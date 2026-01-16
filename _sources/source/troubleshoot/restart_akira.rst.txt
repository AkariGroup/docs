***********************************************************
webコンソールに繋がらないときは
***********************************************************

AKARIが操作PCと同一ネットワークに繋がれており、正しいIPアドレスでアクセスしているのにwebコンソールが開けない場合は、AKARI内でのサービスの自動起動が失敗している可能性があります。

1. AKARIのPCのUbuntuにログインします。

2. 下記コマンドを実行します。 **akari.serviceではなくakira.serviceです。**

.. code-block:: bash

   $ sudo systemctl status akira.service

3. akiraのステータスが表示されます。この状態がfailになっていた場合、サービスの自動起動が失敗しています。

| 下記コマンドを実行して、サービスを再起動します。

.. code-block:: bash

   $ sudo systemctl restart akira.service

4. もう一度2.を実行して、statusがactiveになっていたらOKです。
