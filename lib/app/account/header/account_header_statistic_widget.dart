import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/ui/callback/on_click_ui_callback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final _numberFormat = NumberFormat("#,###");

class AccountHeaderStatisticWidget extends StatelessWidget {
  final String label;
  final int value;
  final OnClickUiCallback onClick;
  final bool dark;

  AccountHeaderStatisticWidget({
    @required this.label,
    @required this.value,
    @required this.onClick,
    @required this.dark,
  });

  @override
  Widget build(BuildContext context) {
    var fediUiTextTheme = IFediUiTextTheme.of(context);
    return InkWell(
      onTap: () {
        if (onClick != null) {
          onClick(context);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _numberFormat.format(value),
            style: dark
                ? fediUiTextTheme.bigShortBoldDarkGrey
                : fediUiTextTheme.bigShortBoldWhite,
          ),
          Text(
            label,
            style: dark
                ? fediUiTextTheme.mediumTallDarkGrey
                : fediUiTextTheme.mediumTallWhite,
          )
        ],
      ),
    );
  }
}
