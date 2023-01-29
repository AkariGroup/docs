***********************************************************
M5が起動しない時は
***********************************************************

AKARI本体起動時に、M5Stackが起動しない場合の対処法を書きます。


===========================================================
M5の画面が最初から真っ暗のままの場合
===========================================================

AKARIの電源投入直後から、M5の画面が真っ暗の場合(Waiting...)画面が表示されない場合は、下記を確認してください。

1. M5Stackに差し込まれているSDカードの中に、"akari_software/setup/m5_sd"の中身が正しくコピーされているか確認する。

| M5のSDカードをPCに挿して、jpg/waiting.jpgが画像として正しく開けるか確認してください。
| 開けなかった場合は、上記ディレクトリをM5のSDにコピーし直してください。
| akari_software/setup/m5_sd/jpg/waiting.jpgも画像として正しく開けなかった場合は、git lfs pullをし忘れている可能性があります。
| 下記を実行してから、再度M5のSDにコピーし直してください。

.. code-block:: bash

   cd ~/akari_software
   git lfs pull
   git lfs checkout

2. M5のソフトの書き込みを再度試してみてください。セットアップ手順にて書き込みが行われているはずですが、下記の手順で再トライしてみてください。

.. code-block:: bash

   cd ~/akari_software/setup/arduino
   platformio run --target=upload

===========================================================
M5の画面がwaitingから進まない場合
===========================================================

電源投入時にwaitingの画面が表示されるものの、AKARI本体の起動が完了してもその画面から進まない(AKARIのロゴが表示されない場合)は、下記を実行してください。

1. akari_rpc_serverが起動しているか確認する。

| AKARIのwebコンソールのServicesのページに移動し、AkariRpcServerのサービスがRUNNNINGになっているか確認します。
| もしRUNNINGになっていない場合は、実行ボタンを押してRUNNINGになるまで待ち、M5の画面にロゴが表示されるか確認します。
| AutoStartのスイッチがOFFになっている場合は、次回以降の起動用にONにすることを推奨します。

2. M5に書かれているソフトのバージョンを確認する。

| M5のソフトのバージョンが最新のバージョンでなく、起動に失敗している可能性があります。
| まず、下記でakari_softwareの最新の更新を取得します。

.. code-block:: bash

   cd ~/akari_software
   git pull

| 次にM5のWaiting画面に表示されているバージョン表記が、最新の `akari_software/setup/arduino/src/m5base_for_akari.ino` に記載されているバージョンと一致しているか確認します。
| githubの最新のファイル(https://github.com/AkariGroup/akari_software/blob/main/setup/arduino/src/m5base_for_akari.ino#L18)からも確認できます。
| M5のWaiting画面に表示されているバージョンが古い場合は、下記コマンドでM5のソフトを再度書き込みます。

.. code-block:: bash

   cd ~/akari_software/setup/arduino
   platformio run --target=upload

再起動したM5のバージョンが最新のものと一致することを確認します。

3. 2.まででM5の画面が変化しない場合は、M5Stackに差し込まれているSDカードの中に、 `akari_software/setup/m5_sd` の中身が正しくコピーされているか確認する。

| M5のSDカードをPCに挿して、jpg/boot内の各画像として正しく開けるか確認してください。
| 開けなかった場合は、上記ディレクトリをM5のSDにコピーし直してください。
| akari_software/setup/m5_sd/jpg/boot/内の各画像が正しく開けなかった場合は、git lfs pullをし忘れている可能性があります。
| 下記を実行してから、再度M5のSDにコピーし直してください。

.. code-block:: bash

   cd ~/akari_software
   git lfs pull
   git lfs checkout
