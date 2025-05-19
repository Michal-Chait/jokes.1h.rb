#!/usr/bin/env/Users/nom/.rbenv/shims/ruby

require 'json'
require 'http'

response = HTTP.get("https://official-joke-api.appspot.com/random_joke")
joke = JSON.parse(response.to_s)

puts "😂 Joke of the Minute"
puts "---"
puts "#{joke["setup"]}"
puts "#{joke["punchline"]}"
