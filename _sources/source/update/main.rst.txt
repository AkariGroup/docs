.. meta::
   :description: オープンソースの小型卓上ロボット「AKARI」のアップデート方法を説明します。

################################
ソフトのアップデート
################################

===========================================================
ベースソフトのアップデート方法
===========================================================

| AKARIのベースソフトはDocker Imageとして配布されており、本体起動時は過去にダウンロードしたDocker Imageを使用しています。
| アップデートが配信された場合、このDocker Imageを更新する必要があります。

1. AKARI本体のUbuntuにログインします。
2. ターミナルを起動し、下記コマンドを実行します。

   .. code-block:: bash

      sudo systemctl start update-akira.service

3. AKARI本体を再起動すると、ソフトの更新が行われます。

   | 各サービスに関しては、webコンソールからサービスを起動した際に更新が行われます。

===========================================================
ライブラリのアップデート方法
===========================================================

| AKARIのライブラリ(akari_client, akari_proto)はPYPIでPyhtonパッケージとして配信されています。
| ライブラリのアップデートがあった場合は、AKARI本体内にインストールしているライブラリの更新作業が必要となります。

1. AKARI本体のUbuntuにログインします。
2. venv内で更新を行いたい場合は、各venvを有効化します。
3. 下記コマンドでアップデートを行います。

   .. code-block:: bash

      pip install -U akari_client[depthai] akari_proto

===========================================================
M5Stackのソフトアップデート方法
===========================================================

| M5Stackのソフトアップデート方法は下記の通りです。

1. AKARIのサービスを停止します。

   | この作業を実行し、シリアル通信を停止させないとソフトの書き込みに失敗します。
   | **「akari」ではなく「akira」です。**

   .. code-block:: bash

      sudo systemctl stop akira.service

2. M5のソフトを書き込みます。

   | 最新のakari_softwareのソフトを書き込む場合は、あらかじめakari_softwareレポジトリの更新を行ってください。

   .. code-block:: bash

      cd ~/akari_software/setup/akari_m5_software
      platformio run --target=upload

3. M5stackが再起動し、「Waiting...」画面に戻ることを確認します。

   | バージョン表記が書き込みたいソフトのバージョンになっていることを確認します。

4. AKARIのサービスを再起動します(もしくはAKARI本体を再起動します)。

   | **「akari」ではなく「akira」です。**

   .. code-block:: bash

      sudo systemctl resetart akira.service

5. webコンソールからakari-rpc-serverのサービスを起動して、AKARIのロゴが表示されることを確認します。
