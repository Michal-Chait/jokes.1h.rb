gem "http"

# $ gem install http

require "http"

require "dotenv/load"
api_key = ENV.fetch("apikey")

# response = HTTP.get("https://newsapi.org/v2/everything?q=#{search}&from=2025-04-09&sortBy=publishedAt&apiKey=#{api_key}&language=he")
# data = response.parse

response = HTTP.get("https://api.adviceslip.com/advice")
data = response.parse