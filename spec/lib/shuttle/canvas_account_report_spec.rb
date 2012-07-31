require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Canvas::AccountReport do

  before(:each) do
  end

  it "should create a new instance given valid options" do
    FactoryGirl.build(:account_report)
  end

end

