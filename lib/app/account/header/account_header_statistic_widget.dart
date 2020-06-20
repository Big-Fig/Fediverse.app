import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

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
    return GestureDetector(
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
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w500,
              height: 1.15,
              fontSize: 16.0,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w300,
              height: 1.5,
              fontSize: 14.0,
            ),
          )
        ],
      ),
    );
  }
}
