import 'package:fedi/app/async/async_smart_refresher_helper.dart';
import 'package:fedi/app/chat/message/chat_message_bloc.dart';
import 'package:fedi/app/chat/message/chat_message_bloc_impl.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/message/list/chat_message_list_item_widget.dart';
import 'package:fedi/app/chat/message/pagination/list/chat_message_pagination_list_base_widget.dart';
import 'package:fedi/app/date/date_utils.dart';
import 'package:fedi/app/list/list_loading_footer_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/list/fedi_list_smart_refresher_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

var _logger = Logger("chat_message_list_widget.dart");

var _dateSeparatorDateFormat = DateFormat('MMMM dd, yyyy');

class ChatMessageListWidget extends ChatMessagePaginationListBaseWidget {
  ChatMessageListWidget({@required Key key}) : super(key: key);

  // override to move refresh/update features from top/bottom to bottom/top
  @override
  Widget buildSmartRefresher(
          IPaginationListBloc paginationListBloc,
          BuildContext context,
          List<IChatMessage> items,
          RefreshController refreshController,
          ScrollController scrollController,
          Widget Function(BuildContext context) smartRefresherBodyBuilder) =>
      FediListSmartRefresherWidget(
        key: key,
        enablePullDown: true,
        enablePullUp: true,
// water drop header bugged (inverted with reverse)
        header: const MaterialClassicHeader(),
        footer: const ListLoadingFooterWidget(),
        controller: refreshController,
        reverse: true,
        scrollController: scrollController,
        primary: scrollController == null,
        onRefresh: () {
          return AsyncSmartRefresherHelper.doAsyncRefresh(
              controller: refreshController,
              action: () async {
                var success;
                try {
                  success = await additionalPreRefreshAction(context);
                } catch (e, stackTrace) {
                  success = false;
                  _logger.severe(() => "additionalPreRefreshAction()", e, stackTrace);
                }
                _logger.finest(() => "additionalRefreshAction $success");
                var state = await paginationListBloc.refreshWithoutController();
                _logger.finest(() => "paginationListBloc.refresh() $state");
                return state;
              });
        },
        onLoading: () => AsyncSmartRefresherHelper.doAsyncLoading(
            controller: refreshController,
            action: paginationListBloc.loadMoreWithoutController),
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
        IChatMessage nextMessage;
        IChatMessage previousMessage;
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

        _logger.finest(() => "content = ${currentMessage.content}\n"
            "\t isFirstInDayGroup = $isFirstInDayGroup \n"
            "\t isFirstInMinuteGroup = $isFirstInMinuteGroup \n"
            "\t isLastInDayGroup = $isLastInDayGroup \n"
            "\t isLastInMinuteGroup = $isLastInMinuteGroup \n");

        var messageWidget = Provider.value(
          value: currentMessage,
          child: DisposableProxyProvider<IChatMessage, IChatMessageBloc>(
              update: (context, value, previous) =>
                  ChatMessageBloc.createFromContext(context, value),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: ChatMessageListItemWidget(
                  isLastInMinuteGroup: isLastInMinuteGroup,
                  isFirstInMinuteGroup: isFirstInMinuteGroup,
                ),
              )),
        );
        if (isFirstInDayGroup) {
          return Column(
            children: <Widget>[
              messageWidget,
              Padding(
                padding: FediPadding.allSmallPadding,
                child: Center(
                    child: Text(
                  _dateSeparatorDateFormat.format(currentCreatedAt),
                  style: FediTextStyles.mediumShortBoldGrey,
                )),
              ),
            ],
          );
        } else {
          return messageWidget;
        }
      },
    );
  }
}
