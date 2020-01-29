#!/usr/bin/env ruby

require 'HTTParty'
require 'Nokogiri'
require 'Pry'

class Watches
    attr_reader :parse_page
    def initialize
        page = HTTParty.get('https://www.nike.com/w/watches-2axv8')
        parse_page = Nokogiri::HTML(page)
    end

#it extract and store Nike Apple watch names

    def names
      watch_name = []
      parse_page.css('.product-card__link-overlay').map do |item|
        item_container = item.text
        watch_name << item_container
      end
    end
#extract and store Nike Apple watch subtitles

    def titles
        sub_title = []
        parse_page.css('.product-card__subtitle').map do |item|
            item_container = item.text unless item.css('.product-card__subtitle').nil?
            sub_title << item_container
        end
    end
#extract and store Nike Apple watch prices

    def prices
        price = []
        parse_page.css('.css-b9fpep').map do |item|
            item_container = item.text unless item.css('.css-b9fpep').nil?
            price << item_container
        end
    end
#print out names, subtitles and prices of watch
    def output
        watch_name = names
        sub_title = titles
        price = prices

        text = ' '
    end
end