***********************************************************
認識機能を試してみよう
***********************************************************

AKARIのヘッドカメラであるOAK-D Liteを使った、認識機能のサンプルを動かしてみましょう。

===========================================================
仮想環境の有効化
===========================================================

仮想環境を有効化していなければ、下記のコマンドで仮想環境を有効化します。

.. code-block:: bash

   cd ~/akari_software
   source venv/bin/activate

===========================================================
顔認識を試してみよう
===========================================================

| 最初に顔認識アプリを試してみましょう。
| まずface_detectionのディレクトリに移動します。

   .. code-block:: bash

      cd ~/akari_software/samples/depthai_sample/face_detection


| 次にface_detection.pyを実行します。

   .. code-block:: bash

      python3 face_detection.py

| 映像をストリーミングするウィンドウが立ち上がって、顔が画面内に写っていると、顔の枠と目、鼻、口の特徴点のプロット、確からしさの数字(0~1)が表示されます。
| カメラ映像のウインドウ上で"q"を押すと終了します。


===========================================================
顔追従を試してみよう
===========================================================

..  youtube:: WEss7OVRRiM

| ここでは、顔認識にプラスして、認識した顔の方をAKARIが追いかけてくれる顔追従も試してみましょう。
| まずface_detectionのディレクトリに移動します。

   .. code-block:: bash

      cd ~/akari_software/samples/depthai_sample/face_detection


| 次にface_tracking.pyを実行します。

   .. code-block:: bash

      python3 face_tracking.py

| 顔認識と同様の認識ウインドウが立ち上がります。
| 顔を動かすと、AKARIのヘッドが動いて顔を追従してくれます。
| カメラ映像のウインドウ上で"q"を押すと終了します。

===========================================================
物体認識を試してみよう(mobilenet-ssd版)
===========================================================

| 次に物体認識アプリを試してみましょう。
| depthai_sampleでは、mobilenet-ssd, YOLOv3-tiny, YOLOv4-tinyの3種類の物体認識が実行できます。

まずobject_recognitionのディレクトリに移動します。

   .. code-block:: bash

      cd ~/akari_software/samples/depthai_sample/object_recognition

mobilenet-ssdの物体認識を実行したい場合は、下記を実行します。

   .. code-block:: bash

      python3 mobilenet.py

| 映像をストリーミングするウィンドウが立ち上がって、認識可能な物体が画面内に写っていると、枠と認識した物体名、その確からしさの数字(0~100%)が表示されます。
| カメラ映像のウインドウ上で"q" を押すと終了します。
| mobilenetで認識できる物体の一覧は下記のとおりです。

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


===========================================================
物体認識を試してみよう(YOLO版)
===========================================================

| 次にYOLOの物体認識を試してみます。mobolenetと同じobject_recognitionのディレクトリで実行できます。
| デフォルトの状態で起動すると、YOLOv4tinyが起動するようになっています。

.. code-block:: bash

   python3 tiny_yolo.py

| 下記のコマンドで、別のモデルで物体認識を起動することもできます。

YOLOv6n

.. code-block:: bash

   python3 tiny_yolo.py -n yolov6n_coco_416x416 -c configs/yolov6n_coco_416x416.json

YOLOv7tiny

.. code-block:: bash

   python3 tiny_yolo.py -n yolov7tiny_coco_416x416 -c configs/yolov7tiny_coco_416x416.json

| どの場合でも映像をストリーミングするウィンドウが立ち上がって、認識可能な物体が画面内に写っていると、枠と認識した物体名、その確からしさの数字(0~100%)が表示されます。
| カメラ映像のウインドウ上で"q"を押すと終了します。
| YOLOで認識できる物体の一覧は下記のとおりです。

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

| また、このアプリでは、オリジナルの物体認識を作成し、それを実行することもできます。
| 詳しくは、 :doc:`../dev/custom_object_detection/main` をご覧ください。


:doc:`test_uvc_camera` へ進む

:doc:`test_sample_app` へ戻る
