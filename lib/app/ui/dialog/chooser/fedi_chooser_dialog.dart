import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
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
              style: IFediUiTextTheme.of(context).dialogTitleBoldDarkGrey,
            ),
          ),
        if (content != null)
          Padding(
            padding: const EdgeInsets.only(bottom: FediSizes.smallPadding),
            child: Text(
              content,
              style: IFediUiTextTheme.of(context).dialogContentDarkGrey,
            ),
          ),
        FediUltraLightGreyDivider(),
        if (loadingActions)
          Padding(
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
                    .toList()
              ],
            ),
          ),
        if (cancelable)
          _buildAction(
            context: context,
            action: BaseDialog.createDefaultCancelAction(
              context: context,
            ),
          ),
      ],
    );
  }

  Widget _buildAction(
      {@required BuildContext context, @required DialogAction action}) {
    return Padding(
      padding: FediPadding.horizontalBigPadding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (action.onAction != null) {
                action.onAction(context);
              }
            },
            child: Row(
              children: [
                if (action.icon != null)
                  Icon(action.icon,
                      color: IFediUiColorTheme.of(context).darkGrey),
                Padding(
                  padding: FediPadding.allMediumPadding,
                  child: Text(
                    action.label,
                    style: IFediUiTextTheme.of(context).bigTallPrimary,
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
