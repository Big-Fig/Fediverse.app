import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/dialog/base_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showFediSelectionChooserDialog(
    {@required BuildContext context,
    @required String title,
    String content,
    @required List<SelectionDialogAction> actions,
    bool cancelable = true}) {
  return showFediModalBottomSheetDialog(
    context: context,
    child: FediSelectionChooserDialogBody(
      title: title,
      cancelable: cancelable,
      content: content,
      actions: actions,
    ),
  );
}

class FediSelectionChooserDialogBody extends StatelessWidget {
  final String title;
  final String content;
  final List<SelectionDialogAction> actions;
  final bool cancelable;

  FediSelectionChooserDialogBody({
    @required this.title,
    @required this.content,
    @required this.actions,
    @required this.cancelable,
  });

  Widget _buildAction({
    @required DialogAction action,
    @required bool isSelected,
  }) =>
      Padding(
        padding: FediPadding.horizontalBigPadding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                if (action.onAction != null) {
                  action.onAction();
                }
              },
              child: Row(
                children: [
                  if (action.icon != null)
                    Icon(action.icon,
                        color: isSelected
                            ? FediColors.primary
                            : FediColors.darkGrey),
                  Padding(
                    padding: FediPadding.allMediumPadding,
                    child: Text(
                      action.label,
                      style: isSelected
                          ? FediTextStyles.bigTallPrimary
                          : FediTextStyles.bigTallDarkGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
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
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ...actions
                  .map((action) => _buildAction(
                        action: action,
                        isSelected: action.isSelected,
                      ))
                  .toList()
            ],
          ),
        ),
        if (cancelable)
          _buildAction(
            action: BaseDialog.createDefaultCancelAction(
              context,
            ),
            isSelected: true,
          ),
      ],
    );
  }
}
