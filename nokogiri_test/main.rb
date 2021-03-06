# frozen_string_literal: true

require 'nokogiri'

# index.htmlを読み込み
html = open('nokogiri_test/index.html', &:read)

doc = Nokogiri::HTML.parse(html, nil)
doc.search('input').each do |element|
  puts "element.attributes: #{element.attributes}"
  puts "type: #{element.attributes['type'].value}"
  puts "name: #{element.attributes['name'].value}" if element.attributes['name']
  puts "id: #{element.attributes['id'].value}" if element.attributes['id']
  puts "value: #{element.attributes['value'].value}"
end

doc.css('.nokogiri').each do |element|
  puts "element.attributes: #{element.attributes}"
  puts "element.content: #{element.content}"
end
