# docs

AKARIのマニュアルを管理するリポジトリです。  
本レポジトリのマニュアルは下記リンク先に掲載されています。  
https://akarigroup.github.io/docs/


## セットアップ手順

ローカルでセットアップしたい場合は下記手順に沿ってください。  

1. docsをクローンする

~~~bash
   $ git clone https://github.com/AkariGroup/docs.git
~~~

2. submoduleを更新する

~~~bash
   $ cd ~/docs
   $ git submodule update --init --recursive
~~~

3. セットアップスクリプトを実行する。これにより環境の構築とドキュメントのビルドが行われ、デスクトップにリンクが生成される。


~~~bash
   $ cd ~/docs/setup
   $ ./setup.sh
~~~

## ドキュメントの確認

ビルドしたマニュアルは、akari_documentディレクトリ直下で下記コマンドを実行することで確認できます。

~~~bash
   $ sensible-browser _build/html/index.html
~~~

## ドキュメントの再ビルド

1回セットアップが完了した後は、下記でドキュメントの再ビルドができます。
ドキュメントを更新した場合は下記でビルドして確認して下さい。


~~~bash
   $ cd ~/docs/setup
   $ ./build.sh
~~~

