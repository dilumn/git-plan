require 'thor'
require 'pry'
require "git/plan/configfile"

module Git
  module Plan
    class CLI < Thor

      def initialize(*)
        @cfile = Git::Plan::ConfigFile.instance
        super
        puts "intialized"
      end

      desc 'add', 'add commands to use later by batch'
      def add(command, group)
        puts "send post hits"
      end

    end
  end
end