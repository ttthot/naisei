# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Gemfileに記載されているgemを読み込む
# :test、:development、:productionなど、環境に限定されたgemも含む
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # 元々のRailsバージョンのデフォルト設定を初期化
    # Rails 7.1の標準設定を適用
    config.load_defaults 7.1

    # `.rb`ファイルを含まない、または再読み込み・eager loadingの対象外とする
    # `lib`サブディレクトリを`ignore`リストに追加してください
    # 一般的なものは`templates`、`generators`、`middleware`などです
    # assetsとtasksディレクトリは自動読み込みの対象外に設定
    config.autoload_lib(ignore: %w(assets tasks))

    # アプリケーション、エンジン、railtiesの設定をここに記述します
    #
    # これらの設定は、config/environments内のファイルを使用して
    # 特定の環境でオーバーライドできます（後で処理されます）
    #
    # タイムゾーンの設定例（日本時間に設定する場合）
    # データ保存時ActiveRecordはTime.currentを呼び現在時刻を取得
    # それはconfig.time_zone に設定された時間を返す

    config.time_zone = "Tokyo"
    #
    # 追加の読み込みパスを設定する例
    # config.eager_load_paths << Rails.root.join("extras")

    # ===== よく使用される設定例 =====

    # 日本語をデフォルト言語に設定
    config.i18n.default_locale = :ja

    # 利用可能な言語を制限
    # config.i18n.available_locales = [:ja, :en]


    # セッションストアの設定（Redisを使う場合など）
    # config.session_store :redis_store, servers: ["redis://localhost:6379/0/session"]

    # CORS設定（APIとして使用する場合）
    # config.middleware.insert_before 0, Rack::Cors do
    #   allow do
    #     origins '*'
    #     resource '*', headers: :any, methods: [:get, :post, :options]
    #   end
    # end
  end
end
