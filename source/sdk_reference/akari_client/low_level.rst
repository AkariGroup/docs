##############
低レイヤー実装
##############

.. module:: akari_client

gRPC クライアント
=================

.. autoclass:: akari_client.grpc.m5stack.M5StackClient
    :member-order: bysource

.. autoclass:: akari_client.grpc.joints_controller.GrpcJointController
    :member-order: bysource

.. autofunction:: akari_client.grpc.factory.create_joint_manager
    :member-order: bysource

.. autofunction:: akari_client.grpc.factory.create_m5stack_client
    :member-order: bysource

Serial クライアント
===================

.. autoclass:: akari_client.serial.dynamixel.DynamixelController
    :member-order: bysource

.. autoclass:: akari_client.serial.dynamixel.DynamixelControlTable
    :member-order: bysource

.. autoclass:: akari_client.serial.dynamixel_communicator.DynamixelCommunicator
    :member-order: bysource

.. autoclass:: akari_client.serial.m5stack.M5StackSerialClient
    :member-order: bysource

.. autoclass:: akari_client.serial.m5stack_communicator.M5SerialCommunicator
    :member-order: bysource

.. autofunction:: akari_client.serial.factory.create_joint_manager
    :member-order: bysource

.. autofunction:: akari_client.serial.factory.create_m5stack_client
    :member-order: bysource
