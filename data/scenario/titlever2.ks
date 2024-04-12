/*
タイトル改造

初めからと続きから
あとで実績確認ボタンなども。
*/

[cm]

@hidemenubutton
@clearstack
;@bg storage ="title2.jpg" time=100
@wait time = 200

*start 
; [button x=135 y=230 graphic="title/btn_md011.png" enterimg="title/btn_md012.png"  target="gamestart" keyfocus="1" exp="f.mode='01'"]
[button x=135 y="&230+100" graphic="title/button_start2.png" enterimg="title/button_start3.png"  target="gamestart" keyfocus="2" exp="f.mode='none'" ]
[button x=135 y=590 graphic="title/button_config.png" enterimg="title/button_config2.png" role="sleepgame" storage="config.ks" keyfocus="5"]

[s]

*gamestart
[cm ]
[clearfix ]
[jump storage="map.ks" ]
[s ]
