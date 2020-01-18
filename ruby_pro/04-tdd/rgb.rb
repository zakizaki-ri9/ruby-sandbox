# frozen_string_literal: true

# rubocop:disable Naming/MethodParameterName
def to_hex(r, g, b)
  # injectでhexへ文字列を追記していく、数値だとhexに対して計算結果を継ぎ足していくイメージ
  [r, g, b].inject('#') do |hex, num|
    # rjustで右パディング
    hex + num.to_s(16).rjust(2, '0')
  end
end
# rubocop:enable Naming/MethodParameterName

def to_ints(rgb_str)
  # scan - \w\wで単語構成文字:[a-zA-Z_0-9]が2文字連続で続く文字を取得
  # ↑で取得した文字をhexで16進数→10進数変換した配列を作成
  rgb_str.scan(/\w\w/).map(&:hex)
end
