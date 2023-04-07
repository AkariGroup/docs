# akari_document

AKARIのマニュアルを管理するリポジトリです。  
本レポジトリのマニュアルは下記リンク先に掲載されています。  
https://akarigroup.github.io/docs/


## セットアップ手順

ローカルでセットアップしたい場合は下記手順に沿ってください。  

1. akari_document をクローンする

~~~bash
   $ git clone git@github.com:AkariGroup/akari_document.git
~~~

2. submoduleを更新する

~~~bash
   $ cd ~/akari_document
   $ git submodule update --init --recursive
~~~

3. セットアップスクリプトを実行する。これにより環境の構築とドキュメントのビルドが行われ、デスクトップにリンクが生成される。


~~~bash
   $ cd ~/akari_document/setup
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
   $ cd ~/akari_document/setup
   $ ./build.sh
~~~

