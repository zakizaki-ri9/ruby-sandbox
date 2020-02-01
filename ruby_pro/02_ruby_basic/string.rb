# frozen_string_literal: true

# rubocop:disable all

# %q! ~ !はシングルクォートで囲んだことと同じとなる
puts %q!"test"'!
# !は?{といった区切り文字にも変更可能
puts %q?"test"'?
puts %q}"test"'}
puts %q{"test"'\}}

# rubocop:enable all

# ヒアドキュメント
puts <<TEST
  test
    test
  test
TEST

# ヒアドキュメント
puts <<-TEST
  test
    test
  test
TEST

# ヒアドキュメント - 最初のインデントは無視される
puts <<~TEST
  test
    test
  test
TEST
