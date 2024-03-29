.. meta::
   :description: オープンソースの小型卓上ロボット「AKARI」の特徴を紹介します。

###########################################################
AKARIの特徴
###########################################################

ここでは、AKARIの特徴を紹介します。

***********************************************************
小型で使いやすい卓上カメラロボット
***********************************************************

| AKARIは、卓上に置ける小型サイズのロボットです。
| 機能も大変シンプルで、
| ・ カメラのついたヘッドが上下左右の2方向に動かせられる
| ・ ボディーに搭載されたディスプレイ(M5Stack)に文字や画像が表示できる
| ・ ボタン入力や環境センサの情報が取得できる
| ・ ヘッドのGPIOが制御でき、センサなどがモジュールとして追加できる
| のみで、 **簡単に使い方を覚えることができます。**

.. image:: ../images/Parameters.png
   :width: 600px

***********************************************************
AIカメラを搭載！ロボット単体でも多様な画像認識が使える
***********************************************************

| カメラにはステレオAIカメラである **OAK-D Lite** を採用しています。
| カメラに推論を行うことができる演算機能が搭載されており、小型なAKARI単体でも **顔認識・物体認識はもちろん、セグメンテーションや骨格推定など様々な画像認識を使うことも可能です。**
| またステレオカメラを活かしたデプス推定を行うことも可能です。
| AKARIに組み込まれたサンプルの他にもOAK-Dの開発元であるLuxonisからも多くのサンプルが公開されており、幅広い画像認識技術を簡単に試すことができます。

***********************************************************
機能を拡張して使える！
***********************************************************

| AKARIは **ヘッドにユニットを追加したり、ベース部を付け替えて使うこともできます。**
| ヘッドにはUSBポートとGPIOが付いており、センサや出力モジュールを追加することができます。
| **画像認識＋αのオリジナル機能を開発したい！** といった場合にすぐに試すことができます。

.. image:: ../images/AKARI_Stack.jpg
   :width: 600px

***********************************************************
webブラウザ上からソフトを書いて動かせる！
***********************************************************

| AKARIには本体のPC上のUbuntuから直接プログラムの開発、実行を行う方法の他に、webブラウザ経由でアクセスして開発が行えるwebコンソールを使うことができます。
| AKARI本体のPCからだけでなく、 **同一ネットワークに接続されている別のPCやタブレットからアクセスして、JupyterLab上でプログラミングし、AKARIを動かしたり、カメラ映像や認識結果を取得することができます。**
| これによって、 **Linuxの知識がなくても簡単・手軽にプログラミングの勉強や開発を始めることができます。**

.. image:: ../images/sample_controller.png
   :width: 500px

.. image:: ../images/sample_jupyter.png
   :width: 500px

***********************************************************
ロボット学習のコンテンツが充実！
***********************************************************

| AKARIのハード、ソフトの仕様は本マニュアルにて詳しく公開されています。
| また、AKARI本体の組み立て方やソフトのセットアップ方法、使い方の手順も記載されています。
| 更に、AKARIの開発をする上でのソフトの書き方を紹介したチュートリアル用のJupyter NotebookやAKARIを動かしながらPythonが学習できる練習問題集も公開されており、 **初めてロボットを使ったプログラミングに挑戦する方にも、勉強しやすい環境が整っています。**

.. image:: ../images/sample_practice.png
   :width: 500px

***********************************************************
完全オープンソース
***********************************************************

| ハードの設計やベースとなるソフト、はオープンソース化されています。
| ソフトはApache2.0、ハードはCC BY 4.0のライセンスで公開されています。
| **各ライセンスの規約に従ってさえいれば、使うのも、改変するのも自由です。**
