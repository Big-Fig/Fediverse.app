import 'package:fedi_app/app/chat/unifedi/with_last_message/list/cached/unifedi_chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/pagination/list/unifedi_chat_with_last_message_pagination_list_with_new_items_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/unifedi_chat_with_last_message_model.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:fedi_app/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';

class UnifediChatWithLastMessagePaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<IUnifediChatWithLastMessage>>
    extends CachedPaginationListWithNewItemsBloc<TPage,
        IUnifediChatWithLastMessage>
    implements
        IUnifediChatWithLastMessagePaginationListWithNewItemsBloc<TPage> {
  final IUnifediChatWithLastMessageCachedListBloc cachedListBloc;

  UnifediChatWithLastMessagePaginationListWithNewItemsBloc({
    required bool mergeNewItemsImmediately,
    required this.cachedListBloc,
    required ICachedPaginationBloc<TPage, IUnifediChatWithLastMessage>
        paginationBloc,
  }) : super(
          mergeNewItemsImmediately: mergeNewItemsImmediately,
          paginationBloc: paginationBloc,
        );

  @override
  Stream<List<IUnifediChatWithLastMessage>> watchItemsNewerThanItem(
    IUnifediChatWithLastMessage? item,
  ) =>
      cachedListBloc.watchLocalItemsNewerThanItem(item);
}
