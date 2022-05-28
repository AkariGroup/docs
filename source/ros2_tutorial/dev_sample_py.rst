.. highlight:: python
   :linenothreshold: 10

*******************************************
ROS2アプリを作ってみよう(ROS2 python編)
*******************************************

| 次はROS2のアプリを新しく作って、AKARIで動かしてみましょう。
| ここではpythonを用いて、ROS2で「付属のカメラで顔を検出するとお辞儀をするアプリ」を開発します。

.. note::

   新規ターミナルを起動する際に下記のターミナルの機能選択画面が表示される場合、本ページではすべて「2:ROS2」を選択します。
   2を入力し、enterを押してください。

   .. image:: ../images/terminal_function.png

.. note::
    本章で作成するパッケージのサンプルは、akari_document/sample内に収録されています。
    ファイルの中身やディレクトリ構成など参考にしたい場合は、こちらを参照してください。


=============================
ワークスペースの作成
=============================

開発用のワークスペース **usr_ws** を作成します。

.. code-block:: bash

   $ cd ~/
   $ mkdir -p usr_ws/src
   $ cd usr_ws/src

=============================
パッケージの作成
=============================

| 新規パッケージ **hello_akari_world** を作成します。
| --build-typeオプションをament_pythonにすると、python用のパッケージが生成されます。

.. code-block:: bash

   $ ros2 pkg create --build-type ament_python hello_akari_world

=============================
スクリプトの実装
=============================

アプリ本体となるpythonスクリプトファイルを作成します。

1. hello_akari_world_sample.pyというpythonファイルを作成し、実行権限を付けます。

.. code-block:: bash

    $ cd ~/usr_ws/src/hello_akari_world/hello_akari_world
    $ touch hello_akari_world_sample.py
    $ chmod +x hello_akari_world_sample.py

2. hello_akari_world_sample.pyをエディタで開き、以下のスクリプトを記載します。

.. code-block:: python

    #!/usr/bin/env python
    import rclpy
    from rclpy.node import Node
    from rclpy import Parameter
    from akari_controller.akari_controller import AkariController
    from object_msgs.msg import ObjectsInBoxes
    import time


    class HelloAkariWorld(Node):
        """顔認識したらお辞儀をするサンプルアプリ"""

        def __init__(self):
            """
            クラスの初期化時にまずここが実行される
            """
            super().__init__('hello_akari_world')
            # 初期位置を設定。左右は正面、上下は20度見上げる
            self.default_pan = 0
            self.default_tilt = 0.349066

            self.akari = AkariController()
            # ログ出力モードをDEBUGモードに
            rclpy.logging.set_logger_level('hello_akari_world', level=10)
            # ヘッドモータのサーボON
            self.akari.set_torque_enable({"joint_names": self.akari.get_joint_names(),
                                        "values": [True, True]})
            # ヘッドモータの速度を6.28rad/s、加速度を制限なしに設定
            self.akari.set_profile_velocity({"joint_names": self.akari.get_joint_names(),
                                            "values": [6.28, 6.28]})
            self.akari.set_profile_acceleration({"joint_names": self.akari.get_joint_names(),
                                                "values": [0.0, 0.0]})

            # OpenVINOの顔認識結果をROS2 topicとして受け取れるようにする
            self.sub_topic_name = '/ros2_openvino_toolkit/face_detection'
            self._image_sub = self.create_subscription(
                ObjectsInBoxes, self.sub_topic_name, self._face_info_cb, 1)

            # 初期位置にヘッドを移動。
            self.akari.set_goal_position({"joint_names": self.akari.get_joint_names(),
                                        "values": [self.default_pan, self.default_tilt]})

        def _bow(self):
            """
            おじぎモーション
            """
            # コマンドラインに表示
            self.get_logger().debug("Hello Akari World!")
            # おじぎは30度！
            self.akari.set_goal_position({"joint_names": self.akari.get_joint_names(),
                                        "values": [self.akari.get_present_position(
                                            self.akari.get_joint_names())[0], -0.523599]})
            # おじぎは3秒！
            time.sleep(3.0)
            # 頭を上げる
            self.akari.set_goal_position({"joint_names": self.akari.get_joint_names(),
                                        "values": [self.akari.get_present_position(
                                            self.akari.get_joint_names())[0], self.default_tilt]})
            # 休憩も3秒！
            time.sleep(3.0)

        def _face_info_cb(self, data):
            """
            OpenVINOのtopicをsubscribeした時に実行される。
            顔の有無に関わらず定期的にpublishされている。
            """
            # 顔が認識されていた場合おじぎをする。
            if data.objects_vector:
                self._bow()


    def main(args=None):
        """
        起動するとここが実行される
        """
        # rclpyを初期化してHelloAkariWorldクラスを立ち上げる
        rclpy.init(args=args)
        hello_akari_world = HelloAkariWorld()
        # rclpyが生きている間は周期実行される
        while rclpy.ok():
            rclpy.spin_once(hello_akari_world, timeout_sec=0.001)
        rclpy.shutdown()


    if __name__ == '__main__':
        main()


