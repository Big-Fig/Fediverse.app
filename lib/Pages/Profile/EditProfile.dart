import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Accounts.dart';
import 'package:fedi/Views/Alert.dart';
import 'package:fedi/Views/ProgressDialog.dart';
import 'package:flutter/material.dart';
import 'package:fedi/Pages/Profile/ProfileImageEditor.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Models/Account.dart';
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
  var bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayNameController.text = myAccount.displayName;
    bioController.text = removeAllHtmlTags(myAccount.note);
    setState(() {});
  }

  alertDisplayName(BuildContext context) {
    showAlert(
      context: context,
      title: "Unsaved changes",
      body:
          "There are unsaved changes to your display name. Are you sure you want to discard them?",
      actions: [
        AlertAction(
          text: "Discard",
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
      title: "Unsaved changes",
      body:
          "There are unsaved changes to your bio. Are you sure you want to discard them?",
      actions: [
        AlertAction(
          text: "Discard",
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
    _pr.setMessage('Updating Profile');
    _pr.show();

    CurrentInstance.instance.currentClient.run(
        path: Accounts.updateCurrentUser(),
        method: HTTPMethod.PATCH,
        params: {
          "display_name": displayNameController.text,
          "note": bioController.text
        }).then((response) {
      _pr.hide();
      CurrentInstance.instance.currentAccount.refreshAccount().then((response) {
        var alert = Alert(context, "Success!", "Profile updated!", () {});
        alert.showAlert();
      }).catchError((error) {
        var alert = Alert(
            context,
            "Opps",
            "Unable to update yoru profile at this time. Please try again later.",
            () => {});
        alert.showAlert();
      });

      print(response.body);
    }).catchError((error) {
      _pr.hide();
      var alert = Alert(
          context,
          "Opps",
          "Unable to update yoru profile at this time. Please try again later.",
          () => {});
      alert.showAlert();
    });
  }

  mediaUploaded(String id) {
    setState(() {
      
    });
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
            } else if (bioController.text !=
                removeAllHtmlTags(myAccount.note)) {
              alertBio(context);
            } else {
              widget.stateUpdated(context);
            }
          },
        ),
        title: Row(children: <Widget>[Text("Edit Account")]),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Save",
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
                    child: FadeInImage.assetNetwork(
                      image: myAccount.header,
                      placeholder: "assets/images/double_ring_loading_io.gif",
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileImageEditor(
                                1, mediaUploaded, "avatar")));
                  },
                  child: Container(
                    width: 125,
                    height: 125,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: new BorderRadius.circular(8.0),
                          child: FadeInImage.assetNetwork(
                            placeholder:
                                'assets/images/double_ring_loading_io.gif',
                            image: myAccount.avatar,
                            height: 125.0,
                            width: 125.0,
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
                              builder: (context) => ProfileImageEditor(
                                  1, mediaUploaded, "header")));
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
                              "Header",
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
                padding: EdgeInsets.all(
                    10), // only( bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TextField(
                  controller: displayNameController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Display Name',
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
                padding: EdgeInsets.all(
                    10), // only( bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TextField(
                  controller: bioController,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Bio',
                  ),
                ),
              ),
            ),
          ),
          // Form
        ],
      ),
    );
  }
}
