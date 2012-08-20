require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Canvas::Login do

  before(:each) do
  end

  describe "class" do
    it "should create a new instance given valid options" do
      FactoryGirl.build(:login)
    end

    it "should create a new instance from a hash of options" do
      pending
    end

    it "should have a class method 'create'" do
      Canvas::Login.should respond_to(:create)
    end

    it "should have an class method 'edit'" do
      Canvas::Login.should respond_to(:edit)
    end

    it "should have a class method 'delete'" do
      Canvas::Login.should respond_to(:delete)
    end

    it "should have a class method 'all'" do
      Canvas::Login.should respond_to(:all)
    end

    it "should have a class method 'get_by_unique_id'" do
      Canvas::Login.should respond_to(:get_by_unique_id)
    end

    it "should have a class method 'get_by_sis_user_id'" do
      Canvas::Login.should respond_to(:get_by_sis_user_id)
    end

    it "should have a class method 'get_or_create_by_unique_id'" do
      Canvas::Login.should respond_to(:get_or_create_by_unique_id)
    end

    it "should have a class method 'get_or_create_by_sis_user_id'" do
      Canvas::Login.should respond_to(:get_or_create_by_sis_user_id)
    end
  end

  describe "objects" do
    it "should have an account_id attribute" do
      @login = FactoryGirl.build(:login)
      @login.should respond_to(:account_id)
    end
    it "should require an integer when setting the account_id attribute" do
      pending
      @login = FactoryGirl.build(:login)
      expect {@login.account_id = 'string'}.to raise_error(ArgumentError, /account_id must be an integer/)
      expect {@login.account_id = 1}.to_not raise_error(ArgumentError, /account_id must be an integer/)
    end
    it "should return the account_id attribute as an integer" do
      pending
      @login = FactoryGirl.build(:login)
      @login.account_id.should be_a_kind_of(Integer)
    end

    it "should have an id attribute" do
      @login = FactoryGirl.build(:login)
      @login.should respond_to(:id)
    end
    it "should require an integer when setting the id attribute" do
      pending
      @login = FactoryGirl.build(:login)
      expect {@login.id = 'string'}.to raise_error(ArgumentError, /id must be an integer/)
      expect {@login.id = 1}.to_not raise_error(ArgumentError, /id must be an integer/)
    end
    it "should return the id attribute as an integer" do
      pending
      @login = FactoryGirl.build(:login)
      @login.id.should be_a_kind_of(Integer)
    end

    it "should have a sis_user_id attribute" do
      @login = FactoryGirl.build(:login)
      @login.should respond_to(:sis_user_id)
    end
    it "should require an integer when setting the sis_user_id attribute" do
      pending
      @login = FactoryGirl.build(:login)
      expect {@login.sis_user_id = 'string'}.to raise_error(ArgumentError, /sis_user_id must be an integer/)
      expect {@login.sis_user_id = 1}.to_not raise_error(ArgumentError, /sis_user_id must be an integer/)
    end
    it "should return the sis_user_id attribute as an integer" do
      pending
      @login = FactoryGirl.build(:login)
      @login.sis_user_id.should be_a_kind_of(Integer)
    end

    it "should have a unique_id attribute" do
      @login = FactoryGirl.build(:login)
      @login.should respond_to(:unique_id)
    end
    it "should require an integer when setting the unique_id attribute" do
      pending
      @login = FactoryGirl.build(:login)
      expect {@login.unique_id = 'string'}.to raise_error(ArgumentError, /unique_id must be an integer/)
      expect {@login.unique_id = 1}.to_not raise_error(ArgumentError, /unique_id must be an integer/)
    end
    it "should return the unique_id attribute as an integer" do
      pending
      @login = FactoryGirl.build(:login)
      @login.unique_id.should be_a_kind_of(Integer)
    end

    it "should have a user_id attribute" do
      @login = FactoryGirl.build(:login)
      @login.should respond_to(:user_id)
    end
    it "should require an integer when setting the user_id attribute" do
      pending
      @login = FactoryGirl.build(:login)
      expect {@login.user_id = 'string'}.to raise_error(ArgumentError, /user_id must be an integer/)
      expect {@login.user_id = 1}.to_not raise_error(ArgumentError, /user_id must be an integer/)
    end
    it "should return the user_id attribute as an integer" do
      pending
      @login = FactoryGirl.build(:login)
      @login.user_id.should be_a_kind_of(Integer)
    end

    it "should have a saved attribute" do
      @login = FactoryGirl.build(:login)
      @login.should respond_to(:saved)
    end
    it "should require a boolean when setting the saved attribute" do
      pending
      @login = FactoryGirl.build(:login)
      expect {@login.saved = 'true'}.to raise_error(ArgumentError, /saved must be a boolean/)
      expect {@login.saved = true}.to_not raise_error(ArgumentError, /saved must be an integer/)
    end
    it "should return the saved attribute as a boolean" do
      pending
      @login = FactoryGirl.build(:login)
      @login.saved.should be_a_kind_of(Boolean)
    end

    it "should have a save method" do
      @login = FactoryGirl.build(:login)
      @login.should respond_to(:save)
    end

    it "should have an update method" do
      @login = FactoryGirl.build(:login)
      @login.should respond_to(:update)
    end

    it "should have a destroy method" do
      @login = FactoryGirl.build(:login)
      @login.should respond_to(:destroy)
    end

    it "should have a saved? method" do
      @login = FactoryGirl.build(:login)
      @login.should respond_to('saved?')
    end
  end
end

