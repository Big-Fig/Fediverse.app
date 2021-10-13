import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef StringBuilderFromContext = String Function(BuildContext context);

Future<void> showSettingsDialog({
  required BuildContext context,
  required String? title,
  StringBuilderFromContext? titleBuilder,
  required String? subTitle,
  StringBuilderFromContext? subTitleBuilder,
  required Widget child,
}) =>
    showFediModalBottomSheetDialog<void>(
      context: context,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: FediSizes.smallPadding,
          horizontal: FediSizes.bigPadding,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Builder(
                builder: (context) => _SettingsDialogTitle(
                  title: titleBuilder != null ? titleBuilder(context) : title,
                ),
              ),
            ),
            Center(
              child: Builder(
                builder: (context) => _SettingsDialogSubTitle(
                  subTitle: subTitleBuilder != null
                      ? subTitleBuilder(context)
                      : subTitle,
                ),
              ),
            ),
            const FediBigVerticalSpacer(),
            const FediUltraLightGreyDivider(),
            const FediSmallVerticalSpacer(),
            child,
          ],
        ),
      ),
    );

class _SettingsDialogSubTitle extends StatelessWidget {
  final String? subTitle;

  const _SettingsDialogSubTitle({
    Key? key,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        subTitle!,
        style: IFediUiTextTheme.of(context).bigTallDarkGrey,
      );
}

class _SettingsDialogTitle extends StatelessWidget {
  final String? title;

  const _SettingsDialogTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        title!,
        style: IFediUiTextTheme.of(context).subHeaderTallBoldDarkGrey,
      );
}
