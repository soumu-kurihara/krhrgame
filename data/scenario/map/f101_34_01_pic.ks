/*
第一工場ピッキング室
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
            if(f.maplst===undefined)f.etl='u11b';
            if(f.maplst==='f101_50_01_ref')f.etl='p2l';//冷蔵庫(出荷待ち)(N)から
            if(f.maplst==='f101_62_01_ent')f.etl='ab12l';//玄関(F1F)(E)から
            if(f.maplst==='f101_34_23_frzp')f.etl='k22t';//冷蔵庫(ピッキング室)(S)から
            if(f.maplst==='f101_30_10_ccr')f.etl='a16r';//コンテナ洗浄室(W))から


            //f.etlを分解収納するsplitをかける
            split(f.etl);//f.povxyzにそれぞれ入る
            f.maplst=f.mpnm;//呼び出した(この)マップ名に中身を更新。

            //pushで範囲位置タイプを登録する
            push(12,3,17,1,1)//冷蔵庫(出荷待ち)
            push(13,2,1,23,1)//冷蔵庫(ピッキング室)
            push(1,1,17,2,2)//冷蔵庫(出荷待ち)(N)へ
            push(1,13,29,6,2)//玄関(F1F)(E)へ
            push(1,1,11,23,2)//冷蔵庫(ピッキング室)(S)へ
            push(1,2,0,16,2)//コンテナ洗浄室(W)へ

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
    *111722
    @eval exp="tf.mpnm='f101_50_01_ref'"//移動先のマップ名
    ;イベントを挟む場合はconfirm挟まない場合はgo
    [jump target="*confirm" ]
    *1132962
    *11022
    @eval exp="tf.mpnm='f101_62_01_ent'"//移動先のマップ名
    ;イベントを挟む場合はconfirm挟まない場合はgo
    [jump target="*confirm" ]
    *1111232
    @eval exp="tf.mpnm='f101_34_23_frzp'"//移動先のマップ名
    ;イベントを挟む場合はconfirm挟まない場合はgo
    [jump target="*confirm" ]
    *120162
    @eval exp="tf.mpnm='f101_30_10_ccr'"//移動先のマップ名
    ;イベントを挟む場合はconfirm,挟まない場合はgo
    [jump target="*confirm" ]

    ;adv的イベント(<3>)
    *1111
    [return]
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


