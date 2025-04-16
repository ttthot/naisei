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
      curl \
      default-mysql-client \
      libvips \
      nodejs \
      yarn && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# ビルド成果物をコピー
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /app /app

# 必要なディレクトリの権限をrailsユーザーに
RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp public tmp/pids

USER rails:rails

# ENTRYPOINTはシンプルに（bin/docker-entrypointが無い場合もOK）
ENTRYPOINT ["bash", "-c", "rm -f tmp/pids/server.pid && exec \"$@\"", "--"]

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
