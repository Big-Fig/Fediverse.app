import 'package:flutter/material.dart';
import 'package:phaze/Pages/Post/ComposeStatus.dart';
import 'package:phaze/Pages/Post/Gallery/GalleryCapture.dart';
import 'package:phaze/Pages/Post/Photo/PhotoCapture.dart';
import 'package:phaze/Pages/Post/TakeMediaController.dart';
import 'package:phaze/Pages/Post/Video/VideoCapture.dart';
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
  List<AppBar> _appBar;
  List<Widget> _children = <Widget>[];

  @override
  void initState() {
    super.initState();
    _children = [
      VideoCapture(videoTaken),
      PhotoCapture(photoTaken),
      GalleryCapture(gallerySelected),
    ];
    _controller = TabController(vsync: this, length: 3);
    _controller.addListener(_controllerChanged);
    _appBar = _appBar = [
      AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("New Post"),
      ),
      AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("New Post"),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ComposeStatus(
                    asset: selectedAsset,
                    popParent: pop,
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
    print("WE ARE FUCKING POPING");
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  videoTaken(String uri) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ComposeStatus(
          videoURL: uri,
          popParent: pop,
        ),
      ),
    );
  }

  photoTaken(String uri) {
    print(uri);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ComposeStatus(
          imageURL: uri,
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
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
              backgroundColor: Colors.grey,
              title: Text('Video'),
              icon: Container(height: 0.0)),
          new BottomNavigationBarItem(
              backgroundColor: Colors.grey,
              title: Text('Photo'),
              icon: Container(height: 0.0)),
          new BottomNavigationBarItem(
            backgroundColor: Colors.grey,
            title: Text('Gallery'),
            icon: Container(height: 0.0),
          ),
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
