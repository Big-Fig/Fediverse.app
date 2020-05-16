import 'package:fedi/refactored/app/async/async_smart_refresher_helper.dart';
import 'package:fedi/refactored/app/chat/message/chat_message_bloc.dart';
import 'package:fedi/refactored/app/chat/message/chat_message_bloc_impl.dart';
import 'package:fedi/refactored/app/chat/message/chat_message_model.dart';
import 'package:fedi/refactored/app/chat/message/list/chat_message_list_date_separator_widget.dart';
import 'package:fedi/refactored/app/chat/message/list/chat_message_list_item_widget.dart';
import 'package:fedi/refactored/app/chat/message/pagination/list/chat_message_pagination_list_base_widget.dart';
import 'package:fedi/refactored/app/list/list_loading_footer_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatMessageListWidget extends ChatMessagePaginationListBaseWidget {
  ChatMessageListWidget({@required Key key}) : super(key: key);

  // override to move refresh/update features from top/bottom to bottom/top
  @override
  SmartRefresher buildSmartRefresher(
          IPaginationListBloc paginationListBloc,
          BuildContext context,
          List<IChatMessage> items,
          RefreshController refreshController,
          Widget Function(BuildContext context) smartRefresherBodyBuilder) =>
      SmartRefresher(
        key: key,
        enablePullDown: true,
        enablePullUp: true,
// water drop header bugged (inverted with reverse)
        header: MaterialClassicHeader(),
        footer: ListLoadingFooterWidget(),
        controller: refreshController,
        reverse: true,
        onRefresh: () {
          return AsyncSmartRefresherHelper.doAsyncRefresh(
              controller: refreshController,
              action: () async {
                bool success;
                if (additionalRefreshAction != null) {
                  success = await additionalRefreshAction();
                } else {
                  success = true;
                }
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
      @required List<IChatMessage> items,
      @required Widget header,
      @required Widget footer}) {
    assert(header == null, "header not supported");
    assert(footer == null, "footer not supported");

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        var nextMessage;
        if (index < items.length - 1) {
          nextMessage = items[index + 1];
        }
        var currentMessage = items[index];
        // todo: rework for better performance
        var currentTimeString = timeago.format(currentMessage.createdAt);

        String nextTimeString;
        if (nextMessage != null) {
          nextTimeString = timeago.format(nextMessage?.createdAt);
        }
        var messageWidget = Provider.value(
          value: currentMessage,
          child: DisposableProxyProvider<IChatMessage, IChatMessageBloc>(
              update: (context, value, previous) =>
                  ChatMessageBloc.createFromContext(context, value),
              child: ChatMessageListItemWidget()),
        );

        if (currentTimeString == nextTimeString) {
          return messageWidget;
        } else {
          return Column(
            children: <Widget>[
              ChatMessageListDateSeparatorWidget(currentTimeString),
              messageWidget
            ],
          );
        }
      },
    );
  }
}
