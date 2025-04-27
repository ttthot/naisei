# syntax = docker/dockerfile:1

FROM ruby:3.4.2-slim as base
WORKDIR /app

# 開発用の環境変数（本番はdocker-compose.yml等で上書き推奨）
ENV RAILS_ENV="development" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="production"

FROM base as build

# 必要なパッケージをインストール
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
      build-essential \
      default-libmysqlclient-dev \
      git \
      libvips \
      pkg-config \
      libyaml-dev \
      nodejs \
      yarn

# GemfileとGemfile.lockを先にコピーしてbundle installのキャッシュを効かせる
COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN gem install rails

# アプリ本体をコピー
COPY . .

# 必要なディレクトリを作成
RUN mkdir -p db log storage tmp public tmp/pids

# 雛形が揃っている場合のみプリコンパイル（初回セットアップ時はコメントアウトしてOK）
RUN bundle exec bootsnap precompile app/ lib/
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile || echo "assets:precompile skipped"

FROM base

# 本番・開発共通で必要なパッケージ
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
      build-essential \
      curl \
      default-mysql-client \
      git \  
      libvips \
      nodejs \
      yarn && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Gitのページャー設定を変更
RUN git config --global pager.branch false && \
    git config --global core.pager ''

# ビルド成果物をコピー
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /app /app

# bin 以下の binstub に実行権限を付与 robocop用
RUN chmod -R 755 /app/bin

# 必要なディレクトリの権限をrailsユーザーに
# 'rails'という新しいユーザーを作成します。このユーザーにはホームディレクトリが作成され、
# デフォルトのシェルとしてbashが設定されます。
# このユーザーはRailsアプリケーションを安全に実行するために使用され、rootユーザーの使用を避けます。
RUN useradd rails --create-home --shell /bin/bash && \
    # 以下のディレクトリやファイルの所有者を'rails'ユーザーとそのグループに変更します。
    # これにより、'rails'ユーザーがこれらのディレクトリ内で適切な読み書きや実行権限を持つようになります。
    # - /usr/local/bundle: アプリケーション用にインストールされたRubyのgemを格納。
    # - db: データベース関連のファイル（該当する場合）。
    # - log: アプリケーションのログファイル。
    # - storage: Active Storageのファイル（例: アップロードされたファイル）。
    # - tmp: アプリケーションで使用される一時ファイル。
    # - public: 公開可能なファイル（例: アセット）。
    # - tmp/pids: サーバープロセスのプロセスIDファイルを格納。
    chown -R rails:rails /usr/local/bundle db log storage tmp public tmp/pids 
USER rails:rails

# ENTRYPOINTはシンプルに（bin/docker-entrypointが無い場合もOK）
ENTRYPOINT ["bash", "-c", "rm -f tmp/pids/server.pid && exec \"$@\"", "--"]
# Dockerコンテナの3000番ポートを外部に公開します
EXPOSE 3000
# Railsサーバーを全てのネットワークインターフェイス（0.0.0.0）の3000番ポートで起動します。
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
