import 'package:easy_localization/easy_localization.dart';
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
import 'package:fedi/disposable/disposable_provider.dart';
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
        title: "app.account.my.domain_block.title".tr(),
        actions: [
          FediIconButton(
            icon: Icon(FediIcons.plus),
            onPressed: () {
              AddMyAccountDomainBlockDialog.createFromContext(
                  context: context,
                  successCallback: () {
                    IPaginationListBloc.of(context, listen: false)
                        .refreshWithController();
                  }).show(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: MyAccountDomainBlockPaginationListWidget(
          key: PageStorageKey("MyAccountDomainBlockListPage"),
          domainBlockSelectedCallback:
              (BuildContext context, DomainBlock domain) {
            // nothing
          },
          domainBlockActions: <Widget>[buildRemoveDomainBlockButton(context)],
        ),
      ),
    );
  }

  Widget buildRemoveDomainBlockButton(BuildContext context) {
    var myAccountDomainBlockNetworkOnlyListBloc =
        IMyAccountDomainBlockNetworkOnlyListBloc.of(context, listen: false);

    var paginationListBloc = IPaginationListBloc.of(context, listen: false);
    return Builder(
      builder: (context) => PleromaAsyncOperationButtonBuilderWidget(
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
      ),
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
