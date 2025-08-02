# frozen_string_literal: true

# このクラスの使い方
# service = ChatgptService.new
# service.get_chatgpt_response("今日は本当に疲れました")

class ChatgptService
  def initialize
    @client = OpenAI::Client.new(
      access_token: ENV["OPENAI_API_KEY"],
      # TODO 本番環境時はオフにする
      # エラーをフログに保存
      # log_errors: true
    )
  end

  def get_chatgpt_response(user_message)
    # <<~識別子 で始まり、対応する識別子で終わるまでの全てのテキストを1つの文字列として扱う
    system_prompt = <<~PROMPT
      あなたは温かく共感的なカウンセラーです。
      以下のガイドラインに従って応答してください：
      まず相手の感情を認識し、それを言葉にして返す
      「大変でしたね」「つらかったですね」など共感の言葉を使う
      批判、評価、アドバイスは避ける
      相手の気持ちを否定しない
      認知の歪み（例：全か無か思考、過度の一般化、マイナス思考など）がないか一緒に確認する
      もし歪みがあれば、現実的な捉え方や別の視点を提案する
      150文字程度で簡潔に応答する
      認知の歪みがあれば共感は関係つにして歪みの指摘を優先する
      返答は一回で終了すること、つまり深掘りは不要
    PROMPT

    response = @client.chat(
      parameters: {
        model: "gpt-4.1-nano",
        messages: [
          {
            role: "system",
            content: system_prompt
          },
          {
            role: "user",
            content: user_message
          }
        ],
        max_tokens: 100,  # 返答の最大文字数（トークン）
        temperature: 1.0  # 創造性の度合い（0-1）
      }
    )
    # レスポンスからメッセージを取り出す
    # dig 途中でnilがあってもエラーにならず、nilを返す　hash.dig(:key1, :key2, :key3)
    # 　choices というキーで配列を取得その配列の0番目の中の message キーの値の content キーの値つまり返答を取得
    response.dig("choices", 0, "message", "content")
  # 上記メソッドでエラー発生時、処理は止めない、エラーメッセージを出すだけ
  # SyntaxError や NoMemoryErrorは捕捉されないスタンダードのもののみ
  # => e　を使う、もしエラーオブジェクトを使用したいのであれば
  rescue StandardError
    "一時的に返答ができません"
  end
end
