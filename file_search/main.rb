# frozen_string_literal: true

require 'csv'

result = []

File.open('./file_search/test.txt') do |f|
  f.each_line do |line|
    str = line.scan(%r{^time:\d{4}\/\d{2}\/\d{2}\s\d{2}:\d{2}:\d{2}|Keyword.*$})
    idx = result.find_index { |r| r[:key] == str[1] }
    if idx >= 0
      result[idx][:count] += 1
    else
      result.push(key: str[1], count: 1)
    end
  end
end

result.sort! { |a, b| a[:count] <=> b[:count] }

file_path = "./file_search/csv/#{Time.now.strftime('%Y%m%d%H%M%S')}.csv"
CSV.open(file_path, 'w+') do |csv|
  result.each { |r| csv << [r[:key], r[:count]] }
end

puts file_path
