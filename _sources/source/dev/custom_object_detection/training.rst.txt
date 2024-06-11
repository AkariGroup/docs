***********************************************************
3. 学習を行う(Google Colab上で行う場合)
***********************************************************

次に、先程作成したアノテーション付き画像を学習させ、学習結果のモデルファイルを出力します。
学習はGoogle Colab上で行います。

===========================================================
Google Colabについて
===========================================================

| Google Colab は、ブラウザから Python を実行できるサービスです。Googleのサーバ上で動作するもので、Googleアカウントがあれば基本無料で使えます。
| 特徴はGPU環境が用意されていることで、これによって自分で環境を用意しなくても、高速な学習を行うことができます。

===========================================================
akari_yolo_trainingのClone
===========================================================

| akari_yolo_trainingをgitからcloneします。
| **webコンソール上からはcloneせず、Ubuntu上でのcloneを実施してください！**

.. code-block:: bash

   git clone https://github.com/AkariGroup/akari_yolo_training.git

===========================================================
学習前の準備
===========================================================

| Google Colabでの学習をするためには、:doc:`annotation` で作成した画像とアノテーションファイルをGoogleドライブに保存する必要があります。
| 下記の手順に沿って実行してください。

1. Googleドライブをブラウザから開きます。
2. Googleドライブ上でマイドライブを右クリックし、「新しいフォルダ」を選択し `object_detection` というフォルダを作ります。
3. `object_detection` の中に `images` というフォルダを作ります。
4. `images` の中に `train` というフォルダと `test` というフォルダを作ります。
5. `train` フォルダの中に、:doc:`annotation` で準備した画像ファイル(.jpg)とアノテーションファイル(.txt)、識別する物体のクラス情報が入った `class.txt` を全部入れます。画像もアノテーションファイルもラベルごとにフォルダ分けせず、train直下にまとめて置きます。
6. `test` フォルダの中に、テスト用の画像を数枚入れます。こちらはアノテーションファイルは必要ありません。学習結果の確認のための最終テストをするのに用います。

.. image:: ../../images/custom_object_detection/train_directory_02.jpg
   :width: 800px

| 以上でGoogleドライブの準備は完了です。

===========================================================
Google Colabで学習をする
===========================================================

| 下記リンクからGoogle Colabにアクセスします。

   .. raw:: html

      <b>学習用Notebook→</b> <a href="https://colab.research.google.com/github/AkariGroup/akari_yolo_training/blob/main/yolov7_training_akari.ipynb" target="_blank"><img alt="Open In Colab" src="https://colab.research.google.com/assets/colab-badge.svg"/></a></h2>

| 学習は上の `Open in colab` のリンク先からGoogle Colabを開いて行います。
| 後は順番にコードを実行していくことで、学習済みのpytorchモデル(.pt)をダウンロードすることができます。

.. image:: ../../images/custom_object_detection/colab_play.jpg
   :width: 800px

| 手順はリンク先のGoogle Colab内に書かれているので、それに沿ってください。
| 次は、このpytorchモデルをOAK-Dで使えるモデルファイルへ変換します。

:doc:`convert_model` へ進む

:doc:`annotation` へ戻る
