import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/InstanceStorage.dart';
import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/Models/Field.dart';
import 'package:fedi/Pleroma/account/edit/pleroma_account_edit_model.dart';
import 'package:fedi/Pleroma/account/edit/pleroma_account_edit_service.dart';
import 'package:fedi/Views/Alert.dart';
import 'package:fedi/Views/ProgressDialog.dart';
import 'package:fedi/app/profile/edit/profile_edit_select_avatar_page.dart';
import 'package:fedi/app/profile/edit/profile_edit_select_header_page.dart';
import 'package:fedi/async/async_dialog.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';

class EditProfile extends StatefulWidget {
  final Function(BuildContext) stateUpdated;

  EditProfile(this.stateUpdated);

  @override
  State<StatefulWidget> createState() {
    return _EditProfile();
  }
}

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

class _EditProfile extends State<EditProfile> {
  refresh() {
    setState(() {});
  }

  ProgressDialog _pr;
  Account myAccount = CurrentInstance.instance.currentAccount;
  var displayNameController = TextEditingController();
  var field1NameController = TextEditingController();
  var field1ValueController = TextEditingController();
  var field2NameController = TextEditingController();
  var field2ValueController = TextEditingController();
  var field3NameController = TextEditingController();
  var field3ValueController = TextEditingController();
  var field4NameController = TextEditingController();
  var field4ValueController = TextEditingController();
  var noteController = TextEditingController();
  bool locked;

  @override
  void initState() {
    super.initState();
    displayNameController.text = myAccount.displayName;
    noteController.text = removeAllHtmlTags(myAccount.note);
    var fields = myAccount.fields;
    if (fields.length > 0) {
      field1NameController.text = fields[0].name;
      field1ValueController.text = fields[0].value;
    }
    if (fields.length > 1) {
      field2NameController.text = fields[1].name;
      field2ValueController.text = fields[1].value;
    }
    if (fields.length > 2) {
      field3NameController.text = fields[2].name;
      field3ValueController.text = fields[2].value;
    }
    if (fields.length > 3) {
      field4NameController.text = fields[3].name;
      field4ValueController.text = fields[3].value;
    }
    locked = myAccount.locked;

    setState(() {});
  }

  alertDisplayName(BuildContext context) {
    showAlert(
      context: context,
      title: AppLocalizations.of(context)
          .tr("profile.edit.display_name.alert.title"),
      body: AppLocalizations.of(context)
          .tr("profile.edit.display_name.alert.body"),
      actions: [
        AlertAction(
          text: AppLocalizations.of(context).tr("profile.edit.action.discard"),
          onPressed: () {
            widget.stateUpdated(context);
          },
        ),
      ],
      cancelable: true,
    );
  }

  alertBio(BuildContext context) {
    showAlert(
      context: context,
      title: AppLocalizations.of(context).tr("profile.edit.bio.alert.title"),
      body: AppLocalizations.of(context).tr("profile.edit.bio.alert.body"),
      actions: [
        AlertAction(
          text: AppLocalizations.of(context).tr("profile.edit.action.discard"),
          onPressed: () {
            widget.stateUpdated(context);
          },
        ),
      ],
      cancelable: true,
    );
  }

  saveProfile(BuildContext context) {
    _pr = ProgressDialog(context, ProgressDialogType.Normal);
    _pr.setMessage(
        AppLocalizations.of(context).tr("profile.edit.update.progress"));
    _pr.show();

    var accountEditService =
        IPleromaAccountEditService.of(context, listen: false);

    accountEditService
        .updateCredentials(PleromaAccountEdit(
            locked: locked,
            displayName: displayNameController.text,
            note: noteController.text,
            fieldsAttributes: {
          0: Field(
              name: field1NameController.text,
              value: field1ValueController.text),
          1: Field(
              name: field2NameController.text,
              value: field2ValueController.text),
          2: Field(
              name: field3NameController.text,
              value: field3ValueController.text),
          3: Field(
              name: field4NameController.text,
              value: field4ValueController.text),
        }))
        .then((response) {
      _pr.hide();
      CurrentInstance.instance.currentAccount.refreshAccount().then((response) {
        var alert = Alert(
            context,
            AppLocalizations.of(context)
                .tr("profile.edit.update.success.alert.title"),
            AppLocalizations.of(context)
                .tr("profile.edit.update.success.alert.content"),
            () {
              Navigator.pop(context);
            });
        alert.showAlert();
      }).catchError((error) {
        var alert = Alert(
            context,
            AppLocalizations.of(context)
                .tr("profile.edit.update.error.alert.title"),
            AppLocalizations.of(context)
                .tr("profile.edit.update.error.alert.content"),
            () => {});
        alert.showAlert();
      });
    }).catchError((error) {
      _pr.hide();
      var alert = Alert(
          context,
          AppLocalizations.of(context)
              .tr("profile.edit.update.error.alert.title"),
          AppLocalizations.of(context)
              .tr("profile.edit.update.error.alert.content"),
          () => {});
      alert.showAlert();
    });
  }

