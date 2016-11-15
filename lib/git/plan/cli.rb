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
        puts "send post hits"
        hash = {command => group}
        @cfile.add_command(hash)
      end

    end
  end
end