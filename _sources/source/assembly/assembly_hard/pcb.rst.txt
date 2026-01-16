***********************************************************
基板を作ろう
***********************************************************

| AKARIの回路基板は :doc:`part_list` のNo.1、テストユニットを作成する場合は :doc:`テストユニットの部品 <../assembly_test_unit/part_list>` のNo.T1の2種類です。
| これらはakari_hardwareのレポジトリでgerberデータが公開されています。

| (1) M5stack基板の公開先: https://github.com/AkariGroup/akari_hardware/tree/main/AKARI/electronics/pcb
| (T1) TEST UNIT基板の公開先: https://github.com/AkariGroup/akari_hardware/tree/main/AKARI/head_units/test_unit/pcb

| 例として、JLCPCB(https://jlcpcb.com/)での発注方法を説明します。
| JLCPCBは中国の基板製造会社で、海外サイトでの発注、製造、宅配となります。利用は自己責任でお願いします。
| 海外への発注が難しい場合は、他の基板製造会社の利用をご検討ください。

1.  https://jlcpcb.com/ サイト内の「Add gerber file」を選択します。

.. image:: ../../images/assembly/pcba/pcba01-01.PNG
    :width: 400px

2. ファイル選択ダイアログで、akari_hardwareリポジトリの `AKARI/electronics/pcb/AKARI_M5_board_gerber.zip` を選択します。

.. image:: ../../images/assembly/pcba/pcba01-02.PNG
    :width: 400px

3. インポートされたデータを確認し、各設定を行います。

| 図は設定の一例です。「PCB Qty」を必要な基板の個数、「PCB Color」を黒にしていますが、これらは任意です。

.. image:: ../../images/assembly/pcba/pcba01-03.PNG
    :width: 500px

4. 設定が問題なければ、「SAVE TO CART」を選択します。

.. image:: ../../images/assembly/pcba/pcba01-04.PNG
    :width: 400px

5. テスト基板も作成する場合は、同様に 1.から行います。

| アップロードするファイルは akari_hardwareリポジトリの `AKARI/head_units/test_unit/pcb/AKARI_Test_Head_Unit_gerber.zip` です。
| 下図は設定の一例で、こちらも「PCB Qty」を必要な基板の個数に変更、「PCB Color」を黒にしていますが、これらは任意です。

.. image:: ../../images/assembly/pcba/pcba01-05.PNG
    :width: 500px

6. アカウントがない場合、新規作成します。

.. image:: ../../images/assembly/pcba/pcba01-06.PNG
    :width: 200px

7. アカウント内のCARTを閲覧し、「Secure Checkout」を選択します。

.. image:: ../../images/assembly/pcba/pcba01-07.PNG
    :width: 400px

8. 以降、配送先住所や支払い先を入力することで、発注が完了します。

