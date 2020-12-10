import 'package:fedi/app/account/my/domain_block/list/my_account_domain_block_list_item_widget.dart';
import 'package:fedi/app/account/my/domain_block/list/pagination/my_account_domain_block_pagination_list_bloc.dart';
import 'package:fedi/app/account/my/domain_block/my_account_domain_block_model.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("domainBlock_pagination_list_widget.dart");

class MyAccountDomainBlockPaginationListWidget
    extends FediPaginationListWidget<DomainBlock> {
  final DomainBlockCallback domainBlockSelectedCallback;

  final bool needWatchLocalRepositoryForUpdates;
  final List<Widget> domainBlockActions;

  const MyAccountDomainBlockPaginationListWidget({
    @required Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
    this.needWatchLocalRepositoryForUpdates = true,
    this.domainBlockActions,
    Widget customLoadingWidget,
    Widget customEmptyWidget,
    @required this.domainBlockSelectedCallback,
    bool refreshOnFirstLoad = true,
  }) : super(
          key: key,
          header: header,
          footer: footer,
          alwaysShowHeader: alwaysShowHeader,
          alwaysShowFooter: alwaysShowFooter,
          customEmptyWidget: customEmptyWidget,
          customLoadingWidget: customLoadingWidget,
          refreshOnFirstLoad: refreshOnFirstLoad,
        );

  @override
  ScrollView buildItemsCollectionView(
          {@required BuildContext context,
          @required List<DomainBlock> items,
          @required Widget header,
          @required Widget footer}) =>
      PaginationListWidget.buildItemsListView(
        context: context,
        items: items,
        header: header,
        footer: footer,
        itemBuilder: (context, index) {
          var item = items[index];
          _logger.finest(() => "itemBuilder ${item.domain}");
          return Provider<DomainBlock>.value(
            value: item,
            child: MyAccountDomainBlockListItemWidget(
              domainBlockSelectedCallback: domainBlockSelectedCallback,
              domainBlockActions: domainBlockActions,
            ),
          );
        },
      );

  @override
  IPaginationListBloc<PaginationPage<DomainBlock>, DomainBlock>
      retrievePaginationListBloc(BuildContext context, {bool listen}) {
    var domainBlockPaginationListBloc =
        IMyAccountDomainBlockPaginationListBloc.of(context, listen: listen);
    return domainBlockPaginationListBloc;
  }
}
