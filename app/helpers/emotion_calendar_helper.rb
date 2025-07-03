# frozen_string_literal: true

# 保存されたpost内の日付に対応する感情を色に変換して返すメソッド
module EmotionCalendarHelper
  def emotion_color_class(date)
    date_string = date.to_s
    post_data = @date_post_map[date_string]

    # 投稿がない場合 - daisyUIのセマンティックカラーに置き換え
    return "bg-base-300" if post_data.nil?

    # １　基本の色を取得
    base_color = get_base_color(post_data[:emotion])
    # ２　濃淡を取得
    opacity = get_opacity_class(post_data[:rating])

    # ３　基本色と濃淡を組み合わせて返す
    "#{base_color} #{opacity}"
  end

  private
    # 感情に応じた基本色を返す
    def get_base_color(emotion)
      colors = {
        "neutral" => "bg-gray-400",
        "happy"   => "bg-green-500",
        "sad"     => "bg-blue-500",
        "angry"   => "bg-red-500",
        "excited" => "bg-yellow-500"
      }
      colors[emotion] || "bg-base-300"
    end

    # 感情強度に応じた不透明度を返す
    # 不透明度（opacity）20＝　２０%の不透明度
    def get_opacity_class(rating)
      opacities = {
        1 => "opacity-20",
        2 => "opacity-40",
        3 => "opacity-60",
        4 => "opacity-80",
        5 => "opacity-100"
      }
      # 濃淡が指定なしの場合
      opacities[rating] || "opacity-60"
    end
end
