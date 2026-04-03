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

3. uvのインストール

~~~bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
~~~

4. 依存関係のインストール

~~~bash
   uv sync
~~~

5. ビルドの実行

~~~bash
   uv run make html
~~~

1回セットアップが完了した後は、5.のみの再実行でドキュメントの再ビルドができます。  


## ドキュメントの確認

ビルドしたマニュアルは、akari_documentディレクトリ直下で下記コマンドを実行することで確認できます。

~~~bash
   sensible-browser _build/html/index.html
~~~
