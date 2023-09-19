# docs

AKARIのマニュアルを管理するリポジトリです。  
本レポジトリのマニュアルは下記リンク先に掲載されています。  
https://akarigroup.github.io/docs/


## セットアップ手順

ローカルでセットアップしたい場合は下記手順に沿ってください。  

1. docsをクローンする

~~~bash
   git clone https://github.com/AkariGroup/docs.git
~~~

2. submoduleを更新する

~~~bash
   cd ~/docs
   git submodule update --init --recursive
~~~

3. apt updateを実行

~~~bash
   sudo apt update
~~~

4. 必要なライブラリのインストール

~~~bash
   sudo apt install curl python3.10 python3.10-venv
~~~

5. 仮想環境の作成

~~~bash
   python3 -m venv venv
   . venv/bin/activate
   pip install -r requirements.txt
~~~

6. ビルドの実行

~~~bash
   cd setup
   ./build.sh
~~~

1回セットアップが完了した後は、6.のみの再実行でドキュメントの再ビルドができます。  


## ドキュメントの確認

ビルドしたマニュアルは、akari_documentディレクトリ直下で下記コマンドを実行することで確認できます。

~~~bash
   $ sensible-browser _build/html/index.html
~~~
