require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Canvas::Course do

  before(:each) do
  end

  it "should create a new instance given valid options" do
    FactoryGirl.build(:course)
  end

  it "should have an account_id attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:account_id)
  end
  it "should require an integer when setting the account_id attribute" do
    pending
    expect {raise 'boom'}.to raise_error(RuntimeError, /boom/)
  end
  it "should return the account_id attribute as an integer" do
    @contact = FactoryGirl.build(:course)
    @contact.account_id.should be_a_kind_of(Integer)
  end

  it "should have a name attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:name)
  end
  it "should require a string when setting the name attribute" do
    pending
  end
  it "should return the name attribute as a string" do
    @contact = FactoryGirl.build(:course)
    @contact.name.should be_an_instance_of(String)
  end

  it "should have a course_code attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:course_code)
  end
  it "should require a string when setting the course_code attribute" do
    pending
  end
  it "should return the course_code attribute as a string" do
    @contact = FactoryGirl.build(:course)
    @contact.course_code.should be_an_instance_of(String)
  end

  it "should have a starts_at attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:starts_at)
  end
  it "should require a datetime when setting the starts_at attribute" do
    pending
  end
  it "should return the starts_at attribute as a datetime" do
    pending
    @contact = FactoryGirl.build(:course)
    @contact.starts_at.should be_an_instance_of(String)
  end

  it "should have an ends_at attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:ends_at)
  end
  it "should require a datetime when setting the ends_at attribute" do
    pending
  end
  it "should return the ends_at attribute as a datetime" do
    pending
    @contact = FactoryGirl.build(:course)
    @contact.ends_at.should be_an_instance_of(String)
  end

  it "should have a license attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:license)
  end
  it "should require a string when setting the license attribute" do
    pending
  end
  it "should return the license attribute as a string" do
    @contact = FactoryGirl.build(:course)
    @contact.license.should be_an_instance_of(String)
  end

  it "should have an is_public attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:is_public)
  end
  it "should require a boolean when setting the is_public attribute" do
    pending
  end
  it "should return the is_public attribute as a boolean" do
    @contact = FactoryGirl.build(:course)
    @contact.is_public.should be_a_kind_of(Boolean)
  end

  it "should have a public_description attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:public_description)
  end
  it "should require a string when setting the public_description attribute" do
    pending
  end
  it "should return the public_description attribute as a string" do
    @contact = FactoryGirl.build(:course)
    @contact.public_description.should be_an_instance_of(String)
  end

  it "should have an allow_student_wiki_edits attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:allow_student_wiki_edits)
  end
  it "should require a boolean when setting the allow_student_wiki_edits attribute" do
    pending
  end
  it "should return the allow_student_wiki_edits attribute as a boolean" do
    @contact = FactoryGirl.build(:course)
    @contact.allow_student_wiki_edits.should be_a_kind_of(Boolean)
  end

  it "should have an allow_student_assignment_edits attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:allow_student_assignment_edits)
  end
  it "should require a boolean when setting the allow_student_assignment_edits attribute" do
    pending
  end
  it "should return the allow_student_assignment_edits attribute as a boolean" do
    @contact = FactoryGirl.build(:course)
    @contact.allow_student_assignment_edits.should be_a_kind_of(Boolean)
  end

  it "should have an allow_wiki_comments attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:allow_wiki_comments)
  end
  it "should require a boolean when setting the allow_wiki_comments attribute" do
    pending
  end
  it "should return the allow_wiki_comments attribute as a boolean" do
    @contact = FactoryGirl.build(:course)
    @contact.allow_wiki_comments.should be_a_kind_of(Boolean)
  end

  it "should have an allow_student_forum_attachments attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:allow_student_forum_attachments)
  end
  it "should require a boolean when setting the allow_student_forum_attachments attribute" do
    pending
  end
  it "should return the allow_student_forum_attachments attribute as a boolean" do
    @contact = FactoryGirl.build(:course)
    @contact.allow_student_forum_attachments.should be_a_kind_of(Boolean)
  end

  it "should have an open_enrollment attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:open_enrollment)
  end
  it "should require a boolean when setting the open_enrollment attribute" do
    pending
  end
  it "should return the open_enrollment attribute as a boolean" do
    @contact = FactoryGirl.build(:course)
    @contact.open_enrollment.should be_a_kind_of(Boolean)
  end

  it "should have a self_enrollment attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:self_enrollment)
  end
  it "should require a boolean when setting the self_enrollment attribute" do
    pending
  end
  it "should return the self_enrollment attribute as a boolean" do
    @contact = FactoryGirl.build(:course)
    @contact.self_enrollment.should be_a_kind_of(Boolean)
  end

  it "should have a restrict_enrollments_to_course_dates attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:restrict_enrollments_to_course_dates)
  end
  it "should require a boolean when setting the restrict_enrollments_to_course_dates attribute" do
    pending
  end
  it "should return the restrict_enrollments_to_course_dates attribute as a boolean" do
    @contact = FactoryGirl.build(:course)
    @contact.restrict_enrollments_to_course_dates.should be_a_kind_of(Boolean)
  end

  it "should have an enroll_me attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:enroll_me)
  end
  it "should require a boolean when setting the enroll_me attribute" do
    pending
  end
  it "should return the enroll_me attribute as a boolean" do
    @contact = FactoryGirl.build(:course)
    @contact.enroll_me.should be_an_kind_of(Boolean)
  end

  it "should have a sis_course_id attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:sis_course_id)
  end
  it "should require a string when setting the sis_course_id attribute" do
    pending
  end
  it "should return the sis_course_id attribute as a string" do
    @contact = FactoryGirl.build(:course)
    @contact.sis_course_id.should be_an_instance_of(String)
  end

  it "should have an offer attribute" do
    @contact = FactoryGirl.build(:course)
    @contact.should respond_to(:offer)
  end
  it "should require a boolean when setting the offer attribute" do
    pending
  end
  it "should return the offer attribute as a boolean" do
    @contact = FactoryGirl.build(:course)
    @contact.offer.should be_a_kind_of(Boolean)
  end

  describe "new" do
    it "should take a hash of arguments" do
      pending
    end
  end

  describe "create" do
    it "should require a value for the account_id attribute" do
      pending
    end
  end
end

