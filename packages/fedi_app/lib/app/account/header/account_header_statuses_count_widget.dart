import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/header/account_header_statistic_widget.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/ui/callback/on_click_ui_callback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountHeaderStatusesCountWidget extends StatelessWidget {
  final OnClickUiCallback? onStatusesTapCallback;

  const AccountHeaderStatusesCountWidget({
    Key? key,
    required this.onStatusesTapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    return StreamBuilder<int?>(
      stream: accountBloc.statusesCountStream,
      builder: (context, snapshot) {
        var count = snapshot.data;

        return Provider<int?>.value(
          value: count,
          child: InkWell(
            onTap: () {
              onStatusesTapCallback?.call(context);
            },
            child: AccountHeaderStatisticWidget(
              label: S.of(context).app_account_info_statuses,
            ),
          ),
        );
      },
    );
  }
}
