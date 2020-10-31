import 'package:fedi/app/account/statuses/account_statuses_widget.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc_impl.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountStatusesTimelineWidget extends AccountStatusesWidget {
  const AccountStatusesTimelineWidget({
    Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
    ScrollController scrollController,
  }) : super(
          key: key,
          footer: footer,
          header: header,
          alwaysShowHeader: alwaysShowHeader,
          alwaysShowFooter: alwaysShowFooter,
          scrollController: scrollController,
        );

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
          itemBuilder: (context, index) => Provider<IStatus>.value(
                value: items[index],
                child: FediListTile(
                  isFirstInList: index == 0 && alwaysShowHeader != true,
                  child: DisposableProxyProvider<IStatus,
                      IStatusListItemTimelineBloc>(
                    update: (context, status, _) =>
                        StatusListItemTimelineBloc.list(
                      status: status,
                      collapsible: true,
                      statusCallback: _onStatusClick,
                      initialMediaAttachment: null,
                    ),
                    child: const StatusListItemTimelineWidget(),
                  ),
                ),
              ));
}

void _onStatusClick(BuildContext context, IStatus status) {
  goToStatusThreadPage(context, status: status, initialMediaAttachment: null);
}
