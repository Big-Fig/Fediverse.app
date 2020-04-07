import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_bloc_impl.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/acct/account_acct_widget.dart';
import 'package:fedi/refactored/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/refactored/app/account/details/account_details_page.dart';
import 'package:fedi/refactored/app/account/display_name/account_display_name_widget.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("status_account_widget.dart");

class StatusAccountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);

    return InitialDataStreamBuilder<IAccount>(
        stream: statusBloc.accountReblogOrOriginalStream,
        initialData: statusBloc.accountReblogOrOriginalAccount,
        builder: (context, snapshot) {
            var reblogOrOriginalAccount = snapshot.data;
            return buildBody(context, reblogOrOriginalAccount, statusBloc);
        });
  }

  Widget buildBody(BuildContext context, IAccount reblogOrOriginalAccount,
      IStatusBloc statusBloc) {
    return Provider<IAccount>.value(
      value: reblogOrOriginalAccount,
      child: DisposableProxyProvider<IAccount, IAccountBloc>(
        update: (context, account, oldValue) => AccountBloc.createFromContext(
            context,
            account: account,
            needWatchLocalRepositoryForUpdates: false,
            needRefreshFromNetworkOnInit: false),
        child: GestureDetector(
          onTap: () {
            goToAccountDetailsPage(context, statusBloc.account);
          },
          behavior: HitTestBehavior.translucent,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AccountAvatarWidget(
                imageSize: 40,
                progressSize: 15,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AccountDisplayNameWidget(),
                  AccountAcctWidget()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
