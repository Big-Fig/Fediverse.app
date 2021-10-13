import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/base_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T?> showFediSingleSelectionChooserDialog<T>({
  required BuildContext context,
  required String title,
  String? content,
  required List<SelectionDialogAction> actions,
  bool cancelable = true,
}) =>
    showFediModalBottomSheetDialog<T>(
      context: context,
      child: FediSingleSelectionChooserDialogBody(
        title: title,
        cancelable: cancelable,
        content: content,
        actions: actions,
      ),
    );

// todo: unify code with fedi_multi_selection_chooser_dialog.dart
// remove copy-pasted code
class FediSingleSelectionChooserDialogBody extends StatelessWidget {
  final String? title;
  final String? content;
  final List<SelectionDialogAction> actions;
  final bool cancelable;

  FediSingleSelectionChooserDialogBody({
    required this.title,
    required this.content,
    required this.actions,
    required this.cancelable,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (title != null)
            _FediSingleSelectionChooserDialogBodyTitle(title: title),
          if (content != null)
            FediSingleSelectionChooserDialogBodyContent(content: content),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                ...actions
                    .map(
                      (action) =>
                          _FediSingleSelectionChooserDialogBodyContentAction(
                        action: action,
                        isSelected: action.isSelected,
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
          if (cancelable)
            _FediSingleSelectionChooserDialogBodyContentAction(
              action: BaseDialog.createDefaultCancelAction(
                context: context,
              ),
              isSelected: true,
            ),
        ],
      );
}

class FediSingleSelectionChooserDialogBodyContent extends StatelessWidget {
  const FediSingleSelectionChooserDialogBodyContent({
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

class _FediSingleSelectionChooserDialogBodyTitle extends StatelessWidget {
  const _FediSingleSelectionChooserDialogBodyTitle({
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

class _FediSingleSelectionChooserDialogBodyContentAction
    extends StatelessWidget {
  final DialogAction action;
  final bool isSelected;

  const _FediSingleSelectionChooserDialogBodyContentAction({
    Key? key,
    required this.action,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var actionExist = action.onAction != null;

    return Row(
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

                return _FediSingleSelectionChooserDialogBodyContentActionBody(
                  enabled: enabled,
                  actionExist: actionExist,
                  action: action,
                  isSelected: isSelected,
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class _FediSingleSelectionChooserDialogBodyContentActionBody
    extends StatelessWidget {
  const _FediSingleSelectionChooserDialogBodyContentActionBody({
    Key? key,
    required this.enabled,
    required this.actionExist,
    required this.action,
    required this.isSelected,
  }) : super(key: key);

  final bool enabled;
  final bool actionExist;
  final DialogAction action;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    var fediUiTextTheme = IFediUiTextTheme.of(context);

    return InkWell(
      key: action.key,
      onTap: enabled
          ? () {
              if (actionExist && enabled) {
                action.onAction!(context);
              }
            }
          : null,
      child: Padding(
        padding: FediPadding.horizontalBigPadding,
        child: Row(
          children: [
            if (action.icon != null)
              Icon(
                action.icon,
                color: isSelected
                    ? fediUiColorTheme.primary
                    : actionExist && enabled
                        ? IFediUiColorTheme.of(context).darkGrey
                        : IFediUiColorTheme.of(context).lightGrey,
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
    );
  }
}
