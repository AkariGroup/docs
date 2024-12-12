***********************************************************
AKARI Light仮想実行環境のセットアップ
***********************************************************

akari_software下に仮想実行環境のセットアップをしていきます。

===========================================================
必要なもの
===========================================================

* AKARI Light(RaspberryPi OSインストール済み)
* キーボード
* マウス
* ディスプレイ

===========================================================
venvのセットアップ
===========================================================

| akari_softwareの仮想実行環境をセットアップします。

1. akari_software直下に移動し直します。

.. code-block:: bash

   cd ~/akari_software

2.  仮想環境を作成します（初回のみ必要）。

.. code-block:: bash

   python -m venv venv

2. 仮想環境を有効にします。

.. code-block:: bash

   source venv/bin/activate

3. 必要なライブラリをインストールします。

.. code-block:: bash

   pip install akari_client[depthai]
   pip install akari_proto


.. tip::

   venvを終了したい場合は下記コマンドを実行します。

   .. code-block:: bash

      deactivate



| 以上でAKARI Lightの準備は完了です。
|

:doc:`main` へ戻る

:doc:`setup_ansible` へ戻る

