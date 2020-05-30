import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/pagination/list/status_pagination_list_base_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPaginationListTimelineWidget
    extends StatusPaginationListBaseWidget {
  final bool needWatchLocalRepositoryForUpdates;

  const StatusPaginationListTimelineWidget(
      {@required Key key,
      Widget header,
      Widget footer,
      bool alwaysShowHeader,
      bool alwaysShowFooter,
      @required this.needWatchLocalRepositoryForUpdates})
      : super(
            key: key,
            header: header,
            footer: footer,
            alwaysShowFooter: alwaysShowFooter,
            alwaysShowHeader: alwaysShowHeader);

  @override
  ScrollView buildItemsCollectionView(
          {@required BuildContext context,
          @required List<IStatus> items,
          @required Widget header,
          @required Widget footer}) =>
      PaginationListWidget.buildItemsListView(
          context: context,
          items: items,
          header: header,
          footer: footer,
          itemBuilder: (context, index) {
            return Provider<IStatus>.value(
              value: items[index],
              child: FediListTile(
                isFirstInList: index == 0 && header == null,
//                isFirstInList: false,
                child: StatusListItemTimelineWidget.list(
                  collapsible: true,
                ),
              ),
            );
          });
}
