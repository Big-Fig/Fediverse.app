import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Pleroma/Foundation/Requests/Media.dart' as MediaRequest;
import 'package:phaze/Pleroma/Models/Status.dart';
import 'package:phaze/Views/Alert.dart';
import 'package:phaze/Views/LocalVideoPlayer.dart';
import 'package:phaze/Views/ProgressDialog.dart';
import 'package:photo_manager/photo_manager.dart';

class DMMediaPage extends StatefulWidget {
  final AssetEntity asset;
  final String imageURL;
  final String videoURL;
  final Function popParent;
  final Function(String) mediaUploaded;

  DMMediaPage({this.asset, this.imageURL, this.videoURL, this.popParent, this.mediaUploaded});

  @override
  State<StatefulWidget> createState() {
    return _DMMediaPage();
  }
}

class _DMMediaPage extends State<DMMediaPage> {
  ProgressDialog _pr;
  CameraController controller;
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
          title: Text("DM Attachment"),
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
    _pr.setMessage('Uploading');
    _pr.show();

    var path = MediaRequest.Media.postNewStatus;
    CurrentInstance.instance.currentClient
        .runUpload(path: path, files: [file]).then((response) {
      response.stream.bytesToString().then((respStr) {
        print(json.decode(respStr));
        _pr.hide();
        MediaAttachment attachment =
            MediaAttachment.fromJson(json.decode(respStr));

        widget.mediaUploaded(attachment.id);
         

      }).catchError((e) {
        print(e);
        _pr.hide();
        var alert = Alert(
            context,
            "Opps",
            "Unable to upload attachment at this time.",
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
