import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Alert {
  // user defined function
  BuildContext context;
  String title;
  String message;
  bool showCancel = false;
  Function onPress;
  String actionButtonTitle;
  String cancelButtonTitle;

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
                child: new Text(cancelButtonTitle ??
                    AppLocalizations.of(context)
                        .tr("alert.action.cancel")
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: new Text(actionButtonTitle ??
                  AppLocalizations.of(context)
                      .tr("alert.action.ok")
              ),
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