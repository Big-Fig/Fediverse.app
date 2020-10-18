import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/list/account_list_item_widget.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/list/hashtag_list_item_widget.dart';
import 'package:fedi/app/search/result/search_result_model.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
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
      @required Widget footer}) {
    SearchResultItemType previousType;

    var itemWithSeparators = <_ItemOrSeparator<ISearchResultItem>>[];
    items.forEach((item) {
      if (item.type != previousType) {
        switch (item.type) {
          case SearchResultItemType.status:
            itemWithSeparators.add(_ItemOrSeparator<ISearchResultItem>(
                item: null, separator: "app.search.tab.statuses".tr()));
            break;
          case SearchResultItemType.account:
            itemWithSeparators.add(_ItemOrSeparator<ISearchResultItem>(
                item: null, separator: "app.search.tab.accounts".tr()));
            break;
          case SearchResultItemType.hashtag:
            itemWithSeparators.add(_ItemOrSeparator<ISearchResultItem>(
                item: null, separator: "app.search.tab.hashtags".tr()));
            break;
        }
      }
      previousType = item.type;

      itemWithSeparators.add(_ItemOrSeparator(item: item, separator: null));
    });

    return PaginationListWidget.buildItemsListView<
            _ItemOrSeparator<ISearchResultItem>>(
        context: context,
        items: itemWithSeparators,
        header: header,
        footer: footer,
        itemBuilder: (context, index) {
          var itemOrSeparator = itemWithSeparators[index];

          if (itemOrSeparator.separator != null) {
            return Padding(
              padding: FediPadding.allMediumPadding,
              child: Text(
                itemOrSeparator.separator,
                style: IFediUiTextTheme.of(context).bigTallBoldDarkGrey,
              ),
            );
          } else {
            var item = itemOrSeparator.item;

            switch (item.type) {
              case SearchResultItemType.status:
                return buildStatusListItem(item, index);
                break;
              case SearchResultItemType.account:
                return buildAccountListItem(item.account);
                break;
              case SearchResultItemType.hashtag:
                return buildHashtagListItem(item, index);
                break;
              default:
                throw "Invalid item.type ${item.type}";
            }
          }
        });
  }

  Widget buildHashtagListItem(ISearchResultItem item, int index) {
    return Provider<IHashtag>.value(
      value: item.hashtag,
      child: FediListTile(
        isFirstInList: index == 0, //                isFirstInList: false,
        child: HashtagListItemWidget(
          hashtag: item.hashtag,
        ),
      ),
    );
  }

  Provider<IStatus> buildStatusListItem(ISearchResultItem item, int index) {
    return Provider<IStatus>.value(
      value: item.status,
      child: FediListTile(
        isFirstInList: index == 0, //                isFirstInList: false,
        child: StatusListItemTimelineWidget.list(
          collapsible: true,
          statusCallback: (BuildContext context, IStatus status) {
            goToStatusThreadPage(context,
                status: status, initialMediaAttachment: null);
          }, initialMediaAttachment: null,
        ),
      ),
    );
  }

  Provider<IAccount> buildAccountListItem(IAccount account) {
    return Provider<IAccount>.value(
      value: account,
      child: DisposableProxyProvider<IAccount, IAccountBloc>(
          update: (context, account, oldValue) => AccountBloc.createFromContext(
              context,
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
  }

  @override
  IPaginationListBloc<PaginationPage<ISearchResultItem>, ISearchResultItem>
      retrievePaginationListBloc(BuildContext context, {bool listen}) =>
          Provider.of<
              IPaginationListBloc<PaginationPage<ISearchResultItem>,
                  ISearchResultItem>>(context, listen: listen);
}

class _ItemOrSeparator<T> {
  final T item;
  final String separator;

  _ItemOrSeparator({@required this.item, @required this.separator}) {
    assert(item != null || separator != null);
    assert(!(item != null && separator != null));
  }
}
