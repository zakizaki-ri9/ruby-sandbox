# frozen_string_literal: true

# aliasのお試し
class User
  def hello
    'Hello!'
  end

  # alias 別名 元名 で定義可能
  alias greeting hello
end

u = User.new
p u.hello
p u.greeting
