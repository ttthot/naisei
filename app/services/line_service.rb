# frozen_string_literal: true

# 　本ファイルの役割
# 　　1. LINE Bot APIを認証状を取得して初期化
# 　　2. テキストメッセージ送信機能
# 　　3. 通知時間選択UI送信機能


class LineService
  # ラインボットを初期化 v1形式なので注意
  def initialize
    @client = Line::Bot::Client.new do |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    end
  end
  # テスト用　関数　現在不使用
  def send_line_message(text = nil)
    message = {
      type: "text",
      text: "Hello, LINE!"

    }

    # ブロードキャストメッセージを送信
    response = @client.broadcast(message)
    if response.code == "200"
      puts " 送信成功:"
      puts " ステータスコード: #{response.code}"
      puts " ヘッダー: #{response.header}"
      Rails.logger.info "送信成功: #{response.body}"
      true
    else
      puts " 送信失敗: #{response.body}"
      Rails.logger.error "送信失敗: #{response.body}"
      false
    end
    # メソット内でエラーハンドリングのためbeginは不要
  rescue => e
    puts " エラー発生: #{e.message}"
    Rails.logger.error "エラー発生: #{e.message}"
    false
  end

  # 複数のボタンから時間を選択できるようにするメッセージ型をラインに送付
  # def send_notification_time_selector(user_id)
  #   message = {
  #     # lineの構成期部品テンプレートを使用
  #     type: "template",
  #     # プッシュ通知で表示される文字
  #     altText: "通知時間を選択してください",
  #     template: {
  #       type: "buttons",
  #       text: "毎日記録をつける習慣をつけましょう！\n通知時間を選択してください",
  #       actions: [
  #         {
  #           # postbackイベント発生時Webhookでの受信を想定
  #           # postbackイベントとはボタンをタップした時に発生するイベント
  #           type: "postback",
  #           label: "21時",
  #           # サーバー側、event.postback.data に "notify_hour=21"が格納
  #           data: "notify_hour=21"
  #         },
  #         {
  #           type: "postback",
  #           label: "22時",
  #           data: "notify_hour=22",
  #         },
  #         {
  #           type: "postback",
  #           label: "23時",
  #           data: "notify_hour=23",
  #         },
  #         {
  #           type: "postback",
  #           label: "24時",
  #           data: "notify_hour=24",
  #         }
  #       ]
  #     }
  #   }
  #   # 該当するユーザーにメッセージを送る
  #   @client.push_message(user_id, message)
  # end
end
