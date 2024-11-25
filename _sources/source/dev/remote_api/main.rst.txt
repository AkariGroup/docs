###########################################################
外部PCからAKARIを制御しよう
###########################################################

| ここでは、同一ネットワークに接続した外部PCからAKARIを制御する方法について説明します。

===========================================================
事前準備
===========================================================

| まずは、AKARIをネットワークに接続し、 :doc:`../../tutorial_web/service` の手順に沿ってAkariRpcServerを起動します。
| また、AKARIのネットワークのIPアドレスを確認しておきます。
| その上で、AKARIを制御したい外部PCを同一のネットワークに接続します。

===========================================================
実行方法
===========================================================

以下はコードの例です。
下記を外部PCから実行することで、AKARIのAPIを遠隔で実行することができます。

.. code-block:: python
   :linenos:


   #!/usr/bin/env python
   # -*- coding: utf-8 -*-
   import time

   from akari_client import AkariClient
   from akari_client.config import (
      AkariClientConfig,
      JointManagerGrpcConfig,
      M5StackGrpcConfig,
   )


   def main() -> None:
      """
      メイン関数
      """
      # AKARI本体のIPアドレスを指定する。
      # 実際のAKARIのIPアドレスに合わせて変更すること。
      akari_ip = "192.168.100.1"
      # portは初期設定のままであれば51001固定
      akari_port = "51001"
      akari_endpoint = f"{akari_ip}:{akari_port}"

      joint_config: JointManagerGrpcConfig = JointManagerGrpcConfig(
         type="grpc", endpoint=akari_endpoint
      )
      m5_config: M5StackGrpcConfig = M5StackGrpcConfig(
         type="grpc", endpoint=akari_endpoint
      )
      akari_client_config = AkariClientConfig(
         joint_manager=joint_config, m5stack=m5_config
      )
      # akari_client_configを引数にしてAkariClientを作成する。
      akari = AkariClient(akari_client_config)

      # 処理を記載。下記は例
      joints = akari.joints
      # サーボトルクをONする。
      joints.enable_all_servo()
      # 初期位置に移動する。
      joints.move_joint_positions(sync=True, pan=0, tilt=0)


   if __name__ == "__main__":
      main()

| 19行目の `akari_ip` は現在のAKARIのIPアドレスに書き換えてください。
| また、21行目の `akari_port` は通常(設定ファイルに特に変更を加えない限りは) `51001` です。
| この情報をもとに、24-29行目と同様にjoint_config, m5_configを作成し、30-32行目でこれを引数にしたAkariClientConfigを作成しています。
| そして、34行目でこのAkariClientConfigを引数としたakariClientを作成することで、そのIPアドレスのAKARIに対してAPIを実行することができます。
| 以降はAKARIのローカル環境で実行するのと同様に各APIを使用することができます。


===========================================================
サンプルコード
===========================================================

| `akari_softwareのsamples/remote_client_sample <https://github.com/AkariGroup/akari_software/tree/feature/remote_sample/samples/remote_client_sample>`_ 内に下記2つのサンプルコードがあります。
- remote_motor_sample.py: 外部PCからAKARIのモーターを制御するサンプル
- remote_m5_sample.py: 外部PCからAKARIのM5ディスプレイを制御するサンプル
| これらも参考にしながら、外部PCでのアプリ作成を行ってください。


:doc:`../main` へ戻る
