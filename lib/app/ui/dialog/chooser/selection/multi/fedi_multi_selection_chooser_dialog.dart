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
}) =>
    showFediModalBottomSheetDialog(
      context: context,
      child: FediMultiSelectChooserDialogBody(
        title: title,
        cancelable: cancelable,
        content: content,
        isNeedRebuildActionsStream: isNeedRebuildActionsStream,
      ),
    );

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

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (title != null)
            _FediMultiSelectChooserDialogBodyTitleWidget(title: title),
          if (content != null)
            _FediMultiSelectChooserDialogBodyContentWidget(content: content),
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
                          (action) =>
                              _FediMultiSelectChooserDialogBodyActionWidget(
                            action: action,
                            isSelected: action.isSelected,
                            isCancelAction: false,
                          ),
                        )
                        .toList(),
                  ],
                );
              },
            ),
          ),
          _FediMultiSelectChooserDialogBodyActionWidget(
            action: BaseDialog.createDefaultOkAction(
              context: context,
              action: null,
            ),
            isSelected: true,
            isCancelAction: true,
          ),
        ],
      );
}

class _FediMultiSelectChooserDialogBodyContentWidget extends StatelessWidget {
  const _FediMultiSelectChooserDialogBodyContentWidget({
    Key? key,
    required this.content,
  }) : super(key: key);

  final String? content;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: FediSizes.smallPadding),
        child: Text(
          content!,
          style: IFediUiTextTheme.of(context).dialogContentDarkGrey,
        ),
      );
}

class _FediMultiSelectChooserDialogBodyTitleWidget extends StatelessWidget {
  const _FediMultiSelectChooserDialogBodyTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: FediSizes.smallPadding),
        child: Text(
          title!,
          style: IFediUiTextTheme.of(context).dialogTitleBoldDarkGrey,
        ),
      );
}

class _FediMultiSelectChooserDialogBodyActionWidget extends StatelessWidget {
  final DialogAction action;
  final bool isSelected;
  final bool isCancelAction;

  const _FediMultiSelectChooserDialogBodyActionWidget({
    Key? key,
    required this.action,
    required this.isSelected,
    required this.isCancelAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var actionExist = action.onAction != null;

    return Padding(
      padding: FediPadding.horizontalBigPadding,
      child: StreamBuilder<bool>(
        initialData: action.isActionEnabledFetcher != null
            ? action.isActionEnabledFetcher!(context)
            : true,
        stream: action.isActionEnabledStreamFetcher != null
            ? action.isActionEnabledStreamFetcher!(context)
            : Stream.value(true),
        builder: (context, snapshot) {
          var enabled = snapshot.data!;
          var fediUiColorTheme = IFediUiColorTheme.of(context);

          var color = isSelected
              ? fediUiColorTheme.primary
              : actionExist && enabled
                  ? IFediUiColorTheme.of(context).darkGrey
                  : IFediUiColorTheme.of(context).lightGrey;

          return StreamBuilder<bool>(
            initialData: action.isActionVisibleFetcher != null
                ? action.isActionVisibleFetcher!(context)
                : true,
            stream: action.isActionVisibleStreamFetcher != null
                ? action.isActionVisibleStreamFetcher!(context)
                : Stream.value(true),
            builder: (context, snapshot) {
              var visible = snapshot.data!;
              if (!visible) {
                return SizedBox.shrink();
              }

              return _FediMultiSelectChooserDialogBodyActionBodyWidget(
                enabled: enabled,
                actionExist: actionExist,
                action: action,
                isCancelAction: isCancelAction,
                color: color,
                isSelected: isSelected,
              );
            },
          );
        },
      ),
    );
  }
}

class _FediMultiSelectChooserDialogBodyActionBodyWidget
    extends StatelessWidget {
  const _FediMultiSelectChooserDialogBodyActionBodyWidget({
    Key? key,
    required this.enabled,
    required this.actionExist,
    required this.action,
    required this.isCancelAction,
    required this.color,
    required this.isSelected,
  }) : super(key: key);

  final bool enabled;
  final bool actionExist;
  final DialogAction action;
  final bool isCancelAction;
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    var fediUiTextTheme = IFediUiTextTheme.of(context);

    return InkWell(
      onTap: enabled
          ? () {
              if (actionExist && enabled) {
                action.onAction!(context);
              }
            }
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: isCancelAction
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
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
                                  : fediUiColorTheme.lightGrey,
                        ) ??
                        (isSelected
                            ? fediUiTextTheme.bigTallPrimary
                            : actionExist && enabled
                                ? fediUiTextTheme.bigTallDarkGrey
                                : fediUiTextTheme.bigTallLightGrey),
                  ),
                ),
              ],
            ),
          ),
          if (!isCancelAction)
            FediIconButton(
              icon: Icon(
                isSelected
                    ? FediIcons.check_circle_solid
                    : FediIcons.check_circle,
              ),
              color: color,
              onPressed: () {
                if (actionExist && enabled) {
                  action.onAction!(context);
                }
              },
            ),
        ],
      ),
    );
  }
}