=============================
dependenciesの追加
=============================
| このパッケージを実行するために、dependenciesを追加する必要があります。
| dependanciesとは、このパッケージを実行する際に依存するライブラリ群です。
| これらはパッケージ直下のpackage.xmlに記述されています。

下記コマンドでhello_akari_worldパッケージのディレクトリに移動して、package.xmlをエディタで開きましょう。

.. code-block:: bash

    $ cd ~/usr_ws/src/hello_akari_world

| 下記3行を、<license>と<test_depend>の間の行に追加します。<exec_depend>には実行時に依存するライブラリを記述します。

.. code-block:: xml

      <exec_depend>rclpy</exec_depend>
      <exec_depend>object_msgs</exec_depend>
      <exec_depend>launch_ros</exec_depend>

| rclpyはROS Client Library for the Python languageの略で、ROS2をpythonで使う際には必須です。
| object_msgsは顔認識結果をtopicでやりとりする際に使うメッセージ型です。
| launch_rosはlaunchファイルを実行する際に必要です。


=============================
setup.pyの編集
=============================
| 次にこのパッケージのセットアップに必要なsetup.pyを編集していきます。
| hello_akari_worldパッケージのディレクトリ直下にあるsetup.pyをエディタで開きます。
| 冒頭の

.. code-block:: python

    from setuptools import setup

を、下記のように変更します。これらは以降ファイルパスを通すのに使われます。

.. code-block:: python

    import os
    from glob import glob
    from setuptools import find_packages, setup

| 次にdata_filesの部分を変更します。ここにはビルドした後にインストールする必要のあるファイルを記述します。
| data_filesの中身を下記のように変更します。

.. code-block:: python

    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml'])
    ],

| 次に先程のhello_akari_world_sample.pyを実行するためのentry pointsを追加します。
| entry pointsはこのパッケージが起動する際の起点を表します。
| これを記述することで、先ほど作成したhello_akari_world_sample.pyのmain関数から起動開始してくれるようになります。

.. code-block:: python

    entry_points={
        'console_scripts': [
            'hello_akari_world_sample = hello_akari_world.hello_akari_world_sample:main',
        ],
    }

完成したsetup.pyの中身は下記のようになります。

.. code-block:: python

    import os
    from glob import glob
    from setuptools import find_packages, setup


    package_name = 'hello_akari_world'

    setup(
        name=package_name,
        version='0.0.0',
        packages=[package_name],
        data_files=[
            ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
            ('share/' + package_name, ['package.xml'])
        ],
        install_requires=['setuptools'],
        zip_safe=True,
        maintainer='akari',
        maintainer_email='TODO',
        description='TODO: Package description',
        license='TODO: License declaration',
        tests_require=['pytest'],
        entry_points={
            'console_scripts': [
                'hello_akari_world_sample = hello_akari_world.hello_akari_world_sample:main',
            ],
        },
    )


=============================
パッケージのbuild
=============================
| これでパッケージは完成です。
| usr_wsに移動してからビルドしてみましょう。
| ROS2のbuildにはcolcon buildを使います。
| オプションの--symlink-installはファイルコピーの代わりに(可能な限り)シンボリックリンクを使用してインストールする仕組みで、基本はこちらを付けた方が便利です。
| --packages-selectはビルドするパッケージを選択できます。

