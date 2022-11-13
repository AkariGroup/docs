***********************************************************
4. 物体認識を実行する
***********************************************************


最後に、学習させた物体認識を実行してみましょう。

===========================================================
物体認識の実行方法
===========================================================

1. akari_main内のdepthai_sampleのディレクトリに移動します。

.. code-block:: bash

   cd akari_main/src/depthai_sample/object_recognition

2. 下記を実行します。

.. code-block:: bash

   python3 mobilenet.py -n PATH_TO_MODEL -c PATH_TO_CONFIG

例) `my_detection.blob` をmodelsの中に、`my_detection.json` をconfigsの中に保存してある場合

.. code-block:: bash

   python3 mobilenet.py -n models/my_detection.blob -c configs/my_detection.json

3. カメラ出力のウインドウが立ち上がるので、学習させた物体を映し、正しく認識されるかをチェックします。

| 物体認識のデータセット作成から学習、動作までのチュートリアルは以上となります。
| うまく行かなかった場合は、データセットの画像の枚数やパターンを増やしてみるなど、色々試してみましょう。

:doc:`main` へ戻る

:doc:`training` へ戻る
