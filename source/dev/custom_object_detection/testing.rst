***********************************************************
4. 物体認識をテストする
***********************************************************

最後に、学習させた物体認識を実行してみましょう。

.. note::

   AKARIのアプリは、poetryというpythonの仮想環境マネージャーを用いて実行する必要があります。

   akari_software直下へ移動し、 `poetry shell` を実行して仮想環境を立ち上げます。

      .. code-block:: bash

         $ cd akari_software
         $ poetry shell

===========================================================
物体認識の実行方法
===========================================================

1. akari_object_detection内の4_testingのディレクトリに移動します。

.. code-block:: bash

   cd akari_object_detection/4_testing

2. 下記を実行します。

.. code-block:: bash

   python3 main.py -m <モデルファイルへのパス> -c <ラベルファイルへのパス>

例) `my_detection.blob` をmodelの中に、 `my_detection.json` をjsonの中に保存してある場合

.. code-block:: bash

   python3 main.py -m model/my_detection.blob -c json/my_detection.json

3. カメラ出力のウインドウが立ち上がるので、学習させた物体を映してみて、正しく認識されるかをチェックします。

| 映像内の学習させた物体に枠がついて、正しいラベルが表示されたら成功です。

| 物体認識のデータセット作成から学習、動作までのチュートリアルは以上となります。
| うまく行かなかった場合は、データセットの画像の枚数やパターンを増やしてみるなど、色々試してみましょう。

:doc:`main` へ戻る

:doc:`training` へ戻る
