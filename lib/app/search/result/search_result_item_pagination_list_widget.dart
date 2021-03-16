import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/local_account_details_page.dart';
import 'package:fedi/app/account/list/account_list_item_widget.dart';
import 'package:fedi/app/account/local_account_bloc_impl.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/list/hashtag_list_item_widget.dart';
import 'package:fedi/app/search/result/search_result_model.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc_impl.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/local_status_thread_page.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SearchResultItemPaginationListWidget
    extends FediPaginationListWidget<ISearchResultItem> {

  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  const SearchResultItemPaginationListWidget({
    Key? key,
    Widget? header,
    Widget? footer,
    bool? alwaysShowHeader,
    bool? alwaysShowFooter,
    bool refreshOnFirstLoad = true,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag,
  }) : super(
          key: key,
          header: header,
          footer: footer,
          alwaysShowFooter: alwaysShowFooter,
          alwaysShowHeader: alwaysShowHeader,
          refreshOnFirstLoad: refreshOnFirstLoad,
        );

  @override
  ScrollView buildItemsCollectionView({
    required BuildContext context,
    required List<ISearchResultItem> items,
    required Widget? header,
    required Widget? footer,
  }) {
    SearchResultItemType? previousType;

    List<_ItemOrSeparator<ISearchResultItem?>> itemWithSeparators = <_ItemOrSeparator<ISearchResultItem>>[];
    items.forEach((item) {
      if (item.type != previousType) {
        switch (item.type) {
          case SearchResultItemType.status:
            itemWithSeparators.add(
              _ItemOrSeparator<ISearchResultItem?>(
                item: null,
                separator: S.of(context).app_search_tab_statuses,
              ),
            );
            break;
          case SearchResultItemType.account:
            itemWithSeparators.add(
              _ItemOrSeparator<ISearchResultItem?>(
                item: null,
                separator: S.of(context).app_search_tab_accounts,
              ),
            );
            break;
          case SearchResultItemType.hashtag:
            itemWithSeparators.add(
              _ItemOrSeparator<ISearchResultItem?>(
                item: null,
                separator: S.of(context).app_search_tab_hashtags,
              ),
            );
            break;
        }
      }
      previousType = item.type;

      itemWithSeparators.add(_ItemOrSeparator(item: item, separator: null));
    });

    return PaginationListWidget.buildItemsListView<
        _ItemOrSeparator<ISearchResultItem?>>(
      context: context,
      keyboardDismissBehavior:keyboardDismissBehavior,
      items: itemWithSeparators,
      header: header,
      footer: footer,
      itemBuilder: (context, index) {
        var itemOrSeparator = itemWithSeparators[index];

        if (itemOrSeparator.separator != null) {
          return Padding(
            padding: FediPadding.allMediumPadding,
            child: Text(
              itemOrSeparator.separator!,
              style: IFediUiTextTheme.of(context).bigTallBoldDarkGrey,
            ),
          );
        } else {
          var item = itemOrSeparator.item!;

          switch (item.type) {
            case SearchResultItemType.status:
              return buildStatusListItem(item, index);
            case SearchResultItemType.account:
              return buildAccountListItem(item.account);
            case SearchResultItemType.hashtag:
              return buildHashtagListItem(item, index);
          }
        }
      },
    );
  }

  Widget buildHashtagListItem(ISearchResultItem item, int index) {
    return Provider<IHashtag?>.value(
      value: item.hashtag,
      child: FediListTile(
        isFirstInList: index == 0, //                isFirstInList: false,
        child: const HashtagListItemWidget(),
      ),
    );
  }

  Provider<IStatus?> buildStatusListItem(ISearchResultItem item, int index) {
    return Provider<IStatus?>.value(
      value: item.status,
      child: FediListTile(
        isFirstInList: index == 0, //                isFirstInList: false,
        child: DisposableProxyProvider<IStatus, IStatusListItemTimelineBloc>(
          update: (context, status, _) => StatusListItemTimelineBloc.list(
            status: status,
            collapsible: true,
            statusCallback: _onStatusClick,
            initialMediaAttachment: null,
          ),
          child: const StatusListItemTimelineWidget(),
        ),
      ),
    );
  }

  Provider<IAccount?> buildAccountListItem(IAccount? account) {
    return Provider<IAccount?>.value(
      value: account,
      child: DisposableProxyProvider<IAccount, IAccountBloc>(
          update: (context, account, oldValue) =>
              LocalAccountBloc.createFromContext(context,
                  isNeedWatchLocalRepositoryForUpdates: false,
                  account: account,
                  isNeedRefreshFromNetworkOnInit: false,
                  isNeedWatchWebSocketsEvents: false,
                  isNeedPreFetchRelationship: false),
          child: Column(
            children: [
              const AccountListItemWidget(
                accountSelectedCallback: _accountSelectedCallback,
              ),
              const FediUltraLightGreyDivider()
            ],
          )),
    );
  }

  @override
  IPaginationListBloc<PaginationPage<ISearchResultItem>, ISearchResultItem>
      retrievePaginationListBloc(BuildContext context, {required bool listen}) =>
          Provider.of<
              IPaginationListBloc<PaginationPage<ISearchResultItem>,
                  ISearchResultItem>>(context, listen: listen);
}

void _accountSelectedCallback(BuildContext context, IAccount account) {
  goToLocalAccountDetailsPage(
    context,
    account: account,
  );
}

class _ItemOrSeparator<T> {
  final T item;
  final String? separator;

  _ItemOrSeparator({required this.item, required this.separator}) {
    assert(item != null || separator != null);
    assert(!(item != null && separator != null));
  }
}

void _onStatusClick(BuildContext context, IStatus status) {
  goToLocalStatusThreadPage(context,
      status: status, initialMediaAttachment: null);
}
