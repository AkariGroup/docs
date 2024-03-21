***********************************************************
4. 物体認識をテストする
***********************************************************
最後に、学習させた物体認識を実行してみましょう。
物体認識のテストには、 **AKARI内でpythonアプリを実行する方法** と **web console上のJupyter Notebookを実行する方法** があります。


===========================================================
AKARI内のpythonでテストする
===========================================================

-----------------------------------------------------------
akari_yolo_inferenceのClone
-----------------------------------------------------------

| akari_yolo_inferenceをgitからcloneします。
| **webコンソール上からはcloneせず、Ubuntu上でのcloneを実施してください！**

.. code-block:: bash

   git clone https://github.com/AkariGroup/akari_yolo_inference.git


-----------------------------------------------------------
(初回のみ) venvのセットアップ
-----------------------------------------------------------

| 仮想実行環境をセットアップします。

.. code-block:: bash

   cd akari_yolo_inference
   python -m venv venv
   source venv/bin/activate
   pip install -r requirements.txt

-----------------------------------------------------------
(初回のみ) submoduleの更新
-----------------------------------------------------------

| submoduleを更新します。

.. code-block:: bash

   git submodule update --init --recursive

-----------------------------------------------------------
物体認識モデルの移動
-----------------------------------------------------------

:doc:`./convert_model` でダウンロードしたzipファイルを展開し、中のOAK-Dの認識モデル(.blob)とラベル(.json)をそれぞれ下記ディレクトリ内に移動します。

| モデル(.blob): `akari_yolo_inference/model/`
| ラベル(.json): `akari_yolo_inference/json/`

-----------------------------------------------------------
物体認識の実行
-----------------------------------------------------------

1. akari_yolo_inference内に移動します。

.. code-block:: bash

   cd akari_yolo_inference

2. venvを有効化していなければ下記を実行します。

.. code-block:: bash

   source venv/bin/activate

3. 下記を実行します。

.. code-block:: bash

   python3 yolo.py -m <モデルファイルへのパス> -c <ラベルファイルへのパス>

例) `my_detection.blob` をmodelの中に、 `my_detection.json` をjsonの中に保存してある場合

.. code-block:: bash

   python3 yolo.py -m model/my_detection.blob -c json/my_detection.json

4. カメラ出力のウインドウが立ち上がるので、学習させた物体を映してみて、正しく認識されるかをチェックします。

| 映像内の学習させた物体に枠がついて、正しいラベルが表示されたら成功です。

.. note::

   | `-f` オプションの後に数値を入れることで、入力のrgbのfpsを変更することができます。(デフォルトは10FPSです。)
   | 例) 20FPSで実行する場合

      .. code-block:: bash

            python3 yolo.py -f 20

   | ただし、OAK-Dの特性上、推論のFPSより入力のFPSを大きくすると、遅延が大きくなる、ソフトが落ちるといった問題が発生することがあります。
   | 実行中の映像に表示されるNN FPSの値が推論のFPSなので、モデルに応じてこれより小さい値を入れることを推奨します。


-----------------------------------------------------------
空間物体認識の実行
-----------------------------------------------------------

同様に、空間内の3次元位置が推定可能な物体認識も使うことが出来ます。

..  youtube:: 4lPpDrTqanQ

1. akari_yolo_inference内に移動します。

.. code-block:: bash

   cd akari_yolo_inference

2. venvを有効化していなければ下記を実行します。

.. code-block:: bash

   source venv/bin/activate

3. 下記を実行します。

.. code-block:: bash

   python3 spatial_yolo.py -m <モデルファイルへのパス> -c <ラベルファイルへのパス>

例) `my_detection.blob` をmodelの中に、 `my_detection.json` をjsonの中に保存してある場合

.. code-block:: bash

   python3 spatial_yolo.py -m model/my_detection.blob -c json/my_detection.json

4. カメラ出力のウインドウと、3次元位置の俯瞰マップが描画されます。学習させた物体を映すと、物体ラベルと3次元位置が表示され、俯瞰マップ上にも物体位置を表す点が表示されます。

.. note::

   | こちらも `-f` オプションの後に数値を入れることで、入力のRGBとdepthのfpsを変更することができます。(デフォルトは10FPSです。)
   | 注意点も上記の `yolo.py` の場合と同様です。
   | また、 `-d` オプションをつけることで、推論に入力しているRGB、depthの映像も画面に表示することができます。
   | こちらは引数は必要なく、 `-d` をつけるのみで有効になります。
   | RGBは正方形にしてから認識に入力しているため、上下に黒枠が追加された形で出力されます。
   | `-r` オプションをつけることで、3次元位置をカメラからの位置でなく、ロボットからの位置に変更できます。
   | AKARI本体のヘッドの向きを取得して、座標変換を行っています。
   | こちらは引数は必要なく、 `-r` をつけるのみで有効になります。

-----------------------------------------------------------
トラッキング物体認識の実行
-----------------------------------------------------------

同様に、空間内の3次元位置推定に基づいて、検出した物体のトラッキングを行うアプリもあります。

..  youtube:: OlwG40fLblM

1. akari_yolo_inference内に移動します。

.. code-block:: bash

   cd akari_yolo_inference

2. venvを有効化していなければ下記を実行します。

.. code-block:: bash

   source venv/bin/activate

3. 下記を実行します。

.. code-block:: bash

   python3 tracking_yolo.py -m <モデルファイルへのパス> -c <ラベルファイルへのパス>

例) `my_detection.blob` をmodelの中に、 `my_detection.json` をjsonの中に保存してある場合

.. code-block:: bash

   python3 tracking_yolo.py -m model/my_detection.blob -c json/my_detection.json

4. カメラ出力のウインドウと、3次元位置の俯瞰マップが描画されます。学習させた物体を映すと、物体ラベルと3次元位置が表示され、俯瞰マップ上にも物体位置を表す点が表示されます。

.. note::

   | こちらも `-f` オプションの後に数値を入れることで、入力のRGBとdepthのfpsを変更することができます。(デフォルトは10FPSです。)
   | 注意点も上記の `yolo.py` の場合と同様です。
   | また、 `-d` オプションをつけることで、推論に入力しているRGB、depthの映像も画面に表示することができます。
   | こちらは引数は必要なく、 `-d` をつけるのみで有効になります。
   | RGBは正方形にしてから認識に入力しているため、上下に黒枠が追加された形で出力されます。
   | `-r` オプションをつけることで、3次元位置をカメラからの位置でなく、ロボットからの位置に変更できます。
   | AKARI本体のヘッドの向きを取得して、座標変換を行っています。
   | こちらは引数は必要なく、 `-r` をつけるのみで有効になります。

.. note::

   | `--spatial_frame` オプションをつけることで、俯瞰マップの代わりに3次元空間へのプロット図を描画することができます。
   | ただし描画が重く、認識、画像描画の速度が低下しますのでご注意ください。
   | こちらは引数は必要なく、 `--spatial_frame` をつけるのみで有効になります。

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

3. 開いたら、ページ左のFile Browserを開き、 `model` というディレクトリを開きます。File Browser上部の「Upload Files」ボタンを押し、先程展開したzipファイル内のOAK-Dの認識モデル(.blob)をアップロードします。

4. 3.と同様に、File Browseから、 `json` というディレクトリを開き、「Upload Files」から、先程展開したzipファイル内のOAK-Dのラベルファイル(.json)をアップロードします。

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

:doc:`test_models` へ進む

:doc:`training` へ戻る
