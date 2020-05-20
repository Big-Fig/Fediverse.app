import 'package:flutter/cupertino.dart';

class DialogAction {
  final String label;
  final VoidCallback onAction;

  DialogAction({@required this.label, @required this.onAction});

  @override
  String toString() {
    return 'DialogAction{title: $label, onAction: $onAction}';
  }
}
