***********************************************************
4. 物体認識をテストする
***********************************************************
最後に、学習させた物体認識を実行してみましょう。
物体認識のテストには、 **AKARI内でpythonアプリを実行する方法** と **web console上のJupyter Notebookを実行する方法** があります。


===========================================================
AKARI内のpythonでテストする
===========================================================

.. note::

   AKARIのアプリは、poetryというpythonの仮想環境マネージャーを用いて実行する必要があります。

   akari_software直下へ移動し、 `poetry shell` を実行して仮想環境を立ち上げます。

      .. code-block:: bash

         $ cd akari_software
         $ poetry shell

-----------------------------------------------------------
akari_yolo_inferenceのClone
-----------------------------------------------------------

| akari_yolo_inferenceをgitからcloneします。
| **webコンソール上からはcloneせず、Ubuntu上でのcloneを実施してください！**

.. code-block:: bash

   git clone https://github.com/AkariGroup/akari_yolo_inference.git

-----------------------------------------------------------
物体認識モデルの移動
-----------------------------------------------------------

:doc:`./convert_model.rst` でダウンロードしたzipファイルを展開し、中のOAK-Dの認識モデル(.blob)とラベル(.json)をそれぞれ下記ディレクトリ内に移動します。

| モデル(.blob): `akari_yolo_inference/model/`
| ラベル(.json): `akari_yolo_inference/json/`

-----------------------------------------------------------
物体認識の実行
-----------------------------------------------------------

1. akari_yolo_inference内に移動します。

.. code-block:: bash

   cd akari_yolo_inference

2. 下記を実行します。

.. code-block:: bash

   python3 main.py -m <モデルファイルへのパス> -c <ラベルファイルへのパス>

例) `my_detection.blob` をmodelの中に、 `my_detection.json` をjsonの中に保存してある場合

.. code-block:: bash

   python3 main.py -m model/my_detection.blob -c json/my_detection.json

3. カメラ出力のウインドウが立ち上がるので、学習させた物体を映してみて、正しく認識されるかをチェックします。

| 映像内の学習させた物体に枠がついて、正しいラベルが表示されたら成功です。


===========================================================
webコンソール上でテストする
===========================================================

-----------------------------------------------------------
akari_yolo_inference_jupyterのClone
-----------------------------------------------------------

| :doc:`../../tutorial_web/tutorial_project` の解説を参考に、webコンソール上で `akari_yolo_inference_jupyter` をcloneします。
| アドレスは下記です。

https://github.com/AkariGroup/akari_yolo_inference_jupyter.git

-----------------------------------------------------------
物体認識モデルのアップロード
-----------------------------------------------------------

1. :doc:`./convert_model` でダウンロードしたzipファイルを展開しておきます。

2. :doc:`../../tutorial_web/tutorial_project` を参考に、先程cloneした`akari_yolo_inference_jupyter`をJupyter Lab上で開きます。

3. 開いたら、ページ左のFile Browserを開き、`model`というディレクトリを開きます。File Browser上部の「Upload Files」ボタンを押し、先程展開したzipファイル内のOAK-Dの認識モデル(.blob)をアップロードします。

4. 3.と同様に、File Browseから、`json`というディレクトリを開き、「Upload Files」から、先程展開したzipファイル内のOAK-Dのラベルファイル(.json)をアップロードします。

-----------------------------------------------------------
物体認識の実行
-----------------------------------------------------------

1. `akari_yolo_inference_jupyter` の親ディレクトリに戻って `main.ipynb` をクリックして表示します。

2. main.ipynb内のコードの17行目の `MODEL_PATH` を先程アップロードした認識モデルのパス、18行目の `CONFIG_PATH` をアップロードしたラベルファイルのパスに書き換えます。

例) `my_detection.blob` をmodelの中に、 `my_detection.json` をjsonの中に保存してある場合

.. code-block:: python

   # ここのパスにmodel(.blob),config(.json)のパスを記載
   MODEL_PATH = 'model/my_detection.blob'
   CONFIG_PATH = 'json/my_detection.json'

3. コードを実行します。Notebook上にカメラ出力のウインドウが表示されるので、学習させた物体を映してみて、正しく認識されるかをチェックします。映像内の学習させた物体に枠がついて、正しいラベルが表示されたら成功です。


| 物体認識のデータセット作成から学習、動作までのチュートリアルは以上となります。
| うまく行かなかった場合は、データセットの画像の枚数やパターンを増やしてみるなど、色々試してみましょう。

:doc:`main` へ戻る

:doc:`training` へ戻る
