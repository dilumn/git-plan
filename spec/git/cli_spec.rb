require 'spec_helper'

describe Git::Plan::CLI do
  let(:cli) { Git::Plan::CLI.new }

  it 'adds git commands to the file' do
    cli.add "test", "testing1, testing2"

    ccfile = Git::Plan::ConfigFile.instance
    file = YAML.load_file(ccfile.path)
    test_command = file['commands']['test']

    expect(test_command).to eq "testing1, testing2"
  end

  it 'run set of git commands' do
    cli.add "test2", ".."

    expect {cli.r("test2", "")}.to output("########################EXECUTING ..##############################\n").to_stdout_from_any_process
  end

  it 'inspect & show output of git commands' do
    cli.add "test3", "ls"

    expect {cli.inspect("test3", "")}.to output("ls\n\n").to_stdout_from_any_process
  end

end
