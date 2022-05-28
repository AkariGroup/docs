******************************
アプリでトピック通信をしよう
******************************

ROS2でのトピック通信のアプリでの使い方について、AKARIを使って解説していきます。

.. note::

   | こちらはROS2を使ったバージョンです。
   | ROSに慣れている方、使ってみたい方はこちらを推奨します。
   | ROSの使用、未使用の環境切り替え方法は :doc:`../troubleshoot/ros_switch` を参照してください。

.. note::

   新規ターミナルを起動する際に下記のターミナルの機能選択画面が表示される場合、本ページではすべて「2:ROS2」を選択します。
   2を入力し、enterを押してください。

   .. image:: ../images/terminal_function.png

==============================================
アプリからトピックをサブスクライブしてみよう
==============================================

| 今回はサンプルアプリでトピックのサブスクライブを試してみます。
| ターミナルを立ち上げて下記のコマンドを実行します。

.. code-block:: bash

   ros2 run akari_sample 2b_gpio_input

| 今回は *akari_sample* のパッケージの中の *2b_gpio_input* を実行します。
| din0、 din1、ain0のデータがコマンドライン上に表示されると思います。
| これは、2b_gpio_inputの中で */m5* のトピックをサブスクライブして、表示しているためです。

==============================================
サブスクライバアプリの中身を見てみよう
==============================================

| アプリの中身を見てみましょう。
| ファイルの場所は *akarimainpc/App/ROS2/akari_sample/akari_sample/2b_gpio_input.py* です。

.. code-block:: python

   #!/usr/bin/env python
   # coding:utf-8

   """
   Env info sample
   Created on 2021/02/14
   @author: Kazuya Yamamoto
   """

   import time
   from m5serial_msgs.msg import M5
   import rclpy

   node = None


   def m5_cb(msg):
      """
      M5からのデータを受信する度にこの関数が呼ばれる。
      """
      global node
      # 気圧の値はmsg.pressure[hPa]、気温の値はmsg.temperature[deg]、明るさの値はmsg.brightness(0-4096)に格納されている。
      # コマンドラインに取得した各値を表示する。
      node.get_logger().info('pressure: %f[hPa], temperature: %f[deg], brightness: %f' % (
         msg.pressure, msg.temperature, msg.brightness))
      # 1秒停止
      time.sleep(1)


   def main(args=None):
      """
      メイン関数
      """
      global node
      # ROS2のrclpyを初期化
      rclpy.init(args=args)

      # ROS2の'env_info'というノードを作る
      node = rclpy.create_node('env_info')
      # '/M5'というros2 topicのサブスクライバを作る。この中にbuttonのデータが格納されている。
      m5_sub = node.create_subscription(M5, '/m5', m5_cb, 1)

      # アプリが終了されるまで、'/M5'のサブスクライブを実行し続ける。
      while rclpy.ok():
         rclpy.spin_once(node)

      # アプリ終了時はnodeを終了してrclpyを終了
      node.destroy_node()
      rclpy.shutdown()


   if __name__ == '__main__':
      main()

解説します。

**10-12行目:**

.. code-block:: python

   import time
   from m5serial_msgs.msg import M5
   import rclpy

| モジュールのimportです。
| 今回はsleep用のtime関数の他に、ros2の2つのモジュールを使っています。
| m5serial_msgs.msgはAKARI用に作成されたパッケージで、M5との通信をROS2で行うためのメッセージです。
| 詳しくは後ほど紹介します。
| 今回はこのM5という型を使うことで、データを取得できます。
| rclpyはpythonのros2ライブラリです。pythonでROS2を書く場合はインポートしてください。

**14行目:**

.. code-block:: python

   node = None

| nodeという空のグローバル変数を作成します。

**17行目:**

.. code-block:: python

   def m5_cb(msg):

| これは **callback関数** といって、トピックをサブスクライブしたときに実行される関数です。
| 関数の引数としてmsgを与えています。これは受信したトピックの中身を表しています。

**21行目:**

.. code-block:: python

      global node

| 14行目で作成したnode変数をグローバル変数として使用します。

**24-25行目:**

.. code-block:: python

      node.get_logger().info('pressure: %f[Pa], temperature: %f[deg], brightness: %f' % (
        msg.pressure, msg.temperature, msg.brightness))

| 後述しますが、39行目でnode変数を使ってros2のノードを作成しています。
| このノードはget_logger()を使って、コマンドライン上にログを出力することができます。
| infoはlogの重要度のレベルを表しています。
| 今回は圧力、気温、明るさの3つの値を取得して、コマンドライン上に表示しています。
| これらの値は、それぞれサブスクライブしたmsg引数の中にmsg.pressure, msg.temperature, msg.brightnessとして格納されています。

**26行目:**

.. code-block:: python

      time.sleep(1)

受信したら１秒停止します。

**30行目:**

.. code-block:: python

   def main(args=None):

メイン関数です。

**34行目:**

.. code-block:: python

      global node

| ここでも14行目で作成したnode変数をグローバル変数として使用します。

**36行目:**

.. code-block:: python

      rclpy.init(args=args)

| ROS2での通信を行うためにrclpyを初期化します。ROS2ノードを作成する前に呼び出す必要があります。

**39行目:**

.. code-block:: python

      node = rclpy.create_node('env_info')

| ここで、node変数を用いてROS2ノードを作成します。
| ROS2ノード作成にはcreate_node()という関数を使います。
| 'env_info'は作成するノードの名前です。

