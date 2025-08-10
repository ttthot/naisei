# frozen_string_literal: true

# Rubyの標準ライブラリではない、Railsの一部であるActive Supportの機能を読み込みます。
# これにより、1.day.ago や 3.hours.from_now のような、時間を直感的に扱えるメソッドがIntegerクラスに追加されます。
require "active_support/core_ext/integer/time"

# Railsアプリケーション全体の設定を行うためのブロックを開始します。
Rails.application.configure do
  # --- 基本設定 ---
  # Settings specified here will take precedence over those in config/application.rb.
  # ここで指定された設定は、config/application.rb 内の設定よりも優先されます。

  # リクエストごとにコードを再読み込みするかどうか。本番環境ではパフォーマンスのためfalseにします。
  # config.cache_classes = true に相当し、Rails 6以降では config.enable_reloading = false が推奨されます。
  config.enable_reloading = false

  # アプリケーション起動時に、関連するコードを事前にメモリに読み込むかどうか。
  # スレッドベースのウェブサーバーやCoW (Copy on Write) を利用する環境でパフォーマンスが向上します。
  # Rakeタスク実行時は、起動速度を優先するため自動的に無視されます。
  config.eager_load = true

  # --- エラー処理とキャッシュ ---

  # リクエストがローカルからのものと見なすかどうか。
  # falseの場合、開発環境のような詳細なエラーレポートは表示されず、public/500.html などが表示されます。
  config.consider_all_requests_local = false
  # コントローラーレベルでのキャッシュを有効にするかどうか。
  # アクションの結果などをキャッシュして、次回以降のレスポンスを高速化します。
  config.action_controller.perform_caching = true

  # --- 暗号化キー ---

  # credentials.yml.enc などの暗号化されたファイルを復号するためのマスターキーが設定されていることを必須とするか。
  # ENV["RAILS_MASTER_KEY"] や config/master.key などから読み込まれます。
  config.require_master_key = true

  # --- 静的ファイル配信 ---
  # falseにすると、NginxやApacheなどのフロントのウェブサーバーが静的ファイルを配信することを期待します。(コメントアウトされています)
  config.public_file_server.enabled = false

  # --- アセットパイプライン ---

  # CSSを圧縮するためのプリプロセッサを指定します。:sass を指定するとSassCで圧縮します、今回はcrssbhunding-railsを使用するためコメントアウトしています。
  # config.assets.css_compressor = :sass

  # プリコンパイルされたアセットが見つからない場合に、アセットパイプラインが動的にコンパイルするかどうか。
  # 本番環境ではプリコンパイル済みの前提のためfalseにします。
  config.assets.compile = false

  # アセット (画像、スタイルシート、JavaScript) を配信するホストを指定します。
  # CDNなどを利用する場合に設定します。(コメントアウトされています)
  # config.asset_host = "http://assets.example.com"

  # --- ファイル送信ヘッダー ---

  # ファイル送信時にサーバーが使用するヘッダーを指定します。
  # Apacheの場合は "X-Sendfile"、Nginxの場合は "X-Accel-Redirect" を指定すると、
  # ファイル送信処理をウェブサーバーにオフロードできます。(コメントアウトされています)
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for Apache
  # config.action_dispatch.x_sendfile_header = "X-Accel-Redirect" # for NGINX

  # --- ファイルアップロード (Active Storage) ---

  # アップロードされたファイルを保存するサービスを指定します。
  # ファイルアップロード機能は現在利用していないため、Active Storageのサービス設定をコメントアウト。
  # 今回はs3を使用しないため、特に設定は不要
  # config.active_storage.service = :amazon

  # --- Action Cable (WebSocket) チャットシステム等の非同期がないので不使用---

  # Action Cableをメインプロセスやドメイン以外でマウントする場合のパス。(コメントアウトされています)
  # config.action_cable.mount_path = nil
  # Action Cableの接続先URL。(コメントアウトされています)
  # config.action_cable.url = "wss://example.com/cable"
  # Action Cableへの接続を許可するオリジン (ドメイン) を指定します。(コメントアウトされています)
  # config.action_cable.allowed_request_origins = [ "http://example.com", /http:\/\/example.*/ ]

  ########## --- SSL/TLS設定 ---
  # trueの場合Strict-Transport-Securityヘッダーが付与され、Cookieにもsecure属性が付きます。
  # # 本来はALBで設定しているため不要だが、ALBの設定ミスがあった場合や、
  # 将来的にALBを経由しない内部的なアクセス経路ができた場合のために設定します
  # 煩雑な設定なのは、擬似本番環境のみfakseに設定しているため
  config.force_ssl = ENV.fetch("RAILS_FORCE_SSL", "true").to_s == "true"

  # config.force_ssl = true と併用する。
  # Railsアプリケーション自体はHTTPでリクエストを受け付けていても、
  # 外部からはHTTPSでアクセスされていると「見なす」ようになります。


  config.assume_ssl = ENV.fetch("RAILS_ASSUME_SSL", "true").to_s == "true"



  #######################
  # --- ロギング ---

  # ログの出力先を標準出力 (STDOUT) に設定します。
  # Loggerのフォーマッターをデフォルトのものに設定し、
  # さらにTaggedLoggingでラップして、タグ付きのログ出力を可能にします。
  config.logger = ActiveSupport::Logger.new(STDOUT)
    .tap  { |logger| logger.formatter = ::Logger::Formatter.new } # ログフォーマットを設定
    .then { |logger| ActiveSupport::TaggedLogging.new(logger) } # タグ付きロギングを有効化

  # 全てのログ行の先頭に付与するタグを指定します。:request_id はリクエストごとにユニークなIDを付与します。
  config.log_tags = [ :request_id ]

  # ログレベルを設定します。
  # 環境変数 RAILS_LOG_LEVEL が設定されていればその値を、なければ "info" をデフォルトとします。
  # "info" は一般的なシステム操作に関する有用な情報を含みますが、PII (個人を特定できる情報) の偶発的な露呈を避けるため、過度な情報は記録しません。
  # 全てをログ記録したい場合は "debug" に設定します。
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # --- キャッシュストア ---

  # 本番環境で使用するキャッシュストアを指定します。
  # :mem_cache_store はMemcachedを利用します。(コメントアウトされています)
  # config.cache_store = :mem_cache_store
  # NOTE  ファイルステムをキャッシュストアとして使用、運用上問題があれば、MemcachedやRedisに変更
  config.cache_store = :file_store, Rails.root.join("tmp", "cache")

  # --- Active Job (バックグラウンドジョブ) ---

  # Active Jobで使用するキューアダプター (バックエンドシステム) を指定します。
  # :resque はResqueを利用します。(コメントアウトされています)
  # config.active_job.queue_adapter = :resque
  # Active Jobのキュー名のプレフィックスを指定します。環境ごとに異なるプレフィックスを付ける場合に利用します。(コメントアウトされています)
  # config.active_job.queue_name_prefix = "app_production"

  # --- Action Mailer (メール送信) 今回は不使用---
  # Action Mailerのビューキャッシュを無効にするかどうか。
  config.action_mailer.perform_caching = false
  # メールアドレスが不正な場合や配信エラーが発生した場合に、例外を発生させないようにします。
  # trueに設定し、メールサーバーを即時配信用に設定すると、配信エラー時に例外が発生します。(コメントアウトされています)
  # config.action_mailer.raise_delivery_errors = false

  # --- 国際化 (I18n) ---

  # I18n (国際化) で、指定されたロケールの翻訳が見つからない場合に、
  # I18n.default_locale (デフォルトのロケール) にフォールバック (代替処理) するかどうか。
  config.i18n.fallbacks = true

  # --- 非推奨機能の警告 ---

  # 非推奨 (deprecated) 機能に関する警告ログを出力しないようにします。
  config.active_support.report_deprecations = false

  # --- データベース ---

  # データベースマイグレーション実行後に、db/schema.rb (または db/structure.sql) を自動的にダンプしないようにします。
  config.active_record.dump_schema_after_migration = false

  # --- ホスト認証 (セキュリティ) ---

  # DNSリバインディング攻撃やその他の `Host` ヘッダー攻撃からの保護を有効にします。
  # アプリケーションが応答すべき正当なホスト名を配列で指定します。
  config.hosts = [
    "naisei.info"    # example.com からのリクエストを許可
    # /.*\.example\.com/ # www.example.com のようなサブドメインからのリクエストを許可
  ]


  # デフォルトのヘルスチェックエンドポイント (/up) に対するDNSリバインディング保護をスキップします。(コメントアウトされています)
  # config.host_authorization = { exclude: ->(request) { request.path == "/up" } }

  # AWS Application Load Balancer (ALB) 経由のアクセスを許可するための設定です。
  # `config.hosts` は、Railsのセキュリティ機能で、許可されたホスト(Hostヘッダーの値)を指定するためのものです。
  # ここでは、ap-northeast-1リージョンのALBのDNS名 (のパターン) からのアクセスを許可リストに追加しています。


  ##########################
  config.hosts << ".ap-northeast-1.elb.amazonaws.com" # ALBのDNSサフィックスを許可ホストに追加
  ######################################
  # "127.0.0.1" (localhost) からのアクセスを許可リストに追加します。heathチェックや内部APIのアクセスを許可等
  config.hosts << "127.0.0.1"
  # dcockercomposeなどでの開発環境や、ローカルホストからのアクセスを許可するための設定
  config.hosts << "localhost"
  # 本番環境のホスト名
  config.hosts << "naisei.info"
  config.hosts << "www.naisei.info"

  # ホスト認証の除外設定です。
  config.host_authorization = {
    exclude: -> (request) { request.path == "/up" } # Rails7標準のヘルスチェックパス /up を具体的に指定して除外.route.rb参照
  }

  # Link タグの preload ヘッダーを無効化（ブラウザコンソールの警告メッセージを抑制するため） ブラウザでリソースをプリロードするので影響は少ない
  config.action_view.preload_links_header = false
end
