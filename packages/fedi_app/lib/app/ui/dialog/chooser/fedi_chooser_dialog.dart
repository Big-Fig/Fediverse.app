import 'package:fedi_app/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:fedi_app/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi_app/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/dialog/base_dialog.dart';
import 'package:fedi_app/dialog/dialog_model.dart';
import 'package:fedi_app/ui/callback/on_click_ui_callback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T?> showFediChooserDialog<T>({
  required BuildContext context,
  required String title,
  String? content,
  required List<DialogAction> actions,
  bool cancelable = true,
  OnClickUiCallback? customCancelCallback,
}) =>
    showFediModalBottomSheetDialog<T>(
      context: context,
      child: FediChooserDialogBody(
        title: title,
        content: content,
        actions: actions,
        cancelable: cancelable,
        customCancelCallback: customCancelCallback,
      ),
    );

class FediChooserDialogBody extends StatelessWidget {
  final String? title;
  final String? content;
  final List<DialogAction> actions;
  final bool loadingActions;
  final bool cancelable;
  final OnClickUiCallback? customCancelCallback;

  const FediChooserDialogBody({
    Key? key,
    required this.title,
    this.content,
    this.customCancelCallback,
    required this.actions,
    required this.cancelable,
    this.loadingActions = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(
                bottom: FediSizes.smallPadding,
                // ignore: no-equal-arguments
                left: FediSizes.smallPadding,
                // ignore: no-equal-arguments
                right: FediSizes.smallPadding,
              ),
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: IFediUiTextTheme.of(context).dialogTitleBoldDarkGrey,
              ),
            ),
          if (content != null)
            Padding(
              padding: const EdgeInsets.only(
                bottom: FediSizes.smallPadding,
                // ignore: no-equal-arguments
                left: FediSizes.smallPadding,
                // ignore: no-equal-arguments
                right: FediSizes.smallPadding,
              ),
              child: Text(
                content!,
                textAlign: TextAlign.center,
                style: IFediUiTextTheme.of(context).dialogContentDarkGrey,
              ),
            ),
          const FediUltraLightGreyDivider(),
          if (loadingActions)
            const Padding(
              padding: FediPadding.allBigPadding,
              child: FediCircularProgressIndicator(),
            ),
          if (!loadingActions)
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ...actions
                      .map(
                        (action) => _buildAction(
                          context: context,
                          action: action,
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          if (cancelable)
            // ignore: avoid-returning-widgets
            _buildAction(
              context: context,
              action: BaseDialog.createDefaultCancelAction(
                context: context,
                customCallback: customCancelCallback,
              ),
            ),
        ],
      );

  Widget _buildAction({
    required BuildContext context,
    required DialogAction action,
  }) {
    var enabled = action.onAction != null;

    return Padding(
      padding: FediPadding.horizontalBigPadding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (enabled) {
                action.onAction!(context);
              }
            },
            child: Row(
              children: [
                if (action.icon != null)
                  Icon(
                    action.icon,
                    color: enabled
                        ? IFediUiColorTheme.of(context).darkGrey
                        : IFediUiColorTheme.of(context).lightGrey,
                  ),
                Padding(
                  padding: FediPadding.allMediumPadding,
                  child: Text(
                    action.label!,
                    style: action.customTextStyle ??
                        IFediUiTextTheme.of(context).bigTallPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
