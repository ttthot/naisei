# 軽量安定ばんどのnginxを使用
FROM nginx:stable-alpine

# デフォルト設定、Dockerイメージを「ビルドする時に変数を入れる
ARG RAILS_APP_IMAGE_TAG=latest # デフォルトタグを latest に設定

# デフォルト設定ファイルを削除
RUN rm -f /etc/nginx/conf.d/*

# カスタム設定ファイルをコピー
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 設定の煩雑さを防ぐためECSでボリュームを共有しないという戦略をとったので
# Railsアプリケーションのビルドステージで生成された静的アセット（CSS、JavaScript、画像など）をコピー
# この命令は、別のDockerfile（Railsアプリケーション用）で定義されたbuildステージから
# ファイルをenginxにコピーする機能
# dockercompose用
# COPY --from=my-rails-app-prod:local-test /app/public /app/public
COPY --from=692859935005.dkr.ecr.ap-northeast-1.amazonaws.com/my-app-rails:${RAILS_APP_IMAGE_TAG} /app/public /app/public

EXPOSE 80
# HTTPSの場合
EXPOSE 443 
# コンテナ起動時に実行するコマンドを指定
# nginxがPID 1で実行、-gにdamon offつまりバックグランドで実行しないように値を渡す
# これにより親プロセス1が終了しないのでコンテナが終了しない
# またログを標準出力に送れる、これがECSのCloudWatch Logsで利用可能）
CMD ["nginx", "-g", "daemon off;"]
