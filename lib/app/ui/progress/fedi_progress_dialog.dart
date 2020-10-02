import 'package:async/async.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/dialog/base_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

abstract class FediProgressDialog extends BaseDialog {
  final String titleMessage;
  final String contentMessage;

  CancelableOperation cancelableOperation;

  // ignore: close_sinks
  final BehaviorSubject<bool> _isCanceledSubject =
      BehaviorSubject.seeded(false);

  bool get isCanceled => _isCanceledSubject.value;

  Stream<bool> get isCanceledStream => _isCanceledSubject.stream;

  FediProgressDialog({
    this.titleMessage,
    this.contentMessage,
    @required this.cancelableOperation,
    @required bool cancelable,
  }) : super(cancelable: cancelable) {
    addDisposable(subject: _isCanceledSubject);
  }

  Widget buildDialogTitle(BuildContext context);

  Widget buildDialogTitleMessage(BuildContext context) {
    return Padding(
      padding: FediPadding.allSmallPadding,
      child: Text(
        titleMessage ?? tr("dialog.progress.content"),
        textAlign: TextAlign.center,
        style: FediTextStyles.subHeaderShortBoldDarkGrey,
      ),
    );
  }

  Widget buildDialogContent(BuildContext context) {
    return Padding(
      padding: FediPadding.allSmallPadding,
      child: Text(
        contentMessage,
        textAlign: TextAlign.center,
        style: FediTextStyles.bigShortDarkGrey.copyWith(
          height: 1,
        ),
      ),
    );
  }

  @override
  Widget buildDialog(BuildContext context) => Dialog(
      insetAnimationCurve: Curves.easeInOut,
      insetAnimationDuration: Duration(milliseconds: 100),
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: buildDialogContainer(context));

  Widget buildDialogContainer(BuildContext context) {
    return Padding(
      padding: FediPadding.allBigPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: FediCircularProgressIndicator(
              size: 35.0,
              color: FediColors.primaryColor,
            ),
          ),
          buildDialogTitle(context),
          if (contentMessage != null) buildDialogContent(context),
          if (cancelable)
            StreamBuilder<bool>(
                stream: isCanceledStream,
                initialData: isCanceled,
                builder: (context, snapshot) {
                  var canceled = snapshot.data;
                  Future<Null> Function() onPressed;

                  if (!canceled) {
                    onPressed = () async {
                      _isCanceledSubject.add(true);
                      await cancelableOperation.cancel();
                      if(isShowing) {
                        hide(context);
                      }
                    };
                  }
                  return InkWell(
                    child: Text(
                      tr("dialog.progress.action.cancel"),
                      style: FediTextStyles.mediumShortPrimary,
                    ),
                    onTap: onPressed,
                  );
                })
        ],
      ),
    );
  }
}
