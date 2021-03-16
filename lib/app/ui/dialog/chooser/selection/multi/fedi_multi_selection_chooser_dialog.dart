import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/base_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T?> showFediMultiSelectionChooserDialog<T>({
  required BuildContext context,
  required String title,
  String? content,
  required Stream<List<SelectionDialogAction>> isNeedRebuildActionsStream,
  bool cancelable = true,
}) {
  return showFediModalBottomSheetDialog(
    context: context,
    child: FediMultiSelectChooserDialogBody(
      title: title,
      cancelable: cancelable,
      content: content,
      isNeedRebuildActionsStream: isNeedRebuildActionsStream,
    ),
  );
}

class FediMultiSelectChooserDialogBody extends StatelessWidget {
  final String? title;
  final String? content;
  final bool cancelable;

  final Stream<List<SelectionDialogAction>> isNeedRebuildActionsStream;

  FediMultiSelectChooserDialogBody({
    required this.title,
    required this.content,
    required this.cancelable,
    required this.isNeedRebuildActionsStream,
  });

  Widget _buildAction({
    required BuildContext context,
    required DialogAction action,
    required bool? isSelected,
    required bool isCancelAction,
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
                ? action.isActionEnabledFetcher!(context)
                : true,
            stream: action.isActionEnabledStreamFetcher != null
                ? action.isActionEnabledStreamFetcher!(context)
                : Stream.value(true),
            builder: (context, snapshot) {
              var enabled = snapshot.data!;
              var fediUiColorTheme = IFediUiColorTheme.of(context);
              var fediUiTextTheme = IFediUiTextTheme.of(context);
              var color = isSelected!
                  ? fediUiColorTheme.primary
                  : actionExist && enabled
                      ? IFediUiColorTheme.of(context).darkGrey
                      : IFediUiColorTheme.of(context).lightGrey;
              return InkWell(
                onTap: enabled
                    ? () {
                        if (actionExist && enabled) {
                          action.onAction!(context);
                        }
                      }
                    : null,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!isCancelAction)
                      FediIconButton(
                        icon: Icon(FediIcons.check_circle),
                        color: color,
                        onPressed: () {
                          if (actionExist && enabled) {
                            action.onAction!(context);
                          }
                        },
                      ),
                    if (action.icon != null)
                      Icon(
                        action.icon,
                        color: color,
                      ),
                    Padding(
                      padding: FediPadding.allMediumPadding,
                      child: Text(
                        action.label!,
                        style: action.customTextStyle?.copyWith(
                                color: isSelected
                                    ? fediUiColorTheme.primary
                                    : actionExist && enabled
                                        ? fediUiColorTheme.darkGrey
                                        : fediUiColorTheme.lightGrey) ??
                            (isSelected
                                ? fediUiTextTheme.bigTallPrimary
                                : actionExist && enabled
                                    ? fediUiTextTheme.bigTallDarkGrey
                                    : fediUiTextTheme.bigTallLightGrey),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
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
              title!,
              style: IFediUiTextTheme.of(context).dialogTitleBoldDarkGrey,
            ),
          ),
        if (content != null)
          Padding(
            padding: const EdgeInsets.only(bottom: FediSizes.smallPadding),
            child: Text(
              content!,
              style: IFediUiTextTheme.of(context).dialogContentDarkGrey,
            ),
          ),
        Align(
          alignment: Alignment.centerLeft,
          child: StreamBuilder<List<SelectionDialogAction>?>(
              stream: isNeedRebuildActionsStream,
              initialData: [],
              builder: (context, snapshot) {
                var actions = snapshot.data;
                if (actions == null) {
                  return const SizedBox.shrink();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ...actions
                        .map(
                          (action) => _buildAction(
                            context: context,
                            action: action,
                            isSelected: action.isSelected,
                            isCancelAction: false,
                          ),
                        )
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
            isCancelAction: true,
          ),
      ],
    );
  }
}
