import 'package:fedi/refactored/dialog/progress/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DeterminateProgressDialog extends ProgressDialog {
  final Stream<int> progressStream;

  DeterminateProgressDialog(
      {@required this.progressStream, String contentMessage})
      : super(contentMessage: contentMessage);

  @override
  Widget buildDialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: buildDialogContentMessage(context),
          top: 35.0,
        ),
        Positioned(
          child: StreamBuilder<int>(
              stream: progressStream,
              builder: (context, snapshot) {
                var progress = snapshot.data ?? 0;
                return Text("$progress/100",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400));
              }),
          bottom: 15.0,
          right: 15.0,
        ),
      ],
    );
  }
}
