***********
自動起動BIOSのインストール
***********

| lattepanda alphaは、初期状態では電源ボタンを押さない限りは起動しない設定になっています。
| AKARIで使用する場合は、電源コネクタからの電源供給されただけで起動するように変更する必要があります。
| ここでは、lattepanda alphaのBIOSを自動起動用のBIOSに書き換えます。

| 参考リンク: https://github.com/LattePandaTeam/LattePanda-Win10-Software/tree/master/BIOS%20for%20LattePanda%20Alpha%26Delta

=============================
必要なもの
=============================

* PC
* USBメモリ
* キーボード
* マウス

=============================
lattepanda alphaのバージョンを調べる
=============================
lattepanda alphaのバージョンを調べます。
| 使用するlattepanda alphaの背面のシリアルナンバー(下図)を確認します。

.. image:: https://www.lattepanda.com/wp-content/uploads/2020/08/Alpha-KR300-.jpg

| シリアルナンバーによってlattepanda alphaのバージョンが分かります。
| S/N: S70KR200 → **KR200**
| S/N: S70KR300 → **KR300**
| S/N: S70KR310 → **KR310**
| バージョンに応じて、以降のセットアップ手順が変化します。
| **正しいバージョン以外のBIOSをインストールしてしまうと、lattepandaが起動しなくなる恐れがあります。**

=============================
lattepanda alphaのバージョンに沿ったBIOSをダウンロードする
=============================

先程調べたバージョンにあったBIOSファイルをダウンロードします。

| **KR200の場合** :
| 下記リンクから、KR200用リフレッシュBIOS、自動起動BIOSとBIOS書き込みツールのダウンロードを行います。
| `KR200用リフレッシュBIOS、自動起動BIOSとBIOS書き込みツールのリンク <https://github.com/LattePandaTeam/LattePanda-Win10-Software/raw/master/BIOS%20for%20LattePanda%20Alpha%26Delta/Alpha%20m3-7y30/Alpha%20Auto-power-on%20BIOS.zip>`_

| **KR300の場合** :
| 下記リンクから、KR200用自動起動BIOSとBIOS書き込みツールのダウンロードを行います。
| `KR200用リフレッシュ用BIOS、自動起動BIOSとBIOS書き込みツールのリンク <https://github.com/LattePandaTeam/LattePanda-Win10-Software/raw/master/BIOS%20for%20LattePanda%20Alpha%26Delta/Alpha%20m3-7y30/Alpha%20Auto-power-on%20BIOS.zip>`_
| 下記リンクから、KR300用のクリーンナップBIOS、自動起動BIOSのダウンロードを行います。
| `KR300用リフレッシュ用BIOS、自動起動BIOSのリンク <https://github.com/LattePandaTeam/LattePanda-Win10-Software/raw/master/BIOS%20for%20LattePanda%20Alpha%26Delta/Alpha%20m3-8100y/Alpha-8100y%20KR300/Alpha%20-8100y%20KR300%20Auto-power-on%20BIOS/Alpha-8100y%20KR300%20Auto-power-on%20BIOS.zip>`_

| **KR310の場合** :
| 下記リンクから、KR200用リフレッシュBIOS、自動起動BIOSとBIOS書き込みツールのダウンロードを行います。
| `KR200用リフレッシュBIOS、自動起動BIOSとBIOS書き込みツールのリンク <https://github.com/LattePandaTeam/LattePanda-Win10-Software/raw/master/BIOS%20for%20LattePanda%20Alpha%26Delta/Alpha%20m3-7y30/Alpha%20Auto-power-on%20BIOS.zip>`_
| 下記2つのリンクから、KR310用リフレッシュBIOS、自動起動BIOSのダウンロードを行います。
| `KR310用リフレッシュBIOSのリンク <https://github.com/LattePandaTeam/LattePanda-Win10-Software/raw/master/BIOS%20for%20LattePanda%20Alpha%26Delta/Alpha%20m3-8100y/Alpha-8100y%20KR310/CDJQ-BS-7-S70KR310-KF65A-101-I.zip>`_
| `KR310用自動起動BIOSのリンク <https://github.com/LattePandaTeam/LattePanda-Win10-Software/raw/master/BIOS%20for%20LattePanda%20Alpha%26Delta/Alpha%20m3-8100y/Alpha-8100y%20KR310/EC-Alpha-KR310-Autopoweron.zip>`_


=============================
BIOSをインストールする
=============================

| 1. USBメモリをFAT32にフォーマットします。

| 2. 先程ダウンロードしたBIOSのzipファイルを展開し、USBメモリにコピーします。
| **KR200の場合** : 
| `Alpha Auto-power-on BIOS` 内の `Alpha Auto-power-on BIOS` ディレクトリ内のファイルを全てUSBメモリの直下にコピーします。
| **同じ名前のディレクトリが二重で存在します。奥のディレクトリにある方(AfuEfix64.efiが含まれている方)を全てコピーします。**

