import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/header/status_header_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusReblogHeaderWidget extends StatelessWidget {
  const StatusReblogHeaderWidget();

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);
    if (statusBloc.reblog != null) {
      return StreamBuilder<IAccount>(
        stream: statusBloc.accountStream,
        initialData: statusBloc.account,
        builder: (context, snapshot) {
          var account = snapshot.data;
          return Provider.value(
            value: account,
            child: StatusHeaderWidget(
              descText: S.of(context).app_status_reblog_header,
              icon: FediIcons.reply,
            ),
          );
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
