#!/usr/bin/env /Users/nom/.rbenv/shims/ruby
require 'json'
require 'http'

response = HTTP.get("https://api.adviceslip.com/advice")
data = response.parse
puts "Daily Quote: #{data['slip']['advice']}"
