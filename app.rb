require "sinatra"
require 'open-uri'
require 'net/http'
require "nokogiri"

post "/" do
  data = JSON.parse request.body.read
  images = []
  data.each do |url|
    images << { "#{url}": scrap(url)}
  end
  images.to_json
end

def scrap(url)
  uri = URI.parse(url)

  response = Net::HTTP.get_response(uri)
  html = response.body
  doc = Nokogiri::HTML(html)

  doc.css("img").map { |i| i['src'] }
end
