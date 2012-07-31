require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Canvas::DiscussionTopic do

  before(:each) do
  end

  it "should create a new instance given valid options" do
    FactoryGirl.build(:discussion_topic)
  end

end

