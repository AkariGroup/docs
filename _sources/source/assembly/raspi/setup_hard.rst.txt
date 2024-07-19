***********************************************************
(Raspberry Pi版) ハードウェアの準備
***********************************************************

Raspberry Piで使う場合のハードウェアの準備方法を記載します。


===========================================================
動作確認済み端末
===========================================================

| 動作確認済みのRaspberry Piは下記の通りです。

- Raspberry Pi 4 Model B / 8GB (`スイッチサイエンス <https://www.switch-science.com/collections/raspberry-pi/products/6370>`__ )
- Raspberry Pi 5 Model B / 8GB (`スイッチサイエンス <https://www.switch-science.com/collections/raspberry-pi/products/9250>`__ )

また、Raspberry Piの使用に下記が必要です。

- microSDカード(容量64GB以上、クラスU1以上のもの)
- USB-C電源アダプタ(5V 3A以上のもの)

===========================================================
ハードの変化点
===========================================================

| AKARIをRaspberry Piで使う場合は、ベース部の組み立ては不要です。
| ベース部を使わない代わりに、ボディー部から出る2本のUSB(OAK-D Lite、USBハブ)をRaspberry Pi4のUSB3.0ポートに接続することで使用可能です。
| **電源はボディー部のDCジャックと、Raspberry PiのPWR IN端子(USB-C)の両方にそれぞれ入力する必要があります。**
| 下図が接続の例です。

.. image:: ../../images/raspi/raspi_connection.jpg
    :width: 600px


| ベース部が不要となることで、下記の部品は準備不要となります。

|  (5) AKARI Base
|  (6) AKARI Plate
|  (7) Lattepanda Alpha
|  (34) DCケーブル 20cm

| 下記の部品は必要数が減ります。

|  (20) コネクタ付コード4P PH(赤黒黄緑) (-1個)
|  (21) 2.1mm標準DCジャック パネル取付用 (-1個)
|  (36) ボルトM3-6 (-4個)

| これ以外の点に関しましては、:doc:`../assembly_hard/main` を参考に、:doc:`../assembly_hard/assembly_body` まで同様の手順で進めていただければ問題ないです。

:doc:`setup_soft` へ進む

:doc:`main` へ戻る
