require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Canvas::Course do

  before(:each) do
  end

  it "should create a new instance given valid options" do
    FactoryGirl.build(:course)
  end

  it "should have an account_id attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:account_id)
  end
  it "should require an integer when setting the account_id attribute" do
    @course = FactoryGirl.build(:course)
    expect {@course.account_id = 'string'}.to raise_error(TypeError, /account_id must be an integer/)
    expect {@course.account_id = 1}.to_not raise_error(TypeError, /account_id must be an integer/)
  end
  it "should return the account_id attribute as an integer" do
    @course = FactoryGirl.build(:course)
    @course.account_id.should be_a_kind_of(Integer)
  end

  it "should have a name attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:name)
  end
  it "should require a string when setting the name attribute" do
    @course = FactoryGirl.build(:course)
    expect {@course.name = 1}.to raise_error(TypeError, /name must be a string/)
    expect {@course.name = 'string'}.to_not raise_error(TypeError, /name must be a string/)
  end
  it "should return the name attribute as a string" do
    @course = FactoryGirl.build(:course)
    @course.name.should be_an_instance_of(String)
  end

  it "should have a course_code attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:course_code)
  end
  it "should require a string when setting the course_code attribute" do
    @course = FactoryGirl.build(:course)
    expect {@course.course_code = 1}.to raise_error(TypeError, /course_code must be a string/)
    expect {@course.course_code = 'string'}.to_not raise_error(TypeError, /course_code must be a string/)
  end
  it "should return the course_code attribute as a string" do
    @course = FactoryGirl.build(:course)
    @course.course_code.should be_an_instance_of(String)
  end

  it "should have a start_at attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:start_at)
  end
  it "should require a datetime when setting the start_at attribute" do
    pending
  end
  it "should return the start_at attribute as a datetime" do
    pending
    @course = FactoryGirl.build(:course)
    @course.start_at.should be_an_instance_of(String)
  end

  it "should have an end_at attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:end_at)
  end
  it "should require a datetime when setting the end_at attribute" do
    pending
  end
  it "should return the end_at attribute as a datetime" do
    pending
    @course = FactoryGirl.build(:course)
    @course.end_at.should be_an_instance_of(String)
  end

  it "should have a license attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:license)
  end
  it "should require a string when setting the license attribute" do
    @course = FactoryGirl.build(:course)
    expect {@course.license = 1}.to raise_error(TypeError, /license must be a string/)
    expect {@course.license = 'string'}.to_not raise_error(TypeError, /license must be a string/)
  end
  it "should return the license attribute as a string" do
    @course = FactoryGirl.build(:course)
    @course.license.should be_an_instance_of(String)
  end

  it "should have an is_public attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:is_public)
  end
  it "should require a boolean when setting the is_public attribute" do
    @course = FactoryGirl.build(:course)
    expect {@course.is_public = 'string'}.to raise_error(TypeError, /is_public must be a boolean/)
    expect {@course.is_public = true}.to_not raise_error(TypeError, /is_public must be a boolean/)
    expect {@course.is_public = false}.to_not raise_error(TypeError, /is_public must be a boolean/)
  end
  it "should return the is_public attribute as a boolean" do
    @course = FactoryGirl.build(:course)
    @course.is_public.should be_a_kind_of(Boolean)
  end

  it "should have a public_description attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:public_description)
  end
  it "should require a string when setting the public_description attribute" do
    @course = FactoryGirl.build(:course)
    expect {@course.public_description = 1}.to raise_error(TypeError, /public_description must be a string/)
    expect {@course.public_description = 'string'}.to_not raise_error(TypeError, /public_description must be a string/)
  end
  it "should return the public_description attribute as a string" do
    @course = FactoryGirl.build(:course)
    @course.public_description.should be_an_instance_of(String)
  end

  it "should have an allow_student_wiki_edits attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:allow_student_wiki_edits)
  end
  it "should require a boolean when setting the allow_student_wiki_edits attribute" do
    @course = FactoryGirl.build(:course)
    expect {@course.allow_student_wiki_edits = 'string'}.to raise_error(TypeError, /allow_student_wiki_edits must be a boolean/)
    expect {@course.allow_student_wiki_edits = true}.to_not raise_error(TypeError, /allow_student_wiki_edits must be a boolean/)
    expect {@course.allow_student_wiki_edits = false}.to_not raise_error(TypeError, /allow_student_wiki_edits must be a boolean/)
  end
  it "should return the allow_student_wiki_edits attribute as a boolean" do
    @course = FactoryGirl.build(:course)
    @course.allow_student_wiki_edits.should be_a_kind_of(Boolean)
  end

  it "should have an allow_student_assignment_edits attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:allow_student_assignment_edits)
  end
  it "should require a boolean when setting the allow_student_assignment_edits attribute" do
    @course = FactoryGirl.build(:course)
    expect {@course.allow_student_assignment_edits = 'string'}.to raise_error(TypeError, /allow_student_assignment_edits must be a boolean/)
    expect {@course.allow_student_assignment_edits = true}.to_not raise_error(TypeError, /allow_student_assignment_edits must be a boolean/)
    expect {@course.allow_student_assignment_edits = false}.to_not raise_error(TypeError, /allow_student_assignment_edits must be a boolean/)
  end
  it "should return the allow_student_assignment_edits attribute as a boolean" do
    @course = FactoryGirl.build(:course)
    @course.allow_student_assignment_edits.should be_a_kind_of(Boolean)
  end

  it "should have an allow_wiki_comments attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:allow_wiki_comments)
  end
  it "should require a boolean when setting the allow_wiki_comments attribute" do
    @course = FactoryGirl.build(:course)
    expect {@course.allow_wiki_comments = 'string'}.to raise_error(TypeError, /allow_wiki_comments must be a boolean/)
    expect {@course.allow_wiki_comments = true}.to_not raise_error(TypeError, /allow_wiki_comments must be a boolean/)
    expect {@course.allow_wiki_comments = false}.to_not raise_error(TypeError, /allow_wiki_comments must be a boolean/)
  end
  it "should return the allow_wiki_comments attribute as a boolean" do
    @course = FactoryGirl.build(:course)
    @course.allow_wiki_comments.should be_a_kind_of(Boolean)
  end

  it "should have an allow_student_forum_attachments attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:allow_student_forum_attachments)
  end
  it "should require a boolean when setting the allow_student_forum_attachments attribute" do
    @course = FactoryGirl.build(:course)
    expect {@course.allow_student_forum_attachments = 'string'}.to raise_error(TypeError, /allow_student_forum_attachments must be a boolean/)
    expect {@course.allow_student_forum_attachments = true}.to_not raise_error(TypeError, /allow_student_forum_attachments must be a boolean/)
    expect {@course.allow_student_forum_attachments = false}.to_not raise_error(TypeError, /allow_student_forum_attachments must be a boolean/)
  end
  it "should return the allow_student_forum_attachments attribute as a boolean" do
    @course = FactoryGirl.build(:course)
    @course.allow_student_forum_attachments.should be_a_kind_of(Boolean)
  end

  it "should have an open_enrollment attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:open_enrollment)
  end
  it "should require a boolean when setting the open_enrollment attribute" do
    @course = FactoryGirl.build(:course)
    expect {@course.open_enrollment = 'string'}.to raise_error(TypeError, /open_enrollment must be a boolean/)
    expect {@course.open_enrollment = true}.to_not raise_error(TypeError, /open_enrollment must be a boolean/)
    expect {@course.open_enrollment = false}.to_not raise_error(TypeError, /open_enrollment must be a boolean/)
  end
  it "should return the open_enrollment attribute as a boolean" do
    @course = FactoryGirl.build(:course)
    @course.open_enrollment.should be_a_kind_of(Boolean)
  end

  it "should have a self_enrollment attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:self_enrollment)
  end
  it "should require a boolean when setting the self_enrollment attribute" do
    @course = FactoryGirl.build(:course)
    expect {@course.self_enrollment = 'string'}.to raise_error(TypeError, /self_enrollment must be a boolean/)
    expect {@course.self_enrollment = true}.to_not raise_error(TypeError, /self_enrollment must be a boolean/)
    expect {@course.self_enrollment = false}.to_not raise_error(TypeError, /self_enrollment must be a boolean/)
  end
  it "should return the self_enrollment attribute as a boolean" do
    @course = FactoryGirl.build(:course)
    @course.self_enrollment.should be_a_kind_of(Boolean)
  end

  it "should have a restrict_enrollments_to_course_dates attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:restrict_enrollments_to_course_dates)
  end
  it "should require a boolean when setting the restrict_enrollments_to_course_dates attribute" do
    @course = FactoryGirl.build(:course)
    expect {@course.restrict_enrollments_to_course_dates = 'string'}.to raise_error(TypeError, /restrict_enrollments_to_course_dates must be a boolean/)
    expect {@course.restrict_enrollments_to_course_dates = true}.to_not raise_error(TypeError, /restrict_enrollments_to_course_dates must be a boolean/)
    expect {@course.restrict_enrollments_to_course_dates = false}.to_not raise_error(TypeError, /restrict_enrollments_to_course_dates must be a boolean/)
  end
  it "should return the restrict_enrollments_to_course_dates attribute as a boolean" do
    @course = FactoryGirl.build(:course)
    @course.restrict_enrollments_to_course_dates.should be_a_kind_of(Boolean)
  end

  it "should have an enroll_me attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:enroll_me)
  end
  it "should require a boolean when setting the enroll_me attribute" do
    @course = FactoryGirl.build(:course)
    expect {@course.enroll_me = 'string'}.to raise_error(TypeError, /enroll_me must be a boolean/)
    expect {@course.enroll_me = true}.to_not raise_error(TypeError, /enroll_me must be a boolean/)
    expect {@course.enroll_me = false}.to_not raise_error(TypeError, /enroll_me must be a boolean/)
  end
  it "should return the enroll_me attribute as a boolean" do
    @course = FactoryGirl.build(:course)
    @course.enroll_me.should be_an_kind_of(Boolean)
  end

  it "should have a sis_course_id attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:sis_course_id)
  end
  it "should require a string when setting the sis_course_id attribute" do
    @course = FactoryGirl.build(:course)
    expect {@course.sis_course_id = 1}.to raise_error(TypeError, /sis_course_id must be a string/)
    expect {@course.sis_course_id = 'string'}.to_not raise_error(TypeError, /sis_course_id must be a string/)
  end
  it "should return the sis_course_id attribute as a string" do
    @course = FactoryGirl.build(:course)
    @course.sis_course_id.should be_an_instance_of(String)
  end

  it "should have an offer attribute" do
    @course = FactoryGirl.build(:course)
    @course.should respond_to(:offer)
  end
  it "should require a boolean when setting the offer attribute" do
    @course = FactoryGirl.build(:course)
    expect {@course.offer = 'string'}.to raise_error(TypeError, /offer must be a boolean/)
    expect {@course.offer = true}.to_not raise_error(TypeError, /offer must be a boolean/)
    expect {@course.offer = false}.to_not raise_error(TypeError, /offer must be a boolean/)
  end
  it "should return the offer attribute as a boolean" do
    @course = FactoryGirl.build(:course)
    @course.offer.should be_a_kind_of(Boolean)
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

