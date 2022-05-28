******************************
アプリでサービスコールをしよう
******************************

ROS2でのサービスのアプリでの使い方について、AKARIを使って解説していきます。

.. note::

   | こちらはROS2を使ったバージョンです。
   | ROSに慣れている方、使ってみたい方はこちらを推奨します。
   | ROSの使用、未使用の環境切り替え方法は :doc:`../troubleshoot/ros_switch` を参照してください。

.. note::

   新規ターミナルを起動する際に下記のターミナルの機能選択画面が表示される場合、本ページではすべて「2:ROS2」を選択します。
   2を入力し、enterを押してください。

   .. image:: ../images/terminal_function.png

========================================
アプリからサービスをコールしてみよう
========================================

| 今回はサンプルアプリでサービスのコールを試してみます。
| ターミナルを立ち上げて下記のコマンドを実行します。

.. code-block:: bash

   ros2 run akari_sample 4a_display_color

| 今回は *akari_sample* のパッケージの中の *4a_display_color* を実行します。
| AKARIのディスプレイの色が、白→赤→青→紫…と変化すると思います。
| これは、4a_display_colorの中で */set_display_color* のサービスを順番にコールしているためです。

==============================================
サービス クライアントアプリの中身を見てみよう
==============================================

| サービスをコールする側をサービス クライアントといいます。
| このアプリの中身を見てみましょう。
| ファイルの場所は *akarimainpc/App/ROS2/akari_sample/akari_sample/4a_display_color.py* です。