.. code-block:: bash

    $ cd ~/usr_ws
    $ colcon build --symlink-install --packages-select hello_akari_world

=============================
実行
=============================
| 作成したアプリを実行してみましょう。
| 今回は、2つのターミナルを立ち上げて1つ目はOpenVINOの顔認識をlaunchファイル経由で実行、2つ目で今回作成したhello_akari_world_sampleを実行します。
| 実行する際はusr_ws内のlocal_setup.bashにsourceを通してから実行します。ここにusr_wsでビルドしたパッケージの情報が記載されているので、これを行わないと起動ができません。

１つめのターミナル

.. code-block:: bash

    $ . install/local_setup.bash
    $ ros2 launch dynamic_vino_sample pipeline_people_akari.launch.py


2つめのターミナル

.. code-block:: bash

    $ . install/local_setup.bash
    $ ros2 run hello_akari_world hello_akari_world_sample


| 両方実行すると、顔検出をしたときヘッドが一定時間下を向いておじぎをします。
| 終了するときはCtrl+cです。
| 仕組みとしては、1つめのターミナルで起動したOpenVINOの顔認識が、デフォルトで起動しているヘッドカメラの画像メッセージをsubsribeして顔認識しています。
| その認識結果をros topicとしてpublishしていて、hello_akari_world_sampleはその結果をsubscribeし、顔が認識されていたらおじぎをする、という流れです。

=============================
launchファイルの作成
=============================
| 次に、OpenVINOの顔認識とhello_akari_worldをまとめて実行するためのlaunchファイルを作成します。
| 下記を実行して、hello_akari_world.launch.pyを作成します。

.. code-block:: bash

    $ cd ~/usr_ws/src/hello_akari_world
    $ mkdir launch
    $ cd launch
    $ touch hello_akari_world.launch.py

| hello_akari_world.launch.pyをエディタで開き、下記のように記載します。
| ここには、hello_akari_world_sampleとOpenVINOのlaunchファイルを両方実行する旨が記載されています。

.. code-block:: python

    import os
    import launch
    import launch.actions
    import launch.substitutions
    import launch_ros.actions
    from ament_index_python.packages import get_package_share_directory


    def generate_launch_description():
        return launch.LaunchDescription([
            launch.actions.DeclareLaunchArgument(
                'prefix',
                default_value=[
                    launch.substitutions.EnvironmentVariable('USER'), '_'],
                description='Prefix for node names'),
            # hello_akari_world_sampleを実行する
            launch_ros.actions.Node(
                package='hello_akari_world', executable='hello_akari_world_sample', output='screen',
                name=[launch.substitutions.LaunchConfiguration(
                    'prefix'), 'hello_akari_world_sample']
            ),
            # OpenVINOのlaunchファイルを実行する
            launch.actions.IncludeLaunchDescription(
                launch.launch_description_sources.PythonLaunchDescriptionSource(
                    get_package_share_directory(
                        'dynamic_vino_sample') + '/launch/pipeline_people_akari.launch.py'))
        ])

=============================
setup.pyの追記
=============================

| 次にsetup.pyに先ほど作成したlaunchファイルのパスを追加します。
| hello_akari_worldパッケージのディレクトリ直下にあるsetup.pyをエディタで開き、data_filesの中身を下記のように変更します。
| これにより、hello_akari_world.launch.pyがビルド後にインストールされるようになります。

.. code-block:: python

    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
        # 下記を追加
        (os.path.join('share', package_name), glob('launch/*.launch.py'))
    ]


=============================
launchファイルの実行
=============================

| 再ビルドしてからlocal_setup.bashにsourceを通して実行します。
| 1つのlaunchファイルを実行するだけで、先程の顔認識とお辞儀動作が両方実行されるのが分かると思います。

.. code-block:: bash

    $ cd ~/usr_ws
    $ colcon build --symlink-install --packages-select hello_akari_world
    $ . install/local_setup.bash
    $ ros2 launch hello_akari_world hello_akari_world.launch.py

|
:doc:`dev_sample_cpp` へ進む

:doc:`ros2_service_app` へ戻る