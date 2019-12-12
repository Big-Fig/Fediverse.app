import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Accounts.dart';
import 'package:fedi/Views/Alert.dart';
import 'package:fedi/Views/LocalVideoPlayer.dart';
import 'package:fedi/Views/ProgressDialog.dart';
import 'package:photo_manager/photo_manager.dart';

class ProfileMediaPage extends StatefulWidget {
  final AssetEntity asset;
  final String imageURL;
  final String videoURL;
  final Function popParent;
  final Function(String) mediaUploaded;
  final String type;

  ProfileMediaPage(
      {this.asset,
      this.imageURL,
      this.videoURL,
      this.popParent,
      this.mediaUploaded,
      this.type});

  @override
  State<StatefulWidget> createState() {
    return _ProfileMediaPage();
  }
}

class _ProfileMediaPage extends State<ProfileMediaPage> {
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
          title: Text("Edit $widget.type"),
          actions: <Widget>[
            FlatButton(
              child: Text("Save"),
              textColor: Colors.white,
              color: Colors.transparent,
              onPressed: () {
                updateImage();
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
              child: Text("Save!"),
              onPressed: () {
                updateImage();
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

  updateImage() {

    _pr = ProgressDialog(context, ProgressDialogType.Normal);
    _pr.setMessage('Uploading ${widget.type} image');
    _pr.show();

    var path = Accounts.updateCurrentUser();
    CurrentInstance.instance.currentClient.patchUpload(
        path: path, paramName: widget.type, files: [file]).then((response) {
      response.stream.bytesToString().then((respStr) {
        
        print(json.decode(respStr));
        _pr.hide();
        CurrentInstance.instance.currentAccount
            .refreshAccount()
            .then((response) {
          var alert = Alert(context, "Success!", "Profile updated!", () {
            widget.mediaUploaded("update");
            Navigator.of(context)
                .popUntil((route) => route.settings.name == "/MyProfile");
          });
          alert.showAlert();
        }).catchError((error) {
          var alert = Alert(context, "Opps",
              "Unable to upload attachment at this time", () => {});
          alert.showAlert();
        });
      }).catchError((e) {
        print(e);
        _pr.hide();
        var alert = Alert(context, "Opps",
            "Unable to upload attachment at this time.", () => {});
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
