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
        variable_count = 0
        group = @cfile.run(command).split(',')
        variables = variables.split(',')
        group.each { |value|
          if value.include? "#"
            value.gsub! '#', variables[variable_count]
            variable_count += 1
          end
          say "########################EXECUTING #{value}##############################"
          system "bash", "-c", value
        }
      end

    end
  end
end