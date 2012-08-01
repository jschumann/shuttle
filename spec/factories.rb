FactoryGirl.define do
  factory :request, class: Canvas::Request do
  end

  factory :account_authentication_service, class: Canvas::AccountAuthenticationService do
  end

  factory :account_report, class: Canvas::AccountReport do
  end

  factory :account, class: Canvas::Account do
  end

  factory :admin, class: Canvas::Admin do
  end

  factory :analytic, class: Canvas::Analytic do
  end

  factory :assignment_group, class: Canvas::AssignmentGroup do
  end

  factory :assignment, class: Canvas::Assignment do
  end

  factory :collection, class: Canvas::Collection do
  end

  factory :communication_channel, class: Canvas::CommunicationChannel do
  end

  factory :conversation, class: Canvas::Conversation do
  end

  factory :course, class: Canvas::Course do
    account_id 1
    name 'name'
    course_code 'course_code'
    start_at 'string'
    end_at 'string'
    license 'license'
    is_public true
    public_description 'public_description'
    allow_student_wiki_edits true
    allow_student_assignment_edits true
    allow_wiki_comments true
    allow_student_forum_attachments true
    open_enrollment true
    self_enrollment true
    restrict_enrollments_to_course_dates true
    enroll_me true
    sis_course_id 'sis_course_id'
    offer true
  end

  factory :discussion_topic, class: Canvas::DiscussionTopic do
  end

  factory :enrollment, class: Canvas::Enrollment do
  end

  factory :external_tool, class: Canvas::ExternalTool do
  end

  factory :uploaded_file, class: Canvas::UploadedFile do
  end

  factory :uploaded_folder, class: Canvas::UploadedFolder do
  end

  factory :group, class: Canvas::Group do
  end

  factory :login, class: Canvas::Login do
  end

  factory :role, class: Canvas::Role do
  end

  factory :sis_import, class: Canvas::SISImport do
  end

  factory :service, class: Canvas::Service do
  end

  factory :submission, class: Canvas::Submission do
  end

  factory :user, class: Canvas::User do
  end
end



