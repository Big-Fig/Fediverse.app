import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_bloc_impl.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/details/account_details_widget.dart';
import 'package:fedi/refactored/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/refactored/app/ui/home/fedi_home_tab_container_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);
    return Scaffold(
      body: FediHomeTabContainer(
        topHeaderHeightInSafeArea: 104,
        body: AccountDetailsWidget(),
        topBar: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: buildBackButton(context),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: buildAcct(accountBloc),
              ),
            ),
          ],
        ),
      ),
    );
  }

  StreamBuilder<String> buildAcct(IAccountBloc accountBloc) {
    return StreamBuilder<String>(
        stream: accountBloc.acctStream,
        initialData: accountBloc.acct,
        builder: (context, snapshot) {
          var acct = snapshot.data;
          return Text(
            acct,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          );
        });
  }

  FediIconInCircleTransparentButton buildBackButton(BuildContext context) {
    return FediIconInCircleTransparentButton(
      Icons.chevron_left,
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
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
