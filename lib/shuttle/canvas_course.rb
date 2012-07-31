class Canvas::Course
  def initialize(*args)
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  attr_accessor :name
  attr_accessor :course_code
  attr_accessor :starts_at
  attr_accessor :ends_at
  attr_accessor :license
  attr_accessor :is_public
  attr_accessor :public_description
  attr_accessor :allow_student_wiki_edits
  attr_accessor :allow_student_assignment_edits
  attr_accessor :allow_wiki_comments
  attr_accessor :allow_student_forum_attachments
  attr_accessor :open_enrollment
  attr_accessor :self_enrollment
  attr_accessor :restrict_enrollments_to_course_dates
  attr_accessor :enroll_me
  attr_accessor :sis_course_id
  attr_accessor :offer

  def account_id=(account_id)
    raise TypeError, "account_id must be an integer" unless account_id.is_a? Integer
    @account_id = account_id
  end
  def account_id
    @account_id.to_int
  end

  def create
    api_method = "POST"
    api_endpoint = "/api/v1/accounts/#{self.account_id}/courses"
    api_request_body = {
      "account_id" => "#{options["course_account_id"]}",
      "course" => {
        "name" => "#{options["course_name"]}",
        "course_code" => "#{options["course_code"]}",
        "start_at" => "#{options["course_starts_at"]}",
        "end_at" => "#{options["course_ends_at"]}",
        "license" => "#{options["course_license"]}",
        "is_public" => "#{options["course_is_public"]}",
        "public_description" => "#{options["course_public_description"]}",
        "allow_student_wiki_edits" => "#{options["course_allow_student_wiki_edits"]}",
        "allow_student_assignment_edits" => "#{options["course_allow_student_assignment_edits"]}",
        "allow_wiki_comments" => "#{options["course_allow_wiki_comments"]}",
        "allow_student_forum_attachments" => "#{options["course_allow_student_forum_attachments"]}",
        "open_enrollment" => "#{options["course_open_enrollment"]}",
        "self_enrollment" => "#{options["course_self_enrollment"]}",
        "restrict_enrollments_to_course_dates" => "#{options["course_restrict_enrollments_to_course_dates"]}",
        "sis_course_id" => "#{options["course_sis_course_id"]}",
      },
      "offer" => "#{options["course_offer"]}",
    }.to_json
    Canvas::Request.new(api_method, api_endpoint, api_request_body)
  end
end

