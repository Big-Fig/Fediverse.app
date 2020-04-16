import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:flutter/cupertino.dart';

class DialogAction {
  final String title;
  final VoidCallback onAction;

  DialogAction({@required this.title, @required this.onAction});

  @override
  String toString() {
    return 'DialogAction{title: $title, onAction: $onAction}';
  }

  static DialogAction createdDefaultCancelAction(BuildContext context) {
    return DialogAction(
        onAction: () {
          Navigator.of(context).pop();
        },
        title: AppLocalizations.of(context).tr("alert.action.cancel"));
  }

}
