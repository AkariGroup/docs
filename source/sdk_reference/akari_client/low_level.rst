##############
低レイヤー実装
##############

.. module:: akari_client

gRPC クライアント
=================

.. autoclass:: akari_client.grpc.m5stack.M5StackClient

.. autoclass:: akari_client.grpc.joints_controller.GrpcJointController

.. autofunction:: akari_client.grpc.factory.create_joint_manager

.. autofunction:: akari_client.grpc.factory.create_m5stack_client

Serial クライアント
===================

.. autoclass:: akari_client.serial.dynamixel.DynamixelController

.. autoclass:: akari_client.serial.dynamixel.DynamixelControlTable

.. autoclass:: akari_client.serial.dynamixel_communicator.DynamixelCommunicator

.. autoclass:: akari_client.serial.m5stack.M5StackSerialClient

.. autoclass:: akari_client.serial.m5stack_communicator.M5SerialCommunicator

.. autofunction:: akari_client.serial.factory.create_joint_manager

.. autofunction:: akari_client.serial.factory.create_m5stack_client