.. code-block:: python

   #!/usr/bin/env python
   # coding:utf-8

   """
   Display color sample
   Created on 2021/02/14
   @author: Kazuya Yamamoto
   """

   import time
   from m5serial_msgs.srv import SetDisplayColor
   import rclpy

   node = None


   def main(args=None):
      """
      メイン関数
      """
      # ROS2のrclpyを初期化
      rclpy.init(args=args)

      # ROS2の'display_color'というノードを作る
      node = rclpy.create_node('display_color')
      # set_display_colorのサービスクライアントを生成
      set_disp_color_cli = node.create_client(
         SetDisplayColor, '/set_display_color')

      # アプリが終了されるまでループする。
      while rclpy.ok():
         # STEP1. ディスプレイの背景色を白にする
         node.get_logger().info('STEP1. Set display color to white')
         # SetDisplayColor.Request()のインスタンスを作成
         color_req = SetDisplayColor.Request()
         # colorで'white'を指定
         color_req.color = 'white'
         # set_disp_colorのサービスが実行可能になるまで待機し、クライアントを非同期実行する。
         while not set_disp_color_cli.wait_for_service(timeout_sec=1.0):
               node.get_logger().info('service not available, waiting again...')
         future = set_disp_color_cli.call_async(color_req)
         # サービス実行終了結果を得るまで待機
         rclpy.spin_until_future_complete(node, future)
         result = future.result()
         # 結果を出力
         node.get_logger().info('Result: %s' % result.result)
         # 2秒停止
         time.sleep(2)
         print()

         # STEP2. ディスプレイの背景色を赤にする
         node.get_logger().info('STEP2. Set display color to red')
         # SetDisplayColor.Request()のインスタンスを作成
         color_req = SetDisplayColor.Request()
         # colorで'red'を指定
         color_req.color = 'red'
         # set_disp_colorのサービスが実行可能になるまで待機し、クライアントを非同期実行する。
         while not set_disp_color_cli.wait_for_service(timeout_sec=1.0):
               node.get_logger().info('service not available, waiting again...')
         future = set_disp_color_cli.call_async(color_req)
         # サービス実行終了結果を得るまで待機
         rclpy.spin_until_future_complete(node, future)
         result = future.result()
         # 結果を出力
         node.get_logger().info('Result: %s' % result.result)
         # 2秒停止
         time.sleep(2)
         print()

         # STEP3. ディスプレイの背景色を青にする
         node.get_logger().info('STEP3. Set display color to blue')
         # SetDisplayColor.Request()のインスタンスを作成
         color_req = SetDisplayColor.Request()
         # colorで'blue'を指定
         color_req.color = 'blue'
         # set_disp_colorのサービスが実行可能になるまで待機し、クライアントを非同期実行する。
         while not set_disp_color_cli.wait_for_service(timeout_sec=1.0):
               node.get_logger().info('service not available, waiting again...')
         future = set_disp_color_cli.call_async(color_req)
         # サービス実行終了結果を得るまで待機
         rclpy.spin_until_future_complete(node, future)
         result = future.result()
         # 結果を出力
         node.get_logger().info('Result: %s' % result.result)
         # 2秒停止
         time.sleep(2)
         print()

         # STEP4. ディスプレイの背景色を紫にする
         node.get_logger().info('STEP4. Set display color to magenta')
         # SetDisplayColor.Request()のインスタンスを作成
         color_req = SetDisplayColor.Request()
         # colorで'magenta'を指定
         color_req.color = 'magenta'
         # set_disp_colorのサービスが実行可能になるまで待機し、クライアントを非同期実行する。
         while not set_disp_color_cli.wait_for_service(timeout_sec=1.0):
               node.get_logger().info('service not available, waiting again...')
         future = set_disp_color_cli.call_async(color_req)
         # サービス実行終了結果を得るまで待機
         rclpy.spin_until_future_complete(node, future)
         result = future.result()
         # 結果を出力
         node.get_logger().info('Result: %s' % result.result)
         # 2秒停止
         time.sleep(2)
         print()

         # STEP5. ディスプレイの背景色を黒にする
         node.get_logger().info('STEP5. Set display color to black')
         # SetDisplayColor.Request()のインスタンスを作成
         color_req = SetDisplayColor.Request()
         # colorで'black'を指定
         color_req.color = 'black'
         # set_disp_colorのサービスが実行可能になるまで待機し、クライアントを非同期実行する。
         while not set_disp_color_cli.wait_for_service(timeout_sec=1.0):
               node.get_logger().info('service not available, waiting again...')
         future = set_disp_color_cli.call_async(color_req)
         # サービス実行終了結果を得るまで待機
         rclpy.spin_until_future_complete(node, future)
         result = future.result()
         # 結果を出力
         node.get_logger().info('Result: %s' % result.result)
         # 2秒停止
         time.sleep(2)
         print()

         node.get_logger().info('Finish!')
         print()
         # 5秒停止
         time.sleep(5)

      # アプリ終了時はnodeを終了してrclpyを終了
      node.destroy_node()
      rclpy.shutdown()


   if __name__ == '__main__':
      main()


解説します。

**10-12行目:**

.. code-block:: python

   import time
   from m5serial_msgs.srv import SetDisplayColor
   import rclpy

| モジュールのimportです。
| 今回はsleep用のtime関数の他に、ros2の2つのモジュールを使っています。
| m5serial_msgs.srvはAKARI用に作成されたパッケージで、M5との通信をROS2で行うためのメッセージです。
| 詳しくは後ほど紹介します。
| 今回はこの中のSetDisplayColorという型を使うことで、ディスプレイ色を変更するサービスをコールできます。
| rclpyはpythonのros2ライブラリです。pythonでROS2を書く場合はインポートしてください。

**14行目:**

.. code-block:: python

   node = None

| nodeという空のグローバル変数を作成します。

**17行目:**

.. code-block:: python

   def main(args=None):

メイン関数です。

**22行目:**

.. code-block:: python

      rclpy.init(args=args)

| ROS2での通信を行うためにrclpyを初期化します。ROS2ノードを作成する前に呼び出す必要があります。

**25行目:**

.. code-block:: python

      node = rclpy.create_node('display_color')

| ここで、node変数を用いてROS2ノードを作成します。
| ROS2ノード作成にはcreate_node()という関数を使います。
| 'display_color'は作成するノードの名前です。

