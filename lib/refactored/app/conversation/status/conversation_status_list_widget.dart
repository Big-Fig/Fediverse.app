import 'package:fedi/refactored/app/async/async_smart_refresher_helper.dart';
import 'package:fedi/refactored/app/conversation/status/conversation_status_list_date_separator_widget.dart';
import 'package:fedi/refactored/app/conversation/status/conversation_status_list_item_widget.dart';
import 'package:fedi/refactored/app/list/list_loading_footer_widget.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_base_widget.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/status/status_bloc_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:timeago/timeago.dart' as timeago;

class ConversationStatusListWidget extends StatusPaginationListBaseWidget {
  ConversationStatusListWidget({@required Key key}) : super(key: key);

  // override to move refresh/update features from top/bottom to bottom/top
  @override
  SmartRefresher buildSmartRefresher(
          IPaginationListBloc paginationListBloc,
          BuildContext context,
          List<IStatus> items,
          RefreshController refreshController,
          Widget Function(BuildContext context) smartRefresherBodyBuilder) =>
      SmartRefresher(
        key: key,
        enablePullDown: true,
        enablePullUp: true,
// water drop header bugged (inverted with reverse)
        header: const MaterialClassicHeader(),
        footer: const ListLoadingFooterWidget(),
        controller: refreshController,
        reverse: true,
        onRefresh: () {
          return AsyncSmartRefresherHelper.doAsyncRefresh(
              controller: refreshController,
              action: () async {
                bool success = await additionalRefreshAction(context);
                success |= await paginationListBloc.refresh();
                return success;
              });
        },
        onLoading: () => AsyncSmartRefresherHelper.doAsyncLoading(
            controller: refreshController, action: paginationListBloc.loadMore),
        child: smartRefresherBodyBuilder(context),
      );

  @override
  ScrollView buildItemsCollectionView(
      {@required BuildContext context,
      @required List<IStatus> items,
      @required Widget header,
      @required Widget footer}) {
    assert(header == null, "header not supported");
    assert(footer == null, "footer not supported");

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        var nextStatus;
        if (index < items.length - 1) {
          nextStatus = items[index + 1];
        }
        var currentStatus = items[index];
        // todo: rework for better performance
        var currentTimeString = timeago.format(currentStatus.createdAt);

        String nextTimeString;
        if (nextStatus != null) {
          nextTimeString = timeago.format(nextStatus?.createdAt);
        }
        var statusWidget = Provider.value(
          value: currentStatus,
          child: DisposableProxyProvider<IStatus, IStatusBloc>(
              update: (context, value, previous) =>
                  StatusBloc.createFromContext(context, value),
              child: ConversationStatusListItemWidget()),
        );

        if (currentTimeString == nextTimeString) {
          return statusWidget;
        } else {
          return Column(
            children: <Widget>[
              ConversationStatusListDateSeparatorWidget(currentTimeString),
              statusWidget
            ],
          );
        }
      },
    );
  }
}
