import 'package:flutter/material.dart';

class Alert {
  // user defined function
  BuildContext context;
  String title;
  String message;
  bool showCancel = false;
  Function onPress;
  String actionButtonTitle = "Ok";
  String cancelButtonTitle = "Cancel";

  Alert(this.context, this.title, this.message, this.onPress, {this.showCancel, this.actionButtonTitle, this.cancelButtonTitle});

  showAlert() {
    showDialog(
      context: this.context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(this.title),
          content: new Text(this.message),
          actions: <Widget>[
            if (showCancel == true)
              FlatButton(
                child: new Text(cancelButtonTitle ?? "Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: new Text(actionButtonTitle ?? "Ok"),
              onPressed: () {
                Navigator.of(context).pop();
                this.onPress();
              },
            ),
          ],
        );
      },
    );
  }
}
