#ドキュメントビルド用スクリプト

#!/bin/bash
# -*- coding: utf-8 -*-
## シェルオプション
set -e           # コマンド実行に失敗したらエラー
set -u           # 未定義の変数にアクセスしたらエラー
set -o pipefail  # パイプのコマンドが失敗したらエラー（bashのみ）


SCRIPT_DIR=$(cd $(dirname $0); pwd)
AKARI_DOC_PARENT_PATH=`pwd | xargs dirname`
. $AKARI_DOC_PARENT_PATH/setup/lib/common.bash    # 共通の関数や定数をライブラリからロード

titleEcho "Set up virtualenv"
cd $AKARI_DOC_PARENT_PATH
virtualenv -p python3.8 venv
successEcho "virtualenv set up finished."

titleEcho "Activate virtualenv"
. ./venv/bin/activate
successEcho "virtualenv activated."

titleEcho " Build document"
cd $AKARI_DOC_PARENT_PATH
make html
successEcho "Document built."

echo -e " "
echo -e "\e[32;1m----------------------------------------\e[m"
echo -e "\e[32;1mAll steps were finished!!\e[m"
echo -e "\e[32;1m----------------------------------------\e[m"
echo -e " "
