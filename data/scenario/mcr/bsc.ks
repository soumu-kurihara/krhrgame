/*
基本動作
全てのページで使うようなものをまとめたマクロ
ベーシック

おかしくなったら
f.map.bsc['loc']をコメントから起動する(240204)
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

    ;フィールド作成マクロ==========================

    [macro name="crimap" ]
        ;他ページから飛んできたときの処理
        [destroy]
        ;マップを初期化
        @eval exp="f.isnmp=false" 

        [start_keyconfig]

        [layopt layer="0" visible="true"  ]
        [layopt layer="1" visible="true"  ]

        ;9マス用(既存)このサイズを起点にマスのサイズを変更するのでウィンドウサイズに合うようになる
        [image name="grid" time="50"   visible="true" layer="1" folder="bgimage" storage="sq80.png" top="0" left="&1280/2-40" wait="true" ]

        ;========================マクロ置場

        ;マクロ呼出 ->効果が被っているので統合。また状況により呼び出すものを変更する？
        @call storage="mcr/testalphamcr.ks"
        ;@call storage="mcr/evt.ks"
        [iscript ]
        //mcr/evtから必要なものを抜いた
            f.map=[]
            f.map['bsc']=[]
            //f.map.bsc['loc']=[] //これも多分いらない
        [endscript ]
        @call storage="&'mcr/mode/'+f.mode+'.ks'"
        ;========================マクロ置場

        ;スタートだけの暫定処置.ここで最初に飛ぶマップを決めている
        @eval exp="f.mpnm=mp.st;f.isfps=false;" cond="f.isnmp==false"
        ;fpsはマップごとに記載箇所があるのでここで宣言いらないかも。


        ;マップ呼び出し(マップに必要なものを読み込ませてrenew)
        [map_smn]
        ;[map_smn nm="&f.mpnm" fps="f"]
        ;マップ読み込み済みの処理(1度だけの処理を行わない)
        @eval exp="f.isnmp=true" 
    [endmacro ]

    [macro name="evemap" ]
        ;ttpの時使わない
        /*
        現在fps切り替えができなくなってる
        */
        [A cond="f.isfps==true"]

        ;======共通=====
        ;Gの中のB1に使用
        [G name="&f.mpnm"]
        [E]
        ;Hのなかのcngbg(fps用),B1に使用
        [H name="&f.mpnm"]
        [I name="&f.mpnm"]
    [endmacro ]
[return ]