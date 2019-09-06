import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:phaze/Pages/Post/Photo/PhotoCapture.dart';
import 'package:phaze/Pages/Post/Video/VideoCapture.dart';

class TakeMediaController extends StatefulWidget {
  final Function(String) videoTaken;
  final Function(String) photoTaken;

  TakeMediaController({this.videoTaken, this.photoTaken});

  @override
  State<StatefulWidget> createState() {
    return _TakeMediaController();
  }
}

enum CurrentView { CAMERA, VIDEO }

class _TakeMediaController extends State<TakeMediaController> {
  CurrentView current = CurrentView.CAMERA;
  Widget controller;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: <Widget>[getMediaCapture(), getIconbutton()],
      ),
    );
  }

  Widget getMediaCapture() {
    if (current == CurrentView.CAMERA) {
      controller = PhotoCapture(
        widget.photoTaken,
      );
    } else {
      controller = VideoCapture(
        widget.videoTaken,
      );
    }
    return controller;
  }

  switchToVideo() {
    
    current = CurrentView.VIDEO;
    if (mounted) setState(() { controller = null; });
  }

  switchToCamera() {
    current = CurrentView.CAMERA;
    if (mounted) setState(() { controller = null; });
  }

  Widget getIconbutton() {
    if (current == CurrentView.CAMERA) {
      return Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          alignment: Alignment(1, -1),
          child: IconButton(
            iconSize: 40,
            color: Colors.white,
            icon: Icon(Icons.switch_video),
            onPressed: () {
              switchToVideo();
            },
          ),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          alignment: Alignment(1, -1),
          child: IconButton(
            iconSize: 40,
            color: Colors.white,
            icon: Icon(Icons.switch_camera),
            onPressed: () {
              switchToCamera();
            },
          ),
        ),
      );
    }
  }
}
