module Shuttle
  require 'net/http'
  require 'uri'
  require 'json'

  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_request')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_account_authentication_service')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_account_report')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_account')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_admin')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_analytic')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_assignment_group')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_assignment')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_collection')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_communication_channel')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_conversation')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_course')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_discussion_topic')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_enrollment')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_external_tool')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_uploaded_file')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_uploaded_folder')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_group')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_login')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_role')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_sis_import')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_service')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_submission')
  require File.join(File.dirname(__FILE__), 'shuttle/shuttle_user')
end

