import 'package:flutter/cupertino.dart';

class DialogAction {
  final String title;
  final VoidCallback onAction;

  DialogAction({@required this.title, @required this.onAction});

  @override
  String toString() {
    return 'DialogAction{title: $title, onAction: $onAction}';
  }
}
