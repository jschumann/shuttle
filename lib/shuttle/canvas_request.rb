class Canvas::API
end

class Canvas::API::Request
  attr_accessor :method
  attr_accessor :endpoint
  attr_accessor :body

  def fire!
    uri = URI.parse("#{Canvas::API::BaseURI}#{self.endpoint}")
    http = Net::HTTP.new(uri.host, uri.port)

    case self.method
    when 'GET'
      request = Net::HTTP::Get.new(uri.path)
    when 'POST'
      request = Net::HTTP::Post.new(uri.path)
      request.body = self.body || ''
    when 'PUT'
      request = Net::HTTP::Put.new(uri.path)
      request.body = self.body || ''
    when 'DELETE'
      request = Net::HTTP::Delete.new(uri.path)
    end
    request["Authorization"] = "Bearer #{Canvas::API::TOKEN}"
    request["Content-Type"] = "application/json"

    puts Canvas::API::BaseURI
    puts Canvas::API::TOKEN
    puts "Request: " + request.body.to_s

    response = http.request(request)
    puts "Response: " + response.body
    puts "Response code: " + response.code
  end

  #canvas_user = JSON.parse(response.body)

#      if response.code == 200
#        canvas_users_added += 1
#        puts "Added Canvas user #{record.username.downcase}"
#      else
#        canvas_creates_failed += 1
#        puts "Failed to add Canvas user #{record.username.downcase}"
#      end

end

