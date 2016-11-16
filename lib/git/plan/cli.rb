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

      desc 'add', 'add commands to use later by batch'
      def add(command, group)
        hash = {command => group}
        @cfile.add_command(hash)
      end

      desc 'r', 'run set of git commands configured before'
      def r(command)
        group = @cfile.run(command).split(',')
        group.each { |x| system "bash", "-c", x }
      end

    end
  end
end