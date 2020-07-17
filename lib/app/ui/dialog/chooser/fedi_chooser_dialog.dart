import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/dialog/base_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showFediChooserDialog(
    {@required BuildContext context,
    @required String title,
    String content,
    @required List<DialogAction> actions,
    bool cancelable = true}) {
  return showFediModalBottomSheetDialog(
    context: context,
    child: FediChooserDialogBody(
      title: title,
      content: content,
      actions: actions,
      cancelable: cancelable,
    ),
  );
}

class FediChooserDialogBody extends StatelessWidget {
  final String title;
  final String content;
  final List<DialogAction> actions;
  final bool loadingActions;
  final bool cancelable;

  FediChooserDialogBody({
    @required this.title,
    this.content,
    @required this.actions,
    @required this.cancelable,
    this.loadingActions = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: FediSizes.smallPadding),
            child: Text(
              title,
              style: FediTextStyles.dialogTitleBoldDarkGrey,
            ),
          ),
        if (content != null)
          Padding(
            padding: const EdgeInsets.only(bottom: FediSizes.smallPadding),
            child: Text(
              content,
              style: FediTextStyles.dialogContentDarkGrey,
            ),
          ),
        if (loadingActions) Padding(
          padding: FediPadding.allBigPadding,
          child: FediCircularProgressIndicator(),
        ),
        if (!loadingActions)
          ...actions.map((action) => _buildAction(action)).toList(),
        if (cancelable)
          _buildAction(BaseDialog.createDefaultCancelAction(context)),
      ],
    );
  }

  Widget _buildAction(DialogAction action) => InkWell(
        onTap: () {
          action.onAction();
        },
        child: Padding(
          padding: FediPadding.allMediumPadding,
          child: Text(
            action.label,
            style: FediTextStyles.bigTallPrimary,
          ),
        ),
      );
}
