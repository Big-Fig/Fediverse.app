import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_widget.dart';
import 'package:fedi/app/account/display_name/account_display_name_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_custom_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountDetailsPage extends StatefulWidget {
  @override
  _AccountDetailsPageState createState() => _AccountDetailsPageState();

  const AccountDetailsPage();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageCustomAppBar(
        leading: const FediBackIconButton(),
        child: AccountDisplayNameWidget(),
      ),
      body: AccountDetailsWidget(),
    );
  }
}

void goToAccountDetailsPage(BuildContext context, IAccount account) {
  Navigator.push(
    context,
    createAccountDetailsPageRoute(account),
  );
}

MaterialPageRoute createAccountDetailsPageRoute(IAccount account) {
  return MaterialPageRoute(
      builder: (context) => DisposableProvider<IAccountBloc>(
          create: (context) => AccountBloc.createFromContext(context,
              isNeedWatchLocalRepositoryForUpdates: true,
              account: account,
              isNeedRefreshFromNetworkOnInit: false,
              isNeedWatchWebSocketsEvents: false,
              isNeedPreFetchRelationship: true),
          child: const AccountDetailsPage()));
}
