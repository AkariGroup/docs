***********
Dynamixelのセットアップ
***********

| 次にDynamixelサーボモータの設定をしていきます。
| 参考リンク: https://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_wizard2/

=============================
必要なもの
=============================

* lattepanda alpha( :doc:`setup_autostart_bios` 終了済みのもの)
* キーボード
* マウス
* Dynamixel 2XL430-W250-T
* `BTE080C USB2TTL dongle <http://www.besttechnology.co.jp/modules/knowledge/?BTE080C%20USB2TTL%20dongle>`_

=============================
Dynamixelの接続
=============================
| M5stackをBTE080C USB2TTL dongle経由でlattepandaと接続します。

=============================
Dynamixel Wizard 2のセットアップ
=============================

1. 下記リンクからDinamixel Wizard 2をダウンロードします。

| https://www.robotis.com/service/download.php?no=1671

2. ダウンロードしたDynamixel Wizardの保存先ディレクトリでターミナルを開き、下記コマンドを実行します。

.. code-block:: bash

    sudo chmod 775 DynamixelWizard2Setup_x64
    ./DynamixelWizard2Setup_x64

3. インストールウィザードが開くので、任意のパスにインストールします。

=============================
Dynamixelの設定
=============================

1. 先程Dynamixel Wizardをインストールしたディレクトリでターミナルを開き、下記コマンドを実行します。

.. code-block:: bash

    ./DynamixelWizard2.sh

2. 上部2段目のバーからScanを選択し、Dynamixelとの接続を行います。
3.  ID:001のモータを左ツリーから選択します。
4. 右上のモータ名表示の下にあるプルダウンから制御モードを「Position」に設定し、その下の「Torque」のスイッチをONにする。
  **注意: サーボモータがONになります!** 

.. image:: ../images/dynamixel_pos_mode.jpg
    :width: 900px

5. 中央のアドレス一覧から「Address:116 Goal Position」を選択し、0°で初期位置、つまみでモータが回転できるか確認します。
  **注意: モータが動くので、一気に大きく値変化させないこと!**

.. image:: ../images/dynamixel_goal_pos.jpg
    :width: 900px

6. この際AKARIの上下方向の軸(Dynamixelの側面を両端に貫通している軸)が動いた場合は、先程の「Torque」のスイッチをOFFにし、中央のアドレス一覧から「Address:7」を選択し、IDを2に変更し、「Save」ボタンを押します。
　**注意: もう１個の軸がID2に割り振られている場合重複したID2に変更できないため、一旦ID3などの空きIDでsaveし、もう一方の軸のIDの変更後ID2に変更すること！**

7. 先程の「Torque」のスイッチをOFFにし、中央のアドレス一覧から「Address:8 Baud Rate」欄を選択し、1Mbpsを選択後、「Save」ボタンを押します。

.. image:: ../images/dynamixel_baudrate.jpg
    :width: 900px

8. ID:002のモータについても4-7を繰り返します。この際6.の手順でAKARIの左右方向の軸(Dynamixelの上面についている軸)が動いた場合は、IDを1に変更し、「Save」ボタンを押します。

| 最終的に左右方向がID:1、上下方向がID:2になっていればOKです。

| 以上でAKARIのソフト周りの環境設定は終了です。

:doc:`main` へ戻る

:doc:`setup_m5` へ戻る
