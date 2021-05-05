import 'package:fedi/app/chat/pleroma/with_last_message/list/cached/pleroma_chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';

class PleromaChatWithLastMessagePaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IPleromaChatWithLastMessage>>
    extends CachedPaginationListWithNewItemsBloc<TPage,
        IPleromaChatWithLastMessage> {
  final IPleromaChatWithLastMessageCachedListBloc cachedListBloc;

  PleromaChatWithLastMessagePaginationListWithNewItemsBloc({
    required bool mergeNewItemsImmediately,
    required this.cachedListBloc,
    required ICachedPaginationBloc<TPage, IPleromaChatWithLastMessage>
        paginationBloc,
  }) : super(
          mergeNewItemsImmediately: mergeNewItemsImmediately,
          paginationBloc: paginationBloc,
        );

  @override
  Stream<List<IPleromaChatWithLastMessage>> watchItemsNewerThanItem(
    IPleromaChatWithLastMessage? item,
  ) =>
      cachedListBloc.watchLocalItemsNewerThanItem(item);

}
