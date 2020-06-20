import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/header/account_header_statistic_widget.dart';
import 'package:flutter/cupertino.dart';

class AccountHeaderStatusesCountWidget extends StatelessWidget {
  final Color color;
  final VoidCallback onStatusesTapCallback;

  AccountHeaderStatusesCountWidget(
      {@required this.color, @required this.onStatusesTapCallback});

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);

    return StreamBuilder<int>(
        stream: accountBloc.statusesCountStream,
        initialData: accountBloc.statusesCount,
        builder: (context, snapshot) {
          var statusesCount = snapshot.data;
          return AccountHeaderStatisticWidget(
            label: tr("app.account.info.statuses"),
            onPressed: () {
              if (onStatusesTapCallback != null) {
                onStatusesTapCallback();
              }
            },
            color: color,
            value: statusesCount,
          );
        });
  }
}
