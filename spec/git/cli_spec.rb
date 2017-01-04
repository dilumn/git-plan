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
end
