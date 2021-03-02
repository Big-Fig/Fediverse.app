import 'package:fedi/app/status/draft/draft_status_bloc.dart';
import 'package:fedi/app/status/draft/draft_status_bloc_impl.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/list/draft_status_list_item_widget.dart';
import 'package:fedi/app/status/draft/pagination/list/draft_status_pagination_list_base_widget.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DraftStatusPaginationListTimelineWidget
    extends DraftStatusPaginationListBaseWidget {
  final bool needWatchLocalRepositoryForUpdates;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  const DraftStatusPaginationListTimelineWidget({
    @required Key key,
    @required this.needWatchLocalRepositoryForUpdates,
    Widget customEmptyWidget,
    Widget customLoadingWidget,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag,
  }) : super(
          key: key,
          customEmptyWidget: customEmptyWidget,
          customLoadingWidget: customLoadingWidget,
        );

  @override
  ScrollView buildItemsCollectionView({
    @required BuildContext context,
    @required List<IDraftStatus> items,
    @required Widget header,
    @required Widget footer,
  }) =>
      PaginationListWidget.buildItemsListView(
        context: context,
        keyboardDismissBehavior: keyboardDismissBehavior,
        items: items,
        header: header,
        footer: footer,
        itemBuilder: (context, index) => Provider<IDraftStatus>.value(
          value: items[index],
          child: DisposableProxyProvider<IDraftStatus, IDraftStatusBloc>(
            update: (context, draftStatus, oldValue) =>
                DraftStatusBloc.createFromContext(
              context,
              draftStatus,
              isNeedWatchLocalRepositoryForUpdates:
                  needWatchLocalRepositoryForUpdates,
            ),
            child: FediListTile(
              isFirstInList: index == 0,
              child: const DraftStatusListItemWidget(),
            ),
          ),
        ),
      );
}
