import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:video_player/video_player.dart';

List<CameraDescription> cameras = <CameraDescription>[];

class VideoCapture extends StatefulWidget {
  final Function(String) videoTaken;
  VideoCapture(this.videoTaken);

  @override
  State<StatefulWidget> createState() {
    return _VideoCapture();
  }
}

class _VideoCapture extends State<VideoCapture> {
  Stopwatch videoLength = Stopwatch();
  int maxLength = 10000;
  Timer timer;

  String videoPath;
  VideoPlayerController videoController;
  VoidCallback videoPlayerListener;
  bool enableAudio = true;

  // 0 is not used
  // 1 is in recording
  // 2 is paused
  // 3 is stopped
  ValueNotifier<int> _cameraStatus = ValueNotifier<int>(0);
  ValueNotifier<int> _videoDuration = ValueNotifier<int>(0);

  CameraController controller;
  int currentCamera = 1;

  @override
  void initState() {
    super.initState();

    availableCameras().then((list) {
      cameras = list;
      controller =
          CameraController(cameras[currentCamera], ResolutionPreset.high);
      controller.initialize().then((_) {
        print("setting state");
        if (!mounted) {
          return;
        }
        setState(() {});
      }).catchError((e) {
        print(e);
      });
    }).catchError((e) {
      print(e);
    });

    timer =
        Timer.periodic(Duration(seconds: 1), (Timer t) => stopWatchUpdated());
  }

  stopWatchUpdated() {
    _videoDuration.value = videoLength.elapsedMilliseconds ~/ 1000;
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return Container();
    }

