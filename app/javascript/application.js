// TODO後で理解
// 1. ブラウザがHTMLをパース
//  javascript_importmap_tagsによるモジュール読み込み

// 2. <script type="module">でapplication.jsを読み込み
// 3. importmapによるモジュール解決
// 4. application.js実行開始
// 5. DOMContentLoadedイベント待機
// 6. DOM構築完了後、イベントリスナー登録
// 7. ユーザー操作時の動的ハイライト更新
import '@hotwired/turbo-rails';
import './controllers';

// --- 感情ボタンのハイライト用 ---
function updateEmotionButtons(groupName) {
  // 明示的にイベントリスナーを追加
  const radios = document.querySelectorAll(`input[type="radio"][name="${groupName}"]`);
  radios.forEach((radio) => {
    radio.parentElement.classList.remove('btn-primary');
    radio.parentElement.classList.add('btn-outline');
  });
  radios.forEach((radio) => {
    if (radio.checked) {
      radio.parentElement.classList.remove('btn-outline');
      radio.parentElement.classList.add('btn-primary');
    }
  });
}

document.addEventListener('turbo:load', function () {
  updateEmotionButtons('post[emotion]');
  const radios = document.querySelectorAll('input[type="radio"][name="post[emotion]"]');
  radios.forEach((radio) => {
    radio.addEventListener('change', function () {
      updateEmotionButtons('post[emotion]');
    });
  });
});
// --- 感情ボタンのハイライト用 ---

// --- 投稿内容ない時ボタン無効用 ---
// 投稿ボタンがからの時は向こう、入れたら有効になるようにする
// id="emotion_content" id="submit_btn"
// HTMLが読み込まれたときに中の処理を実行
document.addEventListener('turbo:load', function () {
  const content = document.getElementById('emotion_content');
  const btn = document.getElementById('submit_btn');
  // jsエラーで止まることを防止
  if (!content || !btn) return;

  function toggleButton() {
    const text = content.value;
    // スペース改行を全部消す
    const trimmedText = text.trim();
    // もし空なら無効化 disalbe属性にtrueを入れる
    if (trimmedText === '') {
      btn.disabled = true;
    } else {
      btn.disabled = false;
    }
  }

  content.addEventListener('input', toggleButton);
  // 初回も判定
  toggleButton();
});
