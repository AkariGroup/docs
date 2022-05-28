**********************************
基本ソフトウェア仕様(ROS2版)
**********************************

AKARIの基本ソフトウェアについて説明します。

.. note::

   | こちらはROS2を使ったバージョンです。
   | ROSに慣れている方、使ってみたい方はこちらを推奨します。
   | ROSの使用、未使用の環境切り替え方法は :doc:`../troubleshoot/ros_switch` を参照してください。

.. note::

   新規ターミナルを起動する際に下記のターミナルの機能選択画面が表示される場合、本ページではすべて「2:ROS2」を選択します。
   2を入力し、enterを押してください。

   .. image:: ../images/terminal_function.png

=============================
カメラ画像の取得
=============================

| AKARI本体のヘッド部のカメラ画像は、本体起動直後からros2 topicとしてpublishされています。
| 下記が自動起動されています。

.. code-block:: bash

   $ ros2 run usb_camera_driver usb_camera_driver_node

| カメラ画像のtopic名は `/image_raw` です。

=============================
サーボの制御
=============================
| AKARIのヘッドのパン、チルトのモータは起動時に初期位置でトルクONされます。
| 起動時に下記が自動実行されています。

.. code-block:: bash

   $ python3 akarimainpc//Base/Other/akari_autostart/script/servo_start.py

| 上記のスクリプトを実行すれば、再度サーボのトルクONし、初期位置へ移動させることができます。
| 各サーボモータはパン(左右)方向がid:1,チルト(上下)方向がid:2として割り当てられています。
| 可動範囲はパンが-135°~135°,チルトが-52.6°~52.8°です。
| サーボをトルクOFFしたい場合は下記を実行してください。

.. code-block:: bash

   $ python3 akarimainpc//Base/Other/akari_autostart/script/servo_off.py

.. _environment_info:

また、python用のAPIとして、akari_controllerライブラリがインストールされています。

自身のpythonコード内で利用したい場合は、下記でライブラリをインポートしてください。

.. code-block:: python

   from akari_controller.akari_controller import AkariController

また、クラスの宣言は下記の例を参考に行ってください。

.. code-block:: python

   akari = AkariController()

下記にAPIの一覧を記載します。

list(str) **get_joint_names** (void)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| 関節名を取得する。
| - **引数**
|  なし
| - **返り値**
|  `list(str) joint_name_list`: 関節名の一覧。通常は['pan', 'tilt']となる。

list(bool) **success_list set_torque_enable** (dict config_dict)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| 各関節のトルクのON、OFFを設定する。
| - **引数**
|  `dict config_dict`:
|   `list(str) joint_names`:関節名のリスト
|   `list(bool) values`: "joint_names"のリストに対応した要素を設定。TrueでトルクON, FalseでトルクOFF。
| - **返り値**
|  `list(bool) success_list`: 各要素の実行結果。Trueで成功、Falseで失敗。

list(bool) **set_profile_acceleration** (dict config_dict)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| 関節の加速度を指定。
| - **引数**
|  `dict config_dict`:
|   `list(str) joint_names`:関節名のリスト
|   `list(float) values`: "joint_names"のリストに対応した要素の加速度。単位はrad/s^2。
| - **返り値**
|  `list(bool) success_list`: 各要素の実行結果。Trueで成功、Falseで失敗。

list(bool) **set_profile_velocity** (dict config_dict)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| 関節の速度を指定。
| - **引数**
|  `dict config_dict`:
|   `list(str) joint_names`:関節名のリスト
|   `list(float) values`: "joint_names"のリストに対応した要素の速度。単位はrad/s。
| - **返り値**
|   `list(bool) success_list`: 各要素の実行結果。Trueで成功、Falseで失敗。

list(bool) **set_goal_position** (dict config_dict)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| 関節の目標位置を指定。
| - **引数**
|  `dict config_dict`:
|   `list(str) joint_names`:関節名のリスト
|   `list(float) values`: "joint_names"のリストに対応した要素の目標位置。実行するとこの位置へ移動する。単位はrad。
| - **返り値**
|   `list(bool) success_list`: 各要素の実行結果。Trueで成功、Falseで失敗。

