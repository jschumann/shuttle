class Shuttle::API
end

class Shuttle::API::Request
  attr_accessor :method
  attr_accessor :endpoint
  attr_accessor :body

  def fire!
    request_counter = 0
    begin
      uri = URI.parse("#{Shuttle::API::BaseURI}#{self.endpoint}")
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
      request["Authorization"] = "Bearer #{Shuttle::API::TOKEN}"
      request["Content-Type"] = "application/json"
      response = http.request(request)
      code = response.code
      body = JSON.parse(response.body)
      return Array[code, body]
    rescue EOFError
      puts "EOFError encountered. Wait 30 seconds for the dust to clear..."
      sleep 30
      puts "Retry request..."
      if request_counter < 6
        request_counter += 1
        puts "Attempt #{request_counter}"
        retry
      else
        puts "FAILED REQUEST #{request_counter} TIMES"
        counter = 0
      end
    end
  end

#      if response.code == 200
#        canvas_users_added += 1
#        puts "Added Canvas user #{record.username.downcase}"
#      else
#        canvas_creates_failed += 1
#        puts "Failed to add Canvas user #{record.username.downcase}"
#      end

end

