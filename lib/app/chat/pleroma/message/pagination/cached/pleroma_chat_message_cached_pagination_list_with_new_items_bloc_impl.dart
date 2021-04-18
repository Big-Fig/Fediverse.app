import 'package:collection/collection.dart';
import 'package:fedi/app/chat/pleroma/message/list/cached/pleroma_chat_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_proxy_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:pedantic/pedantic.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger(
  "pleroma_chat_message_cached_pagination_list_with_new_items_bloc_impl.dart",
);

class PleromaChatMessageCachedPaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IPleromaChatMessage>>
    extends CachedPaginationListWithNewItemsBloc<TPage, IPleromaChatMessage> {
  final IPleromaChatMessageCachedListBloc chatMessageCachedListService;
  final IPleromaChatBloc pleromaChatBloc;

  PleromaChatMessageCachedPaginationListWithNewItemsBloc({
    required bool mergeNewItemsImmediately,
    required this.chatMessageCachedListService,
    required this.pleromaChatBloc,
    required ICachedPaginationBloc<TPage, IPleromaChatMessage>
        cachedPaginationBloc,
  }) : super(
          mergeNewItemsImmediately: mergeNewItemsImmediately,
          paginationBloc: cachedPaginationBloc,
        ) {
    addDisposable(
      streamSubscription: pleromaChatBloc.onMessageLocallyHiddenStream.listen(
        (hiddenMessage) {
          hideItem(hiddenMessage);
        },
      ),
    );

    addDisposable(subject: hiddenItemsSubject);
  }

  final BehaviorSubject<List<IPleromaChatMessage>> hiddenItemsSubject =
      BehaviorSubject.seeded([]);

  List<IPleromaChatMessage> get hiddenItems => hiddenItemsSubject.value!;

  Stream<List<IPleromaChatMessage>> get hiddenItemsStream =>
      hiddenItemsSubject.stream;

  void hideItem(IPleromaChatMessage itemToHide) {
    hiddenItems.add(itemToHide);
    hiddenItemsSubject.add(hiddenItems);
  }

  @override
  Future<TPage> loadFirstPageOnInit() async {
    var page = await paginationBloc.requestPage(
      pageIndex: 0,
      forceToSkipCache: false,
    );

    if (page.items.length == 1 || page.items.isEmpty) {
      // refresh chat from network when local cache have only 1 message
      // usually chat have 1 message when user navigating from chats list where
      // last message already fetched
      unawaited(
        Future.delayed(
          Duration(
            // todo: refactor
            // ignore: no-magic-number
            milliseconds: 100,
          ),
          () {
            refreshWithController();
          },
        ),
      );
    }

    return page;
  }

  @override
  List<IPleromaChatMessage> get items {
    return excludeHiddenItems(super.items, hiddenItems);
  }

  @override
  Stream<List<IPleromaChatMessage>> get itemsStream => Rx.combineLatest2(
        super.itemsStream,
        hiddenItemsStream,
        excludeHiddenItems,
      );

  List<IPleromaChatMessage> excludeHiddenItems(
    List<IPleromaChatMessage> superItems,
    List<IPleromaChatMessage> hiddenItems,
  ) {
    if (hiddenItems.isEmpty) {
      return superItems;
    }

    superItems.removeWhere((currentItem) =>
        hiddenItems.firstWhereOrNull(
          (hiddenItem) => isItemsEqual(hiddenItem, currentItem),
        ) !=
        null);

    return superItems;
  }

  @override
  Stream<List<IPleromaChatMessage>> watchItemsNewerThanItem(
    IPleromaChatMessage? item,
  ) {
    _logger.finest(() => "watchItemsNewerThanItem item = $item");
    return chatMessageCachedListService.watchLocalItemsNewerThanItem(item);
  }

  @override
  int compareItemsToSort(IPleromaChatMessage? a, IPleromaChatMessage? b) {
    if (a?.createdAt == null && b?.createdAt == null) {
      return 0;
    } else if (a?.createdAt != null && b?.createdAt == null) {
      return 1;
    } else if (a?.createdAt == null && b?.createdAt != null) {
      return -1;
    } else {
      return a!.createdAt.compareTo(b!.createdAt);
    }
  }

  @override
  bool isItemsEqual(IPleromaChatMessage a, IPleromaChatMessage b) =>
      a.remoteId == b.remoteId;

  static PleromaChatMessageCachedPaginationListWithNewItemsBloc
      createFromContext(
    BuildContext context, {
    required bool mergeNewItemsImmediately,
  }) {
    return PleromaChatMessageCachedPaginationListWithNewItemsBloc(
      mergeNewItemsImmediately: true,
      chatMessageCachedListService: IPleromaChatMessageCachedListBloc.of(
        context,
        listen: false,
      ),
      cachedPaginationBloc: Provider.of<
          ICachedPaginationBloc<CachedPaginationPage<IPleromaChatMessage>,
              IPleromaChatMessage>>(
        context,
        listen: false,
      ),
      pleromaChatBloc: IPleromaChatBloc.of(
        context,
        listen: false,
      ),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required bool mergeNewItemsImmediately,
    required Widget child,
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
          CachedPaginationPage<IPleromaChatMessage>, IPleromaChatMessage>(
        child: child,
      ),
    );
  }
}
