***********************************************************
(Raspberry Pi版) ソフトウェア環境のセットアップ
***********************************************************

Raspberry Piでのソフトウェア環境セットアップを記載します。

===========================================================
動作確認済みOS
===========================================================

下記のOSにて動作確認済みです。

RaspberryPi 4

- Ubuntu 22.04
- Ubuntu MATE 22.04
- Raspberry Pi OS(bookworm)

RaspberryPi 5

- Raspberry Pi OS(bookworm)

| **Ubuntu, Ubuntu MATEは通常のAKARIとの互換性に優れますが、GUI上での動作がRaspberry Pi上では非常に重いため、Raspberry Pi OSでの使用を推奨します。**
| あらかじめ :doc:`setup_hard` で準備したMicroSDカードに上記のOSをインストールしておく必要があります。

===========================================================
AKARI環境のセットアップ
===========================================================

| OSインストール後、Raspberry Piを起動したら :doc:`../setup_soft/setup_ansible` と同様の手順でセットアップを行うことができます。
| **ただし、Raspberry Pi OSの場合は** :doc:`../setup_soft/setup_ansible` **の「必要なパッケージのインストール」手順は実行不要です。**
| (Raspberry Pi OSは標準でpython3.11, python3.11-venv, gitがインストールされているため、そちらを使用します。)

| 以降、:doc:`../setup_soft/setup_env` 及び :doc:`../setup_soft/setup_m5` を通常のAKARIと同様に実行してください。

| 以上のセットアップが完了した後は、 :doc:`../../tutorial_web/main` や :doc:`../../tutorial/main` の手順で、通常のAKARIと同様に使用可能です。

:doc:`main` へ戻る

