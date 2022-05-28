#!/usr/bin/env python
import rclpy
from rclpy.node import Node
from rclpy import Parameter
from akari_controller.akari_controller import AkariController
from object_msgs.msg import ObjectsInBoxes
import time


class HelloAkariWorld(Node):
    """顔認識したらお辞儀をするサンプルアプリ"""

    def __init__(self):
        """
        クラスの初期化時にまずここが実行される
        """
        super().__init__('hello_akari_world')
        # 初期位置を設定。左右は正面、上下は20度見上げる
        self.default_pan = 0
        self.default_tilt = 0.349066

        self.akari = AkariController()
        # ログ出力モードをDEBUGモードに
        rclpy.logging.set_logger_level('hello_akari_world', level=10)
        # ヘッドモータのサーボON
        self.akari.set_torque_enable({"joint_names": self.akari.get_joint_names(),
                                      "values": [True, True]})
        # ヘッドモータの速度を6.28rad/s、加速度を制限なしに設定
        self.akari.set_profile_velocity({"joint_names": self.akari.get_joint_names(),
                                        "values": [6.28, 6.28]})
        self.akari.set_profile_acceleration({"joint_names": self.akari.get_joint_names(),
                                            "values": [0.0, 0.0]})

        # OpenVINOの顔認識結果をROS2 topicとして受け取れるようにする
        self.sub_topic_name = '/ros2_openvino_toolkit/face_detection'
        self._image_sub = self.create_subscription(
            ObjectsInBoxes, self.sub_topic_name, self._face_info_cb, 1)

        # 初期位置にヘッドを移動。
        self.akari.set_goal_position({"joint_names": self.akari.get_joint_names(),
                                      "values": [self.default_pan, self.default_tilt]})

    def _bow(self):
        """
        おじぎモーション
        """
        # コマンドラインに表示
        self.get_logger().debug("Hello Akari World!")
        # おじぎは30度！
        self.akari.set_goal_position({"joint_names": self.akari.get_joint_names(),
                                      "values": [self.akari.get_present_position(
                                          self.akari.get_joint_names())[0], -0.523599]})
        # おじぎは3秒！
        time.sleep(3.0)
        # 頭を上げる
        self.akari.set_goal_position({"joint_names": self.akari.get_joint_names(),
                                      "values": [self.akari.get_present_position(
                                          self.akari.get_joint_names())[0], self.default_tilt]})
        # 休憩も3秒！
        time.sleep(3.0)

    def _face_info_cb(self, data):
        """
        OpenVINOのtopicをsubscribeした時に実行される。
        顔の有無に関わらず定期的にpublishされている。
        """
        # 顔が認識されていた場合おじぎをする。
        if data.objects_vector:
            self._bow()


def main(args=None):
    """
    起動するとここが実行される
    """
    # rclpyを初期化してHelloAkariWorldクラスを立ち上げる
    rclpy.init(args=args)
    hello_akari_world = HelloAkariWorld()
    # rclpyが生きている間は周期実行される
    while rclpy.ok():
        rclpy.spin_once(hello_akari_world, timeout_sec=0.001)
    rclpy.shutdown()


if __name__ == '__main__':
    main()
