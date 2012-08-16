class Canvas::User
# API for accessing information on the current and other users.

  attr_accessor :id, :name, :short_name, :sortable_name, :primary_email, :login_id
  attr_accessor :sis_user_id, :sis_login_id
  attr_accessor :avatar_url, :calendar, :time_zone, :locale
  attr_accessor :saved

  def initialize(*args)
    if args.length == 1 && args.first.kind_of?(Hash)
      args.first.each { |k,v| send("#{k}=",v) }
    end
    @saved = false
  end

  def saved?
    return @saved
  end

  # TODO This should be moved to the Account api
  # @!method list_users(account_id)
  #   Retrieve the list of users associated with this account.
  #   @param [Integer] account_id the id of the account to query
  def list_users
    # GET /api/v1/accounts/:account_id/users
  end

  # @!method create(account_id, canvas_user)
  #   Create and return a new user and pseudonym for an account.
  #   @param [Integer] account_id the id of the account where we want to create the user
  #   @param [Canvas::User] canvas_user a new, unsaved Canvas::User object
  def self.create(account_id, canvas_user)
    # TODO Validate our canvas user object for fields below
    request = Canvas::API::Request.new
    request.method = 'POST'
    request.endpoint = "/api/v1/accounts/#{account_id}/users"
    request.body = {
      "user" => {
        # Optional | The full name of the user. This name will be used by teacher for grading.
        "name" => "#{canvas_user.name}",
        # Optional | User’s name as it will be displayed in discussions, messages, and comments.
        "short_name" => "#{canvas_user.short_name}",
        # Optional | User’s name as used to sort alphabetically in lists.
        "sortable_name" => "#{canvas_user.sortable_name}",
        # Optional | The time zone for the user. Allowed time zones are listed in The Ruby on Rails documentation.
        "time_zone" => "#{canvas_user.time_zone || 'Eastern Time (US & Canada)'}",
        # Optional | The user’s preferred language as a two-letter ISO 639-1 code. Current supported languages are English (“en”) and Spanish (“es”).
        "locale" => "#{canvas_user.locale || 'en'}"
      },
      "pseudonym" => {
        # User’s login ID.
        "unique_id" => "#{canvas_user.login_id || canvas_user.primary_email}",
        # Optional | Integer | SIS ID for the user’s account. To set this parameter, the caller must be able to manage SIS permissions.
        "sis_user_id" => "#{canvas_user.sis_user_id}",
        # Optional, 0|1 | Integer | Send user notification of account creation if set to 1.
        "send_confirmation" => 0
      }
    }.to_json
    response = request.fire!
    return response
  end

  # @!method edit(canvas_user)
  #   Modify an existing user. To modify a user’s login, see the documentation for logins.
  #   @param [Canvas::User] canvas_user the canvas user object to edit
  def self.edit(canvas_user)
    request = Canvas::API::Request.new
    request.method = 'PUT'
    request.endpoint = "/api/v1/users/#{canvas_user.id}"
    request.body = {
      "user" => {
        # Optional | The full name of the user. This name will be used by teacher for grading.
        "name" => "#{canvas_user.name}",
        # Optional | User’s name as it will be displayed in discussions, messages, and comments.
        "short_name" => "#{canvas_user.short_name}",
        # Optional | User’s name as used to sort alphabetically in lists.
        "sortable_name" => "#{canvas_user.sortable_name}",
        # Optional | The time zone for the user. Allowed time zones are listed in The Ruby on Rails documentation.
        "time_zone" => "#{canvas_user.time_zone || 'Eastern Time (US & Canada)'}",
        # Optional | The user’s preferred language as a two-letter ISO 639-1 code. Current supported languages are English (“en”) and Spanish (“es”).
        "locale" => "#{canvas_user.locale || 'en'}"
        #TODO user[avatar][token]
        #TODO user[avatar][url]
      },
    }.to_json
    response = request.fire!
    return response
  end

  # @!method delete(account_id, user_id)
  #   Delete a user record from Canvas.
  #   @param [Integer] account_id the id of the account where we want to delete the user
  #   @param [Integer] user_id the id of the user to delete
  def self.delete
    request = Canvas::API::Request.new
    request.method = 'DELETE'
    request.endpoint = "/api/v1/accounts/#{account_id}/users/#{id}"
  end

  # @!method save
  #   Save and return a new user and pseudonym for an account.
  def save
    response = Canvas::User.create(2, self)
    if response[0] == '200'
      return true
    else
      return false
    end
  end

  # @!method update
  #   Modify an existing user. To modify a user’s login, see the documentation for logins.
  def update
    response = Canvas::User.edit(self)
    if response[0] == '200'
      return true
    else
      return false
    end
  end

  # @!method destroy
  #   Delete a user record from Canvas.
  def destroy
    # call delete for current object
  end


  # @!method all
  #   Returns all users
  def self.all
  end

  # @!method get_by_canvas_id(user_id)
  #   Returns user profile data, including user id, name, and profile pic.
  #   @param [Integer] user_id the id of the user to find
  def self.get_by_canvas_id(user_id)
    request = Canvas::API::Request.new
    request.method = 'GET'
    request.endpoint = "/api/v1/users/#{user_id}/profile"
    response = request.fire!
    if response[0] == '200'
      return Canvas::User.new(response[1])
    end
  end

  # @!method get_by_sis_id(sis_id)
  #   Returns user profile data, including user id, name, and profile pic.
  #   @param [Integer] sis_id the id of the user to find
  def self.get_by_sis_id(sis_id)
    request = Canvas::API::Request.new
    request.method = 'GET'
    request.endpoint = "/api/v1/users/sis_user_id:#{sis_id}/profile"
    response = request.fire!
    if response[0] == '200'
      return Canvas::User.new(response[1])
    end
  end

  # @!method get_or_create_by_canvas_id(user_id)
  #   Gets the user with the corresponding Canvas user id, or initializes a new, unsaved user if no matches are found.
  #   Either way, returns a Canvas::User object.
  #   @param [Integer] user_id the id of the user to find
  def self.get_or_create_by_canvas_id(user_id)
  end

  # @!method get_or_create_by_sis_id(sis_id)
  #   Gets the user with the corresponding SIS user id, or initializes a new, unsaved user if no matches are found.
  #   Either way, returns a Canvas::User object.
  #   @param [Integer] sis_id the id of the user to find
  def self.get_or_create_by_sis_id(sis_id)
    user_query = Canvas::User.get_by_sis_id(sis_id)
    if user_query.is_a? Canvas::User
      user = user_query
      user.saved = true
      return user
    else
      user = Canvas::User.new
      user.sis_user_id = sis_id
      user.saved = false
      return user
    end
  end


  # @!method list_activity_stream
  #   Returns the current user’s global activity stream, paginated.
  def list_activity_stream
    # GET /api/v1/users/self/activity_stream
    # GET /api/v1/users/activity_stream
  end

  # @!method list_todos
  #   Returns the current user’s list of todo items, as seen on the user dashboard.
  def list_todos
    # GET /api/v1/users/self/todo
  end

  # @!method upload
  #   Upload a file to the user’s personal files section.
  def upload
    # POST /api/v1/users/:user_id/files
  end

  # @!method follow
  #   Follow this user. 
  #   If the current user is already following the target user, nothing happens. 
  #   The target user must have a public profile in order to follow it.
  def follow
    # PUT /api/v1/users/:user_id/followers/self
  end

  # @!method unfollow
  #   Stop following this user. 
  #   If the current user is not already following the target user, nothing happens.
  def unfollow
    # DELETE /api/v1/users/:user_id/followers/self
  end

  # @!method list_avatar_options
  #   Retrieve the possible user avatar options that can be set with the user update endpoint.
  def list_avatar_options
    # GET /api/v1/users/:user_id/avatars
  end

  # @!method list_user_page_views
  #   Return the user’s page view history in json format, similar to the available CSV download.
  def list_user_page_views
    # GET /api/v1/users/:user_id/page_views
  end
end

