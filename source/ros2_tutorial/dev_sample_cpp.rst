.. highlight:: python
   :linenothreshold: 10

*******************************************
ROS2アプリを作ってみよう(ROS2 c++編)
*******************************************

今度はC++を用いて、ROS2で「付属のカメラで顔を検出すると画面に"Hello!"と表示するアプリ」を開発します。


.. note::

   新規ターミナルを起動する際に下記のターミナルの機能選択画面が表示される場合、本ページではすべて「2:ROS2」を選択します。
   2を入力し、enterを押してください。

   .. image:: ../images/terminal_function.png

.. note::
    本章で作成するパッケージのサンプルは、akari_document/sample内に収録されています。
    ファイルの中身やディレクトリ構成など参考にしたい場合は、こちらを参照してください。

=============================
パッケージの作成
=============================

:doc:`dev_sample_py` で作成したusr_ws内に、新規パッケージ **hello_akari_display** を作成します。
| --build-typeオプションをament_cmakeにすると、C++用のパッケージが生成されます。

.. code-block:: bash

   $ cd ~/usr_ws/src
   $ ros2 pkg create --build-type ament_cmake hello_akari_display

=============================
ソースファイルの実装
=============================

アプリ本体となるソースファイルを作成します。

1. cppファイルを作成します。

.. code-block:: bash

    $ cd ~/usr_ws/src/hello_akari_display/src
    $ touch hello_akari_display_sample.cpp

2. hello_akari_display_sample.cppをエディタで開き、以下のコードを記載します。

.. code-block:: cpp

    #include <memory>
    #include "rclcpp/rclcpp.hpp"
    #include "object_msgs/msg/objects_in_boxes.hpp"
    #include "m5serial_msgs/srv/set_display_color.hpp"
    #include "m5serial_msgs/srv/set_display_text.hpp"
    #include <stdio.h>
    #include <unistd.h>

    using std::placeholders::_1;

    /**
    * 顔認識したら"Hello!"と表示するクラス"
    */
    class HelloAkariDisplay : public rclcpp::Node
    {
    public:
        HelloAkariDisplay()
            : Node("hello_akari_display")
        {

            face_sub_ = this->create_subscription<object_msgs::msg::ObjectsInBoxes>(
                "/ros2_openvino_toolkit/face_detection", 10, std::bind(&HelloAkariDisplay::topic_callback, this, _1));
            display_color_cli_ =
                this->create_client<m5serial_msgs::srv::SetDisplayColor>("/set_display_color");
            display_text_cli_ =
                this->create_client<m5serial_msgs::srv::SetDisplayText>("/set_display_text");
        }

    private:
        bool isDetected = false; //顔検出のステータスを保持。ディスプレイ表示を更新するかの判定に使う。

        /**
        * OpenVINOの顔認識結果をsubscribeしたときに実行されるCallback関数
        */
        void topic_callback(const object_msgs::msg::ObjectsInBoxes::SharedPtr msg)
        {
            auto color_req = std::make_shared<m5serial_msgs::srv::SetDisplayColor::Request>();
            auto text_req = std::make_shared<m5serial_msgs::srv::SetDisplayText::Request>();
            //画面中央にサイズ5で文字表示
            text_req->pos_x = -999;
            text_req->pos_y = -999;
            text_req->size = 5;
            text_req->refresh = true;
            if (msg->objects_vector.size() > 0 && isDetected == false)
            {
                //顔検出かつ前のステータスが未検出の場合
                RCLCPP_INFO(this->get_logger(), "Hello akari display!");
                //背景を白に！
                color_req->color = "white";
                auto color_res = display_color_cli_->async_send_request(color_req);
                //黒文字で"Hello!"と表示
                text_req->text = "Hello!";
                text_req->text_color = "black";
                text_req->back_color = "white";
                isDetected = true;
                auto text_res = display_text_cli_->async_send_request(text_req);
                //挨拶は3秒！
                sleep(3);
            }
            else if (msg->objects_vector.size() == 0 && isDetected == true)
            {
                //顔未検出かつ前のステータスが検出の場合
                //背景を黒に！
                color_req->color = "black";
                auto color_res = display_color_cli_->async_send_request(color_req);
                //白文字で"AKARI"と表示
                text_req->text = "AKARI";
                text_req->text_color = "white";
                text_req->back_color = "black";
                isDetected = false;
                auto text_res = display_text_cli_->async_send_request(text_req);
            }
        }

        rclcpp::Subscription<object_msgs::msg::ObjectsInBoxes>::SharedPtr face_sub_;
        rclcpp::Client<m5serial_msgs::srv::SetDisplayColor>::SharedPtr display_color_cli_;
        rclcpp::Client<m5serial_msgs::srv::SetDisplayText>::SharedPtr display_text_cli_;
    };

    /**
    *メイン関数
    */
    int main(int argc, char *argv[])
    {
        rclcpp::init(argc, argv);
        rclcpp::spin(std::make_shared<HelloAkariDisplay>());
        rclcpp::shutdown();
        return 0;
    }


