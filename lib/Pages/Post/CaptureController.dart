import 'package:flutter/material.dart';
import 'package:phaze/Pages/Post/ComposeStatus.dart';
import 'package:phaze/Pages/Post/Gallery/GalleryCapture.dart';
import 'package:phaze/Pages/Post/Photo/PhotoCapture.dart';
import 'package:phaze/Pages/Post/Photo/PhotoFile.dart';
import 'package:phaze/Pages/Post/TextCapture.dart';
import 'package:phaze/Pages/Post/TextEditor.dart';
import 'package:phaze/Pages/Post/Video/VideoCapture.dart';
import 'package:phaze/Pages/Post/Video/VideoFIle.dart';
import 'package:photo_manager/photo_manager.dart';

class CaptureController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CaptureController();
  }
}

class _CaptureController extends State<CaptureController>
    with TickerProviderStateMixin {
  ValueNotifier<int> _showNext = ValueNotifier<int>(0);
  AssetEntity selectedAsset;
  TabController _controller;
  TextCapture textCaptureController;

  TextEditingController statusController = TextEditingController();

  List<AppBar> _appBar;
  List<Widget> _children = <Widget>[];

  @override
  void initState() {
    super.initState();
    textCaptureController = TextCapture(pop, statusController);
    _children = [
      VideoCapture(videoTaken),
      PhotoCapture(photoTaken),
      GalleryCapture(gallerySelected),
      textCaptureController
    ];
    _controller = TabController(vsync: this, length: 3);
    _controller.addListener(_controllerChanged);
    _appBar = [
      // Video Capture AppBar
      AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("New Post"),
      ),
      // Camera Capture AppBar
      AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("New Post"),
      ),
      // Gallery Capture AppBar
      AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("New Post"),
        actions: <Widget>[
          FlatButton(
            child: Text("Next"),
            textColor: Colors.white,
            color: Colors.transparent,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => TextEditor(
                    assets: [selectedAsset],
                    popParent: pop,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("New Post"),
        actions: <Widget>[
          FlatButton(
            child: Text("Next"),
            textColor: Colors.white,
            color: Colors.transparent,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ComposeStatus(
                    htmlPost: statusController.text,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ];
  }

  void tabTapped(int index) {}

  _controllerChanged() {
    print("change");
    if (_controller.index == 1) {
      _showNext.value = 1;
    } else {
      _showNext.value = 0;
    }
  }

  pop() {
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  videoTaken(String uri) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TextEditor(
          assets: [VideoFile(uri)],
          popParent: pop,
        ),
      ),
    );
  }

  photoTaken(String uri) {
    print(uri);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TextEditor(
          assets: [PhotoFile(uri)],
          popParent: pop,
        ),
      ),
    );
  }

  gallerySelected(AssetEntity asset) {
    selectedAsset = asset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar[_currentIndex],
      body: Container(
        child: _children[_currentIndex],
        color: Colors.black,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, //
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          new BottomNavigationBarItem(
            title: Container(height: 0.0),
            icon: Icon(Icons.videocam),
          ),
          new BottomNavigationBarItem(
            title: Container(height: 0.0),
            icon: Icon(Icons.camera_alt),
          ),
          new BottomNavigationBarItem(
            title: Container(height: 0.0),
            icon: Icon(Icons.photo_library),
          ),
          new BottomNavigationBarItem(
              title: Container(height: 0.0), icon: Icon(Icons.text_fields)),
        ],
      ),
    );
  }

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
