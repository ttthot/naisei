module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    # ユーザーがいなければfind_byはnilだかららifはいらない？しかしデータベすの問い合わせを削減するためにifは必要
    if session[:user_id]
      # メモ化（memoization）の書き方です。毎回データベースを叩いて同じユーザーを取得するのではなく、最初に取得した結果をインスタンス変数にキャッシュしておき、以降の呼び出しではキャッシュを返すようになります。
      @current_user ||= User.find_by(id: session[:user_id])
    else
    end
  end

  def logged_in?
    # session[:user_id]がnilでない場合、つまりユーザーがログインしている場合
    # nilはfalseとみなされるため、ifは必要ない
    !current_user.nil?
  end
end
