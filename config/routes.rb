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
  # インフラ用ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check

  # 認証ルート　deviceは不使用
  get "/signup", to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  # アプリケーションのルートURL（"/"）にアクセスしたとき、sessionsコントローラーのnewアクションを表示する
  root "sessions#new"

  # 　メイン機能
  # いいね機能
  # localhost:3000/posts
  # localhost:3000/posts/new
  # %iはシンボルの配列を表す== [:index, :new, :create]
  # likesはposts抜きの状態は考えられないためネストしている
  resources :posts, only: %i[index new create] do
    resources :likes, only: %i[create destroy]
  end

  # ユーザー投稿機能
  # postは一覧表示つまり独立したアクセスが必要なためpostsとusersはネストにしていない
  resources :users, only: %i[index show new create]

  # 感情カレンダー機能
  resources :emotion_calendar, only: [:index]

  #  1ユーザーに1設定なのでresorcesではなくresourceを使用
  resource :settings, only: [:show, :update]

  # ---現在不使用　テストコードには含めない
  # ラインボットのwebhookエンドポイントを定義
  # postリクエストはユーザーがLINE上で選択した時間を受け取るため
  get "line/webhook"
  post "line/webhook", to: "line#webhook"
  # ---
end
