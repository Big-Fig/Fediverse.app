import 'package:fedi/app/account/my/domain_block/add/add_my_account_domain_block_dialog.dart';
import 'package:fedi/app/account/my/domain_block/list/network_only/my_account_domain_block_network_only_list_bloc.dart';
import 'package:fedi/app/account/my/domain_block/list/network_only/my_account_domain_block_network_only_list_bloc_impl.dart';
import 'package:fedi/app/account/my/domain_block/list/network_only/my_account_domain_block_network_only_pagination_bloc.dart';
import 'package:fedi/app/account/my/domain_block/list/network_only/my_account_domain_block_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/account/my/domain_block/list/pagination/my_account_domain_block_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/my/domain_block/list/pagination/my_account_domain_block_pagination_list_widget.dart';
import 'package:fedi/app/account/my/domain_block/my_account_domain_block_model.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/network_only/network_only_pagination_bloc.dart';
import 'package:fedi/pagination/network_only/network_only_pagination_bloc_proxy_provider.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccountDomainBlockListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: S.of(context).app_account_my_domainBlock_title,
        actions: [
          const _MyAccountDomainBlockListPageAddAction(),
        ],
      ),
      body: const _MyAccountDomainBlockListPageBody(),
    );
  }
}

class _MyAccountDomainBlockListPageBody extends StatelessWidget {
  const _MyAccountDomainBlockListPageBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: MyAccountDomainBlockPaginationListWidget(
        key: PageStorageKey("MyAccountDomainBlockListPage"),
        domainBlockSelectedCallback: null,
        domainBlockActions: <Widget>[
          _MyAccountDomainBlockListPageRemoveItemAction(),
        ],
      ),
    );
  }
}

class _MyAccountDomainBlockListPageRemoveItemAction extends StatelessWidget {
  const _MyAccountDomainBlockListPageRemoveItemAction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myAccountDomainBlockNetworkOnlyListBloc =
        IMyAccountDomainBlockNetworkOnlyListBloc.of(context);

    var paginationListBloc = IPaginationListBloc.of(context);
    return PleromaAsyncOperationButtonBuilderWidget(
      asyncButtonAction: () async {
        var domain = Provider.of<DomainBlock>(context, listen: false);
        await myAccountDomainBlockNetworkOnlyListBloc.removeDomainBlock(
            domain: domain.domain);
        paginationListBloc.refreshWithController();
      },
      builder: (BuildContext context, void Function() onPressed) {
        return FediIconButton(
          icon: Icon(FediIcons.remove_circle),
          onPressed: onPressed,
        );
      },
    );
  }
}

class _MyAccountDomainBlockListPageAddAction extends StatelessWidget {
  const _MyAccountDomainBlockListPageAddAction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediIconButton(
      icon: Icon(FediIcons.plus),
      color: IFediUiColorTheme.of(context).darkGrey,
      onPressed: () {
        AddMyAccountDomainBlockDialog.createFromContext(
            context: context,
            successCallback: () {
              IPaginationListBloc.of(context, listen: false)
                  .refreshWithController();
            }).show(context);
      },
    );
  }
}

void goToMyAccountDomainBlockListPage(BuildContext context) {
  Navigator.push(
    context,
    createMyAccountDomainBlockListPage(),
  );
}

MaterialPageRoute createMyAccountDomainBlockListPage() {
  return MaterialPageRoute(
    builder: (context) =>
        MyAccountDomainBlockNetworkOnlyDomainListBloc.provideToContext(
      context,
      child: DisposableProvider<IMyAccountDomainBlockNetworkOnlyPaginationBloc>(
        create: (context) =>
            MyAccountDomainBlockNetworkOnlyPaginationBloc.createFromContext(
                context),
        child: ProxyProvider<IMyAccountDomainBlockNetworkOnlyPaginationBloc,
            INetworkOnlyPleromaPaginationBloc<DomainBlock>>(
          update: (context, value, previous) => value,
          child: ProxyProvider<
              INetworkOnlyPleromaPaginationBloc<DomainBlock>,
              INetworkOnlyPaginationBloc<PaginationPage<DomainBlock>,
                  DomainBlock>>(
            update: (context, value, previous) => value,
            child: NetworkOnlyPaginationBlocProxyProvider<
                PaginationPage<DomainBlock>, DomainBlock>(
              child: MyAccountDomainBlockPaginationListBloc.provideToContext(
                context,
                child: MyAccountDomainBlockListPage(),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
