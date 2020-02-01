# frozen_string_literal: true

# rubyを実行するパスが起点となる
# require './ruby-pro/02/require_relative_test/hello'

# 本rbファイルが起点となる
require_relative 'require_relative_test/hello'
require_relative 'require_relative_test/bye'

hello
bye
