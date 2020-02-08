//import 'dart:io';
//
//import 'package:camera/camera.dart';
//import 'package:carousel_pro/carousel_pro.dart';
//import 'package:easy_localization/easy_localization.dart';
//import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_service.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_html/flutter_html.dart';
//import 'package:fedi/Pages/Post/Photo/PhotoFile.dart';
//import 'package:fedi/Pages/Post/Video/VideoFIle.dart';
//import 'package:fedi/Pages/Post/VisibiltyDropDown.dart';
//import 'package:fedi/Pleroma/Foundation/Client.dart';
//import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
//import 'package:fedi/Pleroma/Foundation/Requests/Status.dart' as StatusRequest;
//import 'package:fedi/Views/Alert.dart';
//import 'package:fedi/Views/LocalVideoPlayer.dart';
//import 'package:fedi/Views/ProgressDialog.dart';
//import 'package:photo_manager/photo_manager.dart';
//
//import 'package:intl/intl.dart';
//// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
//import 'package:html/dom.dart' as dom;
//
//class ComposeStatus extends StatefulWidget {
//  final Function close;
//  final List<dynamic> assets;
//  final Function popParent;
//  final String htmlPost;
//  ComposeStatus({this.assets, this.popParent, this.htmlPost, this.close});
//
//  @override
//  State<StatefulWidget> createState() {
//    return _ComposeStatus();
//  }
//}
//
//class _ComposeStatus extends State<ComposeStatus> {
//  ProgressDialog _pr;
//  CameraController controller;
//  String statusVisability = "";
//  String status = "";
//  List<String> attachments = [];
//  DateTime postAt = DateTime.now();
//  final format = DateFormat("yyyy-MM-dd HH:mm");
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  visibilityUpdated(String visibility) {
//    statusVisability = visibility.toLowerCase();
//  }
//
//  final Map<int, Widget> children = const <int, Widget>{
//    0: Text('Now'),
//    1: Text('Later'),
//  };
//
//  int currentSegment = 0;
//  FocusNode myFocusNode;
//
//  @override
//  Widget build(BuildContext context) {
//    final double deviceWidth = MediaQuery.of(context).size.width;
//
//    return Scaffold(
//        appBar: AppBar(
//          leading: IconButton(
//            icon: Icon(Icons.arrow_back),
//            onPressed: () {
//              Navigator.of(context).pop();
//              // Navigator.pushReplacement(
//              //     context,
//              //     SlideRightRoute(
//              //         page: TextEditor(
//              //       assets: widget.assets,
//              //       popParent: widget.popParent,
//              //       close: widget.close,
//              //     )));
//            },
//          ),
//          title: Text(AppLocalizations.of(context).tr("post.status.title")),
//          actions: <Widget>[
//            FlatButton(
//              child: Text(AppLocalizations.of(context)
//                  .tr("post.status.action.post")),
//              textColor: Colors.white,
//              color: Colors.transparent,
//              onPressed: () {
//                postStatus(context);
//              },
//            ),
//          ],
//        ),
//        body: ListView(
//          children: <Widget>[
//            if (getMediaPreview() != null)
//              Container(
//                height: deviceWidth,
//                color: Colors.black,
//                child: getMediaPreview(),
//              ),
//            Container(
//              height: 40,
//              child: VisibilityDropDown((string) {
//                print(string);
//                visibilityUpdated(string);
//              }),
//            ),
//            if (widget.htmlPost != "")
//              Text(AppLocalizations.of(context).tr("post.status.status")),
//            if (widget.htmlPost != "")
//              Padding(
//                padding: EdgeInsets.all(10),
//                child: Container(
//                    child: Html(
//                  data: widget.htmlPost,
//                  customTextStyle: (dom.Node node, TextStyle baseStyle) {
//                    if (node is dom.Element) {
//                      switch (node.localName) {
//                        case "p":
//                          return baseStyle.merge(TextStyle(fontSize: 18));
//                      }
//                    }
//                    return baseStyle.merge(TextStyle(fontSize: 18));
//                  },
//                )),
//              ),
//            // Padding(
//            //   padding: EdgeInsets.all(10),
//            //   child: Row(
//            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            //     crossAxisAlignment: CrossAxisAlignment.center,
//            //     children: <Widget>[
//            //       Text("Post Time:"),
//            //       Container(
//            //         width: 175,
//            //         child: CupertinoSegmentedControl<int>(
//            //           children: children,
//            //           groupValue: currentSegment,
//            //           onValueChanged: (int value) {
//            //             setState(() {
//            //               currentSegment = value;
//            //             });
//            //           },
//            //         ),
//            //       ),
//            //     ],
//            //   ),
//            // ),
//            if (currentSegment == 1)
//              Padding(
//                  padding: EdgeInsets.all(10),
//                  child: FlatButton(
//                    child: Text(format.format(postAt)),
//                    onPressed: () {
//                      // showDatePicker(
//                      //         context: context,
//                      //         firstDate:
//                      //             DateTime.now().subtract(Duration(days: 1)),
//                      //         initialDate: postAt ?? DateTime.now(),
//                      //         lastDate: DateTime(2100))
//                      //     .then((date) {
//                      //   if (date != null) {
//                      //     showTimePicker(
//                      //       context: context,
//                      //       initialTime: TimeOfDay.fromDateTime(
//                      //           postAt ?? DateTime.now()),
//                      //     ).then((time) {
//                      //       DateTime newTime =
//                      //           DateTimeField.combine(date, time);
//                      //       setState(() {
//                      //         postAt = newTime;
//                      //       });
//                      //     });
//                      //   } else {
//                      //     postAt = DateTime.now();
//                      //   }
//                      // });
//                    },
//                  )),
//            RaisedButton(
//              child: Text(AppLocalizations.of(context)
//                  .tr("post.status.action.post")),
//              onPressed: () {
//                postStatus(context);
//              },
//            )
//          ],
//        ));
//  }
//
//  Widget getMediaPreview() {
//    if (widget.assets == null) {
//      return null;
//    }
//
//    List<Widget> items = [];
//    for (var i = 0; i < widget.assets.length; i++) {
//      dynamic asset = widget.assets[i];
//      if (asset is PhotoFile) {
//        items.add(_cameraPreviewWidget(asset.url));
//      } else if (asset is VideoFile) {
//        items.add(LocalVideoPlayer(url: asset.url));
//      } else if (asset is AssetEntity) {
//        AssetEntity item = asset;
//
//        items.add(FutureBuilder(
//            future: item.file,
//            builder: (context, snapshot) {
//              if (snapshot.connectionState == ConnectionState.done) {
//                if (item.type == AssetType.video) {
//                  return LocalVideoPlayer(
//                    file: snapshot.data,
//                  );
//                } else {
//                  return Image.file(snapshot.data);
//                }
//              } else {
//                return Container();
//              }
//            }));
//      }
//    }
//
//    return Carousel(
//      overlayShadowColors: Colors.transparent,
//      overlayShadowSize: 0.0,
//      images: items,
//      dotIncreasedColor: Colors.blue,
//      dotSize: 4.0,
//      dotSpacing: 15.0,
//      dotColor: Colors.blue.withOpacity(0.5),
//      indicatorBgPadding: 5.0,
//      dotBgColor: Colors.transparent,
//      borderRadius: true,
//      autoplay: false,
//    );
//  }
//
//  Widget _cameraPreviewWidget(String url) {
//    return Image.file(File(url));
//  }
//
//  postStatus(BuildContext context) {
//    if (widget.assets == null) {
//      postTextStatus();
//      return;
//    }
//
//    _pr = ProgressDialog(context, ProgressDialogType.Normal);
//    _pr.setMessage(AppLocalizations.of(context).tr("post.status.posting.progress"));
//    _pr.show();
//
//    getFileForUpload(context, 0);
//  }
//
//  getFileForUpload(BuildContext context, int index) async {
//    print("getting index $index");
//    dynamic asset = widget.assets[index];
//    if (asset is PhotoFile) {
//      uploadFile(context, index, File(asset.url));
//    } else if (asset is VideoFile) {
//      uploadFile(context, index, File(asset.url));
//    } else if (asset is AssetEntity) {
//      AssetEntity item = asset;
//      item.file.then((file) {
//        uploadFile(context, index, file);
//      });
//    }
//  }
//
//  uploadFile(BuildContext context, int index, File file) {
//
//    var mediaAttachmentService = IPleromaMediaAttachmentService.of(
//        context, listen: false);
//
//    mediaAttachmentService.uploadMedia(file: file).then((attachment) {
//      attachments.add(attachment.id);
//      int nextIndex = index + 1;
//      print("whats next?");
//      if (nextIndex != widget.assets.length) {
//        getFileForUpload(context, nextIndex);
//      } else {
//        postStatusAfterUpload();
//      }
//    }).catchError((e) {
//      print("THIS IS THE ERROR!!!!");
//      print(e);
//      _pr.hide();
//      var alert = Alert(
//          context,
//          AppLocalizations.of(context)
//              .tr("post.status.upload.error.alert.title"),
//          AppLocalizations.of(context)
//              .tr("post.status.upload.error.alert.content"),
//              () => {});
//      alert.showAlert();
//    });
//  }
//
//  postStatusAfterUpload() {
//    print("my visability!!!! $statusVisability");
//    var statusPath = StatusRequest.Status.postNewStatus;
//    Map<String, dynamic> params = {
//      "status": widget.htmlPost,
//      "visibility": statusVisability,
//      "media_ids": attachments
//    };
//
//    if (currentSegment == 1) {
//      params["scheduled_at"] = "${postAt.toIso8601String()}";
//    }
//    print("Params");
//    print(params);
//
//    CurrentInstance.instance.currentClient
//        .run(path: statusPath, method: HTTPMethod.POST, params: params)
//        .then((statusResponse) {
//      print(statusResponse.body);
//      _pr.hide();
//      var alert = Alert(context,
//          AppLocalizations.of(context)
//              .tr("post.status.posting.success.alert.title"),
//          AppLocalizations.of(context)
//              .tr("post.status.posting.success.alert.content"), () {
//        Navigator.of(context).pop();
//        Navigator.of(context).pop();
//        widget.close();
//      });
//      alert.showAlert();
//    }).catchError((e) {
//      print("THIS IS THE ERROR!!!!");
//      print(e);
//      _pr.hide();
//      var alert = Alert(
//          context,
//          AppLocalizations.of(context)
//              .tr("post.status.posting.error.alert.title"),
//          AppLocalizations.of(context)
//              .tr("post.status.posting.error.alert.content"),
//          () => {});
//      alert.showAlert();
//    });
//  }
//
//  postTextStatus() {
//    _pr = ProgressDialog(context, ProgressDialogType.Normal);
//    _pr.setMessage('Posting status');
//    _pr.show();
//
//    var statusPath = StatusRequest.Status.postNewStatus;
//    print("visibility  $statusVisability");
//    Map<String, dynamic> params = {
//      "status": widget.htmlPost,
//      "visibility": statusVisability,
//    };
//
//    if (currentSegment == 1) {
//      params["scheduled_at"] = "${postAt.toIso8601String()}";
//    }
//    print("Params");
//    print(params);
//
//    CurrentInstance.instance.currentClient
//        .run(path: statusPath, method: HTTPMethod.POST, params: params)
//        .then((statusResponse) {
//      print(statusResponse.body);
//      _pr.hide();
//      var alert = Alert(context,
//          AppLocalizations.of(context)
//          .tr("post.status.posting.success.alert.title"),
//          AppLocalizations.of(context)
//              .tr("post.status.posting.success.alert.content"), () {
//        Navigator.of(context).pop();
//        widget.close();
//      });
//      alert.showAlert();
//    }).catchError((e) {
//      print(e);
//      _pr.hide();
//      var alert = Alert(
//          context,
//          AppLocalizations.of(context)
//              .tr("post.status.posting.error.alert.title"),
//          AppLocalizations.of(context)
//              .tr("post.status.posting.error.alert.content"),
//          () => {});
//      alert.showAlert();
//    });
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//  }
//}
