***********************************************************
AKARI環境のセットアップ(ansible版)
***********************************************************

lattepandaのUbuntu20.04にAKARI用の環境セットアップをしていきます。

===========================================================
必要なもの
===========================================================

* AKARI(Ubuntu20.04インストール済み)
* キーボード
* マウス

===========================================================
必要なパッケージのインストール
===========================================================

| まずはlattepandaに必要なパッケージをインストールします。
| ターミナルを開いて、下記コマンドを実行します。

.. code-block:: bash

    sudo apt install git python3.8 python3.8-venv sshpass

===========================================================
akari_mainレポジトリのclone
===========================================================

| lattepandaのUbuntuにakari_mainレポジトリをcloneします。
| home直下で下記のコマンドを実行します。

.. code-block:: bash

    git clone https://github.com/AkariGroup/akari_main.git

===========================================================
git submoduleのclone
===========================================================

| akari_mainレポジトリ内には、いくつかのライブラリがsubmoduleとして含まれています。
| これらのsubmoduleもcloneする必要があります。

1. akari_mainの直下に移動します。

.. code-block:: bash

    cd akari_main

2. 下記コマンドでsubmoduleの設定を初期化します。

.. code-block:: bash

    git submodule update --init --recursive

===========================================================
ansibleを用いたセットアップ
===========================================================

AKARIのセットアップには、ansibleというセットアップツールを用います。

1. 下記コマンドでansibleのセットアップ環境に移動します。

.. code-block:: bash

    cd setup/ansible

2. `hosts.example` を `hosts` という名前でコピーします。

.. code-block:: bash

    cp hosts.example hosts

3. 先程の `hosts` ファイルを開き、IPアドレスとして、 `127.0.0.1` を設定します。

| ansibleを使うと、IPアドレスを指定することで、ネットワーク経由で別のPCからもセットアップすることが可能です。
| ただし、今回はAKARI本体から直接セットアップを行うので、自身を指し示すipアドレス`127.0.0.1`を使っています。
| `hosts` ファイルの中身が下記のようになっていればOKです。

.. code-block:: yaml

    [mainpc]
    127.0.0.1
    # ここにIPアドレスを記述します
    # 例: 192.168.100.2

4. 下記のコマンドで、ansibleによる環境セットアップを実行します。

.. code-block:: bash

    ./run-ansible.py -i hosts ./system.yml -Kk --diff -c local

| SSH password, Default passwordを聞かれるので、それぞれlattepandaのログインパスワードを入力します。
| 初回実行時は時間がかかるので、終了までしばらく待ちます。
| このセットアップでは、下記の様なタスクが自動で実行されます。

* ライブラリのインストール
* akariのpython仮想環境(poetry)の設定
* ユーザー権限の設定
* dynamixel、M5Stack、OAK-DなどのUSB周辺機器の接続設定
* M5Stackへのソフト書き込み

全てがOK(既に変更済み)またはchanged(変更あり)になっており、failed=0であればOKです。

.. image:: ../../images/ansible.jpg
    :width: 600px

===========================================================
ansibleを用いたakari_mainのシステムへのインストール
===========================================================

次に、ansibleを用いてAKARIのUbuntuのシステム領域にakari_mainをインストールします。

1. 同じ `akari_main/setup/ansible` の下で、下記のコマンドで環境セットアップを実行します。

.. code-block:: bash

   ./run-ansible.py -c local ./local.yml -K --diff

| Default passwordを聞かれるので、lattepandaのログインパスワードを入力します。

2. 終了すると、PLAY RECAPが表示されます。
全てがOKまたはchangedになっており、failed=0であればOKです。

===========================================================
本体の再起動
===========================================================

1. 一旦Ubuntuをシャットダウンし、AKARI本体を再起動してください。


| 以上でansibleによるセットアップは完了です。
| 次はakari_main直下にアプリケーションを実行するための仮想実行環境を構築します。
|

:doc:`setup_poetry` へ進む

:doc:`install_ubuntu` へ戻る

