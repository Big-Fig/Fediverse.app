import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/header/fedi_sub_header_text.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Dark == white status bar -- for  IOS.
        brightness: Brightness.light,
        backgroundColor: FediColors.white,
        title: buildAcct(accountBloc),
        leading: const FediBackIconButton(),
      ),
      body: const AccountDetailsWidget(),
    );
  }

  StreamBuilder<String> buildAcct(IAccountBloc accountBloc) {
    return StreamBuilder<String>(
        stream: accountBloc.acctStream,
        initialData: accountBloc.acct,
        builder: (context, snapshot) {
          var acct = snapshot.data;
          return FediSubHeaderText(acct);
        });
  }

  const AccountDetailsPage();
}

void goToAccountDetailsPage(BuildContext context, IAccount account) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IAccountBloc>(
            create: (context) => AccountBloc.createFromContext(context,
                isNeedWatchLocalRepositoryForUpdates: true,
                account: account,
                isNeedRefreshFromNetworkOnInit: false,
                isNeedWatchWebSocketsEvents: false),
            child: const AccountDetailsPage())),
  );
}
