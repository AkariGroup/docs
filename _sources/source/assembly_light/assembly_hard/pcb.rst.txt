***********************************************************
基板を作ろう(AKARI Light)
***********************************************************

| AKARI Lightの回路基板は :doc:`part_list` のNo.1です。

| akari_hardwareのレポジトリで必要なデータが公開されています。
| (1) M5stack基板(Light用)の公開先: https://github.com/AkariGroup/akari_hardware/tree/main/AKARI_Light/electronics/pcb

| 例として、JLCPCB(https://jlcpcb.com/)での発注方法を説明します。
| JLCPCBは中国の基板製造会社で、海外サイトでの発注、製造、宅配となります。利用は自己責任でお願いします。
| 海外への発注が難しい場合は、他の基板製造会社の利用をご検討ください。

| また、表面実装の部品2-6は実装済みの状態で発注することができます。
| ここでは、No.2-6の部品を実装済みの状態で発注する方法を説明します。

1. https://jlcpcb.com/ サイト内の「PCB Assembly」の「Quote Now」を選択します。

.. image:: ../../images/assembly_light/pcba/pcba01-01.jpg
    :width: 500px

2.  https://jlcpcb.com/ サイト内の「Add gerber file」を選択します。

.. image:: ../../images/assembly_light/pcba/pcba01-02.jpg
    :width: 500px

2. ファイル選択ダイアログで、akari_hardwareリポジトリの `AKARI_Light/electronics/pcb/AKARI_Light_board_gerber.zip` を選択します。

.. image:: ../../images/assembly_light/pcba/pcba01-03.jpg
    :width: 500px

3. インポートされたデータを確認し、各設定を行います。

| 図は設定の一例です。「PCB Qty」を必要な基板の個数、「PCB Color」を黒にしていますが、これらは任意です。

.. image:: ../../images/assembly_light/pcba/pcba01-04.jpg
    :width: 500px

4. PCB Assemblyを有効化します。

.. image:: ../../images/assembly_light/pcba/pcba01-05.jpg
    :width: 500px

5. 各設定を行います。

| PCBA TypeはEconomic、Assembly sideはTOP Sideを選択します。

.. image:: ../../images/assembly_light/pcba/pcba01-06.jpg
    :width: 500px

6. 設定が問題なければ、「Confirm」を選択します。

.. image:: ../../images/assembly_light/pcba/pcba01-07.jpg
    :width: 500px

7. NEXTを選択します。

.. image:: ../../images/assembly_light/pcba/pcba01-08.jpg
    :width: 500px

8. 「Add BOM File」を選択し、akari_hardwareリポジトリの `AKARI_Light/electronics/pcb/AKARI_Light_board_bom_JLCSMT.xlsx` を選択します。

.. image:: ../../images/assembly_light/pcba/pcba01-09.jpg
    :width: 600px

.. image:: ../../images/assembly_light/pcba/pcba01-10.jpg
    :width: 600px


9. 「Add CPL File」を選択し、akari_hardwareリポジトリの `AKARI_Light/electronics/pcb/AKARI_Light_board_top_cpl.csv` を選択します。

.. image:: ../../images/assembly_light/pcba/pcba01-11.jpg
    :width: 600px

.. image:: ../../images/assembly_light/pcba/pcba01-12.jpg
    :width: 600px

10. 「Process BOM & CPL」を選択します。

.. image:: ../../images/assembly_light/pcba/pcba01-13.jpg
    :width: 500px

11. 部品一覧を確認し、問題なければ「NEXT」を選択します。

.. image:: ../../images/assembly_light/pcba/pcba01-14.jpg
    :width: 500px

12. 部品のマウント位置を確認し、問題なければ「NEXT」を選択します。

.. image:: ../../images/assembly_light/pcba/pcba01-15.jpg
    :width: 500px

13. 「Product Description」を一つ選択してから、「SAVE TO CART」を選択します。

| 「Product Description」はどれでも問題ないと思いますが、今回は「Reserch\Education\DIY\Entertainment」→「Robot - HS Code 847990」を選択しています。

.. image:: ../../images/assembly_light/pcba/pcba01-16.jpg
    :width: 500px

14. アカウント内のCARTを閲覧し、「Secure Checkout」を選択します。

.. image:: ../../images/assembly_light/pcba/pcba01-17.jpg
    :width: 500px

15. 以降、配送先住所や支払い先を入力することで、発注が完了します。

