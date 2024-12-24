***********************************************************
ヘッドカメラをwebカメラとして使ってみよう
***********************************************************

AKARIのヘッドカメラとして採用しているOAK-D Liteは、通常のwebカメラとは使い方が異なりますが、通常のカメラのように **UVC** 規格でのストリーミングを行うこともできます。

UVCとはUSB Video Classの略で、主にUSBカメラの通信方法に関する規格です。

これを行うには、UVCに偽装するためのアプリを立ち上げる必要があります。

===========================================================
depthai_uvcの仮想環境の作成
===========================================================

depthai_uvcは独自に仮想環境の作成が必要です。

1. UVCアプリの保存先のディレクトリへ移動する。

.. code-block:: bash

   cd ~/akari_software/samples/depthai_uvc

2. 仮想環境を作成する。

.. code-block:: bash

   python -m venv venv

3. 仮想環境を有効化する。

.. code-block:: bash

   source venv/bin/activate

4. requirements.txtを使って必要なライブラリをインストールする。

.. code-block:: bash

   pip install -r requirements.txt

===========================================================
UVCアプリの実行
===========================================================

UVCアプリを立ち上げます。depthai_uvcでは、RGBとステレオdepthの2つをストリーミングすることができます。

RGBの場合は下記を実行します。

   .. code-block:: bash

      python3 depthai_uvc_rgb.py

ステレオdepthの場合は下記を実行します。

   .. code-block:: bash

      python3 depthai_uvc_depth.py

このアプリを起動している間は、OAK-D Liteの映像が `/dev/video20` に割り当てられ、ストリーミングされます。

コマンドライン上でCtrl+Cを押すと終了します。

=============================
映像の確認
=============================

サンプルアプリを使って、UVCアプリからの映像を確かめてみましょう。

depthai_uvcを起動したまま、新しいターミナルを立ち上げ、 `uvc_streamer.py` を実行します。

   .. code-block:: bash

      cd ~/akari_software/samples/depthai_uvc
      source venv/bin/activate
      python3 uvc_streamer.py

| 映像をストリーミングするウインドウが起動し、OAK-Dの映像が確認できるようになったと思います。
| ウィンドウを選択して、キーボードの'q'キーを押すことで終了することができます。
| このように、depthai_uvcを起動しておくことで、一般的なwebカメラの映像を用いるアプリやプログラムでもOAK-D Liteの映像を使うことができます。

:doc:`app_repositories` へ進む

:doc:`test_detection` へ戻る