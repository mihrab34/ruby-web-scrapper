#!/usr/bin/env ruby

require 'HTTParty'
require 'Nokogiri'
require 'erubi'
require 'Pry'

class Watch
    attr_reader :parse_page
    def initialize
        page = HTTParty.get('https://www.nike.com/w/watches-2axv8')
        @parse_page = Nokogiri::HTML(page)
    end

    #it extract and store Nike Apple watch names

    def get_names
      watch_name = []
      product_container.css('.product-card__link-overlay').map do |item|
        item_container = item.text
        watch_name << item_container
      end
      watch_name
    end

    #extract and store Nike Apple watch subtitles

    def get_titles
        sub_title = []
        product_container.css('.product-card__subtitle').map do |item|
            item_container = item.text unless item.css('.product-card__subtitle').nil?
            sub_title << item_container
        end
        sub_title
    end

    #extract and store Nike Apple watch prices

    def get_prices
        price = []
        product_container.css('.css-b9fpep').map do |item|
            item_container = item.text unless item.css('.css-b9fpep').nil?
            price << item_container
        end
        price
    end

    #print out names, subtitles and prices of watch

    def output
      name = get_names
      title = get_titles
      price = get_prices

      word = ''
      File.open('scraper.html.erb').each do |file|
        word += file
      end

      result = ERB.new(word).result(binding)
      puts result

      File.open('main.html', 'w') do |file|
        file.write(result)
      end
    end

    private
    def product_container
        parse_page.css('.product-grid__items').css('.product-grid__card')
    end
end

watch = Watch.new
puts watch.output
