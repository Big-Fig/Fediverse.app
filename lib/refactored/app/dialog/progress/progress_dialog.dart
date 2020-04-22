import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/dialog/base_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProgressDialog extends BaseDialog {

  final String contentMessage;

  ProgressDialog({this.contentMessage})
      : super(cancelable: false);

  Widget buildDialogContent(BuildContext context);

  Widget buildDialogContentMessage(BuildContext context) {
    return Text(
        contentMessage ??
            AppLocalizations.of(context)
                .tr("dialog.progress.content"),
        textAlign: TextAlign.justify,
        style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.w700));
  }

  @override
  Widget buildDialog(BuildContext context) => Dialog(
      insetAnimationCurve: Curves.easeInOut,
      insetAnimationDuration: Duration(milliseconds: 100),
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: buildDialogContainer(context));

  Widget buildDialogContainer(BuildContext context) => SizedBox(
        height: 100.0,
        child: Row(children: <Widget>[
          const SizedBox(width: 15.0),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: 60.0,
              height: 60.0,
              child: CircularProgressIndicator(),
            ),
          ),
          const SizedBox(width: 15.0),
          Expanded(
            child: buildDialogContent(context),
          )
        ]));
}
