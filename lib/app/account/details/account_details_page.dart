import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_widget.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountDetailsPage extends StatefulWidget {
  @override
  _AccountDetailsPageState createState() => _AccountDetailsPageState();

  const AccountDetailsPage();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  ScrollControllerBloc scrollControllerBloc;
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollControllerBloc =
        ScrollControllerBloc(scrollController: scrollController);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    scrollControllerBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);

    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: accountBloc.acct,
      ),
      body: Provider<IScrollControllerBloc>.value(
        value: scrollControllerBloc,
        child: AccountDetailsWidget(scrollController: scrollController),
      ),
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
                isNeedRefreshFromNetworkOnInit: false,
                isNeedWatchWebSocketsEvents: false,
                isNeedPreFetchRelationship: true),
            child: const AccountDetailsPage())),
  );
}
