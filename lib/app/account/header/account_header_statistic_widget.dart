import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/ui/callback/on_click_ui_callback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'account_header_bloc.dart';

final _numberFormat = NumberFormat("#,###");

class AccountHeaderStatisticWidget extends StatelessWidget {
  final String label;
  final OnClickUiCallback onClick;

  AccountHeaderStatisticWidget({
    @required this.label,
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    var fediUiTextTheme = IFediUiTextTheme.of(context);
    var accountHeaderBloc = IAccountHeaderBloc.of(context);
    var value = Provider.of<int>(context);

    if(value == null) {
      return const SizedBox.shrink();
    }
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
            style: accountHeaderBloc.brightness == Brightness.dark
                ? fediUiTextTheme.bigShortBoldDarkGrey
                : fediUiTextTheme.bigShortBoldWhite,
          ),
          Text(
            label,
            style: accountHeaderBloc.brightness == Brightness.dark
                ? fediUiTextTheme.mediumTallDarkGrey
                : fediUiTextTheme.mediumTallWhite,
          )
        ],
      ),
    );
  }
}
