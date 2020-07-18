import 'package:async/async.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/progress/fedi_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FediDeterminateProgressDialog extends FediProgressDialog {
  final Stream<int> progressStream;

  FediDeterminateProgressDialog(
      {@required this.progressStream,
      String titleMessage,
      String contentMessage,
      bool cancelable = false,
      @required CancelableOperation cancelableOperation})
      : super(
            titleMessage: titleMessage,
            contentMessage: contentMessage,
            cancelable: cancelable,
            cancelableOperation: cancelableOperation);

  @override
  Widget buildDialogTitle(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: buildDialogTitleMessage(context),
          top: 35.0,
        ),
        Positioned(
          child: StreamBuilder<int>(
              stream: progressStream,
              builder: (context, snapshot) {
                var progress = snapshot.data ?? 0;
                return Text(
                  "$progress/100",
                  style: FediTextStyles.bigShortDarkGrey,
                );
              }),
          bottom: 15.0,
          right: 15.0,
        ),
      ],
    );
  }
}
