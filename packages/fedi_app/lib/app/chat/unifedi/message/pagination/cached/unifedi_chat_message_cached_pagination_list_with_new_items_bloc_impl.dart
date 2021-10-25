import 'package:collection/collection.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/chat/unifedi/message/list/cached/unifedi_chat_message_cached_list_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi_app/app/chat/unifedi/unifedi_chat_bloc.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:fedi_app/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi_app/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi_app/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_proxy_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger(
  'unifedi_chat_message_cached_pagination_list_with_new_items_bloc_impl.dart',
);

class UnifediChatMessageCachedPaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IUnifediChatMessage>>
    extends CachedPaginationListWithNewItemsBloc<TPage, IUnifediChatMessage> {
  final IUnifediChatMessageCachedListBloc chatMessageCachedListService;
  final IUnifediChatBloc unifediChatBloc;

  UnifediChatMessageCachedPaginationListWithNewItemsBloc({
    required bool mergeNewItemsImmediately,
    required this.chatMessageCachedListService,
    required this.unifediChatBloc,
    required ICachedPaginationBloc<TPage, IUnifediChatMessage>
        cachedPaginationBloc,
  }) : super(
          mergeNewItemsImmediately: mergeNewItemsImmediately,
          paginationBloc: cachedPaginationBloc,
          asyncCalculateNewItems: false,
          asyncCalculateActuallyNew: false,
        ) {
    unifediChatBloc.onMessageLocallyHiddenStream
        .listen(
          hideItem,
        )
        .disposeWith(this);

    hiddenItemsSubject.disposeWith(this);
  }

  final BehaviorSubject<List<IUnifediChatMessage>> hiddenItemsSubject =
      BehaviorSubject.seeded([]);

  List<IUnifediChatMessage> get hiddenItems => hiddenItemsSubject.value;

  Stream<List<IUnifediChatMessage>> get hiddenItemsStream =>
      hiddenItemsSubject.stream;

  void hideItem(IUnifediChatMessage itemToHide) {
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
      // ignore: unawaited_futures
      Future.delayed(
        const Duration(
          // todo: refactor
          // ignore: no-magic-number
          milliseconds: 100,
        ),
        refreshWithController,
      );
    }

    return page;
  }

  @override
  List<IUnifediChatMessage> get items =>
      excludeHiddenItems(super.items, hiddenItems);

  @override
  Stream<List<IUnifediChatMessage>> get itemsStream => Rx.combineLatest2(
        super.itemsStream,
        hiddenItemsStream,
        excludeHiddenItems,
      );

  List<IUnifediChatMessage> excludeHiddenItems(
    List<IUnifediChatMessage> superItems,
    List<IUnifediChatMessage> hiddenItems,
  ) {
    if (hiddenItems.isEmpty) {
      return superItems;
    }

    superItems.removeWhere(
      (currentItem) =>
          hiddenItems.firstWhereOrNull(
            (hiddenItem) => hiddenItem.isEqualTo(currentItem),
          ) !=
          null,
    );

    return superItems;
  }

  @override
  Stream<List<IUnifediChatMessage>> watchItemsNewerThanItem(
    IUnifediChatMessage? item,
  ) {
    _logger.finest(() => 'watchItemsNewerThanItem item = $item');

    return chatMessageCachedListService.watchLocalItemsNewerThanItem(item);
  }

  static UnifediChatMessageCachedPaginationListWithNewItemsBloc
      createFromContext(
    BuildContext context, {
    required bool mergeNewItemsImmediately,
  }) =>
          UnifediChatMessageCachedPaginationListWithNewItemsBloc(
            mergeNewItemsImmediately: true,
            chatMessageCachedListService: IUnifediChatMessageCachedListBloc.of(
              context,
              listen: false,
            ),
            cachedPaginationBloc: Provider.of<
                ICachedPaginationBloc<CachedPaginationPage<IUnifediChatMessage>,
                    IUnifediChatMessage>>(
              context,
              listen: false,
            ),
            unifediChatBloc: IUnifediChatBloc.of(
              context,
              listen: false,
            ),
          );

  static Widget provideToContext(
    BuildContext context, {
    required bool mergeNewItemsImmediately,
    required Widget child,
  }) =>
      DisposableProvider<
          ICachedPaginationListWithNewItemsBloc<
              CachedPaginationPage<IUnifediChatMessage>, IUnifediChatMessage>>(
        create: (context) =>
            UnifediChatMessageCachedPaginationListWithNewItemsBloc
                .createFromContext(
          context,
          mergeNewItemsImmediately: mergeNewItemsImmediately,
        ),
        child: CachedPaginationListWithNewItemsBlocProxyProvider<
            CachedPaginationPage<IUnifediChatMessage>, IUnifediChatMessage>(
          child: child,
        ),
      );
}
