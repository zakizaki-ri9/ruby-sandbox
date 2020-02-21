# frozen_string_literal: true

require 'openssl'

word = ARGV[0]
salt = ARGV[1]

puts Digest::MD5.hexdigest word + salt
