# encoding: utf-8
# language: ja
@moviepage
機能: 再生画面を開く
  シナリオ: sm9の再生画面にアクセスする
    もし sm9 の再生画面を表示する
    ならば sm9 の再生画面が表示されていること
    かつ 要素 "#btnCreate" が存在しないこと

  シナリオ: sm9の再生画面にアクセスし、グラフが表示されていることを確認する
    もし sm9 の再生画面を表示する
    ならば sm9 の再生画面が表示されていること
    かつ 要素 "div#chart svg rect" が存在すること

  シナリオ: sm9の再生画面にアクセスし、動画プレイヤーが表示されていることを確認する
    もし sm9 の再生画面を表示する
    ならば sm9 の再生画面が表示されていること
    かつ 要素 "script[src='http://ext.nicovideo.jp/thumb_watch/sm9']" が存在すること

  シナリオ: sm9の再生画面にアクセスし、グラフが10分割で表示されていることを確認する
    もし sm9 の再生画面を表示する
    ならば sm9 の再生画面が表示されていること
    かつ 要素 "div#chart svg rect" が 10 個存在すること

  シナリオ: sm9を300分割する再生画面にアクセスし、グラフが300分割で表示されていることを確認する
    もし sm9 の 300 分割再生画面を表示する
    ならば sm9 の 300 分割再生画面が表示されていること
    かつ 要素 "div#chart svg rect" が 300 個存在すること

  シナリオ: sm9の再生画面でsm32で検索する
    もし sm9 の再生画面を表示する
    かつ q に sm32 と入力する
    かつ 再生 ボタンをクリックする
    ならば sm9 の再生画面が表示されていること

  シナリオ: sm9の再生画面でこのタグは存在しませんで検索する
    もし sm9 の再生画面を表示する
    かつ q に このタグは存在しません と入力する
    かつ 再生 ボタンをクリックする
    ならば sm9 の再生画面が表示されていること

  シナリオ: sm9の再生画面で何も入力せずに検索する
    もし sm9 の再生画面を表示する
    かつ q に "" と入力する
    かつ 再生 ボタンをクリックする
    ならば sm9 の再生画面が表示されていること

	#シナリオ: sm3402368の再生画面にアクセスする
  	#  もし 動画検索画面を表示する
  	#  かつ sm3402368 の再生画面を表示する
  	#  ならば 動画検索画面が表示されていること
