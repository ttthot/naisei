# syntax = docker/dockerfile:1

#################################
# 共通設定ステージ
#################################
FROM ruby:3.4.2-slim AS base
WORKDIR /app

# 必要なパッケージと Node.js をセットアップ
# → cssbundling-rails や daisyUI のビルドに npx が必要
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    curl \
    gnupg \
    default-libmysqlclient-dev \
    git \
    libvips \
    pkg-config \
    libyaml-dev && \
    # NodeSource から Node.js v18 をインストール
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install --no-install-recommends -y nodejs && \
    # yarn のインストール部分を削除
    # キャッシュを削除
    rm -rf /var/lib/apt/lists/*

#################################
# ビルド用ステージ
#################################
FROM base AS build

# Gemfile 先読みでキャッシュ効かせる
COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN gem install rails

# アプリ本体をコピー
COPY . .

# Rails のプリコンパイル等（初回はエラーでもスキップ可）
RUN mkdir -p db log storage tmp tmp/pids && \
    bundle exec bootsnap precompile app/ lib/ && \
    SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile || echo "assets:precompile skipped"

#################################
# 最終ランタイムステージ
#################################
FROM base

# 本番・開発共通で必要なクライアント等を追加（mysql クライアントなど）
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    default-mysql-client && \
    rm -rf /var/lib/apt/lists/*

# ビルド成果物と Gems をコピー
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /app /app

WORKDIR /app

# binstub に実行権限を付与
RUN chmod -R 755 bin

# rails ユーザーを作成し所有権を移譲
RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails /usr/local/bundle /app/db /app/log /app/storage /app/tmp /app/public
USER rails:rails

# サーバ起動時に PID をクリア
ENTRYPOINT ["bash", "-c", "rm -f tmp/pids/server.pid && exec \"$@\"", "--"]

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
