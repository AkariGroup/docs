***********************************************************
ソフトウェア仕様(ROS2版)
***********************************************************

| ROS2版のtopic, service, actionの通信仕様を記載します。


===========================================================
joint_state_publisher
===========================================================

topic
-----------------------------------------------------------

**/joint_state**

  | 関節情報を取得する。
  | type: JointState
  ::

        std_msgs/Header header      Headerの情報。
        string[] name               関節の名前のリスト。
        float32[] position          各関節の現在位置のリスト。単位は[rad]
        float32[] velocity          各関節の目標関節速度の設定値のリスト。単位は[rad/s]
        float32[] acceleration      各関節の目標関節加速度の設定値のリスト。単位は[rad/s^2]
        bool[] enabled              各関節のサーボON状態。Trueの場合サーボON。
        bool[] moving_state         各関節の動作状態。停止中であればTrue。


**/m5stack**

  | M5からの情報を取得する。
  | type: M5
  ::

        std_msgs/Header header      Headerの情報。
        bool button_a               M5の前面のボタンAの入力。ボタンを押すとTrue、押していないとFalse。
        bool button_b               M5の前面のボタンBの入力。ボタンを押すとTrue、押していないとFalse。
        bool button_c               M5の前面のボタンCの入力。ボタンを押すとTrue、押していないとFalse。
        bool din0                   ヘッドのdin0ピンのデジタル入力。HiがTrue、LoがFalse。デフォルトHi。
        bool din1                   ヘッドのdin1ピンのデジタル入力。HiがTrue、LoがFalse。デフォルトHi。
        uint16 ain0                 ヘッドのain0ピンのアナログ入力。0-3.3Vを0-255の256段階にする。
        bool dout0                  ヘッドのdout0ピンのデジタル出力。TrueでHi(3.3V)、FalseでLo(0V)。
        bool dout1                  ヘッドのdout1ピンのデジタル出力。TrueでHi(3.3V)、FalseでLo(0V)。
        uint8 pwmout0               ヘッドのpwmout0ピンのPWM出力。0-255の256段階で0-3.3Vを出力可能。
        float32 temperature         AKARI側面の環境センサモジュールの温度計測値。単位は℃。
        float32 pressure            AKARI側面の環境センサモジュールの観測絶対圧力。単位はPa。
        uint16 brightness           AKARI側面の光センサユニットの観測明るさを4096段階で出力。0が最も明るい。


:doc:`main` へ戻る
