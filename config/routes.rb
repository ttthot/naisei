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
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # localhost:3000/posts
  # localhost:3000/posts/new
  resources :posts, only: [:index, :new, :create] 
  resources :users, only: [:index, :show, :new, :create]
end
