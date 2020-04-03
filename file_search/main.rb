# frozen_string_literal: true

require 'csv'

result = []

# TODO: ログファイルパスを入力
target_path = ARGV[0] || './file_search/test.txt'

# TODO: 検索したいキーワードを入力
search_keyword = ARGV[1] || 'Keyword'

puts "ARGV: #{ARGV}, target_path: #{target_path}"

File.open(target_path) do |f|
  f.each_line do |line|
    str = line.scan(%r{^time:\d{4}\/\d{2}\/\d{2}\s\d{2}:\d{2}:\d{2}|#{search_keyword}.*$})
    idx = result.find_index { |r| r[:key] == str[1] }
    puts "str: #{str}, idx: #{idx}"
    if !idx.nil?
      result[idx][:count] += 1
    else
      result.push(key: str[1], count: 1)
    end
  end
end

puts "result: #{result}"

result.sort! { |a, b| a[:count] <=> b[:count] }

file_path = "./file_search/csv/#{Time.now.strftime('%Y%m%d%H%M%S')}.csv"
CSV.open(file_path, 'w+') do |csv|
  result.each { |r| csv << [r[:key], r[:count]] }
end

puts file_path
