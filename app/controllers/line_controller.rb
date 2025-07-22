# frozen_string_literal: true

# 本ファイルはLINE Botのwebhook（イベント受信）を処理するもの
# 具体的にはユーザがline上で選択した配信時間を受け取るものである

class LineController < ApplicationController
  # ユーザーが配信時間を変えたい場合に備えてログインは不要
  skip_before_action :logged_in_user, only: [:webhook]
  # Railsは通常CSRFトークンをチェック,無い、または一致しない場合エラー発生
  # CSRFトークンはラインから送付されない
  # エラーを防止するため無効化
  protect_from_forgery with: :null_session
  def webhook
    # Httpリクエストのボディを取得、railsの継承元のRack::Requestにあるメソッド
    body = request.body.read
    #### 本当にmessage-apiからのリクエストか確認

    # 1. WebサーバーがHTTPリクエストを受信
    # 2. RackがHTTPヘッダーを解析
    # 3. CGI形式、小文字を大文字的な、環境変数ハッシュ(env)を生成
    # 4. request.envでアクセス可能になる
    #
    # ｒリクエストヘッダーから X-Line-Signature の値を取得
    # railsの.envでRack環境ハッシュにアクセスできる
    signature = request.env["HTTP_X_LINE_SIGNATURE"]
    client = Line::Bot::Client.new do |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    end
    # もし署名が正常でない
    # 送られてきたbodyとX-Line-Signatureヘッダを比較
    unless client.validate_signature(body, signature)
      Rails.logger.warn "LINE Signature 不正！"
      # 400 Bad Requestを返す
      head :bad_request
      return
    end
    ### 終了


    # JSONを ハッシュに変換 イベント配列を取り出す
    # events = JSON.parse(body)["events"]
    # events.each do |event|
    # case event["type"]
    # when "follow"
    #   user_id = event["source"]["userId"]
    #   if logged_in? && current_user
    #     current_user.update(line_user_id: user_id)
    #     Rails.logger.info "LINE連携：#{current_user.id}にline_user_idを保存"
    #   else
    #     Rails.logger.warn "未ログインのため、line_user_idを保存しません"
    #   end
    #   begin
    #     line_service = LineService.new
    #     line_service.send_notification_time_selector(user_id)
    #     puts "友だち追加 #{user_id}に通知時間選択メッセージ送信"
    #   rescue => e
    #     # 例外処理
    #     Rails.logger.error "LINEメッセージ送信エラー: #{e.message}"
    #     puts "LINEメッセージ送信エラー: #{e.message}"
    #   end
    # end
    # end
    # LINEに対して200 OKを返す
    head :ok
  end
end
