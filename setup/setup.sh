#AKARIに必要なライブラリのインストール用スクリプト

#!/bin/bash
# -*- coding: utf-8 -*-
## シェルオプション
set -e           # コマンド実行に失敗したらエラー
set -u           # 未定義の変数にアクセスしたらエラー
set -o pipefail  # パイプのコマンドが失敗したらエラー（bashのみ）


SCRIPT_DIR=$(cd $(dirname $0); pwd)
AKARI_DOC_PARENT_PATH=`pwd | xargs dirname`
. $AKARI_DOC_PARENT_PATH/setup/lib/common.bash    # 共通の関数や定数をライブラリからロード

titleEcho "apt update"
apt_check_and_update

titleEcho "Install curl"
apt_check_and_install curl


titleEcho "Create and set up venv"
(
  cd $AKARI_DOC_PARENT_PATH
  python -m venv venv
  source venv/bin/activate
  pip install -r requirements.txt
  successEcho "venv set up finished"
)

titleEcho "Build document"
(
  cd $AKARI_DOC_PARENT_PATH
  source venv/bin/activate
  make html
  successEcho "Document built."
)

echo -e " "
echo -e "\e[32;1m----------------------------------------\e[m"
echo -e "\e[32;1mAll steps were finished!!\e[m"
echo -e "\e[32;1m----------------------------------------\e[m"
echo -e " "
