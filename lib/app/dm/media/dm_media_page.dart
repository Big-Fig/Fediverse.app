import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/Views/Alert.dart';
import 'package:fedi/Views/LocalVideoPlayer.dart';
import 'package:fedi/Views/ProgressDialog.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DMMediaPage extends StatefulWidget {
  final FilePickerFile filePickerFile;
  final Function popParent;
  final Function(BuildContext context, String) mediaUploaded;

  DMMediaPage({this.filePickerFile, this.popParent, this.mediaUploaded});

  @override
  State<StatefulWidget> createState() {
    return _DMMediaPage();
  }
}

class _DMMediaPage extends State<DMMediaPage> {
  ProgressDialog _pr;
  CameraController controller;

  String statusVisability = "";
  String status = "";
  visibilityUpdated(String visibility) {
    statusVisability = visibility.toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    var appLocalizations = AppLocalizations.of(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(appLocalizations.tr("media.dm.title")),
          actions: <Widget>[
            FlatButton(
              child: Text(appLocalizations.tr("media.dm.action.post")),
              textColor: Colors.white,
              color: Colors.transparent,
              onPressed: () {
                postStatus(context);
              },
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: deviceWidth,
              color: Colors.black,
              child: getMediaPreview(widget.filePickerFile),
            ),
            RaisedButton(
              child: Text(appLocalizations.tr("media.dm.action.send")),
              onPressed: () {
                postStatus(context);
              },
            )
          ],
        ));
  }

  Widget getMediaPreview(FilePickerFile asset) {

    var type = asset.type;
    switch(type) {

      case FilePickerFileType.image:
        return Image.file(asset.file);
        break;
      case FilePickerFileType.video:
        return LocalVideoPlayer(
          file: asset.file,
        );
        break;
      case FilePickerFileType.other:
      default:
        throw "Not supported FilePickerFileType $type";
        break;
    }
  }


  postStatus(BuildContext context) async {
    _pr = ProgressDialog(context, ProgressDialogType.Normal);
    var appLocalizations = AppLocalizations.of(context);
    _pr.setMessage(appLocalizations.tr("media.dm.uploading.dialog.content"));
    _pr.show();

    var mediaAttachmentService = IPleromaMediaAttachmentService.of(
        context, listen: false);


    try {
      var attachment = await mediaAttachmentService.uploadMedia(file: widget
          .filePickerFile.file);
      _pr.hide();
      widget.mediaUploaded(context, attachment.id);
    } on Exception catch (e) {
      print(e);
      _pr.hide();
      var alert = Alert(
          context,
          appLocalizations.tr("media.dm.uploading.error.title"),
          appLocalizations.tr("media.dm.uploading.error.content"),
              () => {});
      alert.showAlert();
    }


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
