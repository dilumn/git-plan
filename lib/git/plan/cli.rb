require 'thor'
require 'pry'
require "git/plan/configfile"

module Git
  module Plan
    class CLI < Thor

      def initialize(*)
        @cfile = Git::Plan::ConfigFile.instance
        super
      end

      desc 'add', 'add set of git commands with an alias to use later. Eg: plan add stat "git status, git log"'
      def add(command, group)
        hash = {command => group}
        @cfile.add_command(hash)
      end

      desc 'r', 'run set of git commands configured from adding. Eg: plan r stat'
      def r(command, variables)
        get_command_list(command, variables).each { |value|
          say "########################EXECUTING #{value}##############################"
          system "bash", "-c", value
        }
      end

      desc 'inspect', 'see the command list for an alias before executing'
      def inspect(command, variables)
        get_command_list(command, variables).each { |value|
          say "#{value}"
        }
        say ""
      end


    private

      def get_command_list(command, variables)
        variable_count = 0
        command_list = []
        group = @cfile.run(command).split(',')
        variables = variables.split(',')
        group.each { |value|
          if value.include? "#"
            value.gsub! '#', variables[variable_count]
            variable_count += 1
          end
          command_list << value
        }
        command_list
      end

    end
  end
end