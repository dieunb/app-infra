require 'net/http'
require 'json'
require 'securerandom'

while true
  threads = (1..100).to_a.map do |i|
    Thread.new do
      begin
        request_id = SecureRandom.uuid
        uri = URI("https://engineering.staging.ehrocks.com/kong?request_id=#{request_id}")
        res = Net::HTTP.get(uri)
        json_data = JSON.parse(res)

        matched = if json_data['data'] == request_id
                    'TRUE'
                  else
                    "FALSE + #{json_data}"
                  end
        unless matched
          puts "URI: #{uri}. #{matched}"
          break
        end
      rescue StandardError => e
        puts "URI: #{uri}. Res: #{e}"
      end
    end
  end

  threads.each(&:join)
end
