import 'package:fedi/app/chat/pleroma/message/list/cached/pleroma_chat_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_proxy_provider.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger(
    "pleroma_chat_message_cached_pagination_list_with_new_items_bloc_impl.dart");

class PleromaChatMessageCachedPaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IPleromaChatMessage>>
    extends CachedPaginationListWithNewItemsBloc<TPage, IPleromaChatMessage> {
  final IPleromaChatMessageCachedListBloc chatMessageCachedListService;

  PleromaChatMessageCachedPaginationListWithNewItemsBloc(
      {@required
          bool mergeNewItemsImmediately,
      @required
          this.chatMessageCachedListService,
      @required
          ICachedPaginationBloc<TPage, IPleromaChatMessage>
              cachedPaginationBloc})
      : super(
            mergeNewItemsImmediately: mergeNewItemsImmediately,
            paginationBloc: cachedPaginationBloc);

  @override
  Stream<List<IPleromaChatMessage>> watchItemsNewerThanItem(
      IPleromaChatMessage item) {
    _logger.finest(() => "watchItemsNewerThanItem item = $item");
    return chatMessageCachedListService.watchLocalItemsNewerThanItem(item);
  }

  @override
  int compareItemsToSort(IPleromaChatMessage a, IPleromaChatMessage b) {
    if (a?.createdAt == null && b?.createdAt == null) {
      return 0;
    }

    if (a?.createdAt != null && b?.createdAt == null) {
      return 1;
    }
    if (a?.createdAt == null && b?.createdAt != null) {
      return -1;
    }
    return a.createdAt.compareTo(b.createdAt);
  }

  @override
  bool isItemsEqual(IPleromaChatMessage a, IPleromaChatMessage b) {
    if (a.oldPendingRemoteId != null || b.oldPendingRemoteId != null) {
      return a.remoteId == b.remoteId ||
          a.oldPendingRemoteId == b.oldPendingRemoteId ||
          a.remoteId == b.oldPendingRemoteId ||
          a.oldPendingRemoteId == b.remoteId;
    } else {
      return a.remoteId == b.remoteId;
    }
  }

  static PleromaChatMessageCachedPaginationListWithNewItemsBloc
      createFromContext(BuildContext context,
          {@required bool mergeNewItemsImmediately}) {
    return PleromaChatMessageCachedPaginationListWithNewItemsBloc(
      mergeNewItemsImmediately: true,
      chatMessageCachedListService:
          IPleromaChatMessageCachedListBloc.of(context, listen: false),
      cachedPaginationBloc: Provider.of<
          IPaginationBloc<CachedPaginationPage<IPleromaChatMessage>,
              IPleromaChatMessage>>(context, listen: false),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    @required bool mergeNewItemsImmediately,
    @required Widget child,
  }) {
    return DisposableProvider<
        ICachedPaginationListWithNewItemsBloc<
            CachedPaginationPage<IPleromaChatMessage>, IPleromaChatMessage>>(
      create: (context) =>
          PleromaChatMessageCachedPaginationListWithNewItemsBloc
              .createFromContext(
        context,
        mergeNewItemsImmediately: mergeNewItemsImmediately,
      ),
      child: CachedPaginationListWithNewItemsBlocProxyProvider<
          CachedPaginationPage<IPleromaChatMessage>,
          IPleromaChatMessage>(child: child),
    );
  }
}
