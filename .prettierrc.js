module.exports = {
  // --- 基本設定 ---
  printWidth: 120,
  tabWidth: 2,
  semi: true,
  singleQuote: true,
  trailingComma: 'all',
  htmlWhitespaceSensitivity: 'ignore',

  // --- プラグイン設定 ---
  plugins: ['@prettier/plugin-ruby', '@4az/prettier-plugin-html-erb'],

  overrides: [
    {
      files: ['*.erb', '*.html.erb'],
      options: {
        parser: 'html',
        printWidth: 999999, // 実質改行無効
        htmlWhitespaceSensitivity: 'ignore',
        bracketSameLine: false,
        singleAttributePerLine: false,
        tabWidth: 2,
        useTabs: false,
        wrapAttributes: 'preserve', // 属性の改行を保持
      },
    },
  ],
};
