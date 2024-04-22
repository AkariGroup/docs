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

..  youtube:: OlwG40fLblM

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

akari_chatgpt_vision_bot
===========================================================

URL: https://github.com/AkariGroup/akari_chatgpt_vision_bot

..  youtube:: eHn9dKENpEM

| chatGPTを使った音声対話botに画像を組み合わせたアプリです。
| カメラ画像と音声を組み合わせてchatGPTから返答を得るGPT-4V版と、YOLOの3次元位置認識結果と音声を組み合わせてchatGPTから返答を得るYOLO版の2種類を公開しています。
| **注: AKARI本体にはマイク、スピーカーが内蔵されていないので、音声認識、音声合成の発話を試す際は外付けする必要があります。**

akari_chatgpt_indian_poker
===========================================================

URL: https://github.com/AkariGroup/akari_chatgpt_indian_poker

..  youtube:: 0CN5xbVBv1o

| chatGPTを使った音声対話botで、AKARIとインディアンポーカーができるアプリです。
| インディアンポーカーの醍醐味であるカード交換の駆け引きを、ChatGPT対話で実現しています。
| トランプはYOLOで認識しています。
| **注: AKARI本体にはマイク、スピーカーが内蔵されていないので、音声認識、音声合成の発話を試す際は外付けする必要があります。**

akari_chat_dify_bot
===========================================================

URL: https://github.com/AkariGroup/akari_chat_dify_bot

| akari_chatgpt_botのLLM部分をDify(https://dify.ai/)で作成したアプリに置き換えたものです。
| 独自にデザインしたDifyアプリを介して音声対話をすることができます。
| **注: AKARI本体にはマイク、スピーカーが内蔵されていないので、音声認識、音声合成の発話を試す際は外付けする必要があります。**

tracking_annotator
===========================================================

URL: https://github.com/AkariGroup/tracking_annotator.git

.. image:: https://raw.githubusercontent.com/AkariGroup/tracking_annotator/main/jpg/tracking_annotator.jpg
   :width: 600

| OAK-Dのtracking機能を使い、認識できなかったフレームを自動でYOLOアノテーションし、保存するアプリです。
| 作成した学習モデルを再学習して強化する用途に便利です。

akari_joy_controller
===========================================================

URL: https://github.com/AkariGroup/akari_joy_controller.git

| AKARIのヘッドをジョイスティックで動かすためのアプリです。

akari_tracking_palette
===========================================================

URL: https://github.com/AkariGroup/akari_tracking_palette.git

..  youtube:: Yt79S5aHO8Q

| AKARIで物体認識を使って、指定した位置に存在する物体の検知を行うサンプルです。
| 3次元物体トラッキングを用い、人や物の場所も認識することができます。
| 更に、俯瞰図上にマウスでエリアを描画することで、そのエリア内に人や物が存在するかを検出することができます。
| 任意の認識モデル、任意のエリアを簡単に設定してオリジナルの見守り、インタラクションアプリを簡単に作ることができます。

:doc:`main` へ戻る

:doc:`test_uvc_camera` へ戻る
