require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Canvas::Account do

  before(:each) do
  end

  it "should create a new instance given valid options" do
    FactoryGirl.build(:account)
  end

end

