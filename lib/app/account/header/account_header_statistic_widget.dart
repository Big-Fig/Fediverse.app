import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'account_header_bloc.dart';

final _numberFormat = NumberFormat("#,###");

class AccountHeaderStatisticWidget extends StatelessWidget {
  final String label;

  AccountHeaderStatisticWidget({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<int?>(context);

    if (value == null) {
      return const SizedBox.shrink();
    }
    var valueString = _numberFormat.format(value);
    return AccountHeaderStatisticBodyWidget(
      valueString: valueString,
      label: label,
    );
  }
}

class AccountHeaderStatisticBodyWidget extends StatelessWidget {
  const AccountHeaderStatisticBodyWidget({
    Key? key,
    required this.valueString,
    required this.label,
  }) : super(key: key);

  final String valueString;
  final String label;

  @override
  Widget build(BuildContext context) {
    var fediUiTextTheme = IFediUiTextTheme.of(context);
    var accountHeaderBloc = IAccountHeaderBloc.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          valueString,
          style: accountHeaderBloc.brightness == Brightness.dark
              ? fediUiTextTheme.bigShortBoldDarkGrey
              : fediUiTextTheme.bigShortBoldWhite,
        ),
        Text(
          label,
          style: accountHeaderBloc.brightness == Brightness.dark
              ? fediUiTextTheme.mediumTallDarkGrey
              : fediUiTextTheme.mediumTallWhite,
        ),
      ],
    );
  }
}
