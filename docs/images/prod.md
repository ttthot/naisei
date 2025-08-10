<!DOCTYPE html>
<html data-theme="lemonade" lang="ja">
  <head>
<title>Naisei</title>

    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <meta name="csrf-param" content="authenticity_token" />

<meta name="csrf-token" content="8igiIPxjBJgNdgX5Ef9pLeJLnFdUwudY_9D4XiTzGeVgjdpnVmbfbsirw2cHw4TtJOw5CRSYObH6LDJ5lwpA4w" />
    
    <link rel="stylesheet" href="/assets/application-50d5773fb60f2fdf032f9dea7c9eee5c56eb90bb8cfa5b45751e7059a8a55fc9.css" data-turbo-track="reload" />
    <script type="importmap" data-turbo-track="reload">{
  "imports": {
    "application": "/assets/application-2e48cc1eaa90fbfb30a41baa09a3f2fb912425dd83842a5273fea5256bb3af1b.js",
    "@hotwired/turbo-rails": "/assets/turbo.min-c85b4c5406dd49df1f63e03a5b07120d39cc3e33bc2448f5e926b80514f9dfc8.js",
    "@hotwired/stimulus": "/assets/stimulus.min-dd364f16ec9504dfb72672295637a1c8838773b01c0b441bd41008124c407894.js",
    "@hotwired/stimulus-loading": "/assets/stimulus-loading-3576ce92b149ad5d6959438c6f291e2426c86df3b874c525b30faad51b0d96b3.js",
    "controllers/application": "/assets/controllers/application-8f2639fe40ab77951aed407b9718aea69394bb0d4954dab815210813f541a50b.js",
    "controllers/hello_controller": "/assets/controllers/hello_controller-7f59110cda0590e842fa21ec58f351ca3df8385326afb50f932d9e87d0bf5355.js",
    "controllers": "/assets/controllers/index-a959e8168df00fd96427bb2c8b73f4e99a92d430ceef1a2e39e865a9bbe507a7.js"
  }
}</script>
<link rel="modulepreload" href="/assets/application-2e48cc1eaa90fbfb30a41baa09a3f2fb912425dd83842a5273fea5256bb3af1b.js">
<link rel="modulepreload" href="/assets/turbo.min-c85b4c5406dd49df1f63e03a5b07120d39cc3e33bc2448f5e926b80514f9dfc8.js">
<link rel="modulepreload" href="/assets/stimulus.min-dd364f16ec9504dfb72672295637a1c8838773b01c0b441bd41008124c407894.js">
<link rel="modulepreload" href="/assets/stimulus-loading-3576ce92b149ad5d6959438c6f291e2426c86df3b874c525b30faad51b0d96b3.js">
<link rel="modulepreload" href="/assets/controllers/application-8f2639fe40ab77951aed407b9718aea69394bb0d4954dab815210813f541a50b.js">
<link rel="modulepreload" href="/assets/controllers/hello_controller-7f59110cda0590e842fa21ec58f351ca3df8385326afb50f932d9e87d0bf5355.js">
<link rel="modulepreload" href="/assets/controllers/index-a959e8168df00fd96427bb2c8b73f4e99a92d430ceef1a2e39e865a9bbe507a7.js">
<script type="module">import "application"</script>
    <script src="/assets/application-2e48cc1eaa90fbfb30a41baa09a3f2fb912425dd83842a5273fea5256bb3af1b.js" data-turbo-track="reload" type="module"></script>
    <style>
       body {
      font-family: 'Zen Maru Gothic', 'Avenir', 'Hiragino Sans', 'Meiryo', sans-serif;
       line-height: 1.7;        /* 行間（1.7倍） */
      letter-spacing: 0.03em;  /* 文字間隔を少し広げる */
    }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;700&display=swap" rel="stylesheet">
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
      rel="stylesheet"
    >
  </head>
  <body class="bg-base-100 text-base-content font-sans">

<div class="drawer lg:drawer-open min-h-screen">
  <input id="my-drawer" type="checkbox" class="drawer-toggle" />

  <!-- サイドバー（左側） -->