list(float) **get_present_position** (list(str) joint_name_list)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| 関節の現在位置を取得。
| - **引数**
|   `list(str) joint_name_list`:関節名のリスト
| - **返り値**
|   `list(float) data_list`: joint_name_listの要素に応じた現在位置のリスト。単位はrad。

=============================
環境情報の取得
=============================
| 起動時にベース部のM5stackとの通信が開始します。
| 環境情報取得用のスクリプトとして、下記が自動実行されています。

.. code-block:: bash

   $ ros2 run m5serial_server m5serial_server

| M5stackから観測された気温、圧力、明るさ、加速度、角加速度、現在角度、ボタンA,B,Cの状態、ヘッドGPIOピンのデジタル入力、アナログ入力の値が取得できます。
| それらはros2 topicとしてpublishされています。トピック名は `/m5` です。
| 下記で確認することができます。

.. code-block:: bash

   $ ros2 topic echo /m5

| 取得できる環境情報の詳細は下記の通りです。
| - **std_msgs/Header header**
| ヘッダ。
| - **bool button_a**
| - **bool button_b**
| - **bool button_c**
|  M5stackのbuttonA,B,Cの入力。押されていた場合true。
| - **bool din0**
| - **bool din1**
| - **uint16 ain0**
|  ヘッドモジュール用GPIOの入力に対応。din0,din1は入力3.3Vでtrue。ain0は0-3.3Vを4096段階で出力。
| - **bool dout0**
| - **bool dout1**
| - **uint8 pwmout0**
|  ヘッドモジュール用GPIOの入力に対応。後述のserviceで出力変更可能。
|  dout0,dout1は3.3V出力時true。pwmout0は0-3.3Vを255段階で出力。
| - **float32 temperature**
|  環境センサモジュールの観測気温。単位はdeg。
| - **float32 pressure**
|  環境センサモジュールの観測絶対圧力。単位はhPa。
| - **uint16 brightness**
|  光センサの観測照度を4096段階で出力。0が最も明るい。

=============================
GPIO出力の制御
=============================
| GPIO出力制御も、環境情報取得と同様に下記のスクリプトにより自動起動しています。

.. code-block:: bash

   $ ros2 run m5serial_server m5serial_server

| 下記のros2 serviceを実行することでGPIO出力の制御が可能です。

/set_dout
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| ヘッド部GPIOピンのデジタル出力を変更。
| - **引数**
|  `uint8 pin_id`: 0でdout0、1でdout1。
|  `bool val`: falseで0V,trueで3.3V出力。
| - **返り値**
|  `bool result`: M5へのserial送信完了でtrue。

/set_pwmout
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| ヘッド部GPIOピンのPWM出力を変更。
| - **引数**
|  `uint8 pin_id`: 0でpwmout0。
|  `uint8 val`: 0-255で0-3.3V出力。
| - **返り値**
|  `bool result`: M5へのserial送信完了でtrue。
|

/set_allout
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| ヘッド部GPIOピンの全出力を同時に変更。
| - **引数**
|  `bool dout0_val`: dout0へfalseで0V,trueで3.3V出力。
|  `bool dout1_val`: dout1へfalseで0V,trueで3.3V出力。
|  `uint8 pwmout0_val`: pwmout0へ0-255で0-3.3V出力。
| - **返り値**
|  `bool result`: M5へのserial送信完了でtrue。
|

/reset_allout
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| ヘッド部GPIOピンの全出力を0にする。
| - **引数**
|  なし
| - **返り値**
|  `bool result`: M5へのserial送信完了でtrue。

=============================
ディスプレイ出力の制御
=============================
| M5Stackのディスプレイ出力制御機能も、環境情報取得と同様に下記のスクリプトにより自動起動しています。

.. code-block:: bash

    $ ros2 run m5serial_server m5serial_server

| 下記のros2 serviceを実行することでディスプレイ出力の制御が可能です。

/set_display_color
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| M5のディスプレイの背景色を塗りつぶし。
| - **引数**
|  `string color`: 背景色を名前で指定。使用可能な色名リストは後述。リストにない文字列の場合(空白など)の場合は前回値をそのまま使用。
| - **返り値**
|  `bool result`: M5へのserial送信完了でtrue。

