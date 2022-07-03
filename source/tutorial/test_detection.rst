***********************************
認識機能を試してみよう
***********************************

AKARIのヘッドカメラであるOAK-D Liteを使った、認識機能のサンプルを動かしてみましょう。

.. note::

   AKARIのソフトはpoetryというpythonの仮想環境マネージャーを用いてセットアップされています。

   AKARIのアプリを実行する際は、最初にこの仮想環境へ移動する必要があります。

   akari_main直下へ移動し、 `poetry shell` を実行して仮想環境を立ち上げます。

      .. code-block:: bash

         $ cd akari_main
         $ poetry shell

=============================
顔認識を試してみよう
=============================

最初に顔認識アプリを試してみましょう。

まずface_detectionのディレクトリに移動します。

   .. code-block:: bash

      $ cd src/depthai_sample/face_detection

次にmain.pyを実行します。

   .. code-block:: bash

      $ python3 main.py

映像をストリーミングするウィンドウが立ち上がって、顔が画面内に写っていると、顔の枠と目、鼻、口の特徴点のプロット、確からしさの数字(0~1)が表示されます。

カメラ映像のウインドウ上で"q"を押すと終了します。

===========================================
物体認識を試してみよう(mobilenet-ssd版)
===========================================

次に物体認識アプリを試してみましょう。
depthai_sampleでは、mobilenet-ssd, YOLOv3-tiny, YOLOv4-tinyの3種類の物体認識が実行できます。

まずobject_recognitionのディレクトリに移動します。

   .. code-block:: bash

      $ cd src/depthai_sample/object_recognition

mobilenet-ssdの物体認識を実行したい場合は、下記を実行します。

   .. code-block:: bash

      $ python3 mobilenet.py

映像をストリーミングするウィンドウが立ち上がって、認識可能な物体が画面内に写っていると、枠と認識した物体名、その確からしさの数字(0~100%)が表示されます。

カメラ映像のウインドウ上で"q" を押すと終了します。

mobilenetで認識できる物体の一覧は下記のとおりです。

   - aeroplane
   - bicycle
   - bird
   - boat
   - bottle
   - bus
   - car
   - cat
   - chair
   - cow
   - diningtable
   - dog
   - horse
   - motorbike
   - person
   - pottedplant
   - sheep
   - sofa
   - train
   - tvmonitor

また、このアプリでは、オリジナルの物体認識を作成し、それを実行することもできます。

詳しくは、 :doc:`../dev/custom_object_detection/main` をご覧ください。

===========================================
物体認識を試してみよう(YOLO版)
===========================================

次にYOLOの物体認識を試してみます。mobolenetと同じobject_recognitionのディレクトリで実行できます。

デフォルトの状態で起動すると、YOLOv4-tinyが起動するようになっています。

.. code-block:: bash

   $ python3 tiny_yolo.py

YOLOv3-tinyを起動したい場合は、YOLOv3-tinyのモデルをオプションで指定する必要があります。

.. code-block:: bash

   $ python3 tiny_yolo.py -n models/yolo-v3-tiny-tf_openvino_2021.4_6shave.blob

どちらの場合でも映像をストリーミングするウィンドウが立ち上がって、認識可能な物体が画面内に写っていると、枠と認識した物体名、その確からしさの数字(0~100%)が表示されます。

カメラ映像のウインドウ上で"q"を押すと終了します。

YOLOで認識できる物体の一覧は下記のとおりです。

   - person
   - bicycle
   - car
   - motorbike
   - aeroplane
   - bus
   - train
   - truck
   - boat
   - traffic light
   - fire hydrant
   - stop sign
   - parking meter
   - bench
   - bird
   - cat
   - dog
   - horse
   - sheep
   - cow
   - elephant
   - bear
   - zebra
   - giraffe
   - backpack
   - umbrella
   - handbag
   - tie
   - suitcase
   - frisbee
   - skis
   - snowboard
   - sports ball
   - kite
   - baseball bat
   - baseball glove
   - skateboard
   - surfboard
   - tennis racket
   - bottle
   - wine glass
   - cup
   - fork
   - knife
   - spoon
   - bowl
   - banana
   - apple
   - sandwich
   - orange
   - broccoli
   - carrot
   - hot dog
   - pizza
   - donut
   - cake
   - chair
   - sofa
   - pottedplant
   - bed
   - diningtable
   - toilet
   - tvmonitor
   - laptop
   - mouse
   - remote
   - keyboard
   - cell phone
   - microwave
   - oven
   - toaster
   - sink
   - refrigerator
   - book
   - clock
   - vase
   - scissors
   - teddy bear
   - hair drier
   - toothbrush
