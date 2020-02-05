import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

List<CameraDescription> cameras = <CameraDescription>[];

class PhotoCapture extends StatefulWidget {
  final Function(String) photoTaken;
  PhotoCapture(this.photoTaken);

  @override
  State<StatefulWidget> createState() {
    return _PhotoCapture();
  }
}

class _PhotoCapture extends State<PhotoCapture> {
  // 0 is not used
  // 1 is in use
  ValueNotifier<int> _cameraStatus = ValueNotifier<int>(0);

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
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
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

            return Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Container(
                alignment: Alignment(0, 1),
                child: IconButton(
                  color: value == 0 ? Colors.white54 : Colors.red,
                  iconSize: 80,
                  icon: Icon(Icons.radio_button_checked),
                  onPressed: () async {
                    if (value > 0) {
                      return;
                    }
                    onTakePictureButtonPressed(context);
                    _cameraStatus.value = 1;
                  },
                ),
              ),
            );
          },
          valueListenable: _cameraStatus,
        ),
      ],
    );
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    //. Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<String> takePicture(BuildContext context) async {
    if (!controller.value.isInitialized) {
      showInSnackBar(AppLocalizations.of(context)
          .tr("post.photo.take_picture.error.select_camera_first"));
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await controller.takePicture(filePath);
    } on CameraException catch (e) {
      print(e);
      // _showCameraException(e);
      return null;
    }
    return filePath;
  }

  void onTakePictureButtonPressed(BuildContext context) {
    takePicture(context).then((String filePath) {
      if (mounted) {
        setState(() {
          // imagePath = filePath;
          // videoController?.dispose();
          // videoController = null;
        });
        if (filePath != null)
          showInSnackBar(AppLocalizations.of(context)
              .tr("post.photo.take_picture.saved", args: [filePath]));
        _cameraStatus.value = 0;
        widget.photoTaken(filePath);
      }
    });
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return Center(
        child: Text(
          AppLocalizations.of(context).tr("post.photo.preview.loading"),
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w900,
          ),
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
