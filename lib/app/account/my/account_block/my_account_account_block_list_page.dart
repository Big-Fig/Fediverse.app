import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/account_block/my_account_account_block_account_pagination_list_widget.dart';
import 'package:fedi/app/account/my/account_block/my_account_account_block_network_only_account_list_bloc.dart';
import 'package:fedi/app/account/my/account_block/my_account_account_block_network_only_account_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/account/select/single/single_select_account_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
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

class MyAccountAccountBlockListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: "app.account.my.account_block.title".tr(),
        actions: [
          buildAddAction(context),
        ],
      ),
      body: SafeArea(
        child: MyAccountAccountBlockAccountPaginationListWidget(),
      ),
    );
  }

  Widget buildAddAction(BuildContext context) {
    var listBloc = IMyAccountAccountBlockNetworkOnlyAccountListBloc.of(
      context,
      listen: false,
    );
    var paginationListBloc =
    IPaginationListBloc.of(context, listen: false);

    return FediIconButton(
      icon: Icon(FediIcons.plus),
      color: IFediUiColorTheme.of(context).darkGrey,
      onPressed: () {
        goToSingleSelectAccountPage(
          context,
          accountSelectedCallback: (context, account) async {
            await listBloc.addAccountBlock(account: account);

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

void goToMyAccountAccountBlockListPage(BuildContext context) {
  Navigator.push(
    context,
    createMyAccountAccountBlockListPage(),
  );
}

MaterialPageRoute createMyAccountAccountBlockListPage() {
  return MaterialPageRoute(
    builder: (context) =>
        MyAccountAccountBlockNetworkOnlyAccountListBloc.provideToContext(
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
              child: MyAccountAccountBlockListPage(),
            ),
          ),
        ),
      ),
    ),
  );
}
