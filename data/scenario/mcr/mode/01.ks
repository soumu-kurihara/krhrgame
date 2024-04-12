/*
「社長でGO」のイベントマクロ
全てのモードで共通名のイベント名にする。

[crimap]マクロ(bsc.ks)からcallで呼び出す
[crimap]はmap.ksの中で1度だけ呼び出す


いままでのは
POV限定====================================(POVは現在凍結中)
mindev
objev
マクロ(evt.ks)で登録。中身は同じだが呼び出す条件が異なる。
それぞれtrgevマクロ(mov.ks)に構成登録
;前のときと後ろの時で2パターン用意
;現在地と一致するイベントが発火する。
    [mindev cond="f.ginfo===2&&!tf.istn&&!tf.istrg&&tf.hoge=='T'"]
    [mindev cond="f.binfo===2&&!tf.istn&&!tf.istrg&&tf.hoge=='B'"]
;現在地+進行予定方向+1の座標と一致するイベントがボタンを押すと発火する。
    [objev cond="f.ginfo===3&&!tf.istn&&!tf.istrg&&tf.hoge=='T'"]
    [objev cond="f.binfo===3&&!tf.istn&&!tf.istrg&&tf.hoge=='B'"]
f.ginfo…キャラ現在地で向いている方向1つ先のマスの数値
tf.istn…ボタン方向とキャラの向いている方向があっているか否か。合っている場合T。
tf.istrg…pov用。その場回転の場合はF。
tf.hoge…この時は、押したボタンの種類。TRBL。
==================================================
TPP(現在の)
mapそれぞれを呼び出し、イベントキーからジャンプして処理をする。


基本的なイベントはそのままに、変化するイベントだけ01系列に飛ばして上書きするとか


進行方向にイベントがある場合処理
f.ginfoが0-3のときそれぞれの効果を変更する。
    - 0…通過可能、何も発生しない。　処理済
    - 1…通行不可。現在値に隣接している場合そちらの方向へ動けない。 処理済
    - 2…イベント発生0。通過したときに発生する　動きは処理済
    - 3…イベント発生1。現在値に隣接している場合、そちらを向いてボタンで発生。1と合わせる
    - 4…メニューのマップワープ移動専用。

マス依存のイベントはマップごとに記載
それ以外のイベントはここに記載

イベント発火
- ゲーム開始時
- エンディング
- 特定の条件を満たした瞬間
- 特定の条件を満たした後の下記
これらはすでにマップ記載のとき、上書きして発生するようにする
- モノ(人)を調べた時
- 何かの上に載ったとき

発火させるマップ名、マス番号、イベント内容
をこちらでも検索させる
*/

[macro name="evt_fst"]
    [trace exp="&`'現在'+f.mode+'モードです'`" ]
    ;[dialog text="&'通った'+f.mode+'//'" ]
        ; [clearfix ]
        ; [adv ]
        ; [cm]
        ; #
        ; ここはクリハラ株式会社[p]
        ; 今日は会社案内の日です![l][r]
        ; あなたはクリハラ株式会社の社長となり、来客に会社を案内しましょう！[p]

        ; [chara_new name="syatyo" storage="chara/akane/normal.png"  jname="社長" ]
        ; [chara_new name="mob" storage="chara/yamato/normal.png"  jname="社員" ]
        ; [chara_config pos_mode="false" ]
        ; [chara_show name="syatyo" left="&1280-400"  top="&720-600" ]
        ; #社長
        ; いっぱいアピールして人材確保するぞー！[p]
        ; [chara_show name="mob" left="0" top="&720-660"   ]
        ; #社員
        ; 社長、いくつかルールがあるのを忘れないでくださいね！[p]
        ; #社長
        ; わかってるって！[l]それではみなさん！私についてきてくださいね！[p]

        ; [chara_hide name="syatyo" ]
        ; #社員
        ; ……行先の目印を付けておこう[p]
        ; [chara_hide name="mob" ]

        ; #
        ; 矢印が次の進行イベントのマスです。[l][r]
        ; イベントを進行させたい場合そのマスまで移動してください。[p]

        @eval exp="f.isevt_fst=true"

        ; [crbtn]
        ; [glink text="MENU" target="*gotitle2" x="&1280-300" y="0" color="btn_01_white"] 
        ; [layopt layer="message0" visible="false" ]

[endmacro ]

[macro name="evt_mid" ]
;条件を満たしたら発火する(if-endif)
[endmacro ]

[macro name="evt_end"]
;条件を満たしたら発火する(if-endif)

[endmacro ]



/*
f.mpnm(マップ名)
f.label(イベントID)
の2つで上書きイベントがあるか調べて発火する

1.モードを指定
2.現在のマップ名を引数
3.モード番号のシナリオに飛び、f.labelのイベントを走らせる
4.終了時に上書きした証拠の変数を刻む


ラベルの一覧配列を読み込む
*/

[iscript ]
    f.arlbl=[];
    f.arlbl[0]="00000"

[endscript ]

[return ]
[s]

*00000
[if exp="f.mpnm=='マップ名'" ]
;ここに特殊イベントを入れる


@eval exp="f.ismdeve=true"
[endif ]

[return ]
[s]