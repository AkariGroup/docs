:orphan:

AKARI_document
========================================

概要
----
AKARIのマニュアルを管理するリポジトリである。


環境構築
------------

#. akari_document をクローンする

   ::

      $ git clone git@github.com:AkariGroup/akari_document.git


#. セットアップスクリプトを実行する。これにより環境の構築とドキュメントのビルドが行われ、デスクトップにリンクが生成される。

   ::

      $ cd ~/akari_document/setup
      $ ./setup.sh


ドキュメントの確認
--------------------------------

#. ビルドされたマニュアルをブラウザで表示する。

   ::

      $ sensible-browser _build/html/index.html


#. 仮想環境を無効にする

   ::

      $ deactivate


---------------------------------------------

ドキュメントの再ビルド
--------------------------------

1回セットアップが完了した後は、下記でドキュメントの再ビルドができます。

ドキュメントを更新した場合は下記でビルドして確認して下さい。

   ::

      $ cd ~/akari_document/setup
      $ ./build.sh


---------------------------------------------

※ここから下は未メンテナンス


英訳の追加
-----------

#. make html を実行したディレクトリに移動し、翻訳をアップデートする

   ::

      $ make gettext
      $ sphinx-intl update -p _build/locale -l en

#. `locale/en/LC_MESSAGES` にある poファイルが更新される

#. poファイル内で、英訳したい日本語の文を探し、msgstrに英訳を入れる

#. 再度ビルドを行う（英語版のみビルドする場合は 'html_en' とする）

   ::

      $ make html_en

#. ビルドされた英語マニュアルをブラウザで表示する

   ::

      $ sensible-browser _build/html_en/index.html

英訳漏れがないかチェック
-------------------------

#. ``hsr_manual/scripts`` に移動し、チェックツールを実行する

   ::

      $ python translation_check.py

#. 英訳漏れがない場合はOKが、英訳漏れがある場合はその場所が表示される

   ::

      qa.po : OK
      safety.po : OK
      ===== Not translated!! =====
      file: ../../hsr_manual/locale/en/LC_MESSAGES/howto.po
      line: 4185
      msgid "Adapterを選択します。"

      howto.po : NG
      index.po : OK
      startup.po : OK
      troubleshoot.po : OK
      changelog.po : OK
      notice.po : OK
      development.po : OK
      intro.po : OK
      security.po : OK
      overview.po : OK
