import 'package:fedi/app/ui/button/text/fedi_white_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/dialog/base_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FediBaseAlertDialog extends BaseDialog {
  final String title;
  final String content;
  final List<DialogAction> actions;

  FediBaseAlertDialog({
    this.title,
    this.content,
    this.actions,
    bool cancelable = true,
  }) : super(cancelable: cancelable);

  Widget buildButton({
    @required BuildContext context,
    @required DialogAction action,
    @required Color color,
    @required bool isLast,
  }) {
    var button = FediWhiteFilledTextButton(
      action.label,
      onPressed: action.onAction,
      color: color,
    );
    if (isLast) {
      return button;
    } else {
      return Padding(
        padding: const EdgeInsets.only(right: FediSizes.mediumPadding),
        child: button,
      );
    }
  }

  @override
  Widget buildDialog(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: FediColors.white,
          borderRadius: FediBorderRadius.allBigBorderRadius,
        ),
        child: Padding(
          padding: FediPadding.allBigPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null)
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: FediSizes.smallPadding),
                  child: Text(
                    title,
                    style: FediTextStyles.dialogTitleBoldDarkGrey,
                  ),
                ),
              if (content != null)
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: FediSizes.smallPadding),
                  child: Text(
                    content,
                    style: FediTextStyles.dialogContentDarkGrey,
                  ),
                ),
              FediBigVerticalSpacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (cancelable)
                    Expanded(
                        child: buildCancelAction(
                      context: context,
                      isLast: actions?.isNotEmpty != true,
                    )),
                  ...actions?.asMap()?.entries?.map((entry) {
                        var index = entry.key;
                        var action = entry.value;
                        var isLast = actions.length - 1 == index;
                        return Expanded(
                          child: buildButton(
                            context: context,
                            action: action,
                            color: FediColors.primaryColor,
                            isLast: isLast,
                          ),
                        );
                      })?.toList() ??
                      []
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCancelAction({
    @required BuildContext context,
    @required bool isLast,
  }) =>
      buildButton(
        context: context,
        action: BaseDialog.createDefaultCancelAction(context),
        color: FediColors.mediumGrey,
        isLast: isLast,
      );
}
