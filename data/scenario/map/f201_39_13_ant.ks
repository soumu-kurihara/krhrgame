/*
第二工場1F内階段

*/
;ADV表示の準備------------------------------
[adv]
;イベントラベル番号f.labelを作成する---------
[crilbl]
;---------------------------------------------------

;----ここまで全てのマップ共通------


[jump target="&f.label" ]
[s]
*place
[iscript ]
    //pushでイベントを記入する
    //どのマップからも移動していない場合初期位置に入れる。これはてきとう。ワープ移動とかに使う
    if(f.maplst===undefined)f.etl='c5l';
    if(f.maplst==='f201_29_01_trm')f.etl='b1b';//トリミング室(N)から
    if(f.maplst==='f201_06_15_wgh')f.etl='a9r';//計量室(W))から
    if(f.maplst==='f201_46_01_ent')f.etl='e4l';//計量室(W))から

    
    //2F(c)から
    
    //f.povxyzにそれぞれ入る
    split(f.etl);
    f.maplst='f201_39_13_ant'

    //範囲XY,位置XY,タイプ
    push(1,1,1,2,1)//柱
    push(7,2,3,1,1)//トリミング室
    push(1,1,2,0,2)//トリミング室(N)へ
    push(1,1,0,9,2)//計量室(W)へ
    push(1,2,6,4,2)//2F(c)へ
    
    //f.iseve=true//イベントが発生するか否かfalseにすることないよ(マップ移動のため)
    f.isfps=false//FPSモードの設定

[endscript ]
[jump storage="&f.pg" target="*rt_bld" ]
[s ]
;マップごとに登場するモノや人を宣言しておく
*dec
[return]
[s]

*11202
;飛ぶ先のマップ名
@eval exp="tf.mpnm='f201_29_01_trm'"
[jump target="*confirm" ]
*11092
@eval exp="tf.mpnm='f201_06_15_wgh'"
[jump target="*confirm" ]
*12642
@eval exp="tf.mpnm='f201_46_01_ent'"
[jump target="*confirm" ]



*confirm
[dialog text="マップ移動するけどいいかな？" type="confirm" target="*go"  ]
[knockback]
[return]

*go
;マップ生成に必要な色々を削除する

;マップに登場するキャラクター・モノ削除

[iscript ]
f.isnmp=false;


//次に呼び出すマップ名
f.mpnm=tf.mpnm;
//移動前のマップ名
//f.maplst=f.maplst;

[endscript ]
[map_smn]
;マップ読み込み済みの処理(1度だけの処理を行わない)
@eval exp="f.isnmp=true" 

[return]
[s]