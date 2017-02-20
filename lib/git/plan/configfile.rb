require 'singleton'
require 'pry'

module Git
  module Plan
    class ConfigFile
      include Singleton
      attr_reader :path
      FILE_NAME = '.gitpath'.freeze

      def initialize
        @path = File.join(File.expand_path('~'), FILE_NAME)
        @data = load_file
      end

      def add_command(hash)
        @data['commands'].merge!(hash)
        write
      end

      def run(command)
        @data['commands'][command]
      end

      def get_all
        @data['commands']
      end

      def delete
        File.delete(@path) if File.exist?(@path)
      end

      def empty?
        @data == default_structure
      end

      def load_file
        require 'yaml'
        YAML.load_file(@path)
      rescue Errno::ENOENT
        default_structure
      end

      def path=(path)
        @path = path
        @data = load_file
        @path
      end


    private

      def write
        require 'yaml'
        File.open(@path, File::RDWR | File::TRUNC | File::CREAT, 0o0600) do |cfile|
          cfile.write @data.to_yaml
        end
      end

      def default_structure
        # TODO: Load a json file with specific default commands, so the user can run default set of git commands by default
        {'commands' => {}}
      end
    end
  end
end
