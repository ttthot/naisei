# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.
# puma起動後にこのファイルが読み出されます。
# raiｌｓを初期化
require_relative "config/environment"
# RailsアプリケーションがRackに登録される
# Rackとは、Rubyで書かれたWebアプリケーションのためのインターフェース
run Rails.application
# Railsアプリケーションをロードすることで、初期値や設定が適用
Rails.application.load_server
# pumaがhttpリクエスト待ち
