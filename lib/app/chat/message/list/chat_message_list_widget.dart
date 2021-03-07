import 'package:fedi/app/async/async_smart_refresher_helper.dart';
import 'package:fedi/app/chat/message/chat_message_bloc.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/message/list/chat_message_list_item_model.dart';
import 'package:fedi/app/chat/selection/chat_selection_bloc.dart';
import 'package:fedi/app/chat/selection/item/chat_selection_item_bloc.dart';
import 'package:fedi/app/chat/selection/item/chat_selection_item_bloc_impl.dart';
import 'package:fedi/app/chat/selection/item/chat_selection_item_widget.dart';
import 'package:fedi/app/date/date_utils.dart';
import 'package:fedi/app/list/list_loading_footer_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/list/fedi_list_smart_refresher_widget.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

var _logger = Logger("chat_message_list_widget.dart");

var _daySeparatorDateFormat = DateFormat('MMMM dd, yyyy');

class ChatMessageListWidget<T extends IChatMessage>
    extends FediPaginationListWidget<T> {
  final WidgetBuilder itemBuilder;

  final Function(BuildContext context, {@required Widget child})
      itemContextBuilder;

  const ChatMessageListWidget({
    Key key,
    @required this.itemBuilder,
    @required this.itemContextBuilder,
    bool refreshOnFirstLoad = true,
  }) : super(
          key: key,
          refreshOnFirstLoad: refreshOnFirstLoad,
        );

  @override
  IPaginationListBloc<PaginationPage<T>, T> retrievePaginationListBloc(
    BuildContext context, {
    @required bool listen,
  }) {
    var timelinePaginationListBloc =
        Provider.of<IPaginationListBloc<PaginationPage<T>, T>>(context,
            listen: listen);
    return timelinePaginationListBloc;
  }

// override to move refresh/update features from top/bottom to bottom/top
  @override
  Widget buildSmartRefresher(
          IPaginationListBloc paginationListBloc,
          BuildContext context,
          List<T> items,
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
                  _logger.severe(
                      () => "additionalPreRefreshAction()", e, stackTrace);
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
  ScrollView buildItemsCollectionView({
    @required BuildContext context,
    @required List<IChatMessage> items,
    @required Widget header,
    @required Widget footer,
  }) {
    assert(header == null, "header not supported");
    assert(footer == null, "footer not supported");

    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        var item = _calculateChatMessageListItem<T>(
          index: index,
          items: items,
        );

        return Provider<ChatMessageListItem<T>>.value(
          value: item,
          child: ProxyProvider<ChatMessageListItem<T>,
              ChatMessageListItem<IChatMessage>>(
            update: (context, item, _) => item,
            child: ProxyProvider<ChatMessageListItem<T>, T>(
              update: (context, item, _) => item.message,
              child: ProxyProvider<ChatMessageListItem<T>, IChatMessage>(
                update: (context, item, _) => item.message,
                child: itemContextBuilder(
                  context,
                  child: DisposableProxyProvider<IChatMessageBloc,
                      IChatSelectionItemBloc>(
                    update: (context, chatMessageBloc, _) {
                      var chatMessage = chatMessageBloc.chatMessage;
                      var chatSelectionItemBloc = ChatSelectionItemBloc(
                        chatSelectionBloc: IChatSelectionBloc.of(
                          context,
                          listen: false,
                        ),
                        chatMessage: chatMessage,
                        isSelectionPossible: chatMessageBloc
                            .isNotPending,
                      );

                      chatSelectionItemBloc.addDisposable(
                        streamSubscription: chatMessageBloc
                            .isNotPendingStream
                            .listen(
                          (isNotPending) {
                            chatSelectionItemBloc.changeSelectionPossible(
                              isNotPending,
                            );
                          },
                        ),
                      );

                      return chatSelectionItemBloc;
                    },
                    child: ChatSelectionItemWidget(
                      child: _ChatMessageListItemWidget(
                        itemBuilder: itemBuilder,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ChatMessageListItemWidget<T extends IChatMessage>
    extends StatelessWidget {
  final WidgetBuilder itemBuilder;

  const _ChatMessageListItemWidget({
    Key key,
    @required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var messageWidget = itemBuilder(context);
    var item = ChatMessageListItem.of<T>(context);
    if (item.isFirstInDayGroup) {
      return Column(
        children: <Widget>[
          messageWidget,
          const _ChatMessageListDaySeparatorWidget(),
        ],
      );
    } else {
      return messageWidget;
    }
  }
}

class _ChatMessageListDaySeparatorWidget extends StatelessWidget {
  const _ChatMessageListDaySeparatorWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var message = Provider.of<IChatMessage>(context);
    return Padding(
      padding: FediPadding.allSmallPadding,
      child: Center(
          child: Text(
        _daySeparatorDateFormat.format(message.createdAt),
        style: IFediUiTextTheme.of(context).mediumShortBoldGrey,
      )),
    );
  }
}

ChatMessageListItem<T> _calculateChatMessageListItem<T extends IChatMessage>({
  @required int index,
  @required List<T> items,
}) {
  T nextMessage;
  T previousMessage;
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
    var isSameAccount =
        currentMessage.account?.remoteId == previousMessage.account?.remoteId;
    isFirstInMinuteGroup =
        !(DateUtils.isSameMinute(currentCreatedAt, previousCreatedAt) &&
            isSameAccount);
  } else {
    isFirstInDayGroup = true;
    isFirstInMinuteGroup = true;
  }
  if (nextCreatedAt != null) {
    var isSameAccount =
        currentMessage.account?.remoteId == nextMessage.account?.remoteId;
    isLastInDayGroup = !DateUtils.isSameDay(currentCreatedAt, nextCreatedAt);
    isLastInMinuteGroup =
        !(DateUtils.isSameMinute(currentCreatedAt, nextCreatedAt) &&
            isSameAccount);
  } else {
    isLastInDayGroup = true;
    isLastInMinuteGroup = true;
  }

  var item = ChatMessageListItem<T>(
    message: currentMessage,
    isFirstInMinuteGroup: isFirstInMinuteGroup,
    isLastInMinuteGroup: isLastInMinuteGroup,
    isFirstInDayGroup: isFirstInDayGroup,
    isLastInDayGroup: isLastInDayGroup,
  );
  return item;
}
