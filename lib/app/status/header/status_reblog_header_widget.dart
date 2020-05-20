import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/header/status_header_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusReblogHeaderWidget extends StatelessWidget {
  const StatusReblogHeaderWidget();

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);
    return StreamBuilder<IAccount>(
        stream: statusBloc.accountStream,
        initialData: statusBloc.account,
        builder: (context, snapshot) {
          var account = snapshot.data;
          return StatusHeaderWidget(
              descText:
                  AppLocalizations.of(context).tr("app.status.reblog.header"),
              account: account);
        });
  }
}
