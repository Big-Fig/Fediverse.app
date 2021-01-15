import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/base_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showFediMultiSelectionChooserDialog(
    {@required BuildContext context,
    @required String title,
    String content,
    @required Stream<List<SelectionDialogAction>> rebuildActionsStream,
    bool cancelable = true}) {
  return showFediModalBottomSheetDialog(
    context: context,
    child: FediMultiSelectChooserDialogBody(
      title: title,
      cancelable: cancelable,
      content: content,
      rebuildActionsStream: rebuildActionsStream,
    ),
  );
}

class FediMultiSelectChooserDialogBody extends StatelessWidget {
  final String title;
  final String content;
  final bool cancelable;

  final Stream<List<SelectionDialogAction>> rebuildActionsStream;

  FediMultiSelectChooserDialogBody({
    @required this.title,
    @required this.content,
    @required this.cancelable,
    @required this.rebuildActionsStream,
  });

  Widget _buildAction({
    @required BuildContext context,
    @required DialogAction action,
    @required bool isSelected,
  }) {
    var actionExist = action.onAction != null;
    return Padding(
      padding: FediPadding.horizontalBigPadding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          StreamBuilder<bool>(
              initialData: action.isActionEnabledFetcher != null
                  ? action.isActionEnabledFetcher(context)
                  : true,
              stream: action.isActionEnabledStreamFetcher != null
                  ? action.isActionEnabledStreamFetcher(context)
                  : Stream.value(true),
              builder: (context, snapshot) {
                var enabled = snapshot.data;
                var fediUiColorTheme = IFediUiColorTheme.of(context);
                var fediUiTextTheme = IFediUiTextTheme.of(context);
                return InkWell(
                  onTap: enabled
                      ? () {
                          if (actionExist && enabled) {
                            action.onAction(context);
                          }
                        }
                      : null,
                  child: Row(
                    children: [
                      if (action.icon != null)
                        Icon(action.icon,
                            color: isSelected
                                ? fediUiColorTheme.primary
                                : actionExist && enabled
                                    ? IFediUiColorTheme.of(context).darkGrey
                                    : IFediUiColorTheme.of(context).lightGrey),
                      Padding(
                        padding: FediPadding.allMediumPadding,
                        child: Text(
                          action.label,
                          style: action.customTextStyle ?? isSelected
                              ? fediUiTextTheme.bigTallPrimary
                              : actionExist && enabled
                                  ? fediUiTextTheme.bigTallDarkGrey
                                  : fediUiTextTheme.bigTallLightGrey,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }

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
        Align(
          alignment: Alignment.centerLeft,
          child: StreamBuilder(
              stream: rebuildActionsStream,
              builder: (context, snapshot) {
                var actions = snapshot.data;
                if (actions == null) {
                  return SizedBox.shrink();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ...actions
                        .map((action) => _buildAction(
                              context: context,
                              action: action,
                              isSelected: action.isSelected,
                            ))
                        .toList()
                  ],
                );
              }),
        ),
        if (cancelable)
          _buildAction(
            context: context,
            action: BaseDialog.createDefaultCancelAction(
              context: context,
            ),
            isSelected: true,
          ),
      ],
    );
  }
}