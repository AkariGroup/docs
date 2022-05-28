******************************
動かしてみよう(ROS2版)
******************************

ROSコマンドを使ってAKARIを動かしてみましょう。

.. note::

   | こちらはROS2を使ったバージョンです。
   | ROSに慣れている方、使ってみたい方はこちらを推奨します。
   | ROSの使用、未使用の環境切り替え方法は :doc:`../troubleshoot/ros_switch` を参照してください。

.. note::

   新規ターミナルを起動する際に下記のターミナルの機能選択画面が表示される場合、本ページではすべて「2:ROS2」を選択します。
   2を入力し、enterを押してください。

   .. image:: ../images/terminal_function.png

=============================
カメラ画像を取得しよう
=============================

AKARIに搭載されたカメラの画像情報を取得して、開発PC上に表示します。

1. 新規ターミナルを起動し、以下のコマンドを実行します。

   .. code-block:: bash

     $ rqt

2. "Plugins"→"Visualization"→"Image view"を選択します。

3. ウィンドウが表示され、カメラ画像を確認できます。

   表示されない場合は、左上プルダウンメニューのトピック名一覧から"/image_raw"を選択してください。

   .. image:: ../images/usb_cam_image.jpg

4. Ctl+Cでプログラムを停止します。

   画像イメージのトピックが発行されていることを確認するには、新規ターミナルを起動し以下のコマンドを実行します。

   .. code-block:: bash

      $ros2 topic list
      /camera_info
      /image
      /parameter_events
      /rosout
      $ ros2 topic hz /image
      average rate: 15.095
         min: 0.056s max: 0.073s std dev: 0.00365s window: 17
      average rate: 15.100
         min: 0.055s max: 0.077s std dev: 0.00430s window: 33
      average rate: 15.120
         min: 0.055s max: 0.077s std dev: 0.00455s window: 49
      average rate: 15.076
         min: 0.055s max: 0.077s std dev: 0.00504s window: 64
     :
     (Ctl+C でコマンドを止めます)


=============================
ヘッドを動かしてみよう
=============================

次にサンプルプログラムを実行してヘッドを動かしてみます。

1. 以下のコマンドを実行します。

   .. code-block:: bash

      $ cd akarimainpc/Base/Other/akari_controller/sample/
      $ python3 akari_controller-sample.py

2. ターミナルに出力され指令に従ってヘッドが動くことを確認します。

==============================================
環境センサの値を取得してみよう
==============================================

次に環境センサの計測値を出力してみます。

1. 新規ターミナルを起動し、以下のコマンドを実行します。

   .. code-block:: bash

     $ ros2 topic echo /m5

2. 環境センサの値がターミナル上に出力されます。
   詳細は :ref:`environment_info` を確認してください。

3. Ctl+Cでechoを停止します。

==============================================
ディスプレイ表示を操作してみよう
==============================================

次にサンプルプログラムを実行してディスプレイを操作してみます。

1. 以下のコマンドを実行します。

   .. code-block:: bash

      $ ros2 run m5serial_server m5serial_sample

2. ディスプレイ下の3つのボタンで画面表示が切り替えられるようになります。

   一番左のボタン(ボタンA): デジタル時計が表示されます。

   真ん中のボタン(ボタンB): 環境センサの値が表示されます。
   
   一番右のボタン(ボタンC): GPIOピンの状態が表示されます。

3. Ctl+Cでプログラムを停止します。

=============================
顔認識を試してみよう
=============================

次にIntelの認識ライブラリであるOpenVINOのサンプルプログラムを実行して顔認識を試してみます。

1. 以下のコマンドを実行します。

   .. code-block:: bash

      $ ros2 launch dynamic_vino_sample pipeline_people_akari_display.launch.py

2. カメラ画像のウインドウが起動します。

3. カメラが顔を認識すると、顔部分に枠の付いた画像が表示されます。

4. Ctl+Cでプログラムを停止します。

=============================
顔追従を試してみよう
=============================

次に上の顔認識を使った、顔追従アプリを試してみましょう。

1. 以下のコマンドを実行します。

   .. code-block:: bash

      $ ros2 launch face_tracking face_tracking.launch.py

2. akariのカメラ視界に顔が入ると、そちらに向かってヘッドが追従します。

3. Ctl+Cでプログラムを停止します。

=============================
物体認識を試してみよう
=============================

次にOpenVINOのサンプルプログラムを実行して物体認識を試してみます。

1. 以下のコマンドを実行します。

   .. code-block:: bash

      $ ros2 launch dynamic_vino_sample pipeline_object_akari_display.launch.py

2. カメラ画像のウインドウが起動します。

3. カメラが特定の物体を認識すると、物体部分に枠の付いた画像と認識された物体名が表示されます。

4. Ctl+Cでプログラムを停止します。

このサンプルでは、mobilenet-ssdという認識器を使っています。

認識できる物体名は下記の通りです。

| - aeroplane
| - bicycle
| - bird
| - boat
| - bottle
| - bus
| - car
| - cat
| - chair
| - cow
| - diningtable
| - dog
| - horse
| - motorbike
| - person
| - pottedplant
| - sheep
| - sofa
| - train
| - tvmonitor