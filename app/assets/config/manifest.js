/**
 * このファイルは、アセットパイプラインの設定ファイルです。
 * Railsアプリケーションで使用される静的アセット（画像、スタイルシート、JavaScriptなど）の
 * パスを指定し、リンクを作成するために使用されます。
 *
 * @file Manages the asset pipeline configuration for a Rails application.
 * @description This file specifies the directories and file types to be included in the asset pipeline.
 * It links images, stylesheets, JavaScript files, and other assets to be precompiled and served.
 */
//= link_tree ../images
//= link_tree ../../../vendor/javascript .js
//= link_tree ../builds
