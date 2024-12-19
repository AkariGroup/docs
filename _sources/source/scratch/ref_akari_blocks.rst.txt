***********************************************************
拡張機能の紹介① AkariBlocks
***********************************************************

| ここでは、AKARIの各APIを実行可能な拡張機能であるAkariBlocksの各ブロックを紹介します。

モータ制御
-----------------------------------------------------------

servoをONにする
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_motor_01.jpg
    :height: 60px

  |
  Block type:
    COMMAND
  Ref:
    | ヘッドのサーボを全軸ONにします。

servoをOFFにする
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_motor_02.jpg
    :height: 60px

  |
  Block type:
    COMMAND
  Ref:
    | ヘッドのサーボを全軸OFFにします。

[関節名]の位置
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_motor_03.jpg
    :height: 60px

  |
  Block type:
    REPORTER
  Ref:
    | 指定した[関節名]の現在角度を取得します。

[関節名]を[角度]°に移動する
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_motor_04.jpg
    :height: 60px

  |
  Block type:
    COMMAND
  Ref:
    | 指定した[関節名]を指定した[角度]に移動します。
    | サーボをONにしていないと動作しません。

panを[pan角度]°、tiltを[tilt角度]°に移動する
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_motor_05.jpg
    :height: 60px

  |
  Block type:
    COMMAND
  Ref:
    | pan軸を[pan角度]、tilt軸を[tilt角度]に移動します。
    | サーボをONにしていないと動作しません。

[関節名]を現在位置から[角度]°移動する
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_motor_06.jpg
    :height: 60px

  |
  Block type:
    COMMAND
  Ref:
    | 指定した[関節名]を現在位置から指定した[角度]だけ移動します。
    | サーボをONにしていないと動作しません。

panを現在位置から[pan角度]°、tiltを現在位置から[tilt角度]°移動する
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_motor_07.jpg
    :height: 60px

  |
  Block type:
    COMMAND
  Ref:
    | 現在位置からpan軸を[pan角度]、tilt軸を[tilt角度]だけ移動します。
    | サーボをONにしていないと動作しません。

モータ角速度を[速度]°/sにする
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_motor_08.jpg
    :height: 60px

  |
  Block type:
    COMMAND
  Ref:
    | サーボの指令角速度を[速度]に変更します。

モータ角加速度を[ACC]°/s^2にする
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_motor_09.jpg
    :height: 60px

  |
  Block type:
    COMMAND
  Ref:
    | サーボの指令角加速度を[ACC]°/s^2に変更します。


M5通信
-----------------------------------------------------------

ボタン[ID]が押されたとき
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_m5_01.jpg
    :height: 60px

  |
  Block type:
    HAT
  Ref:
    | M5の[ID]のボタンが押された時に実行されます。
    | ANYの場合はどれか一つでも押された場合に実行されます。

ボタン[ID]が押された
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_m5_02.jpg
    :height: 60px

  |
  Block type:
    BOOLEAN
  Ref:
    | M5の[ID]のボタンが押されていたらTrue、それ以外ではFalseを返します。

din[ID]がLowになったとき
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_m5_03.jpg
    :height: 60px

  |
  Block type:
    HAT
  Ref:
    | [ID]番号のdinピンがLowになった時に実行されます。
    | ANYの場合はどれか一つでもLowになった場合に実行されます。

din[ID]がLow
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_m5_04.jpg
    :height: 60px

  |
  Block type:
    BOOLEAN
  Ref:
    | [ID]番号のdinピンがLowならTrue、それ以外ではFalseを返します。

ain0の値
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_m5_05.jpg
    :height: 60px

  |
  Block type:
    REPORTER
  Ref:
    | ain0ピンのアナログ入力値(0-3.3V)を0-4095の4096段階で返します。

[センサ]の値
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_m5_06.jpg
    :height: 60px

  |
  Block type:
    REPORTER
  Ref:
    | [センサ]の出力値を返します。
    | センサの種類は温度(℃)、気圧(Pa)、明るさ(0-4095で出力。0が最も明るい)です。

dout[ID]を[値]にする
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_m5_07.jpg
    :height: 60px

  |
  Block type:
    COMMAND
  Ref:
    | [ID]番号のdoutピンの出力を[値]にします。

pwmout0を[VALUE]にする
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_m5_08.jpg
    :height: 60px

  |
  Block type:
    COMMAND
  Ref:
    | pwmout0ピンのPWM出力を[値]にします。
    | 値範囲は0-255で、0で0V、255で3.3Vを出力します。


ディスプレイ制御
-----------------------------------------------------------

画面表示の背景色を[色]に設定する
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_display_01.jpg
    :height: 60px

  |
  Block type:
    COMMAND
  Ref:
    | 画面表示を行う際の背景色を[色]に設定します。
    | このブロック単体ではM5にコマンドは送られません。

画面表示の文字色を[色]に設定する
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_display_02.jpg
    :height: 60px

  |
  Block type:
    COMMAND
  Ref:
    | 画面表示を行う際の文字色を[色]に設定します。
    | このブロック単体ではM5にコマンドは送られません。

画面表示の文字サイズを[サイズ]にする
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_display_03.jpg
    :height: 60px

  |
  Block type:
    COMMAND
  Ref:
    | 画面表示を行う際の文字サイズを[サイズ]に設定します。
    | サイズは1~11の範囲で設定可能です。
    | このブロック単体ではM5にコマンドは送られません。

画面に[テキスト]を表示する
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_display_04.jpg
    :height: 60px

  |
  Block type:
    COMMAND
  Ref:
    | 画面に[テキスト]を表示します。
    | 背景色、文字色、文字サイズは前述のブロックで設定したものになります。
    | [テキスト]を空白にすることで、背景色のみ変更することができます。

画面に画像[パス]を表示する
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch/block_display_05.jpg
    :height: 60px

  |
  Block type:
    COMMAND
  Ref:
    | 画面にM5のSDカード内の[パス]の画像を表示します。
    | あらかじめM5のSDカードに使用する画像を入れておき、SDカードのrootディレクトリからのパスを入力してください。

:doc:`ref_akari_camera` へ進む

:doc:`playing` へ戻る
