import 'package:fedi/app/async/smart_refresher/async_smart_refresher_helper.dart';
import 'package:fedi/app/chat/conversation/status/conversation_chat_status_list_item_widget.dart';
import 'package:fedi/date/date_utils.dart';
import 'package:fedi/app/list/list_loading_footer_widget.dart';
import 'package:fedi/app/status/local_status_bloc_impl.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_base_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/list/fedi_list_smart_refresher_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

var _logger = Logger("conversation_chat_status_list_widget.dart");
var _dateSeparatorDateFormat = DateFormat('MMMM dd, yyyy');

class ConversationChatStatusListWidget
    extends StatusCachedPaginationListBaseWidget {
  ConversationChatStatusListWidget({required Key key}) : super(key: key);

  @override
  IPaginationListBloc<PaginationPage<IStatus>, IStatus>
      retrievePaginationListBloc(
    BuildContext context, {
    required bool listen,
  }) {
    var timelinePaginationListBloc =
        Provider.of<IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
      context,
      listen: listen,
    );
    return timelinePaginationListBloc;
  }

  // override to move refresh/update features from top/bottom to bottom/top
  @override
  Widget buildSmartRefresher(
    IPaginationListBloc paginationListBloc,
    BuildContext context,
    List<IStatus>? items,
    RefreshController refreshController,
    ScrollController? scrollController,
    Widget Function(BuildContext context) smartRefresherBodyBuilder,
  ) =>
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
                  () => "additionalPreRefreshAction()",
                  e,
                  stackTrace,
                );
              }
              _logger.finest(() => "additionalPreRefreshAction() $success");
              var state = await paginationListBloc.refreshWithoutController();
              _logger.finest(
                () => "paginationListBloc.refreshWithoutController() $state",
              );
              return state;
            },
          );
        },
        onLoading: () => AsyncSmartRefresherHelper.doAsyncLoading(
          controller: refreshController,
          action: paginationListBloc.loadMoreWithoutController,
        ),
        child: smartRefresherBodyBuilder(context),
      );

  @override
  // todo: unify with pleroma chat message list widget
  // ignore: long-method
  ScrollView buildItemsCollectionView({
    required BuildContext context,
    required List<IStatus> items,
    required Widget? header,
    required Widget? footer,
  }) {
    assert(header == null, "header not supported");
    assert(footer == null, "footer not supported");

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        IStatus? nextMessage;
        IStatus? previousMessage;
        if (index > 0) {
          previousMessage = items[index - 1];
        }
        if (index < items.length - 1) {
          nextMessage = items[index + 1];
        }
        var currentMessage = items[index];

        DateTime? currentCreatedAt = currentMessage.createdAt;
        DateTime? previousCreatedAt = previousMessage?.createdAt;
        DateTime? nextCreatedAt = nextMessage?.createdAt;

        bool? isFirstInDayGroup;
        bool? isLastInDayGroup;

        bool? isFirstInMinuteGroup;
        bool? isLastInMinuteGroup;

        _logger.finest(() => "content = ${currentMessage.content}\n"
            "\t isFirstInDayGroup = $isFirstInDayGroup \n"
            "\t isFirstInMinuteGroup = $isFirstInMinuteGroup \n"
            "\t isLastInDayGroup = $isLastInDayGroup \n"
            "\t isLastInMinuteGroup = $isLastInMinuteGroup \n");

        if (previousCreatedAt != null) {
          isFirstInDayGroup =
              !CustomDateUtils.isSameDay(currentCreatedAt, previousCreatedAt);
          var isSameAccount = currentMessage.account.remoteId ==
              previousMessage!.account.remoteId;
          isFirstInMinuteGroup = !(CustomDateUtils.isSameMinute(
                currentCreatedAt,
                previousCreatedAt,
              ) &&
              isSameAccount);
        } else {
          isFirstInDayGroup = true;
          isFirstInMinuteGroup = true;
        }
        if (nextCreatedAt != null) {
          var isSameAccount =
              currentMessage.account.remoteId == nextMessage!.account.remoteId;
          isLastInDayGroup =
              !CustomDateUtils.isSameDay(currentCreatedAt, nextCreatedAt);
          isLastInMinuteGroup =
              !(CustomDateUtils.isSameMinute(currentCreatedAt, nextCreatedAt) &&
                  isSameAccount);
        } else {
          isLastInDayGroup = true;
          isLastInMinuteGroup = true;
        }
        var statusWidget = Provider<IStatus>.value(
          value: currentMessage,
          child: DisposableProxyProvider<IStatus, IStatusBloc>(
            update: (context, value, previous) =>
                LocalStatusBloc.createFromContext(
              context,
              status: value,
            ),
            child: ConversationChatStatusListItemWidget(
              isLastInMinuteGroup: isLastInMinuteGroup,
              isFirstInMinuteGroup: isFirstInMinuteGroup,
            ),
          ),
        );

        if (isFirstInDayGroup) {
          return Column(
            children: <Widget>[
              statusWidget,
              Padding(
                padding: FediPadding.allSmallPadding,
                child: Center(
                  child: Text(
                    _dateSeparatorDateFormat.format(currentCreatedAt),
                    style: IFediUiTextTheme.of(context).smallShortBoldGrey,
                  ),
                ),
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
