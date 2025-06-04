# syntax = docker/dockerfile:1

#################################
# 共通設定ステージ
#################################
FROM ruby:3.4.2-slim AS base
WORKDIR /app
# rails assets:precompile時に本場用に圧縮等を最適化するための設定
ENV RAILS_ENV=production \
    NODE_ENV=production \
    # robocopなどの開発用のgemを除外
    BUNDLE_WITHOUT="development:test"\
    # 使用するNode.jsのメジャーバージョン
    NODE_MAJOR_VERSION=18

# 必要なパッケージと Node.js をセットアップ
# → cssbundling-rails や daisyUI のビルドに npx が必要
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    curl \
    gnupg \
    default-libmysqlclient-dev \
    git \
    # 旧ファイル
    # libvips \
    libvips-dev \ 
    pkg-config \
    libyaml-dev  \
    # HTTPS経由でのリソース取得（NodeSourceなど）のために必要
    ca-certificates && \
    # NodeSource から Node.js をインストール
    curl -fsSL https://deb.nodesource.com/setup_${NODE_MAJOR_VERSION}.x | bash - && \
    apt-get install --no-install-recommends -y nodejs && \
    # ダウンロード済みパッケージのキャッシュを削除
    apt-get clean && \    
    # パッケージリストを削除
    rm -rf /var/lib/apt/lists/*

#################################
# ビルド用ステージ
#################################
FROM base AS build

###### Ruby: Gemfile + bundle install
# Gemfile 先読みすることでレイヤーキャッシュ層を作り、RUN bundle install 時読み込みの高速化を図る
COPY Gemfile Gemfile.lock ./
# .lockファイルに基づきインストールする 
#  Dockerコンテナが使えるCPUコアの数をオプションコマンドで取得し、並列処理を試みる
RUN bundle install --jobs $(nproc) --retry 3 

######## Node.js: package.json + npm ci
# package.json と package-lock.json をコピーしてJavaScript依存関係をインストール (JSレイヤーのキャッシュのため)
COPY package.json package-lock.json ./
# npm ci は package-lock.json を元にクリーンインストール
# RUN npm ci
RUN echo "NODE_ENV: ${NODE_ENV:-'not set'}"
RUN npm ci
RUN npm list esbuild || echo "esbuild not installed"
# アプリ本体をコピー
COPY . .

# 以下は本番用だがdocker擬似環境変数を設定するため一時的にコメントアウト
# storage db は本番環境では削除した
# tmp/pids pumaのpidファイルを保存するディレクトリ
# RUN mkdir -p log tmp/pids public/assets \
#     # ootsnapは、Railsの起動時間を高速化するために使用されるGemそれを先読みする
#     bundle exec bootsnap precompile app/ lib/ && \
#     # 確実性のために./bin/rails から変更、エラーは許可しな説てい
#     SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

RUN mkdir -p log tmp/pids public/assets \
    && bundle exec bootsnap precompile app/ lib/ \
    && DB_NAME="dummy_db_name" \
       DB_USER="dummy_user" \
       DB_PASSWORD="dummy_password" \
       DB_HOST="dummy_host" \
       # ダミーキー
       RAILS_MASTER_KEY="00000000000000000000000000000001"  \
       # 他に database.yml で ENV.fetch している変数があれば追加
       SECRET_KEY_BASE_DUMMY=1 \
       bundle exec rails assets:precompile

#################################
# 最終ランタイムステージ
#################################
FROM ruby:3.4.2-slim AS release 
WORKDIR /app

ENV RAILS_ENV=production \
    RAILS_LOG_TO_STDOUT=true \
    BUNDLE_WITHOUT="development:test"


# 本番・開発共通で必要なクライアント等を追加（mysql クライアントなど）
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    default-mysql-client \
    libvips42 \
    # ダウンロード済みパッケージのキャッシュを削除
    && apt-get clean && \ 
    # パッケージリストを削除
    rm -rf /var/lib/apt/lists/*

# ビルドステージで作ったアプリ本体やGem（外部ライブラリーのパッケージ、プリコンパイル済みのアセット）をコピーしてくる
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /app /app



# binstub に実行権限を付与
RUN chmod -R 755 bin

# rails ユーザーを作成し(railsグループも自動付与)所有権を移譲
# セキュリティ向上のためbashを使えないようにする。/bin/false を指定
RUN useradd rails --create-home --home-dir /app --shell /bin/false && \
    # 以下のディレクトリの所有権を railsグループ　rails ユーザーに移譲
    chown -R rails:rails /usr/local/bundle /app
# 以下の命令はrailsグループ:raisl ユーザーで実行すること
USER rails:rails
# docker run -P で自動的にポートを指定せずに公開するための設定
# 後にオーケストレーションツールでEXPOSE変数が参照される可能性あり
EXPOSE 3000

# サーバ起動時に PID を念の為クリア、PIDが残っているとサーバーが起動しないため,pidは強制終了時に残ることがある
# また、exec "$@" でCMDの内容を実行する,$@ はCMDで指定されたコマンドを指す
# execあり: bashプロセスが親プロセスになるのではなく、新しいプロセスに置き換えられる
# execなし: bashプロセスが親プロセスになり、CMDで指定されたコマンドがその子プロセスとして実行される
ENTRYPOINT ["bash", "-c", "rm -f /app/tmp/pids/server.pid && exec \"$@\"", "--"]
# アプリケーションサーバーを起動するコマンド
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]

