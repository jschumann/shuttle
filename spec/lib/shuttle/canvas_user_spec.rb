require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Canvas::User do

  before(:each) do
  end

  describe "class" do
    it "should create a new instance given valid options" do
      FactoryGirl.build(:user)
    end

    it "should create a new instance from a hash of options" do
      pending
    end

    it "should have a class method 'create'" do
      Canvas::User.should respond_to(:create)
    end

    it "should have an class method 'edit'" do
      Canvas::User.should respond_to(:edit)
    end

    it "should have a class method 'delete'" do
      Canvas::User.should respond_to(:delete)
    end

    it "should have a class method 'all'" do
      Canvas::User.should respond_to(:all)
    end

    it "should have a class method 'get_by_canvas_id'" do
      Canvas::User.should respond_to(:get_by_canvas_id)
    end

    it "should have a class method 'get_by_sis_id'" do
      Canvas::User.should respond_to(:get_by_sis_id)
    end

    it "should have a class method 'get_or_create_by_canvas_id'" do
      Canvas::User.should respond_to(:get_or_create_by_canvas_id)
    end

    it "should have a class method 'get_or_create_by_sis_id'" do
      Canvas::User.should respond_to(:get_or_create_by_sis_id)
    end
  end

  describe "an instance" do
    it "should have an id attribute" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:id)
    end

    it "should have a name attribute" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:name)
    end

    it "should have a short_name attribute" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:short_name)
    end

    it "should have a sortable_name attribute" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:sortable_name)
    end

    it "should have a primary_email attribute" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:primary_email)
    end

    it "should have a login_id attribute" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:login_id)
    end

    it "should have a sis_user_id attribute" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:sis_user_id)
    end

    it "should have a sis_login_id attribute" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:sis_login_id)
    end

    it "should have a avatar_url attribute" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:avatar_url)
    end

    it "should have a calendar attribute" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:calendar)
    end

    it "should have a time_zone attribute" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:time_zone)
    end

    it "should have a locale attribute" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:locale)
    end

    it "should have a saved attribute" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:saved)
    end

    it "should have a list_users method" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:list_users)
    end

    it "should have a save method" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:save)
    end

    it "should have an update method" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:update)
    end

    it "should have a destroy method" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:destroy)
    end

    it "should have a list_activity_stream method" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:list_activity_stream)
    end

    it "should have a list_todos method" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:list_todos)
    end

    it "should have an upload method" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:upload)
    end

    it "should have a follow method" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:follow)
    end

    it "should have an unfollow method" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:unfollow)
    end

    it "should have a list_avatar_options method" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:list_avatar_options)
    end

    it "should have a list_user_page_views method" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to(:list_user_page_views)
    end

    it "should have a saved? method" do
      @user = FactoryGirl.build(:user)
      @user.should respond_to('saved?')
    end
  end
end

