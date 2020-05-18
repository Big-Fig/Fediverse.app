import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/details/account_details_page.dart';
import 'package:fedi/refactored/app/status/header/status_header_widget.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusReplyHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);
    return StreamBuilder<IAccount>(
        stream: statusBloc.watchInReplyToAccount(),
        initialData: null,
        builder: (context, snapshot) {
          var account = snapshot.data;

          // todo: show progress
          if (account == null) {
            return SizedBox.shrink();
          }

          return StatusHeaderWidget(
              descText:
              AppLocalizations.of(context).tr("app.status.reply.header"),
              account: account);
        });
  }

  const StatusReplyHeaderWidget();
}
