import 'package:collection/collection.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi/app/chat/conversation/message/list/cached/conversation_chat_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/conversation/message/pagination/cached/conversation_chat_message_cached_pagination_bloc.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc_proxy_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class ConversationChatMessageCachedPaginationBloc
    extends CachedPleromaPaginationBloc<IConversationChatMessage>
    implements IConversationChatMessageCachedPaginationBloc {
  final IConversationChatMessageCachedListBloc chatMessageListService;

  ConversationChatMessageCachedPaginationBloc({
    required this.chatMessageListService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
    required IConnectionService connectionService,
  }) : super(
          connectionService: connectionService,
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IUnifediApiService get unifediApi => chatMessageListService.unifediApi;

  @override
  Future<List<IConversationChatMessage>> loadLocalItems({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<IConversationChatMessage>? olderPage,
    required CachedPaginationPage<IConversationChatMessage>? newerPage,
  }) =>
      chatMessageListService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items.firstOrNull,
        olderThan: newerPage?.items.lastOrNull,
      );

  @override
  Future refreshItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<IConversationChatMessage>? olderPage,
    required CachedPaginationPage<IConversationChatMessage>? newerPage,
  }) async {
    assert(
      !(pageIndex > 0 && olderPage == null && newerPage == null),
      'cant refresh not first page without actual items bounds',
    );

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
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
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
  }) =>
      DisposableProvider<
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
