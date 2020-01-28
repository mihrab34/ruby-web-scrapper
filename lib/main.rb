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

#method that extract and store Nike Apple watch product
    def names
      watch_name = []
      parse_page.css('.product-card__link-overlay').map do |item|
        item_container = item.text
        watch_name << item_container
      end
    end

    def titles
        title = []
        parse_page.css('.product-card__subtitle').map do |item|
            item_container = item.text unless item.css('.product-card__subtitle').nil?
            title << item_container
        end
    end

    def prices
        price = []
        parse_page.css('.css-b9fpep').map do |item|
            item_container = item.text unless item.css('.css-b9fpep').nil?
            price << item_container
        end
    end
end