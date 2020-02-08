import 'dart:io';

import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/account/edit/pleroma_account_edit_service.dart';
import 'package:fedi/Views/Alert.dart';
import 'package:fedi/Views/LocalVideoPlayer.dart';
import 'package:fedi/Views/ProgressDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          title: Text(AppLocalizations.of(context)
              .tr("profile.media.edit.title", args: [widget.type])),
          actions: <Widget>[
            FlatButton(
              child: Text(AppLocalizations.of(context)
                  .tr("profile.media.edit.action.save")),
              textColor: Colors.white,
              color: Colors.transparent,
              onPressed: () {
                updateImage(context);
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
              child: Text(AppLocalizations.of(context)
                  .tr("profile.media.edit.action.save")),
              onPressed: () {
                updateImage(context);
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

  updateImage(BuildContext context) {
    _pr = ProgressDialog(context, ProgressDialogType.Normal);
    _pr.setMessage(AppLocalizations.of(context)
        .tr("profile.media.edit.update.progress", args: [widget.type]));
    _pr.show();


    var editService = IPleromaAccountEditService.of(
        context, listen: false);

    Future<Account> future;
    // TODO: widget type should bre refactored
    switch (widget.type) {
      case "header":
        future = editService.changeHeaderImage(file: file);
        break;
      case "avatar":
        future = editService.changeAvatarImage(file: file);
        break;
    }

    future.then((account) {
      _pr.hide();
      CurrentInstance.instance.currentAccount
          .refreshAccount()
          .then((response) {
        var alert = Alert(context,
            AppLocalizations.of(context)
                .tr("profile.media.edit.update.success.alert.title"),
            AppLocalizations.of(context)
                .tr("profile.media.edit.update.success.alert.content"),
                () {
              widget.mediaUploaded("update");
              Navigator.of(context)
                  .popUntil((route) => route.settings.name == "/MyProfile");
            });
        alert.showAlert();
      }).catchError((error) {
        var alert = Alert(context,
            AppLocalizations.of(context)
                .tr("profile.media.edit.update.error.alert.title"),
            AppLocalizations.of(context)
                .tr("profile.media.edit.update.error.alert.content"),
                () => {});
        alert.showAlert();
      });
    }).catchError((error) {
      var alert = Alert(context,
          AppLocalizations.of(context)
              .tr("profile.media.edit.update.error.alert.title"),
          AppLocalizations.of(context)
              .tr("profile.media.edit.update.error.alert.content"),
              () => {});
      alert.showAlert();
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
