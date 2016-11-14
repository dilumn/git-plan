# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git/plan/version'

Gem::Specification.new do |spec|
  spec.name          = "git-plan"
  spec.version       = Git::Plan::VERSION
  spec.authors       = ["DilumN"]
  spec.email         = ["dilumnavanjana@gmail.com"]

  spec.summary       = %q{Plan your batch of Git commands}
  spec.description   = %q{Configure set of git commands to run at the same time}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"


  spec.files = %w(LICENSE.txt README.md git-plan.gemspec) + Dir['bin/*'] + Dir['lib/**/*.rb']
  spec.executables   = Dir['bin/*'].map { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency 'thor', ['>= 0.19.1', '< 2']
  spec.add_dependency 'pry', '~> 0.10'
end
