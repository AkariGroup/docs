***********
Ubuntu 20.04のインストール
***********

lattepandaにUbuntu20.04をインストールします。

=============================
必要なもの
=============================

* PC
* USBメモリ(4GB以上)
* キーボード
* マウス

=============================
Ubuntuの起動用USBを作成する。
=============================
| 1. PC上に下記リンクからUbuntu 20.04のisoファイルをダウンロードします。
| https://releases.ubuntu.com/20.04/ubuntu-20.04.4-desktop-amd64.iso
| 2. 下記リンクからUniversal USB installerをダウンロードします。
| https://www.pendrivelinux.com/downloads/Universal-USB-Installer/Universal-USB-Installer-2.0.1.0.exe
| 3. USBメモリをパソコンに差し込み、Universal USB Installerを起動します。
| 4. Step.1のDistributionとしてUbuntuを選択します。
| 5. Step.2のOSイメージの選択画面で、ダウンロードしたUbuntu20.04のisoを指定します。
| 6. Step.3のUSBメモリの選択で、インストールするUSBメモリを指定します。

.. image:: ../images/usb_installer_setting.jpg
    :width: 600px

7. Createを選択すると、Ubuntu起動用USBメモリの作成が開始します。しばらく待っていれば終了します。

=============================
Ubuntuをlattepandaにインストールする。
=============================

1. 先ほど作成したUbuntu起動用USBメモリをlattepandaに挿入し、「del」キーを押しながらlattepandaを起動します。
2. 「Save & Exit」に移動し、「Boot Override」内から先程のUbuntu起動用USBメモリを選択し、「Enter」キーを押します。
3. 「Ubuntu」を選択します。
4. 言語を日本語に変更し、「Ubuntuをインストール」を選択します。
5. キーボードレイアウトを「Japanese」にします。
6. Wi-fiネットワークの接続画面になります。接続可能なら接続してください。
7. 「通常のインストール」を選択します。
8. 「ディスクを削除してUbuntuをインストール」を選択し、「インストール」→「続ける」を選びます。
9. 住んでいる場所は任意で選びます。日本国内なら「Tokyo」で問題ありません。
10. あなたの名前、コンピューターの名前、ユーザー名、パスワードは任意で設定します。
11. インストールが始まるのでしばらく待ちます。
12. 「インストールは完了しました」と表示されたら、「今すぐ再起動する」を選択します。「Please remove install medium」と表示されたらUSBメモリを抜き、「Enter」キーを押します。
13. lattepandaが再起動してUbuntuが立ち上がります。

これでUbuntuのインストールは完了です。次に、lattepandaを自動起動できるようにBIOSの書き換えを行います。

:doc:`setup_autostart_bios` へ進む

:doc:`main` へ戻る
