# この設定ファイルはPumaによって評価されます。ここで呼び出されるトップレベルのメソッドは、
# Pumaの設定用DSL (Domain Specific Language) の一部です。DSLが提供するメソッドに関する
# 詳細については、https://puma.io/puma/Puma/DSL.html を参照してください。

# Pumaは、内部スレッドプールから各リクエストをスレッドで処理できます。
# `threads`メソッドは、最小スレッド数と最大スレッド数の2つの数値を引数に取ります。
# スレッドプールを使用する他のライブラリ（例: Active Recordのコネクションプールなど）は、
# Pumaに指定された最大スレッド数と一致するように設定する必要があります。
# デフォルトでは、最小・最大ともに5スレッドに設定されており、これはActive Recordの
# デフォルトのスレッドサイズと一致します。
# --- 追加解説 ---
# RAILS_MAX_THREADS: Pumaがリクエスト処理に使用する最大スレッド数を指定します。
#                    データベースコネクションプールなど、他のスレッドリソースもこれに合わせることが推奨されます。
# RAILS_MIN_THREADS: Pumaが維持する最小スレッド数です。
# #　指定されない場合は５スレッドがデフォルト
max_threads_count_raw = ENV.fetch("RAILS_MAX_THREADS") { 5 }
max_threads_count = Integer(max_threads_count_raw)

min_threads_count_raw = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count } # デフォルト値も最終的に整数化される
min_threads_count = Integer(min_threads_count_raw)
threads min_threads_count, max_threads_count

# Pumaの実行環境のenvironment 命令を設定します。
# 環境変数 RAILS_ENV が設定されていなければ "production" をデフォルトとします。
puma_env = ENV.fetch("RAILS_ENV") { "production" }
environment puma_env #

app_port = ENV.fetch("PORT") { 3000 }
# コンテナの全てのネットワークインターフェース）でリッスン
bind "tcp://0.0.0.0:#{app_port}"

# 本番環境 (production) の場合の設定
if puma_env == "production"
  # プロセスごとに複数のスレッドを実行している場合、本番環境ではワーカー数は
  # プロセッサ（CPUコア）の数と等しくするべきです。
  #
  # 利用可能なCPUコア数を確実に検出することは不可能なため、デフォルトは1に設定されています。
  # WEB_CONCURRENCY: Pumaが起動するワーカープロセス数を指定します。
  #                  複数のCPUコアを効率的に利用するために、通常はCPUコア数に合わせます。
  #                  ワーカープロセスは、それぞれが上記で設定したスレッドプールを持ちます。
  worker_count = Integer(ENV.fetch("WEB_CONCURRENCY") { 2 })
  if worker_count > 1
    # Pumaがワーカープロセスを起動する（フォークする）前に、
    # Railsアプリケーションのコード全体をメインのPumaプロセス（マスタープロセスとも呼ばれます）に読み込んでおくための命令
    preload_app!

    # 複数のワーカープロセスを起動します。
    workers worker_count
  end
  # 本番環境用のワーカータイムアウトを設定します。
  #  worker_timeout: この時間を超えても応答しないワーカープロセスはPumaによって再起動されます。
  #  開発環境では、デバッグ中に長時間処理が止まってもワーカーが終了しないように
  #  長めの時間が設定されることがあります。本番環境ではより短い値が適切です。
  worker_timeout Integer(ENV.fetch("PUMA_WORKER_TIMEOUT") { 60 })
elsif puma_env == "development" # ★ elsif に変更し、puma_env 変数を使用
  worker_timeout 3600
end

# 開発環境において、Pumaがワーカーを終了するまでに待機するタイムアウトの閾値を指定します。
# ここでは3600秒（1時間）に設定されています。
# --- 追加解説 ---




# Pumaが使用するpidファイルのパスを指定します。
# 環境変数 PIDFILE が設定されていればその値を、なければ "tmp/pids/server.pid" を使用します。
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# `bin/rails restart` コマンドでPumaを再起動できるようにします。
# tmp/restart.txt ファイルのタイムスタンプを更新することで再起動をトリガーします。
plugin :tmp_restart
