import 'package:fedi/app/account/header/account_header_bloc.dart';
import 'package:fedi/app/ui/statistic/fedi_statistic_item_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final _numberFormat = NumberFormat('#,###');

class AccountHeaderStatisticWidget extends StatelessWidget {
  final String label;

  const AccountHeaderStatisticWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

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
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    var accountHeaderBloc = IAccountHeaderBloc.of(context);

    return FediStatisticItemWidget(
      label: label,
      valueString: valueString,
      color: accountHeaderBloc.brightness == Brightness.dark
          ? fediUiColorTheme.darkGrey
          : fediUiColorTheme.white,
    );
  }
}
