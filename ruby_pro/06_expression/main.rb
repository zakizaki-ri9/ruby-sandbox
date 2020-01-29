# frozen_string_literal: true

text = <<~TEXT
  I love Ruby.
  Python is a great language.
  Java and JavaScript are different.
TEXT

p text
# ["Ruby", "Python", "Java", "JavaScript"]
# [A-Z]始まり、続きが[A-Za-z]である文字列を抽出する
p text.scan(/[A-Z][A-Za-z]+/)
