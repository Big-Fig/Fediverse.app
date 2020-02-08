//import 'package:easy_localization/easy_localization.dart';
//import 'package:flutter/material.dart';
//import 'package:fedi/Pages/Post/ComposeStatus.dart';
//import 'package:fedi/media/gallery/GalleryCapture.dart';
//import 'package:fedi/media/image/capture/PhotoCapture.dart';
//import 'package:fedi/Pages/Post/Photo/PhotoFile.dart';
//import 'package:fedi/Pages/Post/TextCapture.dart';
//import 'package:fedi/Pages/Post/TextEditor.dart';
//import 'package:fedi/media/video/capture/VideoCapture.dart';
//import 'package:fedi/Pages/Post/Video/VideoFIle.dart';
//import 'package:photo_manager/photo_manager.dart';
//
//class CaptureController extends StatefulWidget {
//  final Function close;
//
//  CaptureController(this.close);
//
//  @override
//  State<StatefulWidget> createState() {
//    return _CaptureController();
//  }
//}
//
//class _CaptureController extends State<CaptureController>
//    with TickerProviderStateMixin {
//  ValueNotifier<int> _showNext = ValueNotifier<int>(0);
//  AssetEntity selectedAsset;
//  TabController _controller;
//  TextCapture textCaptureController;
//
//  TextEditingController statusController = TextEditingController();
//
//  List<AppBar> _appBar;
//  List<Widget> _children = <Widget>[];
//
//  @override
//  void initState() {
//    super.initState();
//    textCaptureController = TextCapture(pop, statusController);
//    _children = [
//      VideoCapture(videoTaken),
//      PhotoCapture(photoTaken),
//      GalleryCapture(gallerySelected),
//      textCaptureController
//    ];
//    _controller = TabController(vsync: this, length: 3);
//    _controller.addListener(_controllerChanged);
//    var newPostLabel = AppLocalizations.of(context)
//        .tr("post.capture.action.new_post");
//    _appBar = [
//      // Video Capture AppBar
//      AppBar(
//        leading: IconButton(
//          icon: Icon(Icons.close),
//          onPressed: () {
//           widget.close();
//          },
//        ),
//        title: Text(newPostLabel),
//      ),
//      // Camera Capture AppBar
//      AppBar(
//        leading: IconButton(
//          icon: Icon(Icons.close),
//          onPressed: () {
//            widget.close();
//           // Navigator.pop(context);
//          },
//        ),
//        title: Text(newPostLabel),
//      ),
//      // Gallery Capture AppBar
//      AppBar(
//        leading: IconButton(
//          icon: Icon(Icons.close),
//          onPressed: () {
//             widget.close();
//          },
//        ),
//        title: Text(newPostLabel),
//        actions: <Widget>[
//          FlatButton(
//            child: Text(AppLocalizations.of(context)
//                .tr("post.capture.action.next")),
//            textColor: Colors.white,
//            color: Colors.transparent,
//            onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => TextEditor(
//                    assets: [selectedAsset],
//                    popParent: pop,
//                    close: widget.close,
//                  ),
//                ),
//              );
//            },
//          ),
//        ],
//      ),
//      AppBar(
//        leading: IconButton(
//          icon: Icon(Icons.close),
//          onPressed: () {
//            Navigator.pop(context);
//          },
//        ),
//        title: Text(newPostLabel),
//        actions: <Widget>[
//          FlatButton(
//            child: Text("Next"),
//            textColor: Colors.white,
//            color: Colors.transparent,
//            onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => ComposeStatus(
//                    htmlPost: statusController.text,
//                    close: widget.close,
//                  ),
//                ),
//              );
//            },
//          ),
//        ],
//      ),
//    ];
//  }
//
//  void tabTapped(int index) {}
//
//  _controllerChanged() {
//    print("change");
//    if (_controller.index == 1) {
//      _showNext.value = 1;
//    } else {
//      _showNext.value = 0;
//    }
//  }
//
//  pop() {
//     widget.close();
//  }
//
//  videoTaken(String uri) {
//    Navigator.push(
//      context,
//      MaterialPageRoute(
//        builder: (context) => TextEditor(
//          assets: [VideoFile(uri)],
//          popParent: pop,
//          close: widget.close,
//        ),
//      ),
//    );
//  }
//
//  photoTaken(String uri) {
//    print(uri);
//    Navigator.push(
//      context,
//      MaterialPageRoute(
//        builder: (context) => TextEditor(
//          assets: [PhotoFile(uri)],
//          popParent: pop,
//          close: widget.close,
//        ),
//      ),
//    );
//  }
//
//  gallerySelected(AssetEntity asset) {
//    selectedAsset = asset;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: _appBar[_currentIndex],
//      body: Container(
//        child: _children[_currentIndex],
//        color: Colors.black,
//      ),
//      bottomNavigationBar: BottomNavigationBar(
//        onTap: onTabTapped, // new
//        currentIndex: _currentIndex, //
//        selectedItemColor: Colors.blue,
//        unselectedItemColor: Colors.grey,
//        items: [
//          new BottomNavigationBarItem(
//            title: Container(height: 0.0),
//            icon: Icon(Icons.videocam),
//          ),
//          new BottomNavigationBarItem(
//            title: Container(height: 0.0),
//            icon: Icon(Icons.camera_alt),
//          ),
//          new BottomNavigationBarItem(
//            title: Container(height: 0.0),
//            icon: Icon(Icons.photo_library),
//          ),
//          new BottomNavigationBarItem(
//              title: Container(height: 0.0), icon: Icon(Icons.text_fields)),
//        ],
//      ),
//    );
//  }
//
//  int _currentIndex = 0;
//
//  void onTabTapped(int index) {
//    setState(() {
//      _currentIndex = index;
//    });
//  }
//}
