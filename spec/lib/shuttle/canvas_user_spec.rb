require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Canvas::User do

  before(:each) do
  end

  it "should create a new instance given valid options" do
    FactoryGirl.build(:user)
  end

  it "should have a create class method" do
    Canvas::User.should respond_to(:create)
  end

  it "should have an edit class method" do
    Canvas::User.should respond_to(:edit)
  end

  it "should have a delete class method" do
    Canvas::User.should respond_to(:delete)
  end

  it "should have an all class method" do
    Canvas::User.should respond_to(:all)
  end

  it "should have a get class method" do
    Canvas::User.should respond_to(:get)
  end

  it "should have a get_by_canvas_id class method" do
    Canvas::User.should respond_to(:get_by_canvas_id)
  end

  it "should have a get_by_sis_id class method" do
    Canvas::User.should respond_to(:get_by_sis_id)
  end

  describe "an instance" do
    it "should have a list_users method" do
      @course = FactoryGirl.build(:user)
      @course.should respond_to(:list_users)
    end

    it "should have a save method" do
      @course = FactoryGirl.build(:user)
      @course.should respond_to(:save)
    end

    it "should have an update method" do
      @course = FactoryGirl.build(:user)
      @course.should respond_to(:update)
    end

    it "should have a destroy method" do
      @course = FactoryGirl.build(:user)
      @course.should respond_to(:destroy)
    end

    it "should have a list_activity_stream method" do
      @course = FactoryGirl.build(:user)
      @course.should respond_to(:list_activity_stream)
    end

    it "should have a list_todos method" do
      @course = FactoryGirl.build(:user)
      @course.should respond_to(:list_todos)
    end

    it "should have an upload method" do
      @course = FactoryGirl.build(:user)
      @course.should respond_to(:upload)
    end

    it "should have a follow method" do
      @course = FactoryGirl.build(:user)
      @course.should respond_to(:follow)
    end

    it "should have an unfollow method" do
      @course = FactoryGirl.build(:user)
      @course.should respond_to(:unfollow)
    end

    it "should have a list_avatar_options method" do
      @course = FactoryGirl.build(:user)
      @course.should respond_to(:list_avatar_options)
    end

    it "should have a list_user_page_views method" do
      @course = FactoryGirl.build(:user)
      @course.should respond_to(:list_user_page_views)
    end
  end
end

