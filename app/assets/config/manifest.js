/**
 * このファイルは、アセットパイプラインの設定ファイルです。
 * Railsアプリケーションで使用される静的アセット（画像、スタイルシート、JavaScriptなど）の
 * パスを指定し、リンクを作成するために使用されます。
 *マニフェストに明示的に記載されていないアセットは、本番環境では利用できません。
 * これにより、アセットの管理と最適化が容易になります。
 * アセットパイプラインは、Railsの機能であり、アプリケーションのパフォーマンスを向上させるために
 * 使用されます。
 * @file Manages the asset pipeline configuration for a Rails application.
 * @description This file specifies the directories and file types to be included in the asset pipeline.
 * It links images, stylesheets, JavaScript files, and other assets to be precompiled and served.
 */
//= link_tree ../images
//= link_tree ../../../vendor/javascript .js
//= link_tree ../builds
//= link controllers/application.js
//= link controllers/hello_controller.js
//= link controllers/index.js
//= link application.css
//= link application.js
