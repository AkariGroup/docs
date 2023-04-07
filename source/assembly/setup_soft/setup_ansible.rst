***********************************************************
AKARI環境のセットアップ
***********************************************************

lattepandaのUbuntu22.04にAKARI用の環境セットアップをしていきます。

===========================================================
必要なもの
===========================================================

* AKARI(Ubuntu22.04インストール済み)
* キーボード
* マウス

===========================================================
apt upgradeの実行
===========================================================

| まずはaptパッケージのupgradeをします。
| ターミナルを開いて、下記コマンドを実行します。

.. code-block:: bash
    sudo apt update
    sudo apt upgrade

===========================================================
必要なパッケージのインストール
===========================================================

| 次にlattepandaに必要なパッケージをインストールします。
| ターミナルを開いて、下記コマンドを実行します。

.. code-block:: bash

    sudo apt install git python3.10 python3.10-venv sshpass git-lfs

===========================================================
akari_softwareレポジトリのclone
===========================================================

| lattepandaのUbuntuにakari_softwareレポジトリをcloneします。
| homeディレクトリ直下で下記のコマンドを実行します。
| **必ずhomeディレクトリで実行してください。home/以外へのcloneは後のセットアップのエラーの元になります！**

.. code-block:: bash

    cd ~/
    git clone https://github.com/AkariGroup/akari_software.git

===========================================================
git submoduleのclone
===========================================================

| akari_softwareレポジトリ内には、いくつかのライブラリがsubmoduleとして含まれています。
| これらのsubmoduleもcloneする必要があります。

1. akari_softwareの直下に移動します。

.. code-block:: bash

    cd ~/akari_software

2. 下記コマンドでsubmoduleの設定を初期化します。

.. code-block:: bash

    git submodule update --init --recursive

===========================================================
git lfsのpull
===========================================================

| akari_softwareレポジトリ内では、画像や認識モデルなどいくつかのファイルはGit LFS(Large File Storage)で管理されています。
| これらは別でpullする必要があります。

1. 下記コマンドでLFSのpullとcheckoutをします。

.. code-block:: bash

    git lfs pull
    git lfs checkout

===========================================================
ansibleを用いたセットアップ
===========================================================

AKARIのセットアップには、ansibleというセットアップツールを用います。

1. 下記コマンドでansibleのセットアップ環境に移動します。

.. code-block:: bash

    cd ~/akari_software/setup/ansible

2. 下記コマンドで、`hosts.example` を `hosts` という名前で同一ディレクトリ内でコピーします。

.. code-block:: bash

    cp hosts.example hosts

3. 下記コマンドで、ansibleによる環境セットアップを実行します。

.. code-block:: bash

    ./run-ansible.py -i hosts ./system.yml -K --diff -c local

| Default passwordを聞かれます。
| Default passwordには、それぞれUbuntuのログインパスワードを入力します。
| 初回実行時は時間がかかるので、終了までしばらく待ちます。
| このセットアップでは、下記の様なタスクが自動で実行されます。

* ライブラリのインストール
* ユーザー権限の設定
* dynamixel、M5Stack、OAK-DなどのUSB周辺機器の接続設定
* M5Stackへのソフト書き込み

全てがOK(既に変更済み)またはchanged(変更あり)になっており、failed=0であればOKです。

.. image:: ../../images/ansible.jpg
    :width: 600px


===========================================================
本体の再起動
===========================================================

1. 一旦Ubuntuをシャットダウンし、AKARI本体を再起動してください。


| 以上でansibleによるセットアップは完了です。
| 次はakari_software直下にアプリケーションを実行するための仮想実行環境を構築します。
|

:doc:`setup_m5` へ進む

:doc:`install_ubuntu` へ戻る

