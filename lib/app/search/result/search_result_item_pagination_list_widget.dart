import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/list/account_list_item_widget.dart';
import 'package:fedi/app/search/result/search_result_model.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SearchResultItemPaginationListWidget
    extends FediPaginationListWidget<ISearchResultItem> {
  const SearchResultItemPaginationListWidget({
    Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
  }) : super(
            key: key,
            header: header,
            footer: footer,
            alwaysShowFooter: alwaysShowFooter,
            alwaysShowHeader: alwaysShowHeader);

  @override
  ScrollView buildItemsCollectionView(
          {@required BuildContext context,
          @required List<ISearchResultItem> items,
          @required Widget header,
          @required Widget footer}) =>
      PaginationListWidget.buildItemsListView(
          context: context,
          items: items,
          header: header,
          footer: footer,
          itemBuilder: (context, index) {
            var item = items[index];

            if (item.isAccount) {
              var account = item.account;
              return Provider<IAccount>.value(
                value: account,
                child: DisposableProxyProvider<IAccount, IAccountBloc>(
                    update: (context, account, oldValue) =>
                        AccountBloc.createFromContext(context,
                            isNeedWatchLocalRepositoryForUpdates: false,
                            account: account,
                            isNeedRefreshFromNetworkOnInit: false,
                            isNeedWatchWebSocketsEvents: false,
                            isNeedPreFetchRelationship: false),
                    child: Column(
                      children: [
                        AccountListItemWidget(
                            accountSelectedCallback: (context, account) {
                          goToAccountDetailsPage(context, account);
                        }),
                        const FediUltraLightGreyDivider()
                      ],
                    )),
              );
            } else {
              return Provider<IStatus>.value(
                value: item.status,
                child: FediListTile(
                  isFirstInList: index == 0,
//                isFirstInList: false,
                  child: StatusListItemTimelineWidget.list(
                    collapsible: true,
                  ),
                ),
              );
            }
          });

  @override
  IPaginationListBloc<PaginationPage<ISearchResultItem>, ISearchResultItem>
      retrievePaginationListBloc(BuildContext context, {bool listen}) =>
          Provider.of<
              IPaginationListBloc<PaginationPage<ISearchResultItem>,
                  ISearchResultItem>>(context, listen: listen);
}
