***********************************************************
拡張機能の紹介③ AKARIブロック(簡易版)
***********************************************************

| ここでは、AKARIの各APIを実行可能な拡張機能であるAKARIブロック(簡易版)の各ブロックを紹介します。


モータ制御
-----------------------------------------------------------

サーボをONにする
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_motor_01.jpg
    :height: 60px

  |

  Block type:
    COMMAND
  Ref:
    | ヘッドのサーボを全軸ONにします。

サーボをOFFにする
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_motor_02.jpg
    :height: 60px

  |

  Block type:
    COMMAND
  Ref:
    | ヘッドのサーボを全軸OFFにします。

[ヘッドの向き]のばしょ
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_motor_03.jpg
    :height: 60px

  |

  Block type:
    REPORTER
  Ref:
    | 指定した[ヘッドの向き]の現在角度を取得します。

[ヘッドの向き]を[角度]°にうごかす
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_motor_04.jpg
    :height: 60px

  |

  Block type:
    COMMAND
  Ref:
    | 指定した[ヘッドの向き]を指定した[角度]に移動します。
    | サーボをONにしていないと動作しません。

さゆうを[角度]°、じょうげを[角度]°にうごかす
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_motor_05.jpg
    :height: 60px

  |

  Block type:
    COMMAND
  Ref:
    | ヘッドの左右方向を[角度]に、上下方向を[角度]に移動します。
    | サーボをONにしていないと動作しません。

いまのばしょから[ヘッドの向き]に[角度]°うごかす
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_motor_06.jpg
    :height: 60px

  |

  Block type:
    COMMAND
  Ref:
    | 指定した[ヘッドの向き]を現在位置から指定した[角度]だけ移動します。
    | サーボをONにしていないと動作しません。

いまのばしょからさゆうに[角度]°、じょうげに[角度]°うごかす
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_motor_07.jpg
    :height: 60px

  |

  Block type:
    COMMAND
  Ref:
    | 現在位置から左右方向を[角度]、上下方向を[角度]だけ移動します。
    | サーボをONにしていないと動作しません。

モータのはやさを[はやく/ゆっくり/おそく]する
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_motor_08.jpg
    :height: 60px

  |

  Block type:
    COMMAND
  Ref:
    | モータの司令角速度を[はやく/ゆっくり/おそく]の3段階で変更します。


M5通信
-----------------------------------------------------------

ボタンの[ID]がおされたとき
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_m5_01.jpg
    :height: 60px

  |

  Block type:
    HAT
  Ref:
    | M5の[ID]のボタンが押された時に実行されます。
    | "どれか"の場合はどれか一つでも押された場合に実行されます。

ボタンの[ID]がおされた
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_m5_02.jpg
    :height: 60px

  |

  Block type:
    BOOLEAN
  Ref:
    | M5の[ID]のボタンが押されていたら真（True）、それ以外では偽（False）を返します。

デジタルにゅうりょくの[ID]がローになったとき
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_m5_03.jpg
    :height: 60px

  |

  Block type:
    HAT
  Ref:
    | [ID]番号のデジタル入力ピンがローになった時に実行されます。
    | "どれか"の場合はどれか一つでもローになった場合に実行されます。

デジタルにゅうりょくの[ID]がロー
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_m5_04.jpg
    :height: 60px

  |

  Block type:
    BOOLEAN
  Ref:
    | [ID]番号のデジタル入力ピンがローなら 真（True）、それ以外では偽（False）を返します。

アナログにゅうりょく
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_m5_05.jpg
    :height: 60px

  |

  Block type:
    REPORTER
  Ref:
    | アナログ入力ピンのアナログ入力値(0-3.3V)を0から4095の4096段階で返します。

[センサ]のあたい
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_m5_06.jpg
    :height: 60px

  |

  Block type:
    REPORTER
  Ref:
    | [センサ]の出力値を返します。
    | センサの種類はおんど(℃)、きあつ(Pa)、あかるさ(0から4095で出力。0が最も明るい)です。

デジタルしゅつりょく[ID]を[値]にする
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_m5_07.jpg
    :height: 60px

  |

  Block type:
    COMMAND
  Ref:
    | [ID]ばんごうのデジタルしゅつりょくピンを[値]にします。

PWMしゅつりょくを[値]にする
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_m5_08.jpg
    :height: 60px

  |

  Block type:
    COMMAND
  Ref:
    | PWM出力ピンのPWM出力を[値]にします。
    | 値範囲は0から255で、0で0V、255で3.3Vを出力します。


ディスプレイ制御
-----------------------------------------------------------

はいけいのいろを[色]にする
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_display_01.jpg
    :height: 60px

  |

  Block type:
    COMMAND
  Ref:
    | 画面表示を行う際の背景色を[色]に設定します。
    | このブロック単体ではM5にコマンドは送られません。

もじのいろを[色]にする
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_display_02.jpg
    :height: 60px

  |

  Block type:
    COMMAND
  Ref:
    | 画面表示を行う際の文字色を[色]に設定します。
    | このブロック単体ではM5にコマンドは送られません。

もじのおおきさを[サイズ]にする
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_display_03.jpg
    :height: 60px

  |

  Block type:
    COMMAND
  Ref:
    | 画面表示を行う際の文字サイズを[サイズ]に設定します。
    | サイズは1から11の範囲で設定可能です。
    | このブロック単体ではM5にコマンドは送られません。

がめんに[テキスト]をひょうじする
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_display_04.jpg
    :height: 60px

  |

  Block type:
    COMMAND
  Ref:
    | 画面に[テキスト]を表示します。
    | 背景色、文字色、文字サイズは前述のブロックで設定したものになります。
    | [テキスト]を空白にすることで、背景色のみ変更することができます。

がめんにがぞう[パス]をひょうじする
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  .. image:: ../images/scratch_beginner/block_display_05.jpg
    :height: 60px

  |

  Block type:
    COMMAND
  Ref:
    | 画面にM5のSDカード内の[パス]の画像を表示します。
    | あらかじめM5のSDカードに使用する画像を入れておき、SDカードのrootディレクトリからのパスを入力してください。

:doc:`ref_akari_camera_beginner` へ進む

:doc:`playing` へ戻る
