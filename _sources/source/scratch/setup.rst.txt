***********************************************************
AKARIのScratch環境をセットアップしよう
***********************************************************

| まずは、AKARIのScratch環境のセットアップ方法を説明します。

===========================================================
事前準備
===========================================================

| まずはScratch環境をセットアップしていきます。

1. akari_scratchをcloneする。

  | 下記コマンドでakari_scratchをcloneします。

  .. code-block:: bash

    git clone https://github.com/AkariGroup/akari_scratch.git

2. submoduleをcloneする。

  | submoduleの取得を行います。

  .. code-block:: bash

    cd akari_scratch
    git submodule update --init --recursive

3. docker環境をbuildする。

  | akari_scratchの環境はdockerにより構築されています。
  | 下記コマンドでdocker環境をbuildします。

  .. code-block:: bash

    cd docker
    docker compose -f docker-compose.yml build

以上でセットアップは終了です。
次は、実際に起動して使ってみましょう。

:doc:`playing` へ進む

:doc:`main` へ戻る