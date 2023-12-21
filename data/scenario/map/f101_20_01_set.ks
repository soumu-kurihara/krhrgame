/*
第一工場セット室
*/

;ADV表示の準備------------------------------
[adv]
;イベントラベル番号f.labelを作成する---------
[crilbl]
;---------------------------------------------------
;ラベルへ飛ぶ
[jump target="&f.label" cond="!tf.warp"]
;移動イベント(tf.warp==true)のとき、confirmに飛ぶようにする。
[jump target="*confirm" ]

[s]
;----ここまで全てのマップ共通------




;===呼び出して値を登録するゾーン(一度通ればOK)======================
    *place
        [iscript ]
            //f.maplst(移動前のマップ名)に対応する初期位置をf.etlに入れる
            if(f.maplst===undefined)f.etl='f9b';
            if(f.maplst==='f101_30_01_cdb')f.etl='j2l';//段ボール室(E1)から
            if(f.maplst==='f101_30_10_ccr')f.etl='j11l';//コンテナ洗浄室(E2)から
            if(f.maplst==='f101_01_01_cy')f.etl='a7r';//中庭(W))から


            //f.etlを分解収納するsplitをかける
            split(f.etl);//f.povxyzにそれぞれ入る
            f.maplst=f.mpnm;//呼び出した(この)マップ名に中身を更新。

            //pushで範囲位置タイプを登録する
            push(1,1,11,2,2)//段ボール室(E1)へ
            push(1,2,11,11,2)//コンテナ洗浄室(E2)へ
            push(1,3,0,6,2)//中庭(W)へ

            f.isfps=false//FPSモードの設定
        [endscript ]
        [jump storage="&f.pg" target="*rt_bld" ]
    [s ]

    ;マップごとに登場するモノや人を宣言しておく
    *dec
        ;[chara_new name="guard" storage="chara/fig/guard.png" jname="門番さん" height="720"   ]
        [return]
    [s]
;==================================================================

;イベント内容(何度も呼び出す)===============

    ;pushで記入した引数を文字列結合したラベルと内容(移動イベント<2>)
    *111122
    @eval exp="tf.mpnm='f101_30_01_cdb'"
    ;イベントを挟む場合はconfirm,挟まない場合はgo
    [jump target="*confirm" ]
    *1211112
    @eval exp="tf.mpnm='f101_30_10_ccr'"
    ;イベントを挟む場合はconfirm挟まない場合はgo
    [jump target="*confirm" ]
    *13062
    @eval exp="tf.mpnm='f101_01_01_cy'"
    ;イベントを挟む場合はconfirm,挟まない場合はgo
    [jump target="*confirm" ]
    [s]

    ;移動のときにイベントを挟む場合
    *confirm
    [dialog text="マップ移動するけどいいかな？" type="confirm" target="*go"  ]
    [knockback]
    [return]

    ;マップ移動専用。このマップで追加したものを削除する。
    *go
        [chara_hide_all time="50" ]
        ;[chara_delete name="guard" ]
        [iscript ]
            //マップの既存読込をOFF
            f.isnmp=false;
            //次に呼び出すマップ名
            f.mpnm=tf.mpnm;
        [endscript ]
        ;マップ新読込
        [map_smn]
        ;マップ既存読込をON(1度だけの処理を行わない)
        @eval exp="f.isnmp=true" 
        [return]
    [s]

;=============================


