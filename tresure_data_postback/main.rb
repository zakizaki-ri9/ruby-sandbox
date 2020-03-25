# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext'
require 'httpclient'
require 'yaml'

# PostbackAPIに通信する情報を取得
yaml_file_path = ARGV[0].presence || './tresure_data_postback/setting.yml'
yaml = YAML.load_file(yaml_file_path)

# puts yaml

def postback_api_url(database:, table:)
  "https://in.treasuredata.com/postback/v3/event/#{database}/#{table}"
end

# PostbackAPIを叩く
client = HTTPClient.new
body = { test: 'test' }
header = {
  'X-TD-Write-Key': yaml['tresure_data']['write_key'],
  'Content-Type': 'application/json;'
}
api =
  postback_api_url(
    database: yaml['tresure_data']['database'],
    table: yaml['tresure_data']['table']
  )

res = client.post(
  postback_api_url(
    database: yaml['tresure_data']['database'],
    table: yaml['tresure_data']['table']
  ),
  {
    body: body,
    header: header
  }
)

# 結果
puts "api: #{api}"
puts "status: #{res.status}"
puts "body: #{res.body}"
