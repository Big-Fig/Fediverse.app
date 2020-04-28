import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_bloc_impl.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/details/account_details_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<String>(
            stream: accountBloc.acctStream,
            initialData: accountBloc.acct,
            builder: (context, snapshot) {
              var acct = snapshot.data;
              return Text(acct);
            }),
      ),
      body: SafeArea(child: AccountDetailsWidget()),
    );
  }
}

void goToAccountDetailsPage(BuildContext context, IAccount account) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IAccountBloc>(
            create: (context) => AccountBloc.createFromContext(context,
                isNeedWatchLocalRepositoryForUpdates: true,
                account: account,
                isNeedRefreshFromNetworkOnInit: false),
            child: AccountDetailsPage())),
  );
}
