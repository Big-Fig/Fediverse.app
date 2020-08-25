import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            style: FediTextStyles.bigShortBoldDarkGrey.copyWith(color: color),
          ),
          Text(
            label,
            style: FediTextStyles.mediumTallDarkGrey.copyWith(color: color),
          )
        ],
      ),
    );
  }
}
