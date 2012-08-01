class Canvas::Course
  def initialize(*args)
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  attr_accessor :start_at
  attr_accessor :end_at

  def account_id=(account_id)
    raise TypeError, "account_id must be an integer" unless account_id.is_a? Integer
    @account_id = account_id
  end
  def account_id
    @account_id.to_i
  end

  def name=(name)
    raise TypeError, "name must be a string" unless name.is_a? String
    @name = name
  end
  def name
    @name.to_s
  end

  def course_code=(course_code)
    raise TypeError, "course_code must be a string" unless course_code.is_a? String
    @course_code = course_code
  end
  def course_code
    @course_code.to_s
  end

  def license=(license)
    raise TypeError, "license must be a string" unless license.is_a? String
    @license = license
  end
  def license
    @license.to_s
  end

  def is_public=(is_public)
    raise TypeError, "is_public must be a boolean" unless (is_public.is_a? TrueClass or is_public.is_a? FalseClass)
    @is_public = is_public
  end
  def is_public
    @is_public
  end

  def public_description=(public_description)
    raise TypeError, "public_description must be a string" unless public_description.is_a? String
    @public_description = public_description
  end
  def public_description
    @public_description.to_s
  end

  def allow_student_wiki_edits=(allow_student_wiki_edits)
    raise TypeError, "allow_student_wiki_edits must be a boolean" unless (allow_student_wiki_edits.is_a? TrueClass or allow_student_wiki_edits.is_a? FalseClass)
    @allow_student_wiki_edits = allow_student_wiki_edits
  end
  def allow_student_wiki_edits
    @allow_student_wiki_edits
  end

  def allow_student_assignment_edits=(allow_student_assignment_edits)
    raise TypeError, "allow_student_assignment_edits must be a boolean" unless (allow_student_assignment_edits.is_a? TrueClass or allow_student_assignment_edits.is_a? FalseClass)
    @allow_student_assignment_edits = allow_student_assignment_edits
  end
  def allow_student_assignment_edits
    @allow_student_assignment_edits
  end

  def allow_wiki_comments=(allow_wiki_comments)
    raise TypeError, "allow_wiki_comments must be a boolean" unless (allow_wiki_comments.is_a? TrueClass or allow_wiki_comments.is_a? FalseClass)
    @allow_wiki_comments = allow_wiki_comments
  end
  def allow_wiki_comments
    @allow_wiki_comments
  end

  def allow_student_forum_attachments=(allow_student_forum_attachments)
    raise TypeError, "allow_student_forum_attachments must be a boolean" unless (allow_student_forum_attachments.is_a? TrueClass or allow_student_forum_attachments.is_a? FalseClass)
    @allow_student_forum_attachments = allow_student_forum_attachments
  end
  def allow_student_forum_attachments
    @allow_student_forum_attachments
  end

  def open_enrollment=(open_enrollment)
    raise TypeError, "open_enrollment must be a boolean" unless (open_enrollment.is_a? TrueClass or open_enrollment.is_a? FalseClass)
    @open_enrollment = open_enrollment
  end
  def open_enrollment
    @open_enrollment
  end

  def self_enrollment=(self_enrollment)
    raise TypeError, "self_enrollment must be a boolean" unless (self_enrollment.is_a? TrueClass or self_enrollment.is_a? FalseClass)
    @self_enrollment = self_enrollment
  end
  def self_enrollment
    @self_enrollment
  end

  def restrict_enrollments_to_course_dates=(restrict_enrollments_to_course_dates)
    raise TypeError, "restrict_enrollments_to_course_dates must be a boolean" unless (restrict_enrollments_to_course_dates.is_a? TrueClass or restrict_enrollments_to_course_dates.is_a? FalseClass)
    @restrict_enrollments_to_course_dates = restrict_enrollments_to_course_dates
  end
  def restrict_enrollments_to_course_dates
    @restrict_enrollments_to_course_dates
  end

  def enroll_me=(enroll_me)
    raise TypeError, "enroll_me must be a boolean" unless (enroll_me.is_a? TrueClass or enroll_me.is_a? FalseClass)
    @enroll_me = enroll_me
  end
  def enroll_me
    @enroll_me
  end

  def sis_course_id=(sis_course_id)
    raise TypeError, "sis_course_id must be a string" unless sis_course_id.is_a? String
    @sis_course_id = sis_course_id
  end
  def sis_course_id
    @sis_course_id.to_s
  end

  def offer=(offer)
    raise TypeError, "offer must be a boolean" unless (offer.is_a? TrueClass or offer.is_a? FalseClass)
    @offer = offer
  end
  def offer
    @offer
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

