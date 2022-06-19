***********
M5stackのセットアップ
***********

次にM5stackへのソフト書き込みをしていきます。

=============================
必要なもの
=============================

* lattepanda alpha( :doc:`setup_akari_main`` 終了済みのもの)
* キーボード
* マウス
* M5stack basic
* microSDカード

=============================
microSDカードの準備
=============================
| M5stack用のmicroSDカードを準備します。
| microSDカードをlattepandaに挿入し、 `akari_main/setup/m5_sd` の中身を、microSDカードの直下に全てコピーします。
| microSDカードをlattepandaから抜き、M5stackに挿入します。

=============================
M5stackの接続
=============================
| M5stackをUSBケーブルでlattepandaと接続します。

=============================
arduino IDEの起動
=============================
| ターミナルを起動し、下記コマンドでarduino IDEを起動します。

.. code-block:: bash

    arduino

=============================
arduino IDEの設定
=============================

| arduino IDEの上部のバーから「ツール」を選び、「ボード」→「ESP32 Arduino」→「M5stack-core-ESP32」を選択します。
| 同様に「ツール」から、「シリアルポー卜」→「/dev/ttyACM1」を選択します。
| (ttyACM1ではなく、ttyACM2など別のポートで認識されている場合もあるので、ttyACM1がなければそちらを選択します。)

.. image:: ../../images/arduino_setup.jpg
    :width: 500px

=============================
ファイルを開く
=============================

| M5に書き込むファイルを選択します。
| arduino IDEの上部のバーから「ファイル」→「開く」を選択すると、エクスプローラが開きます。
| `akari_main/setup/arduino/src/m5base_for_akari/m5base_for_akari.ino` を開きます。


=============================
ファイルを書き込む
=============================

| arduino IDE上部2段目のバーから、マイコンボードに書き込むを選択します。
| `ボードへの書き込みが完了しました。` と表示され、M5Stackの画面にAKARIのロゴが表示されるようになったら成功です。
| ボードへの書き込みが失敗した場合は、別のシリアルポート(/dev/ttyACM2などがあれば)を試してみてください。

.. image:: ../../images/m5_write.jpg
    :width: 500px

| 次は、dynamixelサーボモータの設定を行います。

:doc:`setup_dynamixel` へ進む

:doc:`setup_akari_main` へ戻る

