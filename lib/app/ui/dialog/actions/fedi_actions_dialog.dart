import 'package:fedi/app/ui/dialog/fedi_dialog.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class FediActionsDialog extends FediDialog {
  final String? contentText;

  FediActionsDialog({
    required List<DialogAction> actions,
    required String title,
    this.contentText,
    bool actionsBorderVisible = false,
    Axis actionsAxis = Axis.vertical,
  }) : super(
          title: title,
          actions: actions,
          cancelable: true,
          actionsBorderVisible: actionsBorderVisible,
          actionsAxis: actionsAxis,
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
