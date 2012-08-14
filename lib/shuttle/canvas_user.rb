class Canvas::User
# API for accessing information on the current and other users.

# TODO This should be moved to the Account api
# @!method list_users(account_id)
#   Retrieve the list of users associated with this account.
#   @param [Integer] account_id the id of the account to query
def list_users
  # GET /api/v1/accounts/:account_id/users
end

# @!method create(account_id)
#   Create and return a new user and pseudonym for an account.
#   @param [Integer] account_id the id of the account where we want to create the user
def self.create
  request = Canvas::API::Request.new
  request.method = 'POST'
  request.endpoint = "/api/v1/accounts/#{account_id}/users"
end

# @!method edit(user_id)
#   Modify an existing user. To modify a user’s login, see the documentation for logins.
#   @param [Integer] user_id the id of the user to edit
def self.edit
  request = Canvas::API::Request.new
  request.method = 'PUT'
  request.endpoint = "/api/v1/users/#{id}"
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
  # call create or edit, passing current object, as appropriate
end

# @!method update
#   Modify an existing user. To modify a user’s login, see the documentation for logins.
def update
  # update current object's attributes, then call save
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

# @!method get(user_id)
#   Returns user profile data, including user id, name, and profile pic.
#   @param [Integer] user_id the id of the user to find
def self.get(user_id)
  # GET /api/v1/users/:user_id/profile
end

# @!method get_by_canvas_id(user_id)
#   Returns user profile data, including user id, name, and profile pic.
#   @param [Integer] user_id the id of the user to find
def self.get_by_canvas_id(user_id)
  # GET /api/v1/users/:user_id/profile
end

# @!method get_by_sis_id(sis_id)
#   Returns user profile data, including user id, name, and profile pic.
#   @param [Integer] sys_id the id of the user to find
def self.get_by_sis_id(sis_id)
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

