# frozen_string_literal: true

require "line/bot"

# githubsecret環境変数読みこみ
client = Line::Bot::Client.new do |config|
  config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
  config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
end

message = {
  type: "text",
  text: "【定期メッセージ】ちょっと1日を振り返ってみませんか？"
}

response = client.broadcast(message)
puts "送信結果: #{response.code}"
