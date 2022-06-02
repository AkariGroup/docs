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

titleEcho " Build document"
cd $AKARI_DOC_PARENT_PATH
poetry run make html
successEcho "Document built."

titleEcho "Link custom theme"
if find  $AKARI_DOC_PARENT_PATH/_build/html/akaridoc_theme.css > /dev/null 2>&1; then
 skipEcho "Custom theme has already been linked"
else
 cp $AKARI_DOC_PARENT_PATH/theme/akaridoc_theme.css $AKARI_DOC_PARENT_PATH/_build/html/_static/css
 successEcho "Custom theme link was created."
fi

echo -e " "
echo -e "\e[32;1m----------------------------------------\e[m"
echo -e "\e[32;1mAll steps were finished!!\e[m"
echo -e "\e[32;1m----------------------------------------\e[m"
echo -e " "
