import 'package:flutter/material.dart';

class Alert {
  // user defined function
  BuildContext context;
  String title;
  String message;
  Function onPress;

  Alert(this.context, this.title, this.message, this.onPress);

  showAlert() {
    showDialog(
      context: this.context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(this.title),
          content: new Text(this.message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
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
