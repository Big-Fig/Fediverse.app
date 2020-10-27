import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final _numberFormat = NumberFormat("#,###");

class AccountHeaderStatisticWidget extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onPressed;
  final Color color;

  AccountHeaderStatisticWidget({
    @required this.label,
    @required this.value,
    @required this.onPressed,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _numberFormat.format(value),
            style: IFediUiTextTheme.of(context).bigShortBoldDarkGrey.copyWith(color: color),
          ),
          Text(
            label,
            style: IFediUiTextTheme.of(context).mediumTallDarkGrey.copyWith(color: color),
          )
        ],
      ),
    );
  }
}
