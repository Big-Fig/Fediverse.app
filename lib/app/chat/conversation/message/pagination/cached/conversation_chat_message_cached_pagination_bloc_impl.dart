import 'package:collection/collection.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi/app/chat/conversation/message/list/cached/conversation_chat_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/conversation/message/pagination/cached/conversation_chat_message_cached_pagination_bloc.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc_proxy_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ConversationChatMessageCachedPaginationBloc
    extends CachedPleromaPaginationBloc<IConversationChatMessage>
    implements IConversationChatMessageCachedPaginationBloc {
  final IConversationChatMessageCachedListBloc chatMessageListService;

  ConversationChatMessageCachedPaginationBloc({
    required this.chatMessageListService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IPleromaApi get pleromaApi => chatMessageListService.pleromaApi;

  @override
  Future<List<IConversationChatMessage>> loadLocalItems({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<IConversationChatMessage>? olderPage,
    required CachedPaginationPage<IConversationChatMessage>? newerPage,
  }) {
    return chatMessageListService.loadLocalItems(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items.firstOrNull,
      olderThan: newerPage?.items.lastOrNull,
    );
  }

  @override
  Future refreshItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<IConversationChatMessage>? olderPage,
    required CachedPaginationPage<IConversationChatMessage>? newerPage,
  }) async {
    // cant refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return chatMessageListService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items.firstOrNull,
      olderThan: newerPage?.items.lastOrNull,
    );
  }

  static ConversationChatMessageCachedPaginationBloc createFromContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
  }) =>
      ConversationChatMessageCachedPaginationBloc(
        chatMessageListService:
            Provider.of<IConversationChatMessageCachedListBloc>(
          context,
          listen: false,
        ),
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
        maximumCachedPagesCount: maximumCachedPagesCount,
      );

  static Widget provideToContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
    required Widget child,
  }) {
    return DisposableProvider<
        ICachedPaginationBloc<CachedPaginationPage<IConversationChatMessage>,
            IConversationChatMessage>>(
      create: (context) =>
          ConversationChatMessageCachedPaginationBloc.createFromContext(
        context,
        maximumCachedPagesCount: maximumCachedPagesCount,
      ),
      child: CachedPaginationBlocProxyProvider<
          CachedPaginationPage<IConversationChatMessage>,
          IConversationChatMessage>(
        child: child,
      ),
    );
  }
}
