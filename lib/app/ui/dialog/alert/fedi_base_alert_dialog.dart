import 'package:fedi/app/ui/button/text/fedi_transparent_text_button.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/dialog/base_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FediBaseAlertDialog extends BaseDialog {
  final String title;
  final String content;
  final List<DialogAction> actions;
  final Axis actionsAxis;

  FediBaseAlertDialog({
    this.title,
    this.content,
    this.actions,
    this.actionsAxis = Axis.horizontal,
    bool cancelable = true,
  }) : super(cancelable: cancelable);

  Widget buildButton({
    @required BuildContext context,
    @required DialogAction action,
    @required Color color,
    @required bool notAddRightPadding,
  }) {
    var button = FediTransparentTextButton(
      action.label,
      onPressed: action.onAction,
      color: color,
    );
    if (notAddRightPadding) {
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
          color: IFediUiColorTheme.of(context).white,
          borderRadius: FediBorderRadius.allBigBorderRadius,
        ),
        child: Padding(
          padding: FediPadding.allBigPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (title != null)
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: FediSizes.smallPadding),
                  child: Text(
                    title,
                    style: IFediUiTextTheme.of(context).dialogTitleBoldDarkGrey,
                  ),
                ),
              if (content != null)
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: FediSizes.smallPadding),
                  child: Text(
                    content,
                    style: IFediUiTextTheme.of(context).dialogContentDarkGrey,
                  ),
                ),
              FediBigVerticalSpacer(),
              buildActionWidgets(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildActionWidgets(BuildContext context) {
    var isHorizontal = actionsAxis == Axis.horizontal;
    if (isHorizontal) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
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
                    color: IFediUiColorTheme.of(context).primary,
                    notAddRightPadding: isLast,
                  ),
                );
              })?.toList() ??
              []
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ...actions?.asMap()?.entries?.map((entry) {

                var action = entry.value;
                return Padding(
                  padding: FediPadding.verticalSmallPadding,
                  child: buildButton(
                    context: context,
                    action: action,
                    color: IFediUiColorTheme.of(context).primary,
                    notAddRightPadding: true,
                  ),
                );
              })?.toList() ??
              [],
          if (cancelable)
            Padding(
              padding: FediPadding.verticalSmallPadding,
              child: buildCancelAction(
                context: context,
                isLast: true,
              ),
            ),
        ],
      );
    }
  }

  Widget buildCancelAction({
    @required BuildContext context,
    @required bool isLast,
  }) =>
      buildButton(
        context: context,
        action: BaseDialog.createDefaultCancelAction(context),
        color: IFediUiColorTheme.of(context).mediumGrey,
        notAddRightPadding: isLast,
      );
}
