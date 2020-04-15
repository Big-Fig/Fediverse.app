import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Status.dart' as StatusRequest;
import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/Transitions/SlideBottomRoute.dart';
import 'package:fedi/Views/Alert.dart';
import 'package:fedi/Views/LocalVideoPlayer.dart';
import 'package:fedi/Views/MentionPage.dart';
import 'package:fedi/Views/ProgressDialog.dart';
import 'package:fedi/app/status/edit/attach/status_edit_attach_media_page.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

const heicExtension = ".heic";
var _logger = Logger("QuickPostPage.dart");

class QuickPostPage extends StatefulWidget {
  final String sharedText;
  final List<dynamic> sharedFiles;

  const QuickPostPage(this.sharedText, this.sharedFiles);

  @override
  State<StatefulWidget> createState() {
    return _QuickPostPageState();
  }
}

class _QuickPostPageState extends State<QuickPostPage> {
  bool isChecked = false;
  String statusVisability = "Public";
  List<String> attachments = [];
  ProgressDialog _pr;
  String oldText = "";
  TextEditingController statusController = TextEditingController();
  List<FilePickerFile> assets = [];
  Widget status;

  accountMentioned(Account acct) {
    if (statusController.text.length > 0) {
      print("$acct");
      String lastChar =
          statusController.text.substring(statusController.text.length - 1);
      if (lastChar == "@") {
        statusController.text = statusController.text
            .substring(0, statusController.text.length - 1);
      }
    }
    statusController.text = "${statusController.text} @${acct.acct}";
  }

