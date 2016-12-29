require 'spec_helper'

describe Git::Plan::VERSION do
  it 'has a version number' do
    expect(Git::Plan::VERSION).not_to be nil
  end

  it 'should be versioned correctly' do
    expect(Git::Plan::VERSION.count('.')).to be 2
  end
end
