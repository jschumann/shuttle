require 'time'

class Shuttle::Course
  def initialize(*args)
    if args.length == 1 && args.first.kind_of?(Hash)
      args.first.each { |k,v| send("#{k}=",v) }
    end
    @saved = false
  end

  attr_accessor :saved
  attr_accessor :publish_grades_immediately, :workflow_state, :root_account_id, :enrollments

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

  def self.create(canvas_course)
    # TODO Validate our Shuttle::Course object for fields below
    request = Shuttle::API::Request.new
    request.method = 'POST'
    request.endpoint = "/api/v1/accounts/#{canvas_course.account_id}/courses"
    request.body = {
      "account_id" => "#{canvas_course.account_id}",
      "course" => {
        "name" => "#{canvas_course.name}",
        "course_code" => "#{canvas_course.course_code}",
        "start_at" => "#{canvas_course.start_at}",
        "end_at" => "#{canvas_course.end_at}",
        "license" => "#{canvas_course.license}",
        "is_public" => "#{canvas_course.is_public}",
        "public_description" => "#{canvas_course.public_description}",
        "allow_student_wiki_edits" => "#{canvas_course.allow_student_wiki_edits}",
        "allow_student_assignment_edits" => "#{canvas_course.allow_student_assignment_edits}",
        "allow_wiki_comments" => "#{canvas_course.allow_wiki_comments}",
        "allow_student_forum_attachments" => "#{canvas_course.allow_student_forum_attachments}",
        "open_enrollment" => "#{canvas_course.open_enrollment}",
        "self_enrollment" => "#{canvas_course.self_enrollment}",
        "restrict_enrollments_to_course_dates" => "#{canvas_course.restrict_enrollments_to_course_dates}",
        "sis_course_id" => "#{canvas_course.sis_course_id}",
      },
      "offer" => "#{canvas_course.offer}",
    }.to_json
    response = request.fire!
    return response
  end

  def copy_from(source_course_id)
    # Copies content from one course into another. 

    # ID or SIS-ID of the course to copy the content from
    #source_course_id = "1"

    # ID of the course to copy the content to
    #destination_course_id = "11"

    # A list of the course content types to exclude, all areas not listed will be copied.
    # course_copy_except = ""

    # A list of the course content types to copy, all areas not listed will not be copied.
    # course_copy_only = ""

    request = Shuttle::API::Request.new
    request.method = 'POST'
    request.endpoint = "/api/v1/courses/#{self.id}/course_copy"
    request.body = {
      "source_course" => "#{source_course_id}"
      #"except[]" => "#{course_copy_except}"
      #"only[]" => "#{course_copy_only}"
    }.to_json
    response = request.fire!
    return response
  end

  def save
    response = Shuttle::Course.create(self)
    if response[0] == '200'
      self.publish_grades_immediately = response[1]["publish_grades_immediately"]
      self.is_public = response[1]["is_public"]
      self.start_at = response[1]["start_at"]
      self.open_enrollment = response[1]["open_enrollment"]
      self.self_enrollment = response[1]["self_enrollment"]
      self.allow_student_forum_attachments = response[1]["allow_student_forum_attachments"]
      self.course_code = response[1]["course_code"]
      self.allow_student_assignment_edits = response[1]["allow_student_assignment_edits"]
      self.end_at = response[1]["end_at"]
      self.workflow_state = response[1]["workflow_state"]
      self.public_description = response[1]["public_description"]
      self.restrict_enrollments_to_course_dates = response[1]["restrict_enrollments_to_course_dates"]
      self.license = response[1]["license"]
      self.allow_wiki_comments = response[1]["allow_wiki_comments"]
      self.id = response[1]["id"]
      self.sis_course_id = response[1]["sis_course_id"]
      self.name = response[1]["name"]
      self.account_id = response[1]["account_id"]
      self.root_account_id = response[1]["root_account_id"]
      self.saved = true
      return true
    else
      return false
    end
  end

  def enroll_student_by_sis_id(sis_user_id)
    request = Shuttle::API::Request.new
    request.method = 'POST'
    request.endpoint = "/api/v1/courses/#{self.id}/enrollments"
    request.body = {
      "enrollment" => {
        "user_id" => "sis_user_id:#{sis_user_id}",
        "type" => "StudentEnrollment",
        "enrollment_state" => "active"
      }
    }.to_json
    response = request.fire!
    return response
  end

  def self.find_by_sis_course_id(sis_course_id)
    request = Shuttle::API::Request.new
    request.method = 'GET'
    request.endpoint = "/api/v1/courses/sis_course_id:#{sis_course_id}"
    response = request.fire!
    if response[0] == '200'
      course = Shuttle::Course.new(response[1])
      course.saved = true
    end
    return course
  end

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

