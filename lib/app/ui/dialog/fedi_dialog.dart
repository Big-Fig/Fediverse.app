import 'package:fedi/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/base_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class FediDialog extends BaseDialog {
  final String title;
  final List<DialogAction> actions;
  final Axis actionsAxis;
  final bool actionsBorderVisible;

  FediDialog({
    @required this.title,
    @required this.actions,
    @required this.actionsBorderVisible,
    this.actionsAxis = Axis.horizontal,
    bool cancelable = true,
  }) : super(cancelable: cancelable);

  Widget buildButton({
    @required BuildContext context,
    @required DialogAction action,
    @required Color color,
    @required Color disabledColor,
    @required bool notAddRightPadding,
  }) {
    var button = StreamBuilder<bool>(
      initialData: action.isActionEnabledFetcher != null
          ? action.isActionEnabledFetcher(context)
          : true,
      stream: action.isActionEnabledStreamFetcher != null
          ? action.isActionEnabledStreamFetcher(context)
          : Stream.value(true),
      builder: (context, snapshot) {
        var enabled = snapshot.data;
        return FediTransparentTextButtonWithBorder(
          action.label,
          borderVisible: actionsBorderVisible,
          textStyle: action.customTextStyle,
          onPressed: enabled
              ? () {
                  action.onAction(context);
                }
              : null,
          color: action.customColor ?? (enabled ? color : disabledColor),
          expanded: true,
        );
      },
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
  Widget buildDialogBody(BuildContext context) {
    var content = buildContentWidget(context);
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return Dialog(
      backgroundColor: fediUiColorTheme.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: fediUiColorTheme.white,
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
                  child: content,
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
                child: buildDismissAction(
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
                    disabledColor: IFediUiColorTheme.of(context).lightGrey,
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
                    disabledColor: IFediUiColorTheme.of(context).lightGrey,
                    notAddRightPadding: true,
                  ),
                );
              })?.toList() ??
              [],
          if (cancelable)
            Padding(
              padding: FediPadding.verticalSmallPadding,
              child: buildDismissAction(
                context: context,
                isLast: true,
              ),
            ),
        ],
      );
    }
  }

  Widget buildDismissAction({
    @required BuildContext context,
    @required bool isLast,
  }) =>
      buildButton(
        context: context,
        action: BaseDialog.createDefaultCancelAction(
          context: context,
        ),
        color: IFediUiColorTheme.of(context).mediumGrey,
        disabledColor: IFediUiColorTheme.of(context).lightGrey,
        notAddRightPadding: isLast,
      );

  Widget buildContentWidget(BuildContext context);
}
