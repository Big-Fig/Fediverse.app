import 'dart:core';

import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet_keys.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';

Future<T?> showFediModalBottomSheetDialog<T>({
  required BuildContext context,
  required Widget child,
  bool isScrollControlled = true,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  var fediUiColorTheme = IFediUiColorTheme.of(context, listen: false);

  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    useRootNavigator: useRootNavigator,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    backgroundColor: fediUiColorTheme.transparent,
    barrierColor: fediUiColorTheme.modalBottomSheetDarkOverlay,
    builder: (BuildContext context) => AnimatedPadding(
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      padding: MediaQuery.of(context).viewInsets,
      child: _FediModalBottomSheetDialogBodyWidget(
        child: child,
      ),
    ),
  );
}

class _FediModalBottomSheetDialogBodyWidget extends StatelessWidget {
  const _FediModalBottomSheetDialogBodyWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _FediModalBottomSheetHandlerBar(
          key: Key(
            FediModalBottomSheetKeys.fediModalBottomSheetHandlerBar,
          ),
        ),
        ClipRRect(
          borderRadius: FediBorderRadius.topOnlyBigBorderRadius,
          child: Container(
            color: fediUiColorTheme.white,
            constraints: BoxConstraints(
              // ignore: no-magic-number
              maxHeight: MediaQuery.of(context).size.height / 4.0 * 3.0,
            ),
            child: Padding(
              padding: FediPadding.verticalBigPadding,
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}

class _FediModalBottomSheetHandlerBar extends StatelessWidget {
  const _FediModalBottomSheetHandlerBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Container(
            // ignore: no-magic-number
            width: 42.0,
            // ignore: no-magic-number
            height: 6.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                // ignore: no-magic-number
                Radius.circular(6.0),
              ),
              color: IFediUiColorTheme.of(context).lightGrey,
            ),
          ),
        ),
      );
}
