import 'package:fedi/app/dm/media/dm_media_page.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/file/picker/file_picker_bloc.dart';
import 'package:fedi/file/picker/file_picker_bottom_nav_bar_widget.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/file/picker/single/single_file_picker_bloc.dart';
import 'package:fedi/file/picker/single/single_file_picker_bloc_impl.dart';
import 'package:fedi/file/picker/single/single_file_picker_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CaptureDMMediaWidget extends StatelessWidget {
  final Function(BuildContext context, String) mediaUploaded;

  final FilePickerTab selectedTab;

  CaptureDMMediaWidget(
      {@required this.mediaUploaded, @required this.selectedTab});

  @required
  Widget build(BuildContext context) {
    return DisposableProvider<ISingleFilePickerBloc>(create: (context) =>
        SingleFilePickerBloc(fileTypesToPick: [
          FilePickerFileType.image,
          FilePickerFileType.video
        ],
            captureEnabled: true,
            startActiveTab: selectedTab,
        fileSelectedCallback: (filePickerFile) {
          DMMediaPage(filePickerFile: filePickerFile,
            popParent: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            mediaUploaded: mediaUploaded,);
        }),
        // provide parent abstract implementation by type
        child: ProxyProvider<ISingleFilePickerBloc, IFilePickerBloc>(
          update: (_, ISingleFilePickerBloc value, __) => value,
          child: Scaffold(appBar: AppBar(leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),),
            title: Text("Choose media"),),
            body: SingleFilePickerBodyWidget(),
            bottomNavigationBar: FilePickerBottomNavBarWidget(),),));
  }
}

//class _CaptureDMMediaWidgetState extends State<CaptureDMMediaWidget> {
//  @override
//
//}
//
//class CaptureDMMediaWidget extends StatefulWidget {
//  final Function(BuildContext context, String) mediaUploaded;
//
//  final int selectedIndex;
//  CaptureDMMediaWidget(this.selectedIndex, this.mediaUploaded);
//
//  @override
//  State<StatefulWidget> createState() {
//    return _CaptureDMMedia();
//  }
//}
//
//class _CaptureDMMedia extends State<CaptureDMMediaWidget>
//    with TickerProviderStateMixin {
//  ValueNotifier<int> _showNext = ValueNotifier<int>(0);
//  AssetEntity selectedAsset;
//  TabController _controller;
//  List<AppBar> _appBar;
//  List<Widget> _children = <Widget>[];
//
//  @override
//  void initState() {
//    super.initState();
//    _children = [
//      VideoCapture(videoTaken),
//      PhotoCapture(photoTaken),
//      GalleryCapture(gallerySelected),
//    ];
//    _controller = TabController(vsync: this, length: 3);
//    _currentIndex = widget.selectedTab;
//    _controller.addListener(_controllerChanged);
//  }
//
//  @override
//  void didChangeDependencies() {
//    super.didChangeDependencies();
//    // similar to init state but have valid context
//
//    var attachmentLabel = AppLocalizations.of(context).tr(
//        "media.capture.title");
//    _appBar = _appBar =
//    [
//      AppBar(leading: IconButton(icon: Icon(Icons.close), onPressed: () {
//        Navigator.pop(context);
//      },), title: Text(attachmentLabel),),
//      AppBar(leading: IconButton(icon: Icon(Icons.close), onPressed: () {
//        Navigator.pop(context);
//      },), title: Text(attachmentLabel),),
//      AppBar(leading: IconButton(icon: Icon(Icons.close), onPressed: () {
//        Navigator.pop(context);
//      },),
//        title: Text(attachmentLabel),
//        actions: <Widget>[
//          FlatButton(child: Text("Next"),
//            textColor: Colors.white,
//            color: Colors.transparent,
//            onPressed: () {
//              Navigator.push(context, MaterialPageRoute(builder: (context) =>
//                  DMMediaPage(asset: selectedAsset,
//                      popParent: pop,
//                      mediaUploaded: widget.mediaUploaded),),);
//            },),
//        ],),
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
//    Navigator.pop(context);
//    Navigator.pop(context);
//    Navigator.pop(context);
//  }
//
//  videoTaken(String uri) {
//    Navigator.push(context, MaterialPageRoute(builder: (context) =>
//        DMMediaPage(videoURL: uri,
//          popParent: pop,
//          mediaUploaded: widget.mediaUploaded,),),);
//  }
//
//  photoTaken(String uri) {
//    print(uri);
//    Navigator.push(context, MaterialPageRoute(builder: (context) =>
//        DMMediaPage(imageURL: uri,
//            popParent: pop,
//            mediaUploaded: widget.mediaUploaded),),);
//  }
//
//  gallerySelected(AssetEntity asset) {
//    selectedAsset = asset;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    var appLocalizations = AppLocalizations.of(context);
//    return Scaffold(
//      appBar: _appBar[_currentIndex], body: _children[_currentIndex], // new
//      bottomNavigationBar: BottomNavigationBar(onTap: onTabTapped, // new
//        currentIndex: _currentIndex, // new
//        items: [
//          new BottomNavigationBarItem(backgroundColor: Colors.grey,
//              title: Text(
//                  appLocalizations.tr("media.capture.bottom_nav_bar.video")),
//              icon: Container(height: 0.0)),
//          new BottomNavigationBarItem(backgroundColor: Colors.grey,
//              title: Text(
//                  appLocalizations.tr("media.capture.bottom_nav_bar.photo")),
//              icon: Container(height: 0.0)),
//          new BottomNavigationBarItem(backgroundColor: Colors.grey,
//            title: Text(
//                appLocalizations.tr("media.capture.bottom_nav_bar.gallery")),
//            icon: Container(height: 0.0),),
//        ],),);
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