<div class="drawer-side">
  <label for="my-drawer" class="drawer-overlay"></label>
  <aside class="w-64 min-h-full bg-base-200 flex flex-col">
    <!-- ロゴ＋アプリ名 -->
    <div class="flex items-center gap-2 px-6 py-4 border-b border-base-300">
      <span class="text-3xl text-primary">
        <i class="fa-solid fa-face-smile"></i>
      </span>
      <span class="font-bold text-xl tracking-tight">Naisei</span>
    </div>

    <!-- メニューリスト (daisyUI menu) -->
    <ul class="menu flex-1 px-4 py-4 gap-4">
      <li>
      <a class="btn btn-ghost w-full justify-start gap-2 text-sm font-normal bg-base-200 hover:bg-base-300 shadow" href="/posts/new">
        <i class="fa-solid fa-plus text-sm"></i>
        <span>新規投稿</span>

</a> </li>
<li>
<a href="/posts">
<i class="fa-solid fa-list-ul"></i>
<span>投稿一覧</span>
</a> </li>
<li>
<a href="/emotion_calendar#calendar">
<i class="fa-solid fa-calendar-days"></i>
<span>感情カレンダー</span>
</a> </li>
<li>
<a href="/settings">
<i class="fa-solid fa-gear"></i>
<span>設定</span>
</a> </li>
<li class="mt-auto">
<a data-turbo-method="delete" href="/logout">
<i class="fa-solid fa-right-from-bracket"></i>
<span>ログアウト</span>
</a> </li>
</ul>
<!-- サイドバーフッター -->
<footer class="p-4 text-xs text-base-content/60 text-center border-t border-base-300">
&copy; 2025 Naisei
</footer>

  </aside>
