import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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

class ComposeStatus extends StatefulWidget {
  final AssetEntity asset;
  final String imageURL;
  final String videoURL;
  final Function popParent;
  final String htmlPost;
  ComposeStatus(
      {this.asset,
      this.imageURL,
      this.videoURL,
      this.popParent,
      this.htmlPost});

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
  File file;
  String statusVisability = "";
  String status = "";
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
              child: VisibilityDropDown(visibilityUpdated),
            ),
            Text("Status:"),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  child: Html(
                data: widget.htmlPost,
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
    if (widget.imageURL != null) {
      return _cameraPreviewWidget();
    } else if (widget.videoURL != null) {
      file = File(widget.videoURL);
      return LocalVideoPlayer(url: widget.videoURL);
    } else if (widget.asset != null) {
      widget.asset.file.then((loadedFile) {
        file = loadedFile;
        if (mounted) setState(() {});
      });

      if (widget.asset.type == AssetType.video) {
        if (file != null) {
          return LocalVideoPlayer(
            file: file,
          );
        }
      } else {
        if (file != null) {
          return Image.file(file);
        }
      }
    }

    return null;
  }

  Widget _cameraPreviewWidget() {
    file = File(widget.imageURL);
    return Image.file(file);
  }

  postStatus() {
    if (file == null) {
      postTextStatus();
      return;
    }

    _pr = ProgressDialog(context, ProgressDialogType.Normal);
    _pr.setMessage('Posting status');
    _pr.show();

    var path = MediaRequest.Media.postNewStatus;
    CurrentInstance.instance.currentClient
        .runUpload(path: path, files: [file]).then((response) {
      response.stream.bytesToString().then((respStr) {
        MediaAttachment attachment =
            MediaAttachment.fromJson(json.decode(respStr));
        List<String> ids = [attachment.id];
        var statusPath = StatusRequest.Status.postNewStatus;
        print(json.encode(ids));
        Map<String, dynamic> params = {
          "status": widget.htmlPost,
          "visibility": statusVisability,
          "media_ids": [attachment.id]
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
    });
  }

  postTextStatus() {
    _pr = ProgressDialog(context, ProgressDialogType.Normal);
    _pr.setMessage('Posting status');
    _pr.show();

    var statusPath = StatusRequest.Status.postNewStatus;

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
