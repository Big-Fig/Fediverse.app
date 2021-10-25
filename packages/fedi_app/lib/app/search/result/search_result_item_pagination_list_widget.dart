import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/details/local_account_details_page.dart';
import 'package:fedi_app/app/account/list/account_list_item_widget.dart';
import 'package:fedi_app/app/account/local_account_bloc_impl.dart';
import 'package:fedi_app/app/hashtag/hashtag_bloc.dart';
import 'package:fedi_app/app/hashtag/hashtag_bloc_impl.dart';
import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/app/hashtag/list/hashtag_list_item_widget.dart';
import 'package:fedi_app/app/search/result/search_result_model.dart';
import 'package:fedi_app/app/status/list/status_list_item_timeline_bloc.dart';
import 'package:fedi_app/app/status/list/status_list_item_timeline_bloc_impl.dart';
import 'package:fedi_app/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/status/thread/local_status_thread_page.dart';
import 'package:fedi_app/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/list/fedi_list_tile.dart';
import 'package:fedi_app/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_widget.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
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
          isNeedToAddPaddingForUiTests: false,
        );

  @override
  ScrollView buildItemsCollectionView({
    required BuildContext context,
    required List<ISearchResultItem> items,
    required Widget? header,
    required Widget? footer,
  }) {
    SearchResultItemType? previousType;

    var itemWithSeparators = <_ItemOrSeparator<ISearchResultItem>>[];
    for (final item in items) {
      if (item.type != previousType) {
        switch (item.type) {
          case SearchResultItemType.status:
            itemWithSeparators.add(
              _ItemOrSeparator<ISearchResultItem>(
                item: null,
                separator: S.of(context).app_search_tab_statuses,
              ),
            );
            break;
          case SearchResultItemType.account:
            itemWithSeparators.add(
              _ItemOrSeparator<ISearchResultItem>(
                item: null,
                separator: S.of(context).app_search_tab_accounts,
              ),
            );
            break;
          case SearchResultItemType.hashtag:
            itemWithSeparators.add(
              _ItemOrSeparator<ISearchResultItem>(
                item: null,
                separator: S.of(context).app_search_tab_hashtags,
              ),
            );
            break;
        }
      }
      previousType = item.type;

      itemWithSeparators.add(_ItemOrSeparator(item: item, separator: null));
    }

    return PaginationListWidget.buildItemsListView<
        _ItemOrSeparator<ISearchResultItem>>(
      context: context,
      keyboardDismissBehavior: keyboardDismissBehavior,
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
              return buildAccountListItem(item.account!);
            case SearchResultItemType.hashtag:
              return buildHashtagListItem(item, index);
          }
        }
      },
    );
  }

  Widget buildHashtagListItem(ISearchResultItem item, int index) =>
      Provider<IHashtag>.value(
        value: item.hashtag!,
        child: DisposableProxyProvider<IHashtag, IHashtagBloc>(
          update: (context, value, previous) => HashtagBloc.createFromContext(
            context,
            hashtag: value,
            myAccountFeaturedHashtag: null,
            needLoadFeaturedState: false,
          ),
          child: FediListTile(
            isFirstInList: index == 0,
            //                isFirstInList: false,
            child: const HashtagListItemWidget(
              displayHistory: false,
            ),
          ),
        ),
      );

  Provider<IStatus> buildStatusListItem(ISearchResultItem item, int index) =>
      Provider<IStatus>.value(
        value: item.status!,
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

  Widget buildAccountListItem(IAccount account) => Provider<IAccount>.value(
        value: account,
        child: DisposableProxyProvider<IAccount, IAccountBloc>(
          update: (context, account, oldValue) =>
              LocalAccountBloc.createFromContext(
            context,
            isNeedWatchLocalRepositoryForUpdates: false,
            account: account,
            isNeedRefreshFromNetworkOnInit: false,
            isNeedWatchWebSocketsEvents: false,
            isNeedPreFetchRelationship: false,
          ),
          child: Column(
            children: const [
              AccountListItemWidget(
                accountSelectedCallback: _accountSelectedCallback,
              ),
              FediUltraLightGreyDivider(),
            ],
          ),
        ),
      );

  @override
  IPaginationListBloc<PaginationPage<ISearchResultItem>, ISearchResultItem>
      retrievePaginationListBloc(
    BuildContext context, {
    required bool listen,
  }) =>
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
  final T? item;
  final String? separator;

  _ItemOrSeparator({
    required this.item,
    required this.separator,
  })  : assert(
          item != null || separator != null,
          'item or separator cant be set both',
        ),
        assert(
          !(item != null && separator != null),
          'item or separator should exist',
        );
}

void _onStatusClick(BuildContext context, IStatus status) {
  goToLocalStatusThreadPage(
    context,
    status: status,
    initialMediaAttachment: null,
  );
}
