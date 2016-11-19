# Git-Plan
[![Gem Version](https://img.shields.io/gem/v/git-plan.svg)][gem]

[gem]: https://rubygems.org/gems/git-plan

`git-plan` is a Ruby gem to execute set of git commands at once. If you have set of git commands that you everyday run while developing, you can set an alias for the set & execute from only one command.

## Dependencies
First, make sure you have Ruby installed.

**On a Mac**, open `/Applications/Utilities/Terminal.app` and type:

    ruby -v

If the output looks something like this, you're in good shape:

    ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-darwin15]

If the output looks more like this, you need to [install Ruby][ruby]:
[ruby]: https://www.ruby-lang.org/en/downloads/

    ruby: command not found

**On Linux**, for Debian-based systems, open a terminal and type:

    sudo apt-get install ruby-dev

or for Red Hat-based distros like Fedora and CentOS, type:

    sudo yum install ruby-devel

(if necessary, adapt for your package manager)

**On Windows**, you can install Ruby with [RubyInstaller][].
[rubyinstaller]: http://rubyinstaller.org/downloads/

## Installation
Once you've verified that Ruby is installed:

    gem install git-plan

## Usage

###Before execute set of git commands from a single command, configure the commands with an alias by,

`plan add ALIASNAME "GIT COMMAND, GIT COMMAND2, GIT COMMAND3, GIT COMMAND4 #"`

Eg:

`plan add eg1 "git status, git log"`

`plan add eg2 "git status, git commit -m "#", git push origin #"`

Use # symbol if you want to use a dynamic word inside the command(Eg: branch name)


###To run configured set of commands,

`plan r ALIASNAME "VARIABLE1, VARIABLE2"`

Eg:

`plan r eg1`

`plan r eg2 "HERE IS THE COMMIT MESSAGE, master"`

###Help

`plan help`


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dilumn/git-plan. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

