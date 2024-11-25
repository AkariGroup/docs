***********************************************************
3. 学習を行う(GPU搭載のPC上で行う場合)
***********************************************************

次に、先程作成したアノテーション付き画像を学習させ、学習結果のモデルファイルを出力します。
こちらでは学習をLinux PC上で行う方法を説明します。
nvidia GPUが使えるLinux PCを所持している場合は、こちらの方法で学習させた方が学習時間が短く、安定しています。

===========================================================
推奨環境
===========================================================

- nvidia GPUが搭載されたPC(Ubuntu 22.04で動作確認済み。cudaをインストールしておくこと。)

===========================================================
事前準備
===========================================================

| 以下すべてPC上での作業となります。


1. PCのターミナル上で、akari_yolo_training_localのレポジトリをgitからcloneします。

.. code-block:: bash

   git clone https://github.com/AkariGroup/akari_yolo_training_local.git

2. :doc:`annotation` で準備した画像とアノテーションファイルが含まれるimagesディレクトリを、先程Cloneした `akari_yolo_training_local/images` 内にコピーします。

   | 下図のディレクトリ構成になっていることを確認してください。

.. image:: ../../images/custom_object_detection/train_directory_03.jpg
   :width: 800px

3. pythonがインストールされていない場合は、インストールします。

.. code-block:: bash

   sudo apt install python3.10 python3.10-venv

4. akari_yolo_training_localディレクトリに移動し、submoduleの更新、仮想環境の作成をします（初回のみ必要）。

.. code-block:: bash

   cd akari_yolo_training_local
   git submodule update --init
   python -m venv venv

5. 仮想環境を有効にします。

.. code-block:: bash

   . venv/bin/activate

6. 必要なライブラリをインストールします。

.. code-block:: bash

   pip install -r requirements.txt

7. データセットの画像、アノテーションファイルの8割を学習に、2割をバリデーション用に振り分けます。下記pythonを実行することで、自動で行われます。

.. code-block:: bash

   python3 divide_dataset.py

8. 学習用のパラメータファイルを作成します。下記pythonを実行することで、 `akari_train_data.yaml` が自動で作成されます。

.. code-block:: bash

   python3 make_train_data.py

9.  学習済みモデルの重みを取得します。

.. code-block:: bash

   wget https://github.com/WongKinYiu/yolov7/releases/download/v0.1/yolov7-tiny.pt -P data/

10.  学習用のコンフィグファイルを作成します。下記pythonを実行することで、 `akari_train_cfg.yaml` が自動で作成されます。

.. code-block:: bash

   python3 make_train_cfg.py

===========================================================
学習の実行
===========================================================

下記コマンドを実行すると、学習を開始します。
学習が終了するまで、しばらく待ちます。

.. code-block:: bash

   python3 yolov7/train.py --epochs 300 --workers 8 --device 0 --batch-size 16 --data data/akari_train_data.yaml --img 640 640 --cfg data/akari_train_cfg.yaml --weights data/yolov7-tiny.pt --hyp yolov7/data/hyp.scratch.tiny.yaml --name result --exist-ok

.. note::

   もし `undefined symbol: __nvJitLinkAddData_12_1, version libnvJitLink.so.12` というエラーが出た場合は、自身のvenv内のnvidiaライブラリにLD_LIBRARY_PATHを通す必要があります。

   .. code-block:: bash

      export LD_LIBRARY_PATH=~/"akari_yolo_training_localのパス"/venv/lib64/python3.10/site-packages/nvidia/nvjitlink/lib:$LD_LIBRARY_PATH


===========================================================
テストの実行
===========================================================

| 学習が終了すると、akari_yolo_training_localディレクトリ直下にrunsディレクトリが作成され、 `runs/train/result` 内に学習モデル(.pt)が保存されます。
| `best.pt` が学習スコアが最も良かったファイルとなるので、こちらのファイルでテストを実施してみます。
| 下記コマンドを実行すると、学習したモデルを用いてテストを開始します。

.. code-block:: bash

   python3 yolov7/test.py --data data/akari_train_data.yaml --iou-thres 0.65 --device 0 --weights runs/train/result/weights/best.pt --task test --name result --exist-ok

| テスト結果は、 `akari_yolo_training_local/runs/test/result` に保存されます。
| テスト画像に対する推論結果が画像として保存されているので、期待通り検出されているかを確認してください。


===========================================================
学習モデルの完成
===========================================================

| テスト結果が問題なければ、 `akari_yolo_training_local/runs/train/result/best.pt` を次のモデル変換で使います。


|
:doc:`convert_model` へ進む

:doc:`annotation` へ戻る
