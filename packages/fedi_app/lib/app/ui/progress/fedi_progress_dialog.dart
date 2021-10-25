import 'package:async/async.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/dialog/base_dialog.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

abstract class FediProgressDialog extends BaseDialog {
  final String? titleMessage;
  final String? contentMessage;

  CancelableOperation? cancelableOperation;

  // ignore: close_sinks
  final BehaviorSubject<bool> _isCanceledSubject =
      BehaviorSubject.seeded(false);

  bool? get isCanceled => _isCanceledSubject.valueOrNull;

  Stream<bool> get isCanceledStream => _isCanceledSubject.stream;

  FediProgressDialog({
    this.titleMessage,
    this.contentMessage,
    required this.cancelableOperation,
    required bool cancelable,
  }) : super(cancelable: cancelable) {
    _isCanceledSubject.disposeWith(this);
  }

  Widget buildDialogTitle(BuildContext context);

  Widget buildDialogTitleMessage(BuildContext context) => Padding(
        padding: FediPadding.allSmallPadding,
        child: Text(
          titleMessage ?? S.of(context).dialog_progress_content,
          textAlign: TextAlign.center,
          style: IFediUiTextTheme.of(context).subHeaderShortBoldDarkGrey,
        ),
      );

  Widget buildDialogContent(BuildContext context) => Padding(
        padding: FediPadding.allSmallPadding,
        child: Text(
          contentMessage!,
          textAlign: TextAlign.center,
          style: IFediUiTextTheme.of(context).bigShortDarkGrey.copyWith(
                height: 1,
              ),
        ),
      );

  @override
  Widget buildDialogBody(BuildContext context) => Dialog(
        insetAnimationCurve: Curves.easeInOut,
        // ignore: no-magic-number
        insetAnimationDuration: const Duration(milliseconds: 100),
        // ignore: no-magic-number
        elevation: 10.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              // ignore: no-magic-number
              10.0,
            ),
          ),
        ),
        child: buildDialogContainer(context),
      );

  Widget buildDialogContainer(BuildContext context) => Padding(
        padding: FediPadding.allBigPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: FediCircularProgressIndicator(
                // ignore: no-magic-number
                size: 35.0,
                color: IFediUiColorTheme.of(context).primary,
              ),
            ),
            buildDialogTitle(context),
            if (contentMessage != null) buildDialogContent(context),
            if (cancelable)
              StreamBuilder<bool>(
                stream: isCanceledStream,
                initialData: isCanceled,
                builder: (context, snapshot) {
                  var canceled = snapshot.data!;
                  Future<void> Function()? onPressed;

                  if (!canceled) {
                    onPressed = () async {
                      _isCanceledSubject.add(true);
                      // ignore: avoid-ignoring-return-values
                      await cancelableOperation!.cancel();
                      if (isShowing) {
                        await hide(context);
                      }
                    };
                  }

                  return InkWell(
                    onTap: onPressed,
                    child: Text(
                      S.of(context).dialog_progress_action_cancel,
                      style: IFediUiTextTheme.of(context).mediumShortPrimary,
                    ),
                  );
                },
              ),
          ],
        ),
      );
}
