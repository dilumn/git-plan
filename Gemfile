source 'https://rubygems.org'

gem 'rake'
gem 'jruby-openssl', platforms: :jruby

group :development do
  gem 'pry'
  platforms :ruby_19, :ruby_20 do
    gem 'pry-debugger'
    gem 'pry-stack_explorer'
  end
end

group :test do
  gem 'rspec', '>= 3'
end

gemspec
