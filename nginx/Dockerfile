# 軽量安定ばんどのnginxを使用
FROM nginx:stable-alpine

# デフォルト設定ファイルを削除
RUN rm -f /etc/nginx/conf.d/*

# カスタム設定ファイルをコピー
COPY nginx.conf /etc/nginx/conf.d/default.conf

# コンテナ起動時に実行するコマンドを指定
# nginxがPID 1で実行、-gにdamon offつまりバックグランドで実行しないように値を渡す
# これにより親プロセス1が終了しないのでコンテナが終了しない
# またログを標準出力に送れる、これがECSのCloudWatch Logsで利用可能）
CMD ["nginx", "-g", "daemon off;"]
