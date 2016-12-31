require 'spec_helper'

describe Git::Plan::ConfigFile do
  describe 'Cli integration'
    let(:ccfile) { Git::Plan::ConfigFile.instance }

    it 'ConfigFile load the local file' do
      expect(ccfile).not_to be nil
    end

    it 'Localfile exist in the correct location' do
      file = YAML.load_file(ccfile.path)
      expect(file).not_to eq nil
    end

    it 'ConfigFile add commands to localfile' do
      hash = {"status" => "git status, git log"}
      ccfile.add_command hash

      file = YAML.load_file(ccfile.path)
      status_command = file['commands']['status']
      expect(status_command).to eq "git status, git log"
    end

    it 'ConfigFile run the command from the localfile' do
      hash = {"status" => "git status, git log"}
      ccfile.add_command hash

      command = ccfile.run "status"
      expect(command).to eq "git status, git log"
    end
end
