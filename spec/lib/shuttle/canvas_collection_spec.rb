require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Canvas::Collection do

  before(:each) do
  end

  it "should create a new instance given valid options" do
    FactoryGirl.build(:collection)
  end

end