/set_display_text
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| M5のディスプレイに文字を表示。
| - **引数**
|  `string text`: 表示される文字列。文字列最後に空白を挿入したい場合は空白の後ろに"\\n"をつけること。
|  `int32 pos_x`: x方向の開始ピクセルを0-320で指定。画面左端が0。文字列上端がここで指定した位置に描画される。
|   -999で画面中央揃え、999で画面右揃えとなる。
|  `int32 pos_y`: y方向の開始ピクセルを0-240で指定。画面上端が0。文字列上端がここで指定した位置に描画される。
|   -999で画面中央揃え、999で画面下揃えとなる。
|  `uint8 size`: 文字サイズを1-7の7段階で指定。0の場合前回表示時の文字サイズをそのまま使う。
|  `string text_color`: テキスト色を名前で指定。使用可能な色名リストは後述。リストにない文字列の場合(空白など)の場合は前回値をそのまま使用。
|  `string back_color`: テキストの背景色を名前で指定。使用可能な色名リストは後述。リストにない文字列の場合(空白など)の場合は現在の背景色をそのまま使用。
|  `bool refresh`: trueの場合画面全体を現在の背景色で更新する。falseの場合は現在の表示を維持しつつ、指定表示範囲のみ更新する。
| - **返り値**
|  `bool result`: M5へのserial送信完了でtrue。


/set_display_image
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| M5のディスプレイに画像を表示。
| - **引数**
|  `string filepath`: M5のSDカード内のファイルパス。(例;"image/aaa.jpg")
|  `int32 pos_x`: x方向の開始ピクセルを0-320で指定。画面左端が0。画像左端がここで指定した位置に描画される。
|   -999で画面中央揃え、999で画面右揃えとなる。
|  `int32 pos_y`: y方向の開始ピクセルを0-240で指定。画面上端が0。画像上端がここで指定した位置に描画される。
|   -999で画面中央揃え、999で画面下揃えとなる。
|  `float32 scale`: 画像の拡大縮小倍率を指定。マイナスの値を入れた場合、画面サイズに合わせて自動でサイズ調整される。
| - **返り値**
|  `bool result`: M5へのserial送信完了でtrue。


/use_japanese_font
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| 文字列表示用のフォントを変更。デフォルトではSDカード内にインストールされているKosugimaruフォントをロードしており日本語のひらがな、カタカナ、常用漢字が使用可能となっている。
| またこちらのフォントはフォントサイズ毎に個別にフォントファイルが用意されており、大サイズでもきれいに表示される。
| しかしフォントサイズ変更時のロード、描画がやや遅い。
| このserviceをfalseにすることで、より描画が早くサイズ変更時にロードが不要な内蔵efontに切り替えられる。以前まで内蔵フォントでは日本語が使用できなかったが、ライブラリの変更により現在は可能となっている。
| (したがってこのサービス名が適切でなくなっている。サービス名変更もしくは廃止を検討中。)
| ここでフォントを切り替えると、その後は再度このサービスで切り替えるまで指定したフォントが"/set_display_text"で使用される。
| - **引数**
|  `bool data`: falseで内蔵efontに切り替え。trueでKosugimaruフォントに切り替え。defaultはtrue。
| - **返り値**
|  `bool result`: M5へのserial送信完了でtrue。

| `/set_display_color` や `/set_display_text` で色を指定する場合は下記の色名が指定可能です。大文字小文字は問わず使えます。
| -"black"
| -"navy"
| -"darkgreen"
| -"darkcyan"
| -"maroon"
| -"purple"
| -"olive"
| -"lightgrey"
| -"darkgrey"
| -"blue"
| -"green"
| -"cyan"
| -"red"
| -"magenta"
| -"white"
| -"orange"
| -"green"
| -"yellow"
| -"pink"

=============================
その他M5の制御
=============================
| その他下記のros2 serviceにてM5の制御が可能です。

/reset_m5
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| M5stackを再起動する。
| - **引数**
|  なし。
| - **返り値**
|  `bool result`: M5へのserial送信完了でtrue。