**27-28行目:**

.. code-block:: python

      set_disp_color_cli = node.create_client(
         SetDisplayColor, '/set_display_color')

| create_client()という関数を使うことでサービスをコールするためのクライアントを作成します。
| 今回はset_disp_color_cliという名前でクライアントを作成しています。
| 第1引数はコールするメッセージの型です。今回はSetDisplayColorというAKARI独自で作成されたサービス型を使います。
| 第2引数はコールするサービス名です。ここでは、'/set_display_color'というサービスをコールします。

**31行目:**

.. code-block:: python

      while rclpy.ok():

| rclpyが生きている限りループする部分で、アプリ終了まで動作し続けます。

**33行目:**

.. code-block:: python

      node.get_logger().info('STEP1. Set display color to white')

| 25行目で作成したノードはget_logger()を使って、コマンドライン上にログを出力することができます。
| ここではprint()と同じような用途で用いています。
| infoはlogの重要度のレベルを表しています。
| 'STEP1. Set display color to white'とコマンドラインに表示されます。

**35行目:**

.. code-block:: python

      color_req = SetDisplayColor.Request()

| リクエスト用のインスタンスをcolor_reqという名前を作成しています。
| 27行目で作成したset_disp_color_cliの型に合わせて作成します。ここにリクエスト内容を入れていきます。

**37行目:**

.. code-block:: python

      color_req.color = 'white'

| color_reqにはcolorというメンバがあります。
| ここに変更したい背景色の名前を入れていきます。今回は'white'にします。

**39-40行目:**

.. code-block:: python

      while not set_disp_color_cli.wait_for_service(timeout_sec=1.0):
         node.get_logger().info('service not available, waiting again...')

| 39行目は、set_disp_color_cliが実行可能になるまで待つ、という処理です。
| サービスを受け付けるアプリ側が実行できるようになっていない状態で呼び出すと失敗するので、それを待っています。
| wait_for_service()は実行可能になったらTrueが返ってきます。そうするとwhile()のループから抜けます。
| 引数の'timeout_sec=1.0'はタイムアウトまでの秒数で、この秒数経過しても実行可能にならなかったらfalseを返します。
| つまりここでは、実行可能になっていない場合は1秒ごとに、40行目の'service not available, waiting again...'というメッセージが表示され、再度実行待ちになります。

**41行目:**

.. code-block:: python

      future = set_disp_color_cli.call_async(color_req)

| set_disp_color_cliのサービスをここでコールしています。
| call_async()を使うことでサービスをコールしています。
| 引数はコールする際のリクエストの中身で、先ほど作成した'color_req'を使っています。
| 結果はfutureで受け取ります。

**43−44行目:**

.. code-block:: python

      rclpy.spin_until_future_complete(node, future)
      result = future.result()

| spin_until_future_complete()はサービス コールの結果が返ってくるまで待機します。
| 第一引数は処理を行っているノード名です。ここではnodeを入れます。
| 第二引数は結果を待つfuture名です。ここでは41行目のfutureで結果を待ちます。
| 結果が返ってくると、44行目に進みます。ここでは、futureに返ってきた結果をresultに入れています。


**46行目:**

.. code-block:: python

      node.get_logger().info('Result: %s' % result.result)

| 44行目で取得した結果をコマンドラインに表示します。成功していれば、'Result: True'と表示されます。

**48行目:**

.. code-block:: python

      time.sleep(2)

| 2秒停止します。

**49行目:**

.. code-block:: python

      print()

| 空文字をコマンドラインに出力します。改行用です。

**51-125行目:**

| 31-49行目と同じ処理を、色を変えながら繰り返しています。

**127行目:**

.. code-block:: python

      node.get_logger().info('Finish!')
      print()

| 'Finish!'とコマンドラインに表示して、改行しています。

**130行目:**

.. code-block:: python

      time.sleep(5)

| 処理が1周したので5秒停止します。ここまでが31行目のwhile()の中身なので、この後はまた31行目に戻ります。

