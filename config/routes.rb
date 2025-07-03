# frozen_string_literal: true

# このファイルは、Railsアプリケーションのルーティング設定を定義しています。
# ルートは、受信したHTTPリクエストをどのコントローラーアクションにマッピングするかを決定します。

# ルート `get "up" => "rails/health#show", as: :rails_health_check` は、
# `/up` というヘルスチェック用エンドポイントを公開するために使用されます。
# このエンドポイントは、ロードバランサーや稼働監視ツールがアプリケーションの稼働状況を確認するために利用されます。
# - アプリケーションが例外なく起動した場合、HTTP 200 ステータスを返します。
# - 起動中に問題が発生した場合、HTTP 500 ステータスを返します。

# ルートパス（"/"）はデフォルトではコメントアウトされています。
# デフォルトのランディングページを定義するには、`root` の行をアンコメントして修正してください。
Rails.application.routes.draw do
  get "emotion_calendar/index"
  # アプリケーションのルートURL（"/"）にアクセスしたとき、sessionsコントローラーのnewアクションを表示する
  root "sessions#new"

  # ユーザー登録用のカスタムルート
  get "/signup", to: "users#new"

  # ユーザーログイン用のカスタムルート
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # localhost:3000/posts
  # localhost:3000/posts/new
  #  %iはシンボルの配列を表す
  # likesはposts抜きの状態は考えられないためネストしている
  # %i[...] は、スペースで区切られた文字列をシンボルの配列に変換するための記法です。カンマ,は使えない
  resources :posts, only: %i[index new create] do
    resources :likes, only: %i[create destroy]
  end

  # postは一覧表示つまり独立したアクセスが必要なためpostsとusersはネストにしていない
  resources :users, only: %i[index show new create]
  # likesはposts抜きの状態は考えられないためネストしている
  # カレンダー表示のルーティング
  resources :emotion_calendar, only: [:index]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
