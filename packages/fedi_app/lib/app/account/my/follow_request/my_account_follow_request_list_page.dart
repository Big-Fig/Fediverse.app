import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/my/follow_request/my_account_follow_request_account_pagination_list_widget.dart';
import 'package:fedi_app/app/account/my/follow_request/my_account_follow_request_network_only_account_list_bloc_impl.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi_app/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi_app/app/account/pagination/network_only/account_network_only_pagination_bloc_impl.dart';
import 'package:fedi_app/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/pagination/network_only/network_only_pagination_bloc.dart';
import 'package:fedi_app/pagination/network_only/network_only_pagination_bloc_proxy_provider.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccountFollowRequestListPage extends StatelessWidget {
  const MyAccountFollowRequestListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_account_my_followRequest_title,
        ),
        body: const SafeArea(
          child: MyAccountFollowRequestAccountPaginationListWidget(
            customEmptyWidget: _MyAccountFollowRequestListPageEmptyWidget(),
          ),
        ),
      );
}

class _MyAccountFollowRequestListPageEmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FediEmptyWidget(
        title: S.of(context).app_account_my_followRequest_empty_title,
      );

  const _MyAccountFollowRequestListPageEmptyWidget();
}

Future<void> goToMyAccountFollowRequestListPage(BuildContext context) =>
    Navigator.push(
      context,
      createMyAccountFollowRequestListPage(),
    );

MaterialPageRoute createMyAccountFollowRequestListPage() =>
    MaterialPageRoute<void>(
      builder: (context) =>
          MyAccountFollowRequestNetworkOnlyAccountListBloc.provideToContext(
        context,
        child: DisposableProvider<IAccountNetworkOnlyPaginationBloc>(
          create: AccountNetworkOnlyPaginationBloc.createFromContext,
          child: ProxyProvider<IAccountNetworkOnlyPaginationBloc,
              INetworkOnlyPaginationBloc<PaginationPage<IAccount>, IAccount>>(
            update: (context, value, previous) => value,
            child: NetworkOnlyPaginationBlocProxyProvider<
                PaginationPage<IAccount>, IAccount>(
              child: AccountPaginationListBloc.provideToContext(
                context,
                loadFromCacheDuringInit: false,
                child: const MyAccountFollowRequestListPage(),
              ),
            ),
          ),
        ),
      ),
    );