**133-134行目:**

.. code-block:: python

      node.destroy_node()
      rclpy.shutdown()

| この部分は終了処理です。
| ノードを破壊し、rclpyをshutdownして終了します。


**137-138行目:**

.. code-block:: python

   if __name__ == '__main__':
      main()

| 137行目を入れておくと、ファイルがコマンドラインからスクリプトとして実行された場合にのみ処理を実行してくれます。
| つまり他ファイルからimportしたときにこのコードの中身が自動実行されなくなります。
| 138行目にmain()という名前で実行する関数が指定されているので、17行目のmain()関数が実行されます。

| 以上がサービス クライアントのサンプルアプリの全文解説です。
| 少し難しいですが、最初はこのサンプルを参考に、サービスに応じて必要な部分だけ書き換えていけばいいかと思います。

==============================================
サーバアプリの中身を見てみよう
==============================================

| サービスを呼び出す側はクライアントでしたが、そのサービスを準備して呼び出される側はサーバといいます。
| 今回コールした`/set_display_color`を作成しているサーバの中身を見てみましょう。
| これは`m5serial_server`というノードで、AKARI起動時に自動起動する様になっています。
| このファイルの場所は *akarimainpc/Base/ROS2/m5serial/m5serial_server/m5serial_server_src/m5serial_server.py* です。
| このファイルは若干複雑なので、要点だけかいつまんで説明します。

**56行目:**

.. code-block:: python

   class M5serialService(Node):

| ここでは、サーバのNodeをクラスとして作成しています。

**57-58行目:**

.. code-block:: python

    def __init__(self):
        super().__init__('m5serial_service')

| ここでノードを'm5serial_service'という名前で初期化します。

**67-68行目:**

.. code-block:: python

      self._set_display_color_srv = self.create_service(
         SetDisplayColor, '/set_display_color', self.set_display_color)

| create_service()という関数を使うことでサービス serverを作成します。
| 第1引数はサービスの型です。SetDisplayColorというAKARI独自で作成されたサービス型を使います。
| 第2引数はサービス名です。ここで'/set_display_color'というサービス名を指定しています。
| 第3引数はサービスコール時に実行される関数名です。ここでは、self.set_display_colorという名前にしています。
| 152行目にこの関数が記載されており、ここでリクエストされたcolorでディスプレイ色を変える指令をM5に送っています。
| サービスがコールされる度にこの関数が実行されています。
| 59-79行目では、'/set_display_color'以外にも様々なサービスを作成しています。

**273行目:**

.. code-block:: python

   m5serial_service = M5serialService()

| メイン関数内でM5SerialService()のクラスを作成しています。

**275-276行目:**

.. code-block:: python

   executor = MultiThreadedExecutor()
   executor.add_node(m5serial_service)

| ここではMultiThreadExecutor()というものを使って、m5serial_serviceを実行する専用のスレッドを作成しています。
| とりあえずは気にしなくても構いません。

**284行目:**

.. code-block:: python

      executor.spin_once(timeout_sec=0.001)

| 立ち上げているサービスがコールされているか確認し、ここで処理します。
| 引数はタイムアウトまでの秒数で、この秒数待ってもサービスがコールされていない場合はスキップします。
| ここでは0.001秒待ちます。
| この処理は277行目のwhile()文の中にあるので、ループし続けます。

| 以上のように、このアプリ側で'/set_display_color'というサービスとその実行処理を作っており、クライアント側のサンプルアプリではこれをコールしています。
| 特にサーバは例となるアプリが複雑で、中身の理解が難しかったかもしれません。
| AKARI関係なく基本的なサーバ、クライアントの使い方から学習したい場合は、公式のチュートリアルも参照ください。
| https://docs.ros.org/en/foxy/Tutorials/Writing-A-Simple-Py-Service-And-Client.html


|
:doc:`dev_sample_py` へ進む

:doc:`ros2_service` へ戻る