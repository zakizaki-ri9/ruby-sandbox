# frozen_string_literal: true

module InitializePattern
  # ベースクラス
  class Base
    attr_reader :key, :value, :option
    def self_to_s
      "class: #{self.class}, key: #{key}, value: #{value}, option: #{option}"
    end
  end

  # Bad
  class Bad < Base
    def initialize(args)
      # `a || b`で比較した場合、aがnil or falseならbの値という評価となっている
      # そのため、上記だとaからBoolean型の値(false)を取得できない
      @key = args[:key] || 'key is not found'
      @value = args[:value] || 'value is not found'
      @option = args[:option] || self.class
    end
  end

  # Good: Hash.fetchを利用するパターン
  class Fetch < Base
    def initialize(args)
      @key = args.fetch(:key, 'key is not found')
      @value = args.fetch(:value, 'value is not found')
      @option = args.fetch(:option, self.class)
    end
  end

  # Good: デファルト値を定義したHashに対してmergeするパターン
  class Merge < Base
    def initialize(args)
      args = default_args.merge(args)
      @key = args[:key]
      @value = args[:value]
      @option = args[:option]
    end

    def default_args
      {
        key: 2,
        value: 'bbb',
        option: self.class
      }
    end
  end
end

sample_hash = {
  key: 1,
  value: 'aaa'
}

puts InitializePattern::Bad.new(sample_hash).self_to_s
puts InitializePattern::Fetch.new(sample_hash).self_to_s
puts InitializePattern::Merge.new(sample_hash).self_to_s
