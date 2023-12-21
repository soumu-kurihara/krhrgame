/*
第二工場洗浄室(左上)

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
    if(f.maplst===undefined)f.etl='n8b';
    if(f.maplst==='f201_29_01_trm')f.etl='ab10l';//トリミング室(E)から
    if(f.maplst==='f201_06_15_wgh')f.etl='w14t';//計量室(S)から
    
    //f.povxyzにそれぞれ入る
    split(f.etl);
    f.maplst='f201_01_01_mac'

    //範囲XY,位置XY,タイプ
    push(1,1,1,1,1)//柱
    push(1,1,10,1,1)//柱
    push(1,1,19,1,1)//柱
    push(1,1,1,14,1)//柱
    push(1,1,10,14,1)//柱
    push(1,1,19,14,1)//柱
    push(1,3,29,10,2)//トリミング室(E)へ
    push(2,1,23,15,2)//計量室(S)へ
    
    //f.iseve=true//イベントが発生するか否かfalseにすることないよ(マップ移動のため)
    f.isfps=false//FPSモードの設定

[endscript ]
[jump storage="&f.pg" target="*rt_bld" ]
[s ]
;マップごとに登場するモノや人を宣言しておく
*dec
[return]
[s]

*1329102
@eval exp="tf.mpnm='f201_29_01_trm'"
[jump target="*confirm" ]
*2123152
@eval exp="tf.mpnm='f201_06_15_wgh'"
[jump target="*confirm" ]




;===================
;以下はいじらなくてよい

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