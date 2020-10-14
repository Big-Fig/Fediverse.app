import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/account_mute/my_account_account_mute_account_pagination_list_widget.dart';
import 'package:fedi/app/account/my/account_mute/my_account_account_mute_network_only_account_list_bloc.dart';
import 'package:fedi/app/account/my/account_mute/my_account_account_mute_network_only_account_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/account/select/single/single_select_account_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/network_only/network_only_pagination_bloc.dart';
import 'package:fedi/pagination/network_only/network_only_pagination_bloc_proxy_provider.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccountAccountMuteListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: "app.account.my.account_mute.title".tr(),
        actions: [
          buildAddAction(context),
        ],
      ),
      body: SafeArea(
        child: MyAccountAccountMuteAccountPaginationListWidget(),
      ),
    );
  }

  Widget buildAddAction(BuildContext context) {
    var listBloc = IMyAccountAccountMuteNetworkOnlyAccountListBloc.of(
      context,
      listen: false,
    );
    var paginationListBloc = IPaginationListBloc.of(context, listen: false);

    return FediIconButton(
      icon: Icon(FediIcons.plus),
      color: FediColors.darkGrey,
      onPressed: () {
        goToSingleSelectAccountPage(
          context,
          accountSelectedCallback: (context, account) async {
            await listBloc.addAccountMute(account: account);

            Navigator.of(context).pop();

            await paginationListBloc.refreshWithController();
          },
          excludeMyAccount: true,
          followingsOnly: false,
          customRemoteAccountListLoader: null,
          customLocalAccountListLoader: null,
        );
      },
    );
  }
}

void goToMyAccountAccountMuteListPage(BuildContext context) {
  Navigator.push(
    context,
    createMyAccountAccountMuteListPage(),
  );
}

MaterialPageRoute createMyAccountAccountMuteListPage() {
  return MaterialPageRoute(
    builder: (context) =>
        MyAccountAccountMuteNetworkOnlyAccountListBloc.provideToContext(
      context,
      child: DisposableProvider<IAccountNetworkOnlyPaginationBloc>(
        create: (context) =>
            AccountNetworkOnlyPaginationBloc.createFromContext(context),
        child: ProxyProvider<IAccountNetworkOnlyPaginationBloc,
            INetworkOnlyPaginationBloc<PaginationPage<IAccount>, IAccount>>(
          update: (context, value, previous) => value,
          child: NetworkOnlyPaginationBlocProxyProvider<
              PaginationPage<IAccount>, IAccount>(
            child: AccountPaginationListBloc.provideToContext(
              context,
              child: MyAccountAccountMuteListPage(),
            ),
          ),
        ),
      ),
    ),
  );
}
