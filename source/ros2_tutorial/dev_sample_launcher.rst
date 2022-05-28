*******************************************
ROS2アプリを作ってみよう(ROS2 統合編)
*******************************************

:doc:`dev_sample_py` と :doc:`dev_sample_cpp` の両方をクリアした方は、最後に両方を同時に実行できるlaunchファイルを作ってみましょう。

.. note::

   新規ターミナルを起動する際に下記のターミナルの機能選択画面が表示される場合、本ページではすべて「2:ROS2」を選択します。
   2を入力し、enterを押してください。

   .. image:: ../images/terminal_function.png

.. note::
    本章で作成するパッケージのサンプルは、akaridocument/sample内に収録されています。
    ファイルの中身やディレクトリ構成など参考にしたい場合は、こちらを参照してください。

=============================
launchファイルの追加作成
=============================

下記を実行して、 :doc:`dev_sample_cpp` 内に新たにhello_akari_world_and_display.launch.pyを作成します。

.. code-block:: bash

    $ cd ~/usr_ws/src/hello_akari_display/launch
    $ touch hello_akari_world_and_display.launch.py

hello_akari_world_and_display.launch.pyをエディタで開き、下記のように記載します。
hello_akari_world_sample、hello_akari_display_sample、OpenVINOの顔認識パッケージの3つを実行する様に書きます。

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
実行
=============================
| 作成したら、前章までと同様にコンパイルしてhello_akari_world_and_display.launch.pyをlaunchします。
| 顔を認識したときに、お辞儀しながら画面に"Hello!"が表示されれば成功です。
| ROSを使うと、今回の様にpublishした認識結果をhello_akari_worldとhello_akari_displayの両方が受け取って、それぞれの動作を並列して実行する、ということが簡単にできるようになります。

.. code-block:: bash

    $ cd ~/usr_ws/src
    $ colcon build --symlink-install --packages-select hello_akari_display
    $ . install/local_setup.bash
    $ ros2 launch hello_akari_display hello_akari_world_and_display.launch.py


|
:doc:`main` へ戻る

:doc:`ros2_service_app` へ戻る