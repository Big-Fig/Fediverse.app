import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class DMMediaPage extends StatefulWidget {
  final AssetEntity asset;
  final String imageURL;
  final String videoURL;
  final Function popParent;

  DMMediaPage({this.asset, this.imageURL, this.videoURL, this.popParent});

  @override
  State<StatefulWidget> createState() {
    return _DMMediaPage();
  }
}

class _DMMediaPage extends State<DMMediaPage> {
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
          title: Text("New Post"),
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
            Container(
              height: deviceWidth,
              color: Colors.black,
              child: getMediaPreview(),
            ),
            Container(
              height: 40,
              child: VisibilityDropDown(visibilityUpdated),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 200,
                child: new ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 200.0,
                  ),
                  child: new Scrollbar(
                    child: new SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      reverse: true,
                      child: SizedBox(
                        height: 180.0,
                        child: new TextField(
                          onChanged: (text) {
                            status = text;
                          },
                          maxLines: 100,
                          decoration: new InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(),
                            ),
                            labelText: 'Write a caption',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            RaisedButton(
              child: Text("Send!"),
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

    return Container();
  }

  Widget _cameraPreviewWidget() {
    file = File(widget.imageURL);
    return Image.file(file);
  }

  postStatus() {
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
          "status": status,
          "visibility" : "public",
          "media_ids" : [attachment.id]
        };

        CurrentInstance.instance.currentClient
            .run(
                path: statusPath, method: HTTPMethod.POST, params: params)
            .then((statusResponse) {
          print(statusResponse.body);
          _pr.hide();
          var alert = Alert(context, "Success!", "You status was posted!",
              () => {


                Navigator.of(context).popUntil((route) => route.isFirst)


              });
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
    // CurrentInstance.instance.currentClient
    //     .run(
    //         path: Media.postNewStatus,
    //         method: HTTPMethod.POST)
    //     .then((response) {
    //   List<Status> newStatuses = statusFromJson(response.body);
    //   widget.statuses.addAll(newStatuses);
    //   if (mounted) setState(() {});
    //   _refreshController.loadComplete();
    // }).catchError((error) {
    //   if (mounted) setState(() {});
    //   _refreshController.loadFailed();
    // });
  }
}
