require 'rubygems'
require 'bundler/setup'
require 'rspec'

require File.join(File.dirname(__FILE__), '/../lib/shuttle')

# Make our test data available
require 'factory_girl'
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

# Allows us to test for .class.should == Boolean, as though we had a Boolean class.
# http://stackoverflow.com/questions/3028243/check-if-ruby-object-is-a-boolean
module Boolean; end
class TrueClass; include Boolean; end
class FalseClass; include Boolean; end

