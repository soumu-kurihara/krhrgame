/*
基本動作
全てのページで使うようなものをまとめたマクロ
ベーシック
*/

[macro name="destroy"]
[cm  ]
[clearfix]

[freeimage layer="base"]
[freeimage layer="0"]
[freeimage layer="1"]
[layopt layer=message0 visible=false]
[chara_hide_all time="50"]

[endmacro ]

[macro name="adv"]
;ADV表示の準備------------------------------

;メッセージウィンドウの設定
[position layer="message0" left=160 top=500 width=1000 height=200 page=fore visible=true]
[current layer="message0" ]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="45" marginl="50" marginr="70" marginb="60"]

;メッセージウィンドウの表示
@layopt layer=message0 visible=true

;キャラクターの名前が表示される文字領域
[ptext name="chara_name_area" layer="message0" color="white" size=28 bold=true x=180 y=510]

;上記で定義した領域がキャラクターの名前表示であることを宣言（これがないと#の部分でエラーになります）
[chara_config ptext="chara_name_area"]

;---------------------------------------------------

[endmacro]

[return ]