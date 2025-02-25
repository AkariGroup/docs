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

akari_rag_chatbot
===========================================================

URL: https://github.com/AkariGroup/akari_rag_chatbot

| akari_chatgpt_botのLLM部分をWeaviateを用いたRAGを参照し、回答するLLMに置き換えたアプリです。
| 独自に用意したテキストの知識を参照しながら音声対話をすることができます。
| **注: AKARI本体にはマイク、スピーカーが内蔵されていないので、音声認識、音声合成の発話を試す際は外付けする必要があります。**

akari_introducer
===========================================================

URL: https://github.com/AkariGroup/akari_introducer

..  youtube:: 7YoJtFZIltM

| akari_rag_chatbotのRAGにAKARIマニュアルの内容を追加し、AKARIに質問すると、マニュアルのページを表示しながら回答してくれるアプリです。
| **注: AKARI本体にはマイク、スピーカーが内蔵されていないので、音声認識、音声合成の発話を試す際は外付けする必要があります。**

face_annotator
===========================================================

URL: https://github.com/AkariGroup/face_annotator.git

| OAK-Dの認識機能を使い、顔認識したフレームを自動でYOLOアノテーションし、指定したIDで保存するアプリです。
| 顔ごとに別のラベルで保存することで、個人識別用のデータセットを作成することができます。

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


shy_akari
===========================================================

URL: https://github.com/AkariGroup/shy_akari.git

..  youtube:: 8cPC2DWVK-Y

| 恥ずかしがり屋のAKARIアプリです。
| AKARIはこちらの顔を見つめてきますが目が合うと恥ずかしがって顔を背けてしまいます。
| 顔認識と目線認識を組み合わせて、目が合っていない時は顔を追従しつつ、目線がAKARIを向いているかを検出しています。

akari_good_sign_counter
===========================================================

URL: https://github.com/AkariGroup/akari_good_sign_counter.git

..  youtube:: 24ZCWwcNGfE

| AKARIにグッドポーズをすると、1いいねカウントされるアプリです。

akari_starry_sky
===========================================================

URL: https://github.com/AkariGroup/akar_starry_sky

..  youtube:: VKhBbwKr3s0

| YOLOの物体認識で人の3次元位置の軌道を認識、記録し、星空を描画するアプリです。



***********************************************************
愛知工業大学 情報科学部 知的制御研究室開発のアプリケーション
***********************************************************

以下は愛知工業大学 情報科学部 知的制御研究室の学生が開発したアプリケーションです。


akari_treasure_hunt
===========================================================

URL: https://github.com/AkariGroup/akari_treasure_hunt

..  youtube:: Z25ZOcmBq8E

| 物体認識を使って、AKARIと宝探しゲームで勝負できるアプリです。
| 画像の中から、指定した物体をAKARIより先に見つけられるかを競います。


akari_finger_alphabet_game
===========================================================

URL: https://github.com/AkariGroup/akari_finger_alphabet_game.git

..  youtube:: K45tEPlqJnw

| 物体認識を使って、指文字の練習がクイズ形式でできるアプリです。
| ディスプレイに表示された単語に一番多く含まれる母音を手で示す、という形式で指文字の練習ができます。

akari_doze_detection
===========================================================

URL: https://github.com/AkariGroup/akari_doze_detection.git

..  youtube:: m8uzp-P0CAY

| 顔と手の認識を使って、居眠りを防止するアプリです。
| 居眠りを検知したらアラームが鳴ります。

akari_smile_counter
===========================================================

URL: https://github.com/AkariGroup/akari_smile_counter.git

..  youtube:: exHdhSjy72o

| 表情認識を使って、笑顔の人を見つけた回数をカウントし、ディスプレイに表示するアプリです。

akari_draw_picture
===========================================================

URL: https://github.com/AkariGroup/akari_draw_picture.git

..  youtube:: qPgw0fd7b1o

| 画像認識を使って写真の撮影をし、その写真の上にお絵描きができるアプリです。


:doc:`main` へ戻る

:doc:`test_uvc_camera` へ戻る
