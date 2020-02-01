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

# matchでキャプチャ（正規表現として一致した文字列を取得）できる
# 入れ替えても挙動は同じ
# rubocop:disable Lint/AmbiguousRegexpLiteral
p /(\d+)年(\d+)月(\d+)日/.match('私は2000年12月13日生まれ')
# rubocop:enable Lint/AmbiguousRegexpLiteral
p '私は2000年12月13日生まれ'.match(/(\d+)年(\d+)月(\d+)日/)

# ?<name> でキャプチャに名前を指定できる
r = /(?<yyyy>\d+)年(?<mm>\d+)月(?<dd>\d+)日/
t = r.match('私は2000年12月13日生まれ')
p "#{t[:yyyy]}年#{t[:mm]}月#{t[:dd]}日"

# =~を使うと変数に割り当てられる
# if r =~ '私は2000年12月13日生まれ' だとNGとなる...なぜだ...
if /(?<yyyy>\d+)年(?<mm>\d+)月(?<dd>\d+)日/ =~ '私は2000年12月13日生まれ'
  p "#{yyyy}/#{mm}/#{dd}"
end
