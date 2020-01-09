import 'dart:io';

import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Views/MentionPage.dart';
import 'package:flutter/material.dart';
import 'package:fedi/Constants/AppThemeConsts.dart';
import 'package:fedi/Pages/Post/AddAdditionalMedia.dart';
import 'package:fedi/Pages/Post/CaptureController.dart';
import 'package:fedi/Pages/Post/ComposeStatus.dart';
import 'package:fedi/Transitions/SlideRightRoute.dart';
import 'package:fedi/Views/LocalVideoPlayer.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:fedi/Transitions/SlideBottomRoute.dart';

import 'Photo/PhotoFile.dart';
import 'Video/VideoFIle.dart';

class TextEditor extends StatefulWidget {
  final List<dynamic> assets;

  // final AssetEntity asset;
  // final String imageURL;
  // final String videoURL;
  final Function popParent;

  TextEditor({this.assets, this.popParent});

  @override
  _TextEditor createState() => _TextEditor();
}

class _TextEditor extends State<TextEditor> {
  TextEditingController statusController = TextEditingController();
  @override
  void initState() {
    super.initState();
    assets = widget.assets;
  }

  List<dynamic> assets;

  accountMentioned(Account acct) {
    print("$acct");
    String lastChar =
        statusController.text.substring(statusController.text.length - 1);
    if (lastChar == "@") {
      statusController.text =
          statusController.text.substring(0, statusController.text.length - 1);
    }
    statusController.text = "${statusController.text} @${acct.acct}";
  }

  @override
  Widget build(BuildContext context) {
    final Widget body = Column(
      children: <Widget>[
        Expanded(
          child: TextField(
            onChanged: (value) {
              String lastChar = value.substring(value.length - 1);
              if (lastChar == "@") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MentionPage(accountMentioned)));
              }
            },
            autofocus: true,
            controller: statusController,
            maxLines: null,
            minLines: null,
            expands: true,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Text(
                "@",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MentionPage(accountMentioned)));
              },
            ),
          ],
        ),
        getMediaGrid(),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Compose status"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, SlideRightRoute(page: CaptureController()));
          },
        ),
        actions: <Widget>[
          Builder(
              builder: (context) => FlatButton(
                    child: Text("Next"),
                    textColor: Colors.white,
                    color: Colors.transparent,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComposeStatus(
                            assets: assets,
                            popParent: widget.popParent,
                            htmlPost: statusController.text,
                          ),
                        ),
                      );
                    },
                  ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: body,
      ),
    );
  }

  Widget getMediaGrid() {
    var count = assets.length < 4 ? assets.length + 1 : assets.length;
    print("COUNT: $count");
    return Container(
      height: 100,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: count,
        itemBuilder: (BuildContext context, int index) {
          print("$count == $index");
          if (count == index + 1 && assets.length != 4) {
            return getAddButton();
          }

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(8),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  FutureBuilder(
                      future: getMediaPreview(assets[index]),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return snapshot.data;
                        } else {
                          return Container();
                        }
                      }),
                  Positioned(
                    top: 0,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      iconSize: 20.0,
                      onPressed: () {
                        askToRemoveAsset(index);
                      },
                    ),
                  ),
                ],
              ),
              width: 100,
              height: 100,
            ),
          );
        },
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      ),
    );
  }

  askToRemoveAsset(int index) {
    showDialog(
      context: this.context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text("Are you sure you want to remove the attachment?"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Remove"),
              onPressed: () {
                assets.removeAt(index);
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  videoTaken(String uri) {
    VideoFile video = VideoFile(uri);
    assets.add(video);
    if (mounted) setState(() {});
  }

  photoTaken(String uri) {
    PhotoFile photo = PhotoFile(uri);
    assets.add(photo);
    if (mounted) setState(() {});
  }

  gallerySelected(AssetEntity asset) {
    AssetEntity newAsset = asset;
    assets.add(newAsset);
    if (mounted) setState(() {});
  }

  Future<Widget> getMediaPreview(dynamic asset) async {
    if (asset is PhotoFile) {
      return _cameraPreviewWidget(asset.url);
    } else if (asset is VideoFile) {
      return LocalVideoPlayer(url: asset.url);
    } else if (asset is AssetEntity) {
      AssetEntity item = asset;
      File file = await item.file;
      if (item.type == AssetType.video) {
        return LocalVideoPlayer(
          file: file,
        );
      } else {
        return Image.file(file);
      }
    }
    return Container();
  }

  Widget _cameraPreviewWidget(String url) {
    return Image.file(File(url));
  }

  Widget getAddButton() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
          context,
          SlideBottomRoute(
              page: AddAddtionalMedia(
                  videoTaken: videoTaken,
                  photoTaken: photoTaken,
                  gallerySelected: gallerySelected)),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8),
        color: romaGreen,
        child: Center(
          child: IconButton(
            iconSize: 30,
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                SlideBottomRoute(
                    page: AddAddtionalMedia(
                        videoTaken: videoTaken,
                        photoTaken: photoTaken,
                        gallerySelected: gallerySelected)),
              );
            },
          ),
        ),
        width: 100,
        height: 100,
      ),
    );
  }
}