  mediaUploaded(String id) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            if (displayNameController.text != myAccount.displayName) {
              alertDisplayName(context);
            } else if (noteController.text !=
                removeAllHtmlTags(myAccount.note)) {
              alertBio(context);
            } else {
              widget.stateUpdated(context);
            }
          },
        ),
        title: Row(children: <Widget>[
          Text(AppLocalizations.of(context).tr("profile.edit.title"))
        ]),
        actions: <Widget>[
          FlatButton(
            child: Text(
              AppLocalizations.of(context).tr("profile.edit.action.save"),
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              saveProfile(context);
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          // header
          Container(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  child: FittedBox(
                    alignment: Alignment.center,
                    fit: BoxFit.none,
                    child: CachedNetworkImage(
                      imageUrl: myAccount.header,
                      placeholder: (context, url) => Center(
                        child: Container(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileEditSelectAvatarPage(
                                  selectedCallback:
                                      (FilePickerFile filePickerFile) async {
                                    var accountEditService =
                                        IPleromaAccountEditService.of(context,
                                            listen: false);

                                    try {
                                      var dialogResult =
                                          await doAsyncOperationWithDialog(
                                              title: Text("Updating avatar"),
                                              context: context,
                                              asyncCode: () async =>
                                                  accountEditService
                                                      .updateFiles(
                                                          PleromaAccountFiles(
                                                              avatar:
                                                                  filePickerFile
                                                                      .file)),
                                              isDismissible: true,
                                              cancellationValue: null);

                                      if (dialogResult.result != null) {
                                        this.myAccount = dialogResult.result;
                                        String account =
                                            "${myAccount.username}@${CurrentInstance.instance.currentClient.baseURL}";

                                        CurrentInstance.instance
                                            .currentAccount = myAccount;
                                        await InstanceStorage.updateAccount(
                                            account, myAccount);
                                        if (filePickerFile
                                            .isNeedDeleteAfterUsage) {
                                          filePickerFile.file.delete();
                                        }
                                        setState(() {});
                                      }

                                      // exit file picker
                                      Navigator.pop(context);
                                    } on Exception catch (e) {
                                      showDialog(
                                          context: context,
                                          child: AlertDialog(
                                            title: Text("error $e"),
                                          ));
                                    }
                                  },
                                )));
                  },
                  child: Container(
                    width: 125,
                    height: 125,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: new BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            imageUrl: myAccount.avatar,
                            placeholder: (context, url) => Center(
                              child: Container(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            height: 125,
                            width: 125,
                          ),
                        ),
                        Container(
                          color: Colors.black38,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 2),
                                ),
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileEditSelectHeaderPage(
                                    selectedCallback:
                                        (FilePickerFile filePickerFile) async {
                                      var accountEditService =
                                          IPleromaAccountEditService.of(context,
                                              listen: false);

                                      try {
                                        var dialogResult =
                                            await doAsyncOperationWithDialog(
                                                title: Text("Updating header"),
                                                context: context,
                                                asyncCode: () async =>
                                                    accountEditService
                                                        .updateFiles(
                                                            PleromaAccountFiles(
                                                                header:
                                                                    filePickerFile
                                                                        .file)),
                                                isDismissible: true,
                                                cancellationValue: null);

                                        if (dialogResult.result != null) {
                                          this.myAccount = dialogResult.result;
                                          String account =
                                              "${myAccount.username}@${CurrentInstance.instance.currentClient.baseURL}";

                                          CurrentInstance.instance
                                              .currentAccount = myAccount;
                                          await InstanceStorage.updateAccount(
                                              account, myAccount);
                                          if (filePickerFile
                                              .isNeedDeleteAfterUsage) {
                                            filePickerFile.file.delete();
                                          }
                                          setState(() {});
                                        }

                                        // exit file picker
                                        Navigator.pop(context);
                                      } on Exception catch (e) {
                                        showDialog(
                                            context: context,
                                            child: AlertDialog(
                                              title: Text("error $e"),
                                            ));
                                      }
                                    },
                                  )));
//
//                      Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => ProfileImageEditor(
//                                  1, mediaUploaded, "header")));
                      print("edit header");
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      color: Colors.black38,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)
                                  .tr("profile.edit.header"),
                              style: TextStyle(color: Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                            ),
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200, minHeight: 80),
              child: Padding(
                padding: EdgeInsets.all(10),
                // only( bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TextField(
                  controller: displayNameController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(),
                    ),
                    labelText: AppLocalizations.of(context)
                        .tr("profile.edit.display_name.label"),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200, minHeight: 80),
              child: Padding(
                padding: EdgeInsets.all(10),
                // only( bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TextField(
                  controller: noteController,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(),
                    ),
                    labelText: AppLocalizations.of(context)
                        .tr("profile.edit.bio.label"),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Fields"),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: field1NameController,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(),
                        ),
                        labelText:
                            AppLocalizations.of(context).tr("profile.edit.field"
                                ".label"),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: field1ValueController,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(),
                        ),
                        labelText:
                            AppLocalizations.of(context).tr("profile.edit.field"
                                ".value"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: field2NameController,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(),
                        ),
                        labelText:
                            AppLocalizations.of(context).tr("profile.edit.field"
                                ".label"),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: field2ValueController,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(),
                        ),
                        labelText:
                            AppLocalizations.of(context).tr("profile.edit.field"
                                ".value"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: field3NameController,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(),
                        ),
                        labelText:
                            AppLocalizations.of(context).tr("profile.edit.field"
                                ".label"),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: field3ValueController,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(),
                        ),
                        labelText:
                            AppLocalizations.of(context).tr("profile.edit.field"
                                ".value"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: field4NameController,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(),
                        ),
                        labelText:
                            AppLocalizations.of(context).tr("profile.edit.field"
                                ".label"),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: field4ValueController,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(),
                        ),
                        labelText:
                            AppLocalizations.of(context).tr("profile.edit.field"
                                ".value"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Text(
                  AppLocalizations.of(context).tr("profile.edit.locked.label"),
                ),
                Spacer(),
                Switch(
                  value: locked ?? false,
                  onChanged: (value) {
                    setState(() {
                      locked = value;
                    });
                  },
                  activeTrackColor: Colors.lightBlueAccent,
                  activeColor: Colors.blue,
                ),
              ],
            ),
          ),
          // Form
        ],
      ),
    );
  }
}