  @override
  Widget build(BuildContext context) {
    status = Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        onChanged: (value) {
          String lastChar = value.substring(value.length - 1);
          if (lastChar == "@" && oldText.length < value.length) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MentionPage(accountMentioned)));
          }

          oldText = value;
        },
        autofocus: true,
        controller: statusController,
        maxLines: null,
        minLines: null,
        expands: true,
      ),
    );

    Widget body = Column(
      children: <Widget>[
        Expanded(child: status),
        getMediaGrid(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Text(
                "@",
                style: TextStyle(
                    color: Colors.blue,
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
            IconButton(
              icon: getVisibilityIcon(statusVisability),
              onPressed: () {
                showModalBottomSheet(
                    builder: (BuildContext context) {
                      return Container(
                        height: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            // public button
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: OutlineButton(
                                      child: Row(
                                        children: <Widget>[
                                          getVisibilityIcon("Public"),
                                          Text(AppLocalizations.of(context)
                                              .tr("post.quick_post.visibility"
                                                  ".public"))
                                        ],
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          statusVisability = "Public";
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ), // Unlisted
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: OutlineButton(
                                      child: Row(
                                        children: <Widget>[
                                          getVisibilityIcon("Unlisted"),
                                          Text(AppLocalizations.of(context)
                                              .tr("post.quick_post.visibility"
                                                  ".unlisted"))
                                        ],
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          statusVisability = "Unlisted";
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ), // Private
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: OutlineButton(
                                      child: Row(
                                        children: <Widget>[
                                          getVisibilityIcon("Private"),
                                          Text(AppLocalizations.of(context)
                                              .tr("post.quick_post.visibility"
                                                  ".private"))
                                        ],
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          statusVisability = "Private";
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
                            ), // Cancel
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: OutlineButton(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            AppLocalizations.of(context)
                                                .tr("post.quick_post.action"
                                                    ".cancel"),
                                            style: TextStyle(color: Colors.red),
                                          )
                                        ],
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    context: context);
              },
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                  ),
                  Text(
                    "NSFW",
                    style: TextStyle(color: isChecked ? Colors.blue : Colors.grey),
                  ),
                ],
              ),
            ),
            Spacer(),
            OutlineButton(
              child: Text(
                AppLocalizations.of(context).tr("post.quick_post.action.post"),
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                postStatus();
              },
            ),
            Container(
              width: 10,
            )
          ],
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).tr("post.quick_post.title")),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              AppLocalizations.of(context).tr("post.quick_post.action.post"),
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              postStatus();
            },
          )
        ],
      ),
      body: body,
    );
  }

  Widget getMediaGrid() {
    var count = assets.length < 4 ? assets.length + 1 : assets.length;
    print("COUNT: $count");
    return Container(
      height: 125,
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
          content: new Text(AppLocalizations.of(context)
              .tr("post.quick_post.attachment.remove.alert.content")),
          actions: <Widget>[
            new FlatButton(
              child: new Text(AppLocalizations.of(context)
                  .tr("post.quick_post.attachment.remove.alert.action"
                      ".cancel")),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(AppLocalizations.of(context)
                  .tr("post.quick_post.attachment.remove.alert.action"
                      ".remove")),
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

  Future<Widget> getMediaPreview(FilePickerFile asset) async {
    var type = asset.type;
    switch (type) {
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

  Icon getVisibilityIcon(String visibility) {
    if (visibility == "Public") {
      return Icon(
        Icons.public,
        color: Colors.blue,
      );
    } else if (visibility == "Unlisted") {
      return Icon(Icons.lock_open, color: Colors.blue);
    } else {
      return Icon(Icons.lock, color: Colors.blue);
    }
  }

  Widget getAddButton() {
    return Container(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              _openAttachPage();
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.all(2),
                color: Colors.blue,
                child: IconButton(
                  iconSize: 30,
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _openAttachPage();
                  },
                ),
                height: 125,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Center(
                child: Container(
                  // margin: EdgeInsets.all(5),
                  color: Colors.blue,
                  child: IconButton(
                    iconSize: 30,
                    icon: Image(
                      height: 30,
                      width: 30,
                      color: Colors.white,
                      image: AssetImage("assets/images/addVideoFileIcon.png"),
                    ),
                    onPressed: () {
                      _openVideoMediaPicker();
                    },
                  ),
                  height: 60,
                ),
              ),
              Container(
                height: 5,
              ),
              Center(
                child: Container(
                  // margin: EdgeInsets.all(5),
                  color: Colors.blue,
                  child: IconButton(
                    iconSize: 30,
                    icon: Icon(
                      Icons.add_photo_alternate,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _openMediaPicker();
                    },
                  ),
                  height: 60,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _openMediaPicker() async {
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
    // var file = FilePickerFile(file: image, type: )
    var isNeedDeleteAfterUsage = false;
    var filePath = file.absolute.path;
    _logger.fine(() => "retrieveFile \n"
        "\t file $filePath");

    var extension = path.extension(filePath);
    if (extension == heicExtension || Platform.isIOS) {
      // gallery may return photos in HEIC format from iOS gallery
      // in this case we should re-compress them to jpg
      // gallery on iOS is selecting the old
      file = await _compressToJpeg(file);
      isNeedDeleteAfterUsage = true;
    }
    var newFile = FilePickerFile(
        file: file,
        type: FilePickerFileType.image,
        isNeedDeleteAfterUsage: isNeedDeleteAfterUsage);

    assets.add(newFile);
    setState(() {});
  }

  Future<void> _openVideoMediaPicker() async {
    var file = await ImagePicker.pickVideo(source: ImageSource.gallery);
    // var file = FilePickerFile(file: image, type: )
    var isNeedDeleteAfterUsage = false;
    var filePath = file.absolute.path;
    _logger.fine(() => "retrieveFile \n"
        "\t file $filePath");

    var newFile = FilePickerFile(
        file: file,
        type: FilePickerFileType.video,
        isNeedDeleteAfterUsage: isNeedDeleteAfterUsage);
    assets.add(newFile);
    setState(() {});
  }

  Future<File> _compressToJpeg(File file) async {
    var originPath = file.absolute.path;
    final Directory extDir = await getTemporaryDirectory();
    var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final String dirPath = path.join(extDir.path, "gallery_picker", timestamp);
    await Directory(dirPath).create(recursive: true);
    var originalFileNameWithoutExtension =
        path.basenameWithoutExtension(file.path);
    final String resultPath =
        path.join(dirPath, "$originalFileNameWithoutExtension.jpg");
    _logger.fine(() => "_compressToJpeg \n"
        "\t originPath $originPath"
        "\t resultPath $resultPath");
    file = await FlutterImageCompress.compressAndGetFile(
      originPath,
      resultPath,
      format: CompressFormat.jpeg,
      quality: 88,
    );
    return file;
  }

  void _openAttachPage() {
    Navigator.push(context, SlideBottomRoute(page: StatusEditAttachImagePage(
      fileSelectedCallback: (FilePickerFile filePickerFile) {
        assets.add(filePickerFile);
        Navigator.pop(context);
        setState(() {});
      },
    )));
  }

  postStatus() {
    if (assets.length == 0 && statusController.text == "") {
      var alert = Alert(
          context,
          AppLocalizations.of(context)
              .tr("post.quick_post.posting.error.alert.title"),
          AppLocalizations.of(context)
              .tr("post.quick_post.posting.error.alert.content"),
          () => {});
      alert.showAlert();
      return;
    }

    if (assets.length == 0) {
      postTextStatus();
      return;
    }

    _pr = ProgressDialog(context, ProgressDialogType.Normal);
    _pr.setMessage(
      AppLocalizations.of(context).tr("post.quick_post.posting.progress"),
    );
    _pr.show();

    getFileForUpload(context, 0);
  }

  getFileForUpload(BuildContext context, int index) async {
    print("getting index $index");
    FilePickerFile filePickerFile = assets[index];

    uploadFile(context, index, filePickerFile);
  }

  uploadFile(BuildContext context, int index, FilePickerFile filePickerFile) {
    var mediaAttachmentService =
        IPleromaMediaAttachmentService.of(context, listen: false);

    var file = filePickerFile.file;
    mediaAttachmentService.uploadMedia(file: file).then((attachment) {
      attachments.add(attachment.id);
      int nextIndex = index + 1;
      print("whats next?");
      if (filePickerFile.isNeedDeleteAfterUsage) {
        filePickerFile.file.delete();
      }
      if (nextIndex != assets.length) {
        getFileForUpload(context, nextIndex);
      } else {
        postStatusAfterUpload();
      }
    }).catchError((e) {
      print("THIS IS THE ERROR!!!!");
      print(e);
      _pr.hide();
      var alert = Alert(
          context,
          AppLocalizations.of(context)
              .tr("post.quick_post.posting.error.alert.title"),
          AppLocalizations.of(context)
              .tr("post.quick_post.posting.error.alert.content"),
          () => {});
      alert.showAlert();
    });
  }

  postStatusAfterUpload() {
    print("my visability!!!! $statusVisability");
    var statusPath = StatusRequest.Status.postNewStatus;
    Map<String, dynamic> params = {
      "status": statusController.text,
      "sensitive": isChecked,
      "visibility": statusVisability,
      "media_ids": attachments
    };

    print("Params");
    print(params);

    CurrentInstance.instance.currentClient
        .run(path: statusPath, method: HTTPMethod.POST, params: params)
        .then((statusResponse) {
      print(statusResponse.body);
      _pr.hide();
      Navigator.of(context).popUntil((route) => route.isFirst);
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context)
              .tr("post.quick_post.posting.success.alert.content"),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }).catchError((e) {
      _pr.hide();
      var alert = Alert(
          context,
          AppLocalizations.of(context)
              .tr("post.quick_post.posting.error.alert.title"),
          AppLocalizations.of(context)
              .tr("post.quick_post.posting.error.alert.content"),
          () => {});
      alert.showAlert();
    });
  }

  postTextStatus() {
    _pr = ProgressDialog(context, ProgressDialogType.Normal);
    _pr.setMessage(
        AppLocalizations.of(context).tr("post.quick_post.posting.progress"));
    _pr.show();

    var statusPath = StatusRequest.Status.postNewStatus;
    print("visibility  $statusVisability");
    Map<String, dynamic> params = {
      "status": statusController.text,
      "sensitive": isChecked,
      "visibility": statusVisability,
    };

    print("Params");
    print(params);

    CurrentInstance.instance.currentClient
        .run(path: statusPath, method: HTTPMethod.POST, params: params)
        .then((statusResponse) {
      print(statusResponse.body);
      _pr.hide();
      Navigator.of(context).popUntil((route) => route.isFirst);
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context)
              .tr("post.quick_post.posting.success.alert.content"),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }).catchError((e) {
      print(e);
      _pr.hide();
      var alert = Alert(
          context,
          AppLocalizations.of(context)
              .tr("post.quick_post.posting.error.alert.title"),
          AppLocalizations.of(context)
              .tr("post.quick_post.posting.error.alert.content"),
          () => {});
      alert.showAlert();
    });
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    super.dispose();
  }
}
