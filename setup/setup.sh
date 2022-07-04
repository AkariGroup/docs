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


titleEcho " Install curl"
apt_check_and_install curl

titleEcho "Install python3-pip" 
apt_check_and_install python3-pip

titleEcho " Install poetry"
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
successEcho "poetry installed"

titleEcho "Add poetry path in .bashrc"
if grep 'export PATH="\$HOME/.poetry/bin:\$PATH"' ~/.bashrc > /dev/null 2>&1; then 
 skipEcho "poetry path has already been available in .bashrc."
else
 echo 'export PATH="$HOME/.poetry/bin:$PATH"' >> ~/.bashrc
 successEcho "poetry path was added in .bashrc"
fi

titleEcho "Install pipenv"
pip3_check_and_install pipenv

titleEcho "set up akari poetry env"
(
    source $HOME/.poetry/env
    cd $AKARI_DOC_PARENT_PATH
    poetry install
)

titleEcho " Build document"
cd $AKARI_DOC_PARENT_PATH
poetry run make html
successEcho "Document built."

echo -e " "
echo -e "\e[32;1m----------------------------------------\e[m"
echo -e "\e[32;1mAll steps were finished!!\e[m"
echo -e "\e[32;1m----------------------------------------\e[m"
echo -e " "
