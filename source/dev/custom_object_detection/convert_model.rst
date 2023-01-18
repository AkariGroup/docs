***********************************************************
3. モデル変換を行う
***********************************************************

先程学習させたpyTorchモデルをdepthAI公式ののonline model converterを使ってOAK-D形式のモデルファイルに変換します。

===========================================================
モデルのアップロードと変換
===========================================================

1. 下記リンクからdepthAIのYOLO model converterにアクセスします。

| http://tools.luxonis.com/

2. 「Yolo version」で「YoloV7(detection only)」を選択します。

3. 「File」をクリックし、:doc:`training` でダウンロードしたpytorchモデル(.pt)を選択します。

4. Input shapeは「640」を入力します。

5. 「submit」を選択すると、model変換が始まり、しばらくするとzipファイルがダウンロードできます。

6. ダウンロードしたzipファイルを展開し、中のOAK-Dの認識モデル(.blob)とラベル(.json)をそれぞれ下記に移動します。

| モデル(.blob): `akari_object_detection/4_testing/model`
| ラベル(.json): `akari_object_detection/4_testing/json/``

| 以上でオリジナル画像認識の準備は完了です。
| 次はいよいよ画像認識をAKARIで実際に動かしていきます。

:doc:`testing` へ進む

:doc:`annotation` へ戻る
