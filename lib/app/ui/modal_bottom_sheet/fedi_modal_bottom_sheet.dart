import 'dart:core';

import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';

void showFediModalBottomSheetDialog({
  @required BuildContext context,
  @required Widget child,
}) {
  var fediUiColorTheme = IFediUiColorTheme.of(context, listen: false);
  showModalBottomSheet(
    context: context,
    backgroundColor: fediUiColorTheme.transparent,
    barrierColor: fediUiColorTheme.modalBottomSheetDarkOverlay,
    isScrollControlled: true,
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
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _FediModalBottomSheetHandlerBar(),
        ClipRRect(
          borderRadius: FediBorderRadius.topOnlyBigBorderRadius,
          child: Container(
            color: fediUiColorTheme.white,
            constraints: BoxConstraints(
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
  const _FediModalBottomSheetHandlerBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Container(
        width: 42.0,
        height: 6.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
          color: IFediUiColorTheme.of(context).lightGrey,
        ),
      ),
    );
  }
}