=============================
launchファイルの作成
=============================
| 今回は最初からlaunchファイルを作成してしまいましょう。
| launchファイルは先程のhello_akari_display_sampleとOpenVINOの顔認識パッケージを実行するように作成します。
| 下記を実行して、hello_akari_display.launch.pyを作成します。

.. code-block:: bash

    $ cd ~/usr_ws/src/hello_akari_display
    $ mkdir launch
    $ cd launch
    $ touch hello_akari_display.launch.py

| hello_akari_display.launch.pyをエディタで開き、下記のように記載します。
| ここには、hello_akari_display_sampleとOpenVINOのlaunchファイルを両方実行する旨が記載されています。


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
            # hello_akari_display_sampleを実行する
            launch_ros.actions.Node(
                package='hello_akari_display', executable='hello_akari_display_sample', output='screen',
                name=[launch.substitutions.LaunchConfiguration(
                    'prefix'), 'hello_akari_display_sample']
            ),
            # OpenVINOのlaunchファイルを実行する
            launch.actions.IncludeLaunchDescription(
                launch.launch_description_sources.PythonLaunchDescriptionSource(
                    get_package_share_directory(
                        'dynamic_vino_sample') + '/launch/pipeline_people_akari.launch.py'))
        ])



=============================
dependenciesの追加
=============================
| このパッケージを実行するために、pythonと同様dependenciesを追加する必要があります。
| 今回はpython編でも使ったobject_msgs, launch_rosに加え、M5とデータをやり取りするためのAKARI独自のmsgライブラリであるm5serial_msgsを追加する必要があります。
| 下記コマンドでhello_akari_displayパッケージのディレクトリに移動して、package.xmlをエディタで開きましょう。

.. code-block:: bash

    $ cd ~/usr_ws/src/hello_akari_display

下記3行を、<buildtool_depend>と<test_depend>の間の行に追加します。

.. code-block:: xml

      <exec_depend>object_msgs</exec_depend>
      <exec_depend>m5serial_msgs</exec_depend>
      <exec_depend>launch_ros</exec_depend>

=============================
CMakeLists.txtの編集
=============================
| 次に先程のhello_akari_display_sample.cppをビルドするためのCMakeList.txtを編集します。
| hello_akari_displayパッケージのディレクトリ直下にあるCMakeLists.txtをエディタで開きます。
| # find dependencies以下を下記の様に変更します。

.. code-block:: cmake

    # find dependencies
    find_package(ament_cmake REQUIRED)
    find_package(rclcpp REQUIRED)
    find_package(object_msgs REQUIRED)
    find_package(m5serial_msgs REQUIRED)

    add_executable(hello_akari_display_sample src/hello_akari_display_sample.cpp)
    ament_target_dependencies(hello_akari_display_sample
    rclcpp object_msgs m5serial_msgs)


    install(TARGETS
    hello_akari_display_sample
    DESTINATION lib/${PROJECT_NAME})

    install(DIRECTORY
    launch
    DESTINATION share/${PROJECT_NAME}
    )

    ament_package()



=============================
パッケージのbuild
=============================
| これでパッケージは完成です。
| usr_wsに移動してからビルドしてみましょう。
| 今回は--packages-selectでhello_akari_displayだけを選んでビルドします。

.. code-block:: bash

    $ cd ~/usr_ws/src
    $ colcon build --symlink-install --packages-select hello_akari_display

=============================
実行
=============================
| usr_wsのlocal_setup.bashにsourceを通してから、先程作成したhello_akari_display.launch.pyをlaunchして実行します。
| 実行すると、顔検出したときディスプレイに”Hello！”と表示されます。
| 仕組みとしてはpython編とほぼ同様で、OpenVINOの顔認識が、デフォルトで起動しているヘッドカメラの画像メッセージをsubsribeして認識にかけます。
| その認識結果をros topicとしてpublishしていて、hello_akari_display_sampleはその結果をsubscribeし、顔が認識されていたらHello!と表示をする、という流れです。

.. code-block:: bash

   $ . install/local_setup.bash
   $ ros2 launch hello_akari_display hello_akari_display.launch.py

|
:doc:`dev_sample_launcher` へ進む

:doc:`ros2_service_py` へ戻る