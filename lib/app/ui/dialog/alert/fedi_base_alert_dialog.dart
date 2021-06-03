import 'package:fedi/app/ui/dialog/fedi_dialog.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FediBaseAlertDialog extends FediDialog {
  final String? contentText;

  FediBaseAlertDialog({
    String? title,
    required this.contentText,
    List<DialogAction>? actions,
    Axis actionsAxis = Axis.horizontal,
    bool cancelable = true,
    bool actionsBorderVisible = true,
  }) : super(
          title: title,
          actions: actions,
          actionsAxis: actionsAxis,
          cancelable: cancelable,
          actionsBorderVisible: actionsBorderVisible,
        );

  @override
  Widget? buildContentWidget(BuildContext context) {
    if (contentText == null) {
      return null;
    }
    return Padding(
      padding: FediPadding.horizontalSmallPadding,
      child: Text(
        contentText!,
        textAlign: TextAlign.center,
        style: IFediUiTextTheme.of(context).dialogContentDarkGrey,
      ),
    );
  }
}
