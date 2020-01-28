require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'
require 'csv'

page = HTTParty.get('https://www.annahariri.com/collections/clearance-items')

parse_page = Nokogiri::HTML(page)

Pry.start(binding)
