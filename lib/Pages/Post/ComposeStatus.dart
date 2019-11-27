import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:phaze/Pages/Post/Photo/PhotoFile.dart';
import 'package:phaze/Pages/Post/Video/VideoFIle.dart';
import 'package:phaze/Pages/Post/VisibiltyDropDown.dart';
import 'package:phaze/Pleroma/Foundation/Client.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Pleroma/Foundation/Requests/Media.dart' as MediaRequest;
import 'package:phaze/Pleroma/Foundation/Requests/Status.dart' as StatusRequest;
import 'package:phaze/Pleroma/Models/Status.dart';
import 'package:phaze/Views/Alert.dart';
import 'package:phaze/Views/LocalVideoPlayer.dart';
import 'package:phaze/Views/ProgressDialog.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:html/dom.dart' as dom;

class ComposeStatus extends StatefulWidget {
  final List<dynamic> assets;
  // final AssetEntity asset;
  // final String imageURL;
  // final String videoURL;
  final Function popParent;
  final String htmlPost;
  ComposeStatus({this.assets, this.popParent, this.htmlPost});

  @override
  State<StatefulWidget> createState() {
    return _ComposeStatus();
  }
}

class _ComposeStatus extends State<ComposeStatus> {
  ProgressDialog _pr;
  CameraController controller;
  VideoPlayerController videoController;
  VoidCallback videoPlayerListener;
  bool enableAudio = true;
  String statusVisability = "";
  String status = "";
  List<String> attachments = [];

  visibilityUpdated(String visibility) {
    statusVisability = visibility.toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Status Preview"),
          actions: <Widget>[
            FlatButton(
              child: Text("Post"),
              textColor: Colors.white,
              color: Colors.transparent,
              onPressed: () {
                postStatus();
              },
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            if (getMediaPreview() != null)
              Container(
                height: deviceWidth,
                color: Colors.black,
                child: getMediaPreview(),
              ),
            Container(
              height: 40,
              child: VisibilityDropDown((string){
                print(string);
                visibilityUpdated(string);

              }),
            ),
            Text("Status:"),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  child: Html(
                data: widget.htmlPost,
                customTextStyle: (dom.Node node, TextStyle baseStyle) {
                  if (node is dom.Element) {
                    switch (node.localName) {
                      case "p":
                        return baseStyle.merge(TextStyle(fontSize: 18));
                    }
                  }
                  return baseStyle.merge(TextStyle(fontSize: 18));
                },
              )),
            ),
            RaisedButton(
              child: Text("POST!"),
              onPressed: () {
                postStatus();
              },
            )
          ],
        ));
  }

  Widget getMediaPreview() {
    if (widget.assets == null) {
      return null;
    }

    List<Widget> items = [];
    for (var i = 0; i < widget.assets.length; i++) {
      dynamic asset = widget.assets[i];
      if (asset is PhotoFile) {
        items.add(_cameraPreviewWidget(asset.url));
      } else if (asset is VideoFile) {
        items.add(LocalVideoPlayer(url: asset.url));
      } else if (asset is AssetEntity) {
        AssetEntity item = asset;

        items.add(FutureBuilder(
            future: item.file,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (item.type == AssetType.video) {
                  return LocalVideoPlayer(
                    file: snapshot.data,
                  );
                } else {
                  return Image.file(snapshot.data);
                }
              } else {
                return Container();
              }
            }));
      }
    }

    return Carousel(
      overlayShadowColors: Colors.transparent,
      overlayShadowSize: 0.0,
      images: items,
      dotIncreasedColor: Colors.green,
      dotSize: 4.0,
      dotSpacing: 15.0,
      dotColor: Colors.green.withOpacity(0.5),
      indicatorBgPadding: 5.0,
      dotBgColor: Colors.transparent,
      borderRadius: true,
      autoplay: false,
    );
  }

  Widget _cameraPreviewWidget(String url) {
    return Image.file(File(url));
  }

  postStatus() {
    if (widget.assets ==  null) {
      postTextStatus();
      return;
    }

    _pr = ProgressDialog(context, ProgressDialogType.Normal);
    _pr.setMessage('Posting status');
    _pr.show();

    getFileForUpload(0);
  }

  getFileForUpload(int index) async {
    print("getting index $index");
    dynamic asset = widget.assets[index];
    if (asset is PhotoFile) {
      uploadFile(index, File(asset.url));
    } else if (asset is VideoFile) {
      uploadFile(index, File(asset.url));
    } else if (asset is AssetEntity) {
      AssetEntity item = asset;
      item.file.then((file){
         uploadFile(index, file);
      });
     
    }
  }

  uploadFile(int index, File file) {
    var path = MediaRequest.Media.postNewStatus;
    CurrentInstance.instance.currentClient
        .runUpload(path: path, files: [file]).then((response) {
      response.stream.bytesToString().then((respStr) {
        MediaAttachment attachment =
            MediaAttachment.fromJson(json.decode(respStr));
        attachments.add(attachment.id);
        int nextIndex = index + 1;
        print("whats next?");
        if (nextIndex != widget.assets.length) {
          getFileForUpload(nextIndex);
        } else {
          postStatusAfterUpload();
        }
      }).catchError((e) {
        print("THIS IS THE ERROR!!!!");
        print(e);
        _pr.hide();
        var alert = Alert(
            context,
            "Opps",
            "Unable to post status at this time. Please try again later.",
            () => {});
        alert.showAlert();
      });
    });
  }

  postStatusAfterUpload() {
    print("my visability!!!! $statusVisability");
    var statusPath = StatusRequest.Status.postNewStatus;
    Map<String, dynamic> params = {
      "status": widget.htmlPost,
      "visibility": statusVisability,
      "media_ids": attachments
    };

    CurrentInstance.instance.currentClient
        .run(path: statusPath, method: HTTPMethod.POST, params: params)
        .then((statusResponse) {
      print(statusResponse.body);
      _pr.hide();
      var alert = Alert(context, "Success!", "You status was posted!",
          () => {Navigator.of(context).popUntil((route) => route.isFirst)});
      alert.showAlert();
    }).catchError((e) {
      print("THIS IS THE ERROR!!!!");
      print(e);
      _pr.hide();
      var alert = Alert(
          context,
          "Opps",
          "Unable to post status at this time. Please try again later.",
          () => {});
      alert.showAlert();
    });
  }

  postTextStatus() {
    _pr = ProgressDialog(context, ProgressDialogType.Normal);
    _pr.setMessage('Posting status');
    _pr.show();

    var statusPath = StatusRequest.Status.postNewStatus;
    print("visibility  $statusVisability");
    Map<String, dynamic> params = {
      "status": widget.htmlPost,
      "visibility": statusVisability,
    };

    CurrentInstance.instance.currentClient
        .run(path: statusPath, method: HTTPMethod.POST, params: params)
        .then((statusResponse) {
      print(statusResponse.body);
      _pr.hide();
      var alert = Alert(context, "Success!", "You status was posted!",
          () => {Navigator.of(context).popUntil((route) => route.isFirst)});
      alert.showAlert();
    }).catchError((e) {
      print(e);
      _pr.hide();
      var alert = Alert(
          context,
          "Opps",
          "Unable to post status at this time. Please try again later.",
          () => {});
      alert.showAlert();
    });
  }
}
