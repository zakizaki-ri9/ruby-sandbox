# frozen_string_literal: true

require 'nokogiri'

html = open('./index.html', &:read)

# htmlをパース(解析)してオブジェクトを生成
doc = Nokogiri::HTML.parse(html, nil)
puts doc
