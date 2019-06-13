# frozen_string_literal: true

require 'nokogiri'
require 'byebug'

html = open('./index.html', &:read)

doc = Nokogiri::HTML.parse(html, nil)
doc.search('input').each do |element|
  puts "element.attributes: #{element.attributes}"
  puts "is hidden?: #{element.attributes['type'].value == 'hidden'}"
  puts "value: #{element.attributes['value'].value}"
end
