import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:phaze/Pages/Post/Gallery/GalleryCapture.dart';
import 'package:phaze/Pages/Post/Photo/PhotoCapture.dart';
import 'package:phaze/Pages/Post/TextCapture.dart';
import 'package:phaze/Pages/Post/TextEditor.dart';
import 'package:phaze/Pages/Post/Video/VideoCapture.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:zefyr/zefyr.dart';
import 'package:quill_delta/quill_delta.dart';

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
  ZefyrController zefyrController;

  List<AppBar> _appBar;
  List<Widget> _children = <Widget>[];
  NotusDocument document;

  @override
  void initState() {
    super.initState();
    print("THIS IS THE INITING OF THE CAPTURE CONTROLLER");
    _loadDocument();
    _children = [
      VideoCapture(videoTaken),
      PhotoCapture(photoTaken),
      GalleryCapture(gallerySelected),
      TextCapture(document)
    ];
    _controller = TabController(vsync: this, length: 3);
    _controller.addListener(_controllerChanged);
    _appBar = [
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
                  builder: (context) => TextEditor(
                    document: document,
                    asset: selectedAsset,
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TextEditor(
                    document: document,
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
        builder: (context) => TextEditor(
          document: document,
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
        builder: (context) => TextEditor(
          document: document,
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
            title:Container(height: 0.0),
            icon: Icon(Icons.videocam),
          ),
          new BottomNavigationBarItem(
            title:Container(height: 0.0),
            icon:  Icon(Icons.camera_alt),
          ),
          new BottomNavigationBarItem(
            title: Container(height: 0.0),
            icon: Icon(Icons.photo_library),
          ),
          new BottomNavigationBarItem(
            title: Container(height: 0.0),
            icon: Icon(Icons.text_fields)
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


   /// Loads the document asynchronously from a file if it exists, otherwise
  /// returns default document.
  Future<NotusDocument> _loadDocument() async {
    final file = File(Directory.systemTemp.path + "/quick_start.json");
    if (await file.exists()) {
      final contents = await file
          .readAsString()
          .then((data) => Future.delayed(Duration(seconds: 1), () => data));
      return NotusDocument.fromJson(jsonDecode(contents));
    }
    final Delta delta = Delta()..insert("\n");
    return NotusDocument.fromDelta(delta);
  }
}