    if (!controller.value.isInitialized) {
      return Container();
    }
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Center(
                    child: _cameraPreviewWidget(),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        if (videoLength.elapsedTicks == 0)
          Padding(
            padding: EdgeInsets.only(bottom: 60, left: 40),
            child: Container(
              alignment: Alignment(-1, 1),
              child: IconButton(
                iconSize: 40,
                color: Colors.white,
                icon: Icon(Icons.sync),
                onPressed: () {
                  currentCamera = currentCamera == 0 ? 1 : 0;
                  controller = CameraController(
                      cameras[currentCamera], ResolutionPreset.high);
                  controller.initialize().then((_) {
                    if (!mounted) {
                      return;
                    }
                    setState(() {});
                  });
                },
              ),
            ),
          ),
        ValueListenableBuilder(
          builder: (BuildContext context, int value, Widget child) {
            print(value);
            if (value == 1) {
              // recording
              return Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Container(
                  alignment: Alignment(0, 1),
                  child: IconButton(
                    color: Colors.red,
                    iconSize: 80,
                    icon: Icon(Icons.pause_circle_outline),
                    onPressed: () async {
                      onPauseButtonPressed();
                    },
                  ),
                ),
              );
            } else if (value == 2) {
              // paused
              return Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Container(
                  alignment: Alignment(0, 1),
                  child: IconButton(
                    color: Colors.red,
                    iconSize: 80,
                    icon: Icon(Icons.radio_button_checked),
                    onPressed: () async {
                      onResumeButtonPressed();
                    },
                  ),
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Container(
                  alignment: Alignment(0, 1),
                  child: IconButton(
                    color: value == 0 ? Colors.white54 : Colors.red,
                    iconSize: 80,
                    icon: Icon(Icons.radio_button_checked),
                    onPressed: () async {
                      onVideoRecordButtonPressed();
                    },
                  ),
                ),
              );
            }
          },
          valueListenable: _cameraStatus,
        ),
        ValueListenableBuilder(
          builder: (BuildContext context, int value, Widget child) {
            return Opacity(
              opacity: value == 0 ? 0 : 1,
              child: Padding(
                padding: EdgeInsets.only(bottom: 60, right: 40),
                child: Container(
                  alignment: Alignment(1, 1),
                  child: IconButton(
                    color: Colors.red,
                    iconSize: 40,
                    icon: Icon(Icons.stop),
                    onPressed: () async {
                      if (_cameraStatus.value != 3) {
                        onStopButtonPressed();
                      }
                    },
                  ),
                ),
              ),
            );
          },
          valueListenable: _cameraStatus,
        ),
        Visibility(visible: false, child: 
        ValueListenableBuilder(
          valueListenable: _videoDuration,
          builder: (BuildContext context, int value, Widget child) {
            if (value >= maxLength && _cameraStatus.value != 3) {
              onStopButtonPressed();
            }
            return Padding(
                padding: EdgeInsets.all(20),
                child: Stack(
                  alignment: Alignment(-1, -1),
                  children: <Widget>[
                    Container(
                      width: 40,
                      alignment: Alignment(-1, -1),
                      child: Column(
                        children: <Widget>[
                          CircularPercentIndicator(
                            radius: 40.0,
                            lineWidth: 4.0,
                            animation: false,
                            percent:
                                value / maxLength >= 1 ? 1 : value / maxLength,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (value == 0) {
                          return;
                        }
                        videoLength.stop();
                        pauseVideoRecording().then((_) {
                          if (mounted) setState(() {});
                          showDialog(
                            context: this.context,
                            builder: (BuildContext context) {
                              var appLocalizations = AppLocalizations.of(context);
                              // return object of type Dialog
                              return AlertDialog(
                                title: new Text(appLocalizations
                                    .tr("post.video.capture.pause.alert"
                                    ".title")),
                                content: new Text(
                                    appLocalizations
                                        .tr("post.video.capture.pause.alert"
                                        ".content")),
                                actions: <Widget>[
                                  FlatButton(
                                    child: new Text(
                                      appLocalizations
                                          .tr("post.video.capture.pause.alert"
                                          ".action.cancel"),
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  // usually buttons at the bottom of the dialog
                                  FlatButton(
                                    child: new Text(
                                      appLocalizations
                                          .tr("post.video.capture.pause.alert"
                                          ".action.delete"),
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                    onPressed: () {
                                      controller.stopVideoRecording();
                                      _cameraStatus.value = 0;
                                      videoLength.stop();
                                      videoLength.reset();
                                      if (mounted) {
                                        setState(() {});
                                      }
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        });
                      },
                      child: Container(
                        width: 15,
                        child: Opacity(
                          child: IconButton(
                            icon: Icon(Icons.close),
                            color: Colors.red,
                            onPressed: () {
                              videoLength.stop();
                              pauseVideoRecording().then((_) {
                                if (mounted) setState(() {});
                                showDialog(
                                  context: this.context,
                                  builder: (BuildContext context) {
                                    var appLocalizations = AppLocalizations.of(context);
                                    // return object of type Dialog
                                    return AlertDialog(
                                      title: new Text(appLocalizations
                                          .tr("post.video.capture.pause.alert"
                                          ".title")),
                                      content: new Text(
                                          appLocalizations
                                              .tr("post.video.capture.pause.alert"
                                              ".content")),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: new Text(
                                            appLocalizations
                                                .tr("post.video.capture.pause.alert"
                                                ".action.cancel"),
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        // usually buttons at the bottom of the dialog
                                        FlatButton(
                                          child: new Text(
                                            appLocalizations
                                                .tr("post.video.capture.pause.alert"
                                                ".action.delete"),
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                          onPressed: () {
                                            controller.stopVideoRecording();
                                            _cameraStatus.value = 0;
                                            videoLength.stop();
                                            videoLength.reset();
                                            if (mounted) {
                                              setState(() {});
                                            }
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                            },
                          ),
                          opacity: _cameraStatus.value == 0 ? 0 : 1,
                        ),
                      ),
                    ),
                  ],
                ));
          },
        ),),
      ],
    );
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    //. Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  resetVideo() {}

  void onVideoRecordButtonPressed() {
    _cameraStatus.value = 1;
    videoLength.start();
    startVideoRecording().then((String filePath) {
      if (mounted) setState(() {});
      if (filePath != null) showInSnackBar(AppLocalizations.of(context)
          .tr("post.video.capture.finishing.saving", args: [filePath]));
    }).catchError((e) {
      print(e);
    });
  }

  Future onStopButtonPressed() async {
    print("stop");
    _cameraStatus.value = 3;
    await stopVideoRecording();
    videoLength.stop();

    widget.videoTaken(videoPath);
    if (mounted) setState(() {});
  }

  void onPauseButtonPressed() {
    _cameraStatus.value = 2;
    videoLength.stop();
    pauseVideoRecording().then((_) {
      if (mounted) setState(() {});
    });
  }

  void onResumeButtonPressed() {
    _cameraStatus.value = 1;
    videoLength.start();
    resumeVideoRecording().then((_) {
      if (mounted) setState(() {});
      showInSnackBar(AppLocalizations.of(context)
          .tr("post.video.capture.resume.resumed"));
    });
  }

  Future<String> startVideoRecording() async {
    if (!controller.value.isInitialized) {
      showInSnackBar(AppLocalizations.of(context)
          .tr("post.video.capture.error.select_camera_first"));
      return null;
    }

    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Movies/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.mp4';

    if (controller.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return null;
    }

    try {
      videoPath = filePath;
      await controller.startVideoRecording(filePath);
    } on CameraException catch (e) {
      print(e);
      return null;
    }
    return filePath;
  }

  Future<void> stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.stopVideoRecording();
    } on CameraException catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> pauseVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.pauseVideoRecording();
    } on CameraException catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> resumeVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.resumeVideoRecording();
    } on CameraException catch (e) {
      print(e);
      return null;
    }
  }

  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return Text(
        AppLocalizations.of(context)
            .tr("post.video.capture.preview.loading"),
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller),
      );
    }
  }
}
