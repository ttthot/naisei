/** @type {import('tailwindcss').Config} */
module.exports = {
  // content には Tailwind CSS クラスを含むファイルパスのパターンを指定
  content: [
    "./app/views/**/*.{html,html.erb,erb}", // Rails ビューファイル
    "./app/helpers/**/*.rb",                // Rails ヘルパー
    "./app/javascript/**/*.js",             // JavaScript ファイル
    "./app/assets/stylesheets/**/*.css",    // CSS ファイル
  ],
  
  // テーマカスタマイズ
  theme: {
    extend: {
      // 色のカスタマイズ例
      colors: {
        'custom-blue': '#1fb6ff',
      },
      // フォントのカスタマイズ例
      fontFamily: {
        sans: ['Inter', 'sans-serif'],
      },
      // 必要に応じて他のカスタマイズを追加
    },
  },
  
  // プラグイン
  plugins: [
    require('daisyui'),
  ],
  
  // daisyUI の設定（オプション）
  daisyui: {
    themes: ['light', 'dark', 'cupcake'], // 使用したいテーマを指定
    darkTheme: 'dark',                   // ダークモード設定
    base: true,                          // ベーススタイルを適用
    styled: true,                        // コンポーネントのスタイル適用
    utils: true,                         // ユーティリティクラス
    logs: true,                          // コンソールログ
  }
}
