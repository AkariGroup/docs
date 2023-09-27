***********************************************************
ROS2で動かしてみよう
***********************************************************

| セットアップしたROS2を動かしてみましょう。

===========================================================
akari_ros2のパッケージ紹介
===========================================================

最初に、akari_ros2に含まれる各パッケージを紹介します。
akari_ros2には下記のパッケージが含まれています。

・ **akari_msgs**
  | akari_ros2で使うカスタムメッセージ型、サービス型、アクション型を定義しています。

・ **state_publisher**
  | akariのjointやM5のstateをメッセージとしてpublishするpublisherが含まれています。

・ **m5_server**
  | akariのM5のコマンドを実行するservice serverが含まれています。

・ **servo_server**
  | akariのヘッドのサーボのコマンドを実行するservice serverが含まれています。

・ **akari_client_example**
  | サンプルアプリ群です。上記のpublisherからsubsclibeして表示するサンプルや、serverに対してserviceを実行するclientサンプルが含まれています。

・ **akari_launch**
  | publisher、serverをまとめて起動するlaunchファイルが含まれています。


===========================================================
ROS2サーバの起動
===========================================================

| サーバ側のアプリは下記のコマンドでまとめて起動します。

  .. code-block:: bash

    ros2 launch akari_launch akari_launch.py

| 上記コマンドでは、下記のノードをまとめて起動しています。

・ **joint_state_publisher** (パッケージ: state_publisher)
  各関節の状態をpublishするpublisher
・ **m5stack_publisher** (パッケージ: state_publisher)
  M5の状態をpublishするpublisher
・servo_server






  .. code-block:: bash

    . ~/ros2_ws/install/local_setup.bash

  .. note::

    | **こちらの読み込みも、ROS2を使う場合ターミナルを起動する度に実行する必要があります。**
    | **下記コマンドを実行して~/.bashrcに追記しておくと自動実行されるようになります。**

    .. code-block:: bash

      echo ". ~/ros2_ws/install/local_setup.bash" >> ~/.bashrc


以上でセットアップは終了です。
次は、実際に起動して使ってみましょう。

:doc:`example` へ進む

:doc:`main` へ戻る
