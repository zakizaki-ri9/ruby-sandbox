# frozen_string_literal: true

# aliasのお試し
class User
  def hello
    self.class.name
  end

  # alias 別名 元名 で定義可能
  alias greeting hello
end

u = User.new
p "User: #{u.hello}, #{u.greeting}"

# モンキーパッチのお試し
class User
  # 元のhelloメソッドはhello_originalで別名定義
  alias hello_original hello

  # 再定義
  # rubocop:disable Lint/DuplicateMethods
  def hello
    self.class.name + 'Ex'
  end
  # rubocop:enable Lint/DuplicateMethods
end

u = User.new
p "User: #{u.hello}, #{u.greeting}, hello_original: #{u.hello_original}"
