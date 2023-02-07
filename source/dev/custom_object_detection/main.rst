###########################################################
オリジナルの物体認識を作ってみよう
###########################################################

| 本章は、AKARIで簡単にオリジナルのデータセットで物体認識を行うためのチュートリアルです。
| 学習用の画像収集からアノテーション、学習を行い、その学習結果を使って物体認識を動かしていきます。

| 本チュートリアルで使うレポジトリは下記です(各チュートリアル内でCloneします)。

| - akari_dataset_creator
|   https://github.com/AkariGroup/akari_dataset_creator
| - akari_yolo_training
|   https://github.com/AkariGroup/akari_yolo_training
| - akari_yolo_inference
|   https://github.com/AkariGroup/akari_yolo_inference

.. toctree::
   :maxdepth: 2

   preparation
   image_collection
   annotation
   training
   convert_model
   testing