import 'package:fedi/refactored/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_bloc_impl.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/details/account_details_widget.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                needWatchLocalRepositoryForUpdates: true,
                account: account, needRefreshFromNetworkOnInit: false),
            child: AccountDetailsPage())),
  );
}
