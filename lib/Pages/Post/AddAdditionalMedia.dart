import 'package:flutter/material.dart';
import 'package:fedi/Pages/Post/Gallery/GalleryCapture.dart';
import 'package:fedi/Pages/Post/Photo/PhotoCapture.dart';
import 'package:fedi/Pages/Post/Video/VideoCapture.dart';
import 'package:photo_manager/photo_manager.dart';

class AddAddtionalMedia extends StatefulWidget {
  final Function(String) videoTaken;
  final Function(String) photoTaken;
  final Function(AssetEntity) gallerySelected;

  AddAddtionalMedia({this.videoTaken, this.photoTaken, this.gallerySelected});

  @override
  State<StatefulWidget> createState() {
    return _AddAddtionalMedia();
  }
}

class _AddAddtionalMedia extends State<AddAddtionalMedia>
    with TickerProviderStateMixin {
  ValueNotifier<int> _showNext = ValueNotifier<int>(0);
  AssetEntity selectedAsset;
  TabController _controller;

  TextEditingController statusController = TextEditingController();

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
    _appBar = [
      // Video Capture AppBar
      AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Add to post"),
      ),
      // Camera Capture AppBar
      AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Add to post"),
      ),
      // Gallery Capture AppBar
      AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Add to post"),
        actions: <Widget>[
          FlatButton(
            child: Text("Add"),
            textColor: Colors.white,
            color: Colors.transparent,
            onPressed: () {
              widget.gallerySelected(selectedAsset);

              Navigator.pop(context);
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
    widget.videoTaken(uri);
    Navigator.pop(context);
  }

  photoTaken(String uri) {
    widget.photoTaken(uri);
    Navigator.pop(context);
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
        selectedItemColor: Colors.blue,
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
