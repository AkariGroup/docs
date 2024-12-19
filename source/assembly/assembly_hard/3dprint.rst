***********************************************************
3Dプリント部品を作ろう
***********************************************************

| AKARIの3Dプリント部品は :doc:`part_list` のNo.2~No.6の5種類です。
| これらはakari_hardwareのレポジトリでSTLファイルが公開されています。

| 公開先: https://github.com/AkariGroup/akari_hardware/tree/main/AKARI/3d_models/

| このSTLファイルを使用して、3Dプリント部品を作成する方法を紹介します。

===========================================================
3Dプリンタで造形する場合
===========================================================

| ここでは例として、FLASHFORGE社製3Dプリンタでの造形方法を説明します。
| 手元に3Dプリンタがない場合は、下記の製造業者に発注する方法を検討ください。

1.  FLASHFORGEのスライサーソフト「FlashPrint」を起動し、ロードを選択します。

.. image:: ../../images/assembly/3dprint/3dprint01-01.PNG
    :width: 400px

2. ファイル選択ダイアログで、akari_hardwareリポジトリにある、造形したいSTLファイルを選択します。

.. image:: ../../images/assembly/3dprint/3dprint01-02.PNG
    :width: 400px

3.  表示されたモデルを移動・回転させ、枠内に収まるようにします。

.. image:: ../../images/assembly/3dprint/3dprint01-03.PNG
    :width: 400px

4. サポート材-自動サポートを選択し、サポート材を設定します。

.. image:: ../../images/assembly/3dprint/3dprint01-04.PNG
    :width: 400px

5. スライスを選択し、3Dプリンタに合わせた細かな設定を行います。

.. image:: ../../images/assembly/3dprint/3dprint01-05.PNG
    :width: 400px

6. その後、gxファイルが出力され、3Dプリンタで造形可能です。

===========================================================
製造業者に外注する場合
===========================================================

| 手元に3Dプリンタがない場合は、製造会社に発注することでも製造が可能です。
| 例として、 JLCPCB(https://jlcpcb.com/)での発注方法を説明します。
| JLCPCBは中国の製造会社で、海外サイトでの発注、製造、宅配となります。利用は自己責任でお願いします。
| 海外への発注が難しい場合は、他の製造会社の利用をご検討ください。

1.  https://jlcpcb.com/ サイト内の「3D Printing」を選択します。

.. image:: ../../images/assembly/3dprint/3dorder01-01.png
    :width: 400px

2. 「Add 3D Files」を選択し、ファイル選択ダイアログで、造形したいSTLファイルを選択します。

| akari_hardwareリポジトリの3d_modelsディレクトリにある5つのSTLファイルがAKARIの組み立てに必要な部品となります。

.. image:: ../../images/assembly/3dprint/3dorder01-02.png
    :width: 400px

.. image:: ../../images/assembly/3dprint/3dorder01-03.png
    :width: 400px

3. 各モデルが読み込まれるので造形方法や素材、数量などを設定します。

| 参考までに、各部品の造形情報の一例を掲載しておきます。
| あくまで一度造形に成功した例になりますので、この設定による確実な造形成功を保証するものではありません。ご了承ください。

・AKARI_Head

.. image:: ../../images/assembly/3dprint/3dorder01-04.png
    :width: 400px

・AKARI_Body

.. image:: ../../images/assembly/3dprint/3dorder01-05.png
    :width: 400px


・AKARI_Cover

.. image:: ../../images/assembly/3dprint/3dorder01-06.png
    :width: 400px

・AKARI_Base

.. image:: ../../images/assembly/3dprint/3dorder01-07.png
    :width: 400px

・AKARI_Plate

.. image:: ../../images/assembly/3dprint/3dorder01-08.png
    :width: 400px

4. 設定が終わったら「SAVE TO CART」を選択します。アカウントがない場合新規作成し、注文を進めます。

| 注文を進める過程で、3Dモデルのレビューが必要になります。
| レビュー完了までは時間がかかるので、完了まで待ちます。
| またレビュー結果次第では割れ等のリスクの承認が必要となりますので、確認の上各自ご判断ください。
| 図は肉厚の薄い箇所に対する割れの警告です。yesを選ぶことでリスクを許容したことになります。

.. image:: ../../images/assembly/3dprint/3dorder01-09.png
    :width: 400px

5. レビューが完了したら支払い可能になるので、支払いして発注完了となります。
