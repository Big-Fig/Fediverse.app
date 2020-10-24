import 'package:fedi/app/ui/dialog/alert/fedi_base_alert_dialog.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/base_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/widgets.dart';

class FediSimpleAlertDialog extends FediBaseAlertDialog {
  final DialogActionCallback action;

  FediSimpleAlertDialog({
    @required BuildContext context,
    String title,
    String content,
    this.action,
  }) : super(title: title, content: content, cancelable: true);

  @override
  Widget buildDismissAction({
    @required BuildContext context,
    @required bool isLast,
  }) =>
      buildButton(
        context: context,
        action:
            BaseDialog.createDefaultOkAction(context: context, action: action),
        color: IFediUiColorTheme.of(context).mediumGrey,
        notAddRightPadding: isLast,
      );
}
