#!/usr/bin/env ruby

require "typhoeus"
require "json"

tokenpath = "/Users/chrifpa/.scrpt/.a.token"
endpoint = "https://alpha-api.app.net/stream/0/posts?"
maxlen = 256
posturl = ""

begin
    File.open(tokenpath, "r") do |tokenfile|
        token = tokenfile.readline
        posturl = endpoint + "access_token=" + token
    end
rescue
    puts "a: could not obtain user token at #{tokenpath}. check you token file."
    exit(1)
end

text = "test"




post = {:text => text}

request = Typhoeus::Request.new(posturl,
                                method: :post,
                                body: post,
                                headers: { ContentType: "application/json" })

puts "#{post}"
puts "#{request}"
request.run
puts request.response.body
