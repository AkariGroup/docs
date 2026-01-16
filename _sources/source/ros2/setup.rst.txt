***********************************************************
AKARIのROS2環境をセットアップしよう
***********************************************************

| まずは、AKARIのROS2環境のセットアップ方法を説明します。

1. aptリポジトリの追加

  | 下記コマンドを実行し、aptリポジトリを追加します。

  .. code-block:: bash

    sudo apt install software-properties-common
    sudo add-apt-repository universe

2. aptの更新とROS2のGPGキーを取得

  | 下記コマンドを実行しaptの更新を行い、ROS2のGPGキーを取得します。

  .. code-block:: bash

    sudo apt update && sudo apt install curl -y
    sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

3. リポジトリをsource listに追加

  | 下記コマンドを実行し、ROS2のリポジトリをsourceのlistに追加します。

  .. code-block:: bash

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

4. ROS2のインストール

  | 再度aptの更新を行い、ROS2 humbleとbuild用のパッケージであるcolconをインストールします。

  .. code-block:: bash

    sudo apt update
    sudo apt upgrade
    sudo apt install ros-humble-desktop python3-colcon-common-extensions

5. workspaceを作成する

  | ros2のworkspaceを作成します。
  | 今回はhomeディレクトリの直下に"ros2_ws"というディレクトリを作成し、そこでROS2の開発を行います。

  .. code-block:: bash

    cd ~/
    mkdir ros2_ws
    cd ros2_ws

6. akari_rosをcloneする。

  | 作成したworkspace内にsrcというディレクトリを作成し、その中にakari_rosをcloneします。

  .. code-block:: bash

    mkdir src
    cd src
    git clone https://github.com/AkariGroup/akari_ros.git

7. ROS2のsetupファイルを読み込む

  | ROS2を使うには、ROS2のsetupファイルを読み込む必要が有ります。
  | 下記を実行し、setupファイルを読み込みます。

  .. code-block:: bash

    . /opt/ros/humble/setup.bash

  .. note::

    | **この読み込みは、ROS2を使う場合ターミナルを起動する度に実行する必要があります。**
    | **下記コマンドを実行して~/.bashrcに追記しておくと自動実行されるようになります。**

    .. code-block:: bash

      echo ". /opt/ros/humble/setup.bash" >> ~/.bashrc

8. akari_rosをビルドする。

  | akari_rosのビルドを行います。
  | ビルドはros2_ws直下で行うため、移動してから実行します。

  .. code-block:: bash

    cd ~/ros2_ws
    colcon build --symlink-install

9.  workspaceのsetupファイルを読み込む

  | ビルドが成功したら、このworkspaceのsetupファイルが生成されるのでこちらも読み込む必要が有ります。
  | 下記を実行し、setupファイルを読み込みます。

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
