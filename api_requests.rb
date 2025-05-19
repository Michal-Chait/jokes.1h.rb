

# response = HTTP.get("https://data.sfgov.org/resource/jjew-r69b.json")

# data = response.parse
# locations = []
# index = 0
# while index < data.length
#   locations << data[index]["location"]
#   index = index + 1
# end

# # puts "The first stop is #{data[2]["location"]}."
# pp locations

# response = HTTP.get("https://api.etsy.com/v3/public/oauth/token")
# data = response.parse
# pp data


# topics = []
# index = 0
# while index < data.length

#   topics << data[index]
#   index = index + 1
# end
# p 
# puts "Enter topic#{search}


require "http"
require "dotenv/load"
api_key = ENV.fetch("apikey")


loop do
  puts "Enter a topic to get the news!"
  search = gets.chomp
  if search == "quit"
    break
  else
    response = HTTP.get("https://newsapi.org/v2/everything?q=#{search}&from=2025-04-09&sortBy=publishedAt&apiKey=#{api_key}&language=he")
    data = response.parse
    puts data
  end
end


