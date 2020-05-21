import 'package:fedi/app/async/async_smart_refresher_helper.dart';
import 'package:fedi/app/conversation/status/conversation_status_list_item_widget.dart';
import 'package:fedi/app/date/date_utils.dart';
import 'package:fedi/app/list/list_loading_footer_widget.dart';
import 'package:fedi/app/status/pagination/list/status_pagination_list_base_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

var _logger = Logger("conversation_status_list_widget.dart");
var _dateSeparatorDateFormat = DateFormat('MMMM dd, yyyy');

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
        var nextMessage;
        var previousMessage;
        if (index > 0) {
          previousMessage = items[index - 1];
        }
        if (index < items.length - 1) {
          nextMessage = items[index + 1];
        }
        var currentMessage = items[index];

        DateTime currentCreatedAt = currentMessage.createdAt;
        DateTime previousCreatedAt = previousMessage?.createdAt;
        DateTime nextCreatedAt = nextMessage?.createdAt;

        bool isFirstInDayGroup;
        bool isLastInDayGroup;

        bool isFirstInMinuteGroup;
        bool isLastInMinuteGroup;

        _logger.finest(() => "content = ${currentMessage.content}\n"
            "\t isFirstInDayGroup = $isFirstInDayGroup \n"
            "\t isFirstInMinuteGroup = $isFirstInMinuteGroup \n"
            "\t isLastInDayGroup = $isLastInDayGroup \n"
            "\t isLastInMinuteGroup = $isLastInMinuteGroup \n");

        if (previousCreatedAt != null) {
          isFirstInDayGroup =
              !DateUtils.isSameDay(currentCreatedAt, previousCreatedAt);
          var isSameAccount = currentMessage.account.remoteId ==
              previousMessage.account.remoteId;
          isFirstInMinuteGroup =
              !(DateUtils.isSameMinute(currentCreatedAt, previousCreatedAt) &&
                  isSameAccount);
        } else {
          isFirstInDayGroup = true;
          isFirstInMinuteGroup = true;
        }
        if (nextCreatedAt != null) {
          var isSameAccount =
              currentMessage.account.remoteId == nextMessage.account.remoteId;
          isLastInDayGroup =
              !DateUtils.isSameDay(currentCreatedAt, nextCreatedAt);
          isLastInMinuteGroup =
              !(DateUtils.isSameMinute(currentCreatedAt, nextCreatedAt) &&
                  isSameAccount);
        } else {
          isLastInDayGroup = true;
          isLastInMinuteGroup = true;
        }
        var statusWidget = Provider.value(
          value: currentMessage,
          child: DisposableProxyProvider<IStatus, IStatusBloc>(
              update: (context, value, previous) =>
                  StatusBloc.createFromContext(context, value),
              child: ConversationStatusListItemWidget(
                isLastInMinuteGroup: isLastInMinuteGroup,
                isFirstInMinuteGroup: isFirstInMinuteGroup,
              )),
        );

        if (isFirstInDayGroup) {
          return Column(
            children: <Widget>[
              statusWidget,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  _dateSeparatorDateFormat.format(currentCreatedAt),
                  style: TextStyle(
                      height: 1.15,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: FediColors.grey),
                )),
              ),
            ],
          );
        } else {
          return statusWidget;
        }
      },
    );
  }
}
