import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/header/account_header_statistic_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/ui/callback/on_click_ui_callback.dart';
import 'package:flutter/cupertino.dart';

class AccountHeaderStatusesCountWidget extends StatelessWidget {
  final bool dark;
  final OnClickUiCallback onStatusesTapCallback;

  const AccountHeaderStatusesCountWidget({
    @required this.dark,
    @required this.onStatusesTapCallback,
  });

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    return StreamBuilder<int>(
        stream: accountBloc.statusesCountStream,
        initialData: accountBloc.statusesCount,
        builder: (context, snapshot) {
          var statusesCount = snapshot.data;
          return AccountHeaderStatisticWidget(
            label: S.of(context).app_account_info_statuses,
            onClick: (context) {
              if (onStatusesTapCallback != null) {
                onStatusesTapCallback(context);
              }
            },
            dark: dark,
            value: statusesCount,
          );
        });
  }
}
