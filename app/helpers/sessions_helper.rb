# 一般的にはhelperとは動作をメソッド化して、ビューで使えるようにするもの
# 一方このファイルはそれだけでなくコントローラーでも使用するものを扱っている。
module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    # ユーザーがいなければfind_byはnilだかららifはいらない？しかしデータベすの問い合わせを削減するためにifは必要
    if session[:user_id]
      # メモ化（memoization）の書き方です。毎回データベースを叩いて同じユーザーを取得するのではなく、最初に取得した結果をインスタンス変数にキャッシュしておき、以降の呼び出しではキャッシュを返すようになります。
      # リクエスト中に一度だけデータベースにアクセス
      # 同じリクエスト内でcurrent_userメソッドが複数回呼ばれても、キャッシュした値を返す
      # リクエストが終了すると破棄される
      # 次のリクエストでは再びnilから始まる
      # 文法について
      # a += 1 はa = a + 1と同じ
      # a ||= 1 はa = a || 1と同じ
      # ||=は、aがnilまたはfalseの場合にだけ1を代入する
      @current_user ||= User.find_by(id: session[:user_id])
    else
    end
  end

  def logged_in?
    # session[:user_id]がnilでない場合、つまりユーザーがログインしている場合
    # nilはfalseとみなされるため、ifは必要ない
    !current_user.nil?
  end

  def log_out
    # session.delete(:user_id)はsession[:user_id] = nilと同じ
    # session.delete(:user_id)はsession[:user_id]を削除する
    session.delete(:user_id)
    # メモ化したものをnilにする
    # これにより、次回current_userメソッドが呼ばれたときに再度データベースにアクセスする
    @current_user = nil
  end
end
