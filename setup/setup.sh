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

titleEcho "Install virtualenv"
pip_check_and_install virtualenv

titleEcho "Set up virtualenv"
cd $AKARI_DOC_PARENT_PATH
virtualenv -p python3.8 venv
successEcho "virtualenv set up finished."

titleEcho "Activate virtualenv"
. ./venv/bin/activate
successEcho "virtualenv activated."

titleEcho " Install Sphinx"
pip install Sphinx
successEcho "Sphinx installed."

titleEcho " Install sphinx-rtd-theme"
pip install sphinx-rtd-theme
successEcho "sphinx-rtd-theme installed."

titleEcho " Install sphinxcontrib-youtube"
pip install sphinxcontrib-youtube
successEcho "sphinxcontrib-youtube installed."

titleEcho " Build document"
cd $AKARI_DOC_PARENT_PATH
make html
successEcho "Document built."

titleEcho "Link custom theme"
if find  $AKARI_DOC_PARENT_PATH/_build/html/akaridoc_theme.css > /dev/null; then
 skipEcho "Custom theme has already been linked"
else
 cp $AKARI_DOC_PARENT_PATH/theme/akaridoc_theme.css $AKARI_DOC_PARENT_PATH/_build/html/_static/css
 successEcho "Custom theme link was created."
fi

titleEcho "Link document to Desktop"
if find  ~/Desktop > /dev/null; then
 ln -sf $AKARI_DOC_PARENT_PATH/_build/html/index.html ~/Desktop/AKARIマニュアル
 successEcho "Document link was created."
elif find  ~/デスクトップ > /dev/null; then
 ln -sf $AKARI_DOC_PARENT_PATH/_build/html/index.html ~/デスクトップ/AKARIマニュアル
 successEcho "Document link was created."
fi

echo -e " "
echo -e "\e[32;1m----------------------------------------\e[m"
echo -e "\e[32;1mAll steps were finished!!\e[m"
echo -e "\e[32;1m----------------------------------------\e[m"
echo -e " "
