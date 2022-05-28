***********************************
サンプルアプリを動かそう(ROS2版)
***********************************

AKARIのサンプルアプリを動かしてみましょう。
アプリのソースファイルはakarimainpc/App/ROS2/akari_sample/akari_sampleにあります。

.. note::

   | こちらはROS2を使ったバージョンです。
   | ROSに慣れている方、使ってみたい方はこちらを推奨します。
   | ROSの使用、未使用の環境切り替え方法は :doc:`../troubleshoot/ros_switch` を参照してください。

.. note::

   新規ターミナルを起動する際に下記のターミナルの機能選択画面が表示される場合、本ページではすべて「2:ROS2」を選択します。
   2を入力し、enterを押してください。

   .. image:: ../images/terminal_function.png

=============================
モータの制御
=============================

1a.モータ制御

ヘッドのモータ制御サンプル。

   .. code-block:: bash

      $ cd akarimainpc/App/ROS2/akari_sample/akari_sample
      $ python3 1a_motor_control.py

=============================
環境情報の取得
=============================

2a.ボタン入力

ボタン入力のサンプル。ボタンを押すとコマンドラインにメッセージが出力される。

   .. code-block:: bash

      $ ros2 run akari_sample 2a_button

2b.GPIO入力

GPIO入力のサンプル。コマンドラインにdin,ainの値が出力される。

   .. code-block:: bash

      $ ros2 run akari_sample 2b_gpio_input

2c.GPIO出力

GPIO出力のサンプル。コマンドラインにdout,pwmoutの値が出力される。

   .. code-block:: bash

      $ ros2 run akari_sample 2c_gpio_output

2d.環境センサ

環境センサのサンプル。コマンドラインに気圧、温度、明るさセンサの値が出力される。

   .. code-block:: bash

      $ ros2 run akari_sample 2d_env_info

2e.IMU

IMUのサンプル。コマンドラインに加速度、ジャイロ、それらから算出された本体角度値が出力される。

   .. code-block:: bash

      $ ros2 run akari_sample 2e_imu_info

=============================
GPIO出力の取得
=============================

3a.GPIO出力制御

GPIO出力制御のサンプル。ステップごとにdout,pwmoutの出力制御を行う。

   .. code-block:: bash

      $ ros2 run akari_sample 3a_gpio_control

=============================
ディスプレイ制御
=============================

4a.ディスプレイ背景カラー出力

ディスプレイ背景カラー変更のサンプル。ステップごとにM5の背景カラー変更を行う。

   .. code-block:: bash

      $ ros2 run akari_sample 4a_display_color

4b.ディスプレイテキスト出力

ディスプレイテキスト出力のサンプル。ステップごとにM5の画面にテキストを出力する。

   .. code-block:: bash

      $ ros2 run akari_sample 4b_display_text

4c.ディスプレイ画像出力

ディスプレイ画像出力のサンプル。ステップごとにM5の画面に画像を出力する。

   .. code-block:: bash

      $ ros2 run akari_sample 4c_display_image

=============================
その他の制御
=============================

5a.IMU初期化

IMU初期化のサンプル。一定時間ごとにIMU値を初期化する。

   .. code-block:: bash

      $ ros2 run akari_sample 5a_init_imu

5b.M5リセット

M5リセットのサンプル。一定時間ごとにM5をリセットする。

   .. code-block:: bash

      $ ros2 run akari_sample 5b_reset_m5

=============================
顔認識
=============================

6a.顔認識

顔認識のサンプル。カメラに顔が認識された場合、画像に枠を表示し、位置とサイズをコマンドラインに表示する。

   .. code-block:: bash

      (ターミナル1) $ ros2 launch dynamic_vino_sample pipeline_people_akari_display.launch.py
      (ターミナル2) $ ros2 run akari_sample 6a_face_detection

もしくは後述のlaunch 3.でも同様


===============================
launchによるサンプルの同時実行
===============================

1.GPIO

2c_gpio_outputと3a_gpio_controlの同時実行。gpio出力を制御しながら、値の変化をコマンドラインで確認可能.

   .. code-block:: bash

      $ ros2 launch akari_sample 1_gpio.launch.py

2.IMU

2e_imu_infoと5a_init_imuの同時実行。IMUのyaw値はずれていってしまうが、イニシャライズの度にyawがリセットされることがコマンドラインで確認可能。

   .. code-block:: bash

      $ ros2 launch akari_sample 2_imu.launch.py

3.顔認識

6aのサンプルを一つのlaunchで実行

   .. code-block:: bash

      $ ros2 launch akari_sample 3_face_detection.launch.py