| **KR300の場合** : 
| `Alpha Auto-power-on BIOS` ディレクトリ内の `BIOS-S70KR200-101-B2.Bin` と `EC-S70KR200-101-B2.bin` **以外の** ファイルを全てUSBメモリの直下にコピーします。
| **同じ名前のディレクトリが二重で存在します。奥のディレクトリにある方(AfuEfix64.efiが含まれている方)を全てコピーします。**
| `Alpha-8100y KR300 Auto-power-on BIOS` 内 `BS-7-S70KR300-KF65A-101-J` 内の `CDJQ-BS-7-S70KR300-KF65A-101-J.BIN` をUSBメモリの直下にコピーします。
| `Alpha-8100y KR300 Auto-power-on BIOS` 内 `EC-7-S70KR300_20190704` 内の `S70KR300_20190704.bin` をUSBメモリの直下にコピーします。

| **KR310の場合** : 
| `Alpha Auto-power-on BIOS` ディレクトリ内の `BIOS-S70KR200-101-B2.Bin` と `EC-S70KR200-101-B2.bin` **以外の** ファイルを全てUSBメモリの直下にコピーします。
| **同じ名前のディレクトリが二重で存在します。奥のディレクトリにある方(AfuEfix64.efiが含まれている方)を全てコピーします。**
| `CDJQ-BS-7-S70KR310-KF65A-101-I` 内の `CDJQ-BS-7-S70KR310-KF65A-101-I.BIN` をUSBメモリの直下にコピーします。
| `EC-Alpha-KR310-Autopoweron` 内の `S70KR310A-auto-poweron.bin` をUSBメモリの直下にコピーします。

| 3. USBメモリをlattepandaに差し込み、lattepandaを起動します。

| 4. 起動と同時にキーボードの「del」キーを押し続け、BIOS設定ページに入ります。

| 5. 「Save & Exit」に移動し、「Boot Override」内の「UEFI.Built-in EFI Shell」を選択し、"Enter "キーを押します。

.. image:: https://www.lattepanda.com/wp-content/uploads/2019/08/Alpha-BIOS-reflash01.jpg
    :width: 500px

| 6. **Shell>** と表示されるまで数秒待ちます。

.. image:: https://www.lattepanda.com/wp-content/uploads/2019/08/Alpha-BIOS-reflash02.jpg
    :width: 500px

| 7. `fs1` :と入力し、「Enter」キーを押します。(「Not found」と表示されたら `fs2:` 、 `fs3:` を試します。)

| 8. **dir** と入力し、「Enter」キーを押して、先程コピーしたBIOSファイルが表示されるか確認します。

.. image:: https://www.lattepanda.com/wp-content/uploads/2019/08/Alpha-BIOS-reflash03.jpg
    :width: 500px

| 9. BIOSバージョンに応じて、下記のコマンドを入力します。「TAB」キーを押すことで、ファイル名の入力を補助してくれます。
| **KR200** :
.. code-block:: bash

    Fpt -f BS-7-S70KR200-K65A-B1A.Bin

| **KR300** :
.. code-block:: bash

    Fpt -f CDJQ-BS-7-S70KR300-KF65A-101-J.BIN

| **KR310** :
.. code-block:: bash

    Fpt -f CDJQ-BS-7-S70KR310-KF65A-101-I.BIN

.. image:: https://www.lattepanda.com/wp-content/uploads/2019/08/Alpha-BIOS-reflash04.jpg
    :width: 500px

| 10. 「ENTER」キーを押してリフレッシュBIOSの書き込みを実行します。

| 11. 「Ctrl」+「Alt」+「Del」を押してシステムを再起動します。
| **必ず一度OSが通常通り立ち上がることを確認してください。**

| 12. lattepandaをもう一度「ESC」キーを押しながら再起動しBIOSメニューに入り、「Save & Exit」に移動し、「Boot Override」内の「UEFI.Built-in EFI Shell」を選択し、"Enter "キーを押します。

| 13. `fs1` :と入力し、「Enter」キーを押します。(「Not found」と表示されたら `fs2:` 、 `fs3:` を試します。)

| 14. BIOSバージョンに応じて、下記のコマンドを入力します。「TAB」キーを押すことで、ファイル名の入力を補助してくれます。
| **KR200** :
.. code-block:: bash

    eFuitX64.efi /u EC-7-S70KR200-K65A-B1A.bin

| **KR300** :
.. code-block:: bash

    eFuitX64.efi /u S70KR300_20190704.bin

| **KR310** :
.. code-block:: bash

    eFuitX64.efi /u S70KR310A-auto-poweron.bin

.. image:: https://www.lattepanda.com/wp-content/uploads/2019/08/Alpha-BIOS-reflash05.jpg
    :width: 500px

| 15. 「ENTER」キーを押して自動起動BIOSの書き込みを実行します。ITE Flash Utilityがロードされ、BIOSの書き込みが行われます。「Update EC Rom successfully」と表示されるまで待ちます。

.. image:: https://www.lattepanda.com/wp-content/uploads/2019/08/Alpha-BIOS-reflash06.jpg
    :width: 500px

| 16. 「Ctrl」+「Alt」+「Del」を押してシステムを再起動します。次回以降は、電源コネクタからの電源投入のみで自動起動が行われるようになります。

:doc:`setup_ansible` へ進む

:doc:`install_ubuntu` へ戻る
