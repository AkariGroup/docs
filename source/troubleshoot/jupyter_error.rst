***********************************************************
webコンソールからのJupyter Notebookの起動に失敗するときは
***********************************************************

webコンソールからJupyter Notebookの起動に失敗する時は、下記の手順を実行してみてください。

===========================================================
再起動
===========================================================

下記の順番で再起動を試してみてください。

1. ブラウザのタブを閉じて、再度Jupyter Notebookのserviceをprojectから開く。

2. 1.で解決しない時は、ServicesのページからJupyter LabのServiceを再起動して再度試す。

3. 2.で解決しない時は、AKARI本体を再起動する。

===========================================================
Jupyter serviceのSTATUSの確認
===========================================================

ここまでで解決しない時は、下記コマンドを実行してakarirobot/akira-service-jupyter@v1のSTATUSを確認してください。

   .. code-block:: bash

      docker ps -a

.. image:: ../images/troubleshooting/jupyter_status.png
    :width: 900px

| STATUSが"Up"だった場合は、他のブラウザを試すか、ブラウザのキャッシュを削除してみてください。
| STATUSが"Exited"だった場合は、次に説明する方法でJupyterのvenvを削除します。

===========================================================
Jupyter serviceのvenvの削除
===========================================================

1. 下記コマンドを実行します。

   .. code-block:: bash

      cd /var/lib/akira
      sudo nautilus .

2. エクスプローラが開くので、右上の3本線が並んでいるオプションを開き、「隠しファイルの表示を有効にする」にチェックを入れます。

3. 表示されている文字列の羅列のディレクトリの中身を一つ一つ確認し、".jupyter" というディレクトリが含まれるものを探します。

4. ".jupyter" というディレクトリが含まれる場所を見つけたら、 **同じディレクトリ内にある".venv"というディレクトリを削除します。**

5. エクスプローラを閉じ、AKARI本体を再起動します。

6. Jupyterのサービスを再度立ち上げ、正しく起動するか確認します。
