##########################
AKARI練習問題(工事中)
##########################

AKARIの使い方を学ぶ練習問題集です。

AKARIのモータ、GPIO、ディスプレイ、カメラなどの使い方を学びつつ、pythonの基本を覚えることができます。


事前準備
========

まずは、練習問題のレポジトリをCloneします。

akari_main直下のappに移動します。

.. code-block:: bash

   $ cd akari_main/app

akari_practiceのレポジトリをcloneします。

.. code-block:: bash

   $ git clone git@github.com:AkariGroup/akari_practice.git

進め方
========

上記の事前準備を行うと、問題と回答がakari_main/app/akari_practice内にあると思います。

akari_practice内には4つのディレクトリがあります。

+ 1_motor: ヘッドを上下左右に動かすモータの制御方法を学習できます。
+ 2_m5_com: ヘッドのGPIOピンの使い方を学習できます。
+ 3_m5_display: ボディーについているM5のディスプレイ表示の仕方を学習できます。
+ 4_challenge: カメラを使ったり、これまで学んだ項目を複合して練習するチャレンジ問題です。

各パート内には'question'と'answer'の2つのディレクトリがあります。

questionディレクトリには問題用のファイルがあります。このドキュメントの各問題を見ながらquestionディレクトリ内の対応する問題用ファイルにコードを書いていきましょう。

各問題は"""()"""で囲われた部分の中身を穴埋めしてアプリを完成させていきます。

最初は関数１個の穴埋めから始まり、最後はコード全部を書いていくことになります。

書き終わって答え合わせをする時や、分からなかった時はこのドキュメントの回答編と、answerディレクトリ内のファイルを参照してください。

練習問題一覧
================

.. toctree::
   :maxdepth: 2

   1_motor/main
   2_m5_com/main
   3_m5_display/main
   4_challenge/main
