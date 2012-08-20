require 'time'

class Canvas::Course
  def initialize(*args)
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  attr_accessor :saved

  # @!attribute id
  #   @return [Integer] Canvas's unique identifier for the course
  def id=(id)
    raise ArgumentError, "id must be an integer" unless id.is_a? Integer
    @id = id
  end
  def id
    @id.to_i
  end

  # @!attribute account_id
  #   @return [Integer] The unique ID of the account to which the course belongs
  def account_id=(account_id)
    raise ArgumentError, "account_id must be an integer" unless account_id.is_a? Integer
    @account_id = account_id
  end
  def account_id
    @account_id.to_i
  end

  # @!attribute name
  #   @return [String] The full name of the course
  def name=(name)
    raise ArgumentError, "name must be a string" unless name.is_a? String
    @name = name
  end
  def name
    @name.to_s
  end

  # @!attribute course_code
  #   @return [String] The course code for the course
  def course_code=(course_code)
    raise ArgumentError, "course_code must be a string" unless course_code.is_a? String
    @course_code = course_code
  end
  def course_code
    @course_code.to_s
  end

  # @!attribute start_at
  #   @return [Datetime] Course start date in ISO8601 format, e.g. 2011-01-01T01:00Z, 2012-06-01T00:00:00-06:00
  def start_at=(start_at)
    @start_at = Time.iso8601(start_at)
  end
  def start_at
    @start_at.iso8601
  end

  # @!attribute end_at
  #   @return [Datetime] Course end date in ISO8601 format. e.g. 2011-01-01T01:00Z
  def end_at=(end_at)
    @end_at = Time.iso8601(end_at)
  end
  def end_at
    @end_at.iso8601
  end

  # @!attribute calendar
  #   @return [String] URL for the course calendar ics. e.g. ics: "https:\/\/canvas.instructure.com\/feeds\/calendars\/course_abcdef.ics"
  def calendar=(calendar)
    @calendar = calendar
  end
  def calendar
    @calendar
  end

  # @!attribute license
  #   @return [String] The name of the licensing. 
  def license=(license)
    raise ArgumentError, "license must be a string" unless license.is_a? String
    @license = license
  end
  def license
    @license.to_s
  end

  # @!attribute is_public
  #   @return [Boolean] Set to true if course is public.
  def is_public=(is_public)
    raise ArgumentError, "is_public must be a boolean" unless (is_public.is_a? TrueClass or is_public.is_a? FalseClass)
    @is_public = is_public
  end
  def is_public
    @is_public
  end

  # @!attribute public_description
  #   @return [String] 
  def public_description=(public_description)
    raise ArgumentError, "public_description must be a string" unless public_description.is_a? String
    @public_description = public_description
  end
  def public_description
    @public_description.to_s
  end

  def allow_student_wiki_edits=(allow_student_wiki_edits)
    raise ArgumentError, "allow_student_wiki_edits must be a boolean" unless (allow_student_wiki_edits.is_a? TrueClass or allow_student_wiki_edits.is_a? FalseClass)
    @allow_student_wiki_edits = allow_student_wiki_edits
  end
  def allow_student_wiki_edits
    @allow_student_wiki_edits
  end

  def allow_student_assignment_edits=(allow_student_assignment_edits)
    raise ArgumentError, "allow_student_assignment_edits must be a boolean" unless (allow_student_assignment_edits.is_a? TrueClass or allow_student_assignment_edits.is_a? FalseClass)
    @allow_student_assignment_edits = allow_student_assignment_edits
  end
  def allow_student_assignment_edits
    @allow_student_assignment_edits
  end

  def allow_wiki_comments=(allow_wiki_comments)
    raise ArgumentError, "allow_wiki_comments must be a boolean" unless (allow_wiki_comments.is_a? TrueClass or allow_wiki_comments.is_a? FalseClass)
    @allow_wiki_comments = allow_wiki_comments
  end
  def allow_wiki_comments
    @allow_wiki_comments
  end

  def allow_student_forum_attachments=(allow_student_forum_attachments)
    raise ArgumentError, "allow_student_forum_attachments must be a boolean" unless (allow_student_forum_attachments.is_a? TrueClass or allow_student_forum_attachments.is_a? FalseClass)
    @allow_student_forum_attachments = allow_student_forum_attachments
  end
  def allow_student_forum_attachments
    @allow_student_forum_attachments
  end

  def open_enrollment=(open_enrollment)
    raise ArgumentError, "open_enrollment must be a boolean" unless (open_enrollment.is_a? TrueClass or open_enrollment.is_a? FalseClass)
    @open_enrollment = open_enrollment
  end
  def open_enrollment
    @open_enrollment
  end

  def self_enrollment=(self_enrollment)
    raise ArgumentError, "self_enrollment must be a boolean" unless (self_enrollment.is_a? TrueClass or self_enrollment.is_a? FalseClass)
    @self_enrollment = self_enrollment
  end
  def self_enrollment
    @self_enrollment
  end

  def restrict_enrollments_to_course_dates=(restrict_enrollments_to_course_dates)
    raise ArgumentError, "restrict_enrollments_to_course_dates must be a boolean" unless (restrict_enrollments_to_course_dates.is_a? TrueClass or restrict_enrollments_to_course_dates.is_a? FalseClass)
    @restrict_enrollments_to_course_dates = restrict_enrollments_to_course_dates
  end
  def restrict_enrollments_to_course_dates
    @restrict_enrollments_to_course_dates
  end

  def enroll_me=(enroll_me)
    raise ArgumentError, "enroll_me must be a boolean" unless (enroll_me.is_a? TrueClass or enroll_me.is_a? FalseClass)
    @enroll_me = enroll_me
  end
  def enroll_me
    @enroll_me
  end

  # A list of enrollments linking the current user to the course.
  # for student enrollments, grading information may be included
  # if include[]=total_scores
  #enrollments: [
  #  {
  #    type: student,
  #    computed_final_score: 41.5,
  #    computed_current_score: 90,
  #    computed_final_grade: 'A-'
  #  }
  #],

  # the SIS identifier for the course, if defined
  # sis_course_id: null,

  def sis_course_id=(sis_course_id)
    raise ArgumentError, "sis_course_id must be a string" unless sis_course_id.is_a? String
    @sis_course_id = sis_course_id
  end
  def sis_course_id
    @sis_course_id.to_s
  end

  def offer=(offer)
    raise ArgumentError, "offer must be a boolean" unless (offer.is_a? TrueClass or offer.is_a? FalseClass)
    @offer = offer
  end
  def offer
    @offer
  end

  # optional: user-generated HTML for the course syllabus
  # syllabus_body: "<p>syllabus html goes here<\/p>",

  # optional: the number of submissions needing grading
  # returned only if the current user has grading rights
  # and include[]=needs_grading_count
  # needs_grading_count: '17'

  def saved?
    return @saved
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

  #def copy
  #end

  #def save
  #end

  #def find_or_create
  #end

  #def find_or_new
  #end

  #def update
  #end

  #def destroy
  #end

  #def get_by_id
  #end

  #def get_by_sis
  #end

  #def all
  #end
end

