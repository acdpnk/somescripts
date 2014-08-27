#!/usr/bin/env ruby

require "uri"
require "typhoeus"

links = URI.extract `pbpaste`

if links.none?
    puts "#{`pbpaste`} does not contain a valid url"
    exit(1)
end

args = ARGV.join.partition("//")

text, meta = args[0], args[1..2]


cleanlinks = []
shortlinks = []
reqs = []

shortlinkendpoint = "http://is.gd/create.php?format=simple&url="

hydra = Typhoeus::Hydra.new

links.each() do |link|
    puts "#{link}"
    req = Typhoeus::Request.new(URI.parse(link))
    reqs << req
    hydra.queue req
end

hydra.run

reqs.each do |req|
    if req.response.headers_hash['location']
        cleanlinks << req.response.headers_hash['location']
    else
        cleanlinks << nil
    end
end

cleanlinks.each do |cl|
    puts "#{cl}"
end
