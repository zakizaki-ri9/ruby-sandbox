# frozen_string_literal: true

arr = [
  [1, 2, 'a'],
  [3, 4, 'b'],
  [5, 6, 'c']
].freeze

# ブロック引数自体が配列の場合は分解する
arr.each do |n1, n2|
  puts "n1: #{n1}, n2: #{n2}"
end

arr.each do |a|
  puts "a: #{a}"
end
