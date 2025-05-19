#!/usr/bin/env/Users/nom/.rbenv/shims/ruby

require 'json'
require 'http'

response = HTTP.get("https://api.adviceslip.com/advice")
advice = JSON.parse(response.to_s)

puts "Daily Quote: #{advice['slip']['advice']}"


