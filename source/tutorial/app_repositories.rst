***********************************************************
その他のアプリも使ってみよう
***********************************************************

ここまで紹介した以外にも、様々なアプリが公開されています。
興味があるアプリがあれば、git cloneして使ってみましょう。
使い方は、各URL先のREADMEを参照ください。

akari_hand_tracking
===========================================================

URL: https://github.com/AkariGroup/akari_hand_tracking

..  youtube:: jrmozEp-8qc

| AKARIが認識した手の追従が出来るアプリです。
| 引数で手のポーズを指定すると、そのポーズをしている時のみ追従することができます。

akari_dataset_creator
===========================================================

URL: https://github.com/AkariGroup/akari_dataset_creator

| AKARIで学習用のデータセットを作成するアプリです。
| 画像を特定の名前や連番で撮影する機能があり、手動シャッター、自動撮影を行うことができます。
| 詳しい使い方は :doc:`../dev/custom_object_detection/image_collection` を参照ください。

akari_yolo_inference
===========================================================

URL: https://github.com/AkariGroup/akari_yolo_inference

| AKARIでYOLOの推論を行うアプリです。
| デフォルトではYOLOv4の認識を行う設定になっていますが、自身で学習させたYOLOの推論モデルを使うこともできます。
| 詳しい使い方は :doc:`../dev/custom_object_detection/testing` を参照ください。

akari_motion_server
===========================================================

URL: https://github.com/AkariGroup/akari_motion_server.git

..  youtube:: qHvSr6PvjPQ

| AKARIヘッドを動かして感情表現をするモーションサーバアプリです。
| grpcでモーション名を送ると、そのモーションを再生します。
| 割り込み再生や優先度による割り込みブロックにも対応しています。

akari_chatgpt_bot
===========================================================

URL: https://github.com/AkariGroup/akari_chatgpt_bot.git

..  youtube:: 1lY4J1G9-K8

| AKARIでchatGPTを使った音声対話botを使用するサンプルです。
| 音声認識、文章生成、音声合成を組み合わせて、高速で応答するチャットボットを作成しています。
| それぞれの要素に対するサンプルアプリも用意されているため、各機能を個別で試したり、自身のアプリに実装する用途でも使えます。
| **注: AKARI本体にはマイク、スピーカーが内蔵されていないので、音声認識、音声合成の発話を試す際は外付けする必要があります。**

tracking_annotator
===========================================================

URL: https://github.com/AkariGroup/tracking_annotator.git

.. image:: https://raw.githubusercontent.com/AkariGroup/tracking_annotator/main/jpg/tracking_annotator.jpg
   :width: 600

| OAK-Dのtracking機能を使い、認識できなかったフレームを自動でYOLOアノテーションし、保存するアプリです。
| 作成した学習モデルを再学習して強化する用途に便利です。


:doc:`main` へ戻る

:doc:`test_uvc_camera` へ戻る
