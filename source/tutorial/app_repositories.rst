***********************************************************
その他のアプリも使ってみよう
***********************************************************

ここまで紹介した以外にも、様々なアプリが公開されています。
興味があるアプリがあれば、git cloneして使ってみましょう。
使い方は、各URL先のREADMEを参照ください。

akari_hand_tracking
===========================================================

URL: https://github.com/AkariGroup/akari_hand_tracking

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

:doc:`main` へ戻る

:doc:`test_uvc_camera` へ戻る