</div>

  <!-- メインコンテンツ（右側） -->
  <div class="drawer-content flex flex-col min-h-screen bg-base-100">
    <!-- モバイル用メニューボタン -->
    <label for="my-drawer" class="btn btn-square btn-outline btn-ghost drawer-button lg:hidden mt-0 w-12 h-12 flex items-center justify-center">
      <i class="fa-solid fa-bars text-xl"></i>
    </label>
    <div class="card bg-base-100 shadow-lg w-full max-w-md mx-auto m-4">
  <div class="card-body flex flex-col items-center">

    <div class="tooltip tooltip-success" data-tip="色の濃淡で感情の強さがわかります！">
      <button class="btn btn-soft text-2xl font-bold mb-4 text-center">感情カレンダー</button>
    </div>
    <div
      class="
        grid grid-cols-8 gap-1 mb-2 text-xs text-base-content/60 text-center w-fit
      "
    >
      <div class="w-6 h-6 flex items-center justify-center">月</div>
      <div class="w-6 h-6 flex items-center justify-center"></div>
      <div class="w-6 h-6 flex items-center justify-center"></div>
      <div class="w-6 h-6 flex items-center justify-center"></div>
      <div class="w-6 h-6 flex items-center justify-center"></div>
      <div class="w-6 h-6 flex items-center justify-center"></div>
      <div class="w-6 h-6 flex items-center justify-center"></div>
      <div class="w-6 h-6 flex items-center justify-center"></div>
    </div>

    <div class="grid grid-cols-8 gap-1 w-fit">
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >
          １月
        </div>

            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-01"
            >
            </div>
            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-02"
            >
            </div>
            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-03"
            >
            </div>
            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-04"
            >
            </div>
            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-05"
            >
            </div>
            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-06"
            >
            </div>
            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-07"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-08"
            >
            </div>
            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-09"
            >
            </div>
            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-10"
            >
            </div>
            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-11"
            >
            </div>
            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-12"
            >
            </div>
            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-13"
            >
            </div>
            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-14"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-15"
            >
            </div>
            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-16"
            >
            </div>
            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-17"
            >
            </div>
            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-18"
            >
            </div>
            <div
              class="w-6 h-6 bg-base-300 rounded-sm"
              title="2025-01-19"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-40 rounded-sm"
              title="2025-01-20"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-20 rounded-sm"
              title="2025-01-21"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-purple-400 opacity-80 rounded-sm"
              title="2025-01-22"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-20 rounded-sm"
              title="2025-01-23"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-20 rounded-sm"
              title="2025-01-24"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-100 rounded-sm"
              title="2025-01-25"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-100 rounded-sm"
              title="2025-01-26"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-20 rounded-sm"
              title="2025-01-27"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-20 rounded-sm"
              title="2025-01-28"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >
          ２月
        </div>

            <div
              class="w-6 h-6 bg-red-500 opacity-80 rounded-sm"
              title="2025-01-29"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-60 rounded-sm"
              title="2025-01-30"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-60 rounded-sm"
              title="2025-01-31"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-100 rounded-sm"
              title="2025-02-01"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-80 rounded-sm"
              title="2025-02-02"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-80 rounded-sm"
              title="2025-02-03"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-40 rounded-sm"
              title="2025-02-04"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-blue-500 opacity-100 rounded-sm"
              title="2025-02-05"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-100 rounded-sm"
              title="2025-02-06"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-40 rounded-sm"
              title="2025-02-07"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-20 rounded-sm"
              title="2025-02-08"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-80 rounded-sm"
              title="2025-02-09"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-100 rounded-sm"
              title="2025-02-10"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-40 rounded-sm"
              title="2025-02-11"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-green-500 opacity-80 rounded-sm"
              title="2025-02-12"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-40 rounded-sm"
              title="2025-02-13"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-60 rounded-sm"
              title="2025-02-14"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-20 rounded-sm"
              title="2025-02-15"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-20 rounded-sm"
              title="2025-02-16"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-20 rounded-sm"
              title="2025-02-17"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-100 rounded-sm"
              title="2025-02-18"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-yellow-500 opacity-100 rounded-sm"
              title="2025-02-19"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-20 rounded-sm"
              title="2025-02-20"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-40 rounded-sm"
              title="2025-02-21"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-60 rounded-sm"
              title="2025-02-22"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-100 rounded-sm"
              title="2025-02-23"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-20 rounded-sm"
              title="2025-02-24"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-20 rounded-sm"
              title="2025-02-25"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >
          ３月
        </div>

            <div
              class="w-6 h-6 bg-yellow-500 opacity-100 rounded-sm"
              title="2025-02-26"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-40 rounded-sm"
              title="2025-02-27"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-80 rounded-sm"
              title="2025-02-28"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-40 rounded-sm"
              title="2025-03-01"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-100 rounded-sm"
              title="2025-03-02"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-40 rounded-sm"
              title="2025-03-03"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-100 rounded-sm"
              title="2025-03-04"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-red-500 opacity-80 rounded-sm"
              title="2025-03-05"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-80 rounded-sm"
              title="2025-03-06"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-40 rounded-sm"
              title="2025-03-07"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-80 rounded-sm"
              title="2025-03-08"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-100 rounded-sm"
              title="2025-03-09"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-40 rounded-sm"
              title="2025-03-10"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-40 rounded-sm"
              title="2025-03-11"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-red-500 opacity-20 rounded-sm"
              title="2025-03-12"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-20 rounded-sm"
              title="2025-03-13"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-40 rounded-sm"
              title="2025-03-14"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-100 rounded-sm"
              title="2025-03-15"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-40 rounded-sm"
              title="2025-03-16"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-40 rounded-sm"
              title="2025-03-17"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-40 rounded-sm"
              title="2025-03-18"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-purple-400 opacity-60 rounded-sm"
              title="2025-03-19"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-40 rounded-sm"
              title="2025-03-20"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-40 rounded-sm"
              title="2025-03-21"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-100 rounded-sm"
              title="2025-03-22"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-100 rounded-sm"
              title="2025-03-23"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-100 rounded-sm"
              title="2025-03-24"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-100 rounded-sm"
              title="2025-03-25"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >
          ４月
        </div>

            <div
              class="w-6 h-6 bg-purple-400 opacity-100 rounded-sm"
              title="2025-03-26"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-20 rounded-sm"
              title="2025-03-27"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-40 rounded-sm"
              title="2025-03-28"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-60 rounded-sm"
              title="2025-03-29"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-20 rounded-sm"
              title="2025-03-30"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-20 rounded-sm"
              title="2025-03-31"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-40 rounded-sm"
              title="2025-04-01"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-purple-400 opacity-100 rounded-sm"
              title="2025-04-02"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-60 rounded-sm"
              title="2025-04-03"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-60 rounded-sm"
              title="2025-04-04"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-60 rounded-sm"
              title="2025-04-05"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-80 rounded-sm"
              title="2025-04-06"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-60 rounded-sm"
              title="2025-04-07"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-60 rounded-sm"
              title="2025-04-08"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-purple-400 opacity-100 rounded-sm"
              title="2025-04-09"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-20 rounded-sm"
              title="2025-04-10"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-80 rounded-sm"
              title="2025-04-11"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-20 rounded-sm"
              title="2025-04-12"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-100 rounded-sm"
              title="2025-04-13"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-100 rounded-sm"
              title="2025-04-14"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-40 rounded-sm"
              title="2025-04-15"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-yellow-500 opacity-40 rounded-sm"
              title="2025-04-16"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-40 rounded-sm"
              title="2025-04-17"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-100 rounded-sm"
              title="2025-04-18"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-20 rounded-sm"
              title="2025-04-19"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-100 rounded-sm"
              title="2025-04-20"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-20 rounded-sm"
              title="2025-04-21"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-60 rounded-sm"
              title="2025-04-22"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-purple-400 opacity-100 rounded-sm"
              title="2025-04-23"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-100 rounded-sm"
              title="2025-04-24"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-80 rounded-sm"
              title="2025-04-25"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-80 rounded-sm"
              title="2025-04-26"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-100 rounded-sm"
              title="2025-04-27"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-20 rounded-sm"
              title="2025-04-28"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-60 rounded-sm"
              title="2025-04-29"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >
          ５月
        </div>

            <div
              class="w-6 h-6 bg-red-500 opacity-60 rounded-sm"
              title="2025-04-30"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-80 rounded-sm"
              title="2025-05-01"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-60 rounded-sm"
              title="2025-05-02"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-60 rounded-sm"
              title="2025-05-03"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-60 rounded-sm"
              title="2025-05-04"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-40 rounded-sm"
              title="2025-05-05"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-60 rounded-sm"
              title="2025-05-06"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-blue-500 opacity-60 rounded-sm"
              title="2025-05-07"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-60 rounded-sm"
              title="2025-05-08"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-60 rounded-sm"
              title="2025-05-09"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-100 rounded-sm"
              title="2025-05-10"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-100 rounded-sm"
              title="2025-05-11"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-60 rounded-sm"
              title="2025-05-12"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-80 rounded-sm"
              title="2025-05-13"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-purple-400 opacity-80 rounded-sm"
              title="2025-05-14"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-60 rounded-sm"
              title="2025-05-15"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-20 rounded-sm"
              title="2025-05-16"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-40 rounded-sm"
              title="2025-05-17"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-20 rounded-sm"
              title="2025-05-18"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-60 rounded-sm"
              title="2025-05-19"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-20 rounded-sm"
              title="2025-05-20"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-yellow-500 opacity-20 rounded-sm"
              title="2025-05-21"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-100 rounded-sm"
              title="2025-05-22"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-40 rounded-sm"
              title="2025-05-23"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-40 rounded-sm"
              title="2025-05-24"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-80 rounded-sm"
              title="2025-05-25"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-60 rounded-sm"
              title="2025-05-26"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-100 rounded-sm"
              title="2025-05-27"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >
          ６月
        </div>

            <div
              class="w-6 h-6 bg-blue-500 opacity-20 rounded-sm"
              title="2025-05-28"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-80 rounded-sm"
              title="2025-05-29"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-80 rounded-sm"
              title="2025-05-30"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-100 rounded-sm"
              title="2025-05-31"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-100 rounded-sm"
              title="2025-06-01"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-100 rounded-sm"
              title="2025-06-02"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-20 rounded-sm"
              title="2025-06-03"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-green-500 opacity-20 rounded-sm"
              title="2025-06-04"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-40 rounded-sm"
              title="2025-06-05"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-40 rounded-sm"
              title="2025-06-06"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-100 rounded-sm"
              title="2025-06-07"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-20 rounded-sm"
              title="2025-06-08"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-40 rounded-sm"
              title="2025-06-09"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-40 rounded-sm"
              title="2025-06-10"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-red-500 opacity-40 rounded-sm"
              title="2025-06-11"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-80 rounded-sm"
              title="2025-06-12"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-60 rounded-sm"
              title="2025-06-13"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-80 rounded-sm"
              title="2025-06-14"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-80 rounded-sm"
              title="2025-06-15"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-100 rounded-sm"
              title="2025-06-16"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-60 rounded-sm"
              title="2025-06-17"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-red-500 opacity-60 rounded-sm"
              title="2025-06-18"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-60 rounded-sm"
              title="2025-06-19"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-80 rounded-sm"
              title="2025-06-20"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-20 rounded-sm"
              title="2025-06-21"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-40 rounded-sm"
              title="2025-06-22"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-60 rounded-sm"
              title="2025-06-23"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-100 rounded-sm"
              title="2025-06-24"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >
          ７月
        </div>

            <div
              class="w-6 h-6 bg-blue-500 opacity-80 rounded-sm"
              title="2025-06-25"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-40 rounded-sm"
              title="2025-06-26"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-100 rounded-sm"
              title="2025-06-27"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-20 rounded-sm"
              title="2025-06-28"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-20 rounded-sm"
              title="2025-06-29"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-20 rounded-sm"
              title="2025-06-30"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-20 rounded-sm"
              title="2025-07-01"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-green-500 opacity-60 rounded-sm"
              title="2025-07-02"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-80 rounded-sm"
              title="2025-07-03"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-100 rounded-sm"
              title="2025-07-04"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-60 rounded-sm"
              title="2025-07-05"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-100 rounded-sm"
              title="2025-07-06"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-20 rounded-sm"
              title="2025-07-07"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-40 rounded-sm"
              title="2025-07-08"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-green-500 opacity-40 rounded-sm"
              title="2025-07-09"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-20 rounded-sm"
              title="2025-07-10"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-60 rounded-sm"
              title="2025-07-11"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-80 rounded-sm"
              title="2025-07-12"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-60 rounded-sm"
              title="2025-07-13"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-20 rounded-sm"
              title="2025-07-14"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-60 rounded-sm"
              title="2025-07-15"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-red-500 opacity-80 rounded-sm"
              title="2025-07-16"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-80 rounded-sm"
              title="2025-07-17"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-20 rounded-sm"
              title="2025-07-18"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-100 rounded-sm"
              title="2025-07-19"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-20 rounded-sm"
              title="2025-07-20"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-40 rounded-sm"
              title="2025-07-21"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-80 rounded-sm"
              title="2025-07-22"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-blue-500 opacity-80 rounded-sm"
              title="2025-07-23"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-80 rounded-sm"
              title="2025-07-24"
            >
            </div>
            <div
              class="w-6 h-6 bg-green-500 opacity-80 rounded-sm"
              title="2025-07-25"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-80 rounded-sm"
              title="2025-07-26"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-80 rounded-sm"
              title="2025-07-27"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-20 rounded-sm"
              title="2025-07-28"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-40 rounded-sm"
              title="2025-07-29"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >
          ８月
        </div>

            <div
              class="w-6 h-6 bg-green-500 opacity-40 rounded-sm"
              title="2025-07-30"
            >
            </div>
            <div
              class="w-6 h-6 bg-red-500 opacity-80 rounded-sm"
              title="2025-07-31"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-40 rounded-sm"
              title="2025-08-01"
            >
            </div>
            <div
              class="w-6 h-6 bg-yellow-500 opacity-80 rounded-sm"
              title="2025-08-02"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-20 rounded-sm"
              title="2025-08-03"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-60 rounded-sm"
              title="2025-08-04"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-20 rounded-sm"
              title="2025-08-05"
            >
            </div>
        <div
          class="
            w-8 h-8 flex items-center justify-center text-xs text-base-content/80
          "
        >

        </div>

            <div
              class="w-6 h-6 bg-red-500 opacity-60 rounded-sm"
              title="2025-08-06"
            >
            </div>
            <div
              class="w-6 h-6 bg-blue-500 opacity-80 rounded-sm"
              title="2025-08-07"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-60 rounded-sm"
              title="2025-08-08"
            >
            </div>
            <div
              class="w-6 h-6 bg-purple-400 opacity-60 rounded-sm"
              title="2025-08-09"
            >
            </div>
    </div>

    <div class="mt-6 p-4 bg-base-200 rounded-lg w-full">
      <h3 class="text-lg font-semibold mb-3 text-base-content">感情の種類</h3>
      <div class="flex flex-wrap gap-3 justify-center">
          <div class="flex items-center gap-2">
            <div class="w-4 h-4 bg-green-500 rounded-sm"></div>
            <span class="text-lg text-base-content/80">😊 嬉しい</span>
          </div>
          <div class="flex items-center gap-2">
            <div class="w-4 h-4 bg-blue-500 rounded-sm"></div>
            <span class="text-lg text-base-content/80">😢 悲しい</span>
          </div>
          <div class="flex items-center gap-2">
            <div class="w-4 h-4 bg-red-500 rounded-sm"></div>
            <span class="text-lg text-base-content/80">😠 怒り</span>
          </div>
          <div class="flex items-center gap-2">
            <div class="w-4 h-4 bg-yellow-500 rounded-sm"></div>
            <span class="text-lg text-base-content/80">🎉 ワクワク</span>
          </div>
          <div class="flex items-center gap-2">
            <div class="w-4 h-4 bg-purple-400 rounded-sm"></div>
            <span class="text-lg text-base-content/80">😐 普通</span>
          </div>
      </div>
    </div>

  </div>
</div>

  </div>
</div>

  </body>
</html>
