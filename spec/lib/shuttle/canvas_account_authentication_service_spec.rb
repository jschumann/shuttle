require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Canvas::AccountAuthenticationService do

  before(:each) do
  end

  it "should create a new instance given valid options" do
    FactoryGirl.build(:account_authentication_service)
  end

end

