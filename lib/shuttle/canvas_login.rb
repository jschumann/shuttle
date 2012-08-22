class Canvas::Login
# TODO GET /api/v1/accounts/:account_id/logins in accounts class
# TODO GET /api/v1/users/:user_id/logins in user class

  attr_accessor :account_id
  attr_accessor :id, :user_id, :unique_id, :sis_user_id
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

  def self.create(account_id, canvas_login)
    # TODO Validate our Canvas::Login object for fields below
    request = Canvas::API::Request.new
    request.method = 'POST'
    request.endpoint = "/api/v1/accounts/#{account_id}/logins"
    request.body = {
      "user" => {
        # The ID of the user to create the login for.
        "id" => "#{canvas_login.user_id}",
      },
      "login" => {
        # The unique ID for the new login.
        "unique_id" => "#{canvas_login.unique_id}",
        # The new login’s password.
        # "password" => "#{canvas_login.password}",
        # SIS ID for the login. To set this parameter, the caller must be able to manage SIS permissions on the account.
        "sis_user_id" => "#{canvas_login.sis_user_id}"
      }
    }.to_json
    response = request.fire!
    return response
  end

  def self.edit(account_id, canvas_login)
    # TODO Validate our Canvas::Login object for fields below
    request = Canvas::API::Request.new
    request.method = 'PUT'
    request.endpoint = "/api/v1/accounts/#{account_id}/logins/#{canvas_login.user_id}"
    request.body = {
      "login" => {
        # The new unique ID for the login.
        "unique_id" => "#{canvas_login.unique_id}",
        # The new password for the login. Can only be set by an admin user if admins are allowed to change passwords for the account.
        # "password" => "#{canvas_login.password}",
        # SIS ID for the login. To set this parameter, the caller must be able to manage SIS permissions on the account.
        #"sis_user_id" => "#{canvas_login.sis_user_id}"
      }
    }.to_json
    response = request.fire!
    return response
  end

  def self.delete
    request = Canvas::API::Request.new
    request.method = 'DELETE'
    request.endpoint = "/api/v1/users/:user_id/logins/:id"
  end

  def save
    response = Canvas::Login.create(2, self)
    if response[0] == '200'
      return true
    else
      return false
    end
  end

  def update
    response = Canvas::Login.edit(2, self)
    if response[0] == '200'
      return true
    else
      return false
    end
  end

  def destroy
  end

  def self.all
  end

  def self.get_all_by_user_id(user_id)
    logins = Array.new
    request = Canvas::API::Request.new
    request.method = 'GET'
    request.endpoint = "/api/v1/users/#{user_id}/logins"
    response = request.fire!
    if response[0] == '200'
       response[1].each do |response_part|
         login = Canvas::Login.new(response_part)
         login.saved = true
         logins << login
       end
    end
    return logins
  end

  def self.get_all_by_sis_user_id(sis_user_id)
    logins = Array.new
    request = Canvas::API::Request.new
    request.method = 'GET'
    request.endpoint = "/api/v1/users/sis_user_id:#{sis_user_id}/logins"
    response = request.fire!
    if response[0] == '200'
       response[1].each do |login|
         logins << Canvas::Login.new(login)
       end
    end
    return logins
  end

  def self.get_or_create_by_user_id_and_unique_id(user_id, unique_id)
    logins = Canvas::Login.get_all_by_user_id(user_id)
    login = logins.find {|login| login.unique_id == unique_id }
    if login != nil
      login.saved = true
      return login
    else
      login = Canvas::Login.new
      login.saved = false
      login.user_id = user_id
      login.unique_id = unique_id
      return login
    end
  end

  def self.get_or_create_by_sis_user_id_and_unique_id(sis_user_id, unique_id)
    logins = Canvas::Login.get_all_by_sis_user_id(sis_user_id)
    login = logins.find {|login| login.unique_id == unique_id }
    if login != nil
      login.saved = true
      return login
    else
      login = Canvas::Login.new
      login.saved = false
      login.sis_user_id = sis_user_id
      login.unique_id = unique_id
      return login
    end
  end
end