**41行目:**

.. code-block:: python

      m5_sub = node.create_subscription(M5, '/m5', m5_cb, 1)

| create_subscription()という関数を使うことでトピックをサブスクライブするためのサブスクライバを作成します。
| 今回はm5_subという名前でサブスクライバを作成しています。
| 第1引数はサブスクライブするメッセージの型です。今回はM5というAKARI独自で作成されたメッセージ型を使います。
| 第2引数はサブスクライブするトピック名です。ここでは、'/m5'というトピックをサブスクライブします。
| 第3引数はcallback関数名です。17行目で作成したm5_cb関数を使います。
| 第4引数はバッファするトピックの数ですが、今回は1にします。

**44-45行目:**

.. code-block:: python

      while rclpy.ok():
         rclpy.spin_once(node)

| rclpyが生きている限りループする部分で、アプリ終了まで動作し続けます。
| rclpy.spin_once(node)の部分で、ノードの処理を１回実行します。
| ここでは、/m5のサブスクライブを1回実行するまで待ち続けます。
| while文の中にはこの処理しか書かれていないため、サブスクライブしたら再度この部分が呼ばれ、また次のサブスクライブを待ち続けます。

**48-49行目:**

.. code-block:: python

      node.destroy_node()
      rclpy.shutdown()

| この部分は終了処理です。
| ノードを破壊し、rclpyをshutdownして終了します。

**52-53行目:**

.. code-block:: python

   if __name__ == '__main__':
      main()

| 52行目を入れておくと、ファイルがコマンドラインからスクリプトとして実行された場合にのみ処理を実行してくれます。
| つまり他ファイルからimportしたときにこのコードの中身が自動実行されなくなります。
| 53行目にmain()という名前で実行する関数が指定されているので、14行目のmain()関数が実行されます。

| 以上がサブスクライバーのサンプルアプリの全文解説です。
| 自身でアプリを作成する際は、この書き方に則ってサブスクライブするトピックを変えたり、callback関数の中身を変えたりして作りたいアプリを実現していきましょう。

==============================================
パブリッシャアプリの中身を見てみよう
==============================================

| 今回受信した`/m5`をパブリッシュしているパブリッシャの中身を見てみましょう。
| これは`m5serial_server`というノードで、AKARI起動時に自動起動する様になっています。
| このファイルの場所は *akarimainpc/Base/ROS2/m5serial/m5serial_server/m5serial_server_src/m5serial_server.py* です。
| このファイルは若干複雑なので、要点だけかいつまんで説明します。

**225行目:**

.. code-block:: python

   class M5SerialPublisher(Node):

| ここでは、パブリッシャのノードをクラスとして作成しています。
| 本来ROS2では、パブリッシャやサブスクライバを作る際はこの方法が推奨されています。

**226-228行目:**

.. code-block:: python

      def __init__(self):
         super().__init__('m5serial_publisher')
         self._m5_pub = self.create_publisher(M5, 'm5', 10)

| ここでノードを'm5serial_publisher'という名前で初期化します。
| また、create_publisher()という関数を使うことでトピックをパブリッシュするためのパブリッシャを作成します。
| 第1引数はパブリッシュするメッセージの型です。M5というAKARI独自で作成されたメッセージ型を使います。
| 第2引数はパブリッシュするトピック名です。ここで'm5'というトピック名を指定しています。
| 第3引数はキューのサイズで、サブスクライバがデータを何らかの理由で受信できないとき保持するデータ数です。

**230行目:**

.. code-block:: python

   def parse_m5_output(self, message):

| このノードでは、M5からシリアルで送られてきたデータを受信して、それをros2のメッセージに変換してパブリッシュしています。
| それらの処理は、230-268行目のこの関数内に書かれています。

**233行目:**

.. code-block:: python

            self.m5_mes = M5()

| M5というメッセージ型でself.m5_mesというメッセージ本体を作成しています。
| 234-263行目では、このm5_mesにデータを代入しています。

**264行目:**

.. code-block:: python

         self._m5_pub.publish(self.m5_mes)

| メッセージを実際にパブリッシュするのはこの行です。
| 228行目で作成したself._m5_pubのpublish()というメンバを呼び出してパブリッシュを行います。
| 引数にはパブリッシュするメッセージを指定します。ここでは233行目で作成したself.m5_mesを指定しています。

**274行目:**

.. code-block:: python

   m5serial_publisher = M5SerialPublisher()

| メイン関数内でM5SerialPublisher()のクラスを作成しています。

**281行目:**

.. code-block:: python

            m5serial_publisher.parse_m5_output(data_str)

| ここで230行目のparse_m5_output()を呼び出すことで、メッセージを作成し、パブリッシュされることとなります。

| 以上のように、M5という型で/m5というトピックをこのノードがパブリッシュしており、サブスクライバ側のサンプルアプリではこれをサブスクライブしてデータを取得していました。
| パブリッシャの方は例となるアプリが複雑で、中身の理解が難しかったかもしれません。
| AKARI関係なく基本的なパブリッシャ、サブスクライバから学習したい場合は、公式のpub-subチュートリアルも参照ください。
| https://docs.ros.org/en/foxy/Tutorials/Writing-A-Simple-Py-Publisher-And-Subscriber.html

|
:doc:`ros2_service` へ進む

:doc:`ros2_topic` へ戻る
