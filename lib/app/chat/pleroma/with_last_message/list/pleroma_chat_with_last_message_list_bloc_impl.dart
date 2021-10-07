import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/list/cached/pleroma_chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/list/cached/pleroma_chat_with_last_message_cached_list_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/list/pleroma_chat_with_last_message_list_bloc.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pagination/list/pleroma_chat_with_last_message_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pagination/list/pleroma_chat_with_last_message_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pagination/pleroma_chat_with_last_message_pagination_bloc.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pagination/pleroma_chat_with_last_message_pagination_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/repository/pleroma_chat_with_last_message_repository.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('pleroma_chat_with_last_message_list_bloc_impl.dart');

class PleromaChatWithLastMessageListBloc extends DisposableOwner
    implements IPleromaChatWithLastMessageListBloc {
  @override
  // ignore: avoid-late-keyword
  late IPleromaChatWithLastMessageCachedListBloc chatListBloc;

  @override
  // ignore: avoid-late-keyword
  late IPleromaChatWithLastMessagePaginationBloc chatPaginationBloc;

  @override
  IPaginationListBloc<PaginationPage<IPleromaChatWithLastMessage>,
          IPleromaChatWithLastMessage>
      get chatPaginationListBloc => chatPaginationListWithNewItemsBloc;

  @override
  // ignore: avoid-late-keyword
  late IPleromaChatWithLastMessagePaginationListWithNewItemsBloc<
          CachedPaginationPage<IPleromaChatWithLastMessage>>
      chatPaginationListWithNewItemsBloc;

  final IPleromaChatMessageRepository chatMessageRepository;
  final IPleromaChatRepository chatRepository;
  final IPleromaChatWithLastMessageRepository chatWithLastMessageRepository;
  final IPaginationSettingsBloc paginationSettingsBloc;

  PleromaChatWithLastMessageListBloc({
    required IUnifediApiChatService pleromaApiChatService,
    required this.chatMessageRepository,
    required this.chatRepository,
    required this.chatWithLastMessageRepository,
    required this.paginationSettingsBloc,
    required IConnectionService connectionService,
    required IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc,
    required WebSocketsChannelHandlerType handlerType,
  }) {
    _logger.finest(() => 'constructor');
    chatListBloc = PleromaChatWithLastMessageCachedListBloc(
      pleromaApiChatService: pleromaApiChatService,
      chatWithLastMessageRepository: chatWithLastMessageRepository,
      chatRepository: chatRepository,
    )..disposeWith(this);
    chatPaginationBloc = PleromaChatWithLastMessagePaginationBloc(
      connectionService: connectionService,
      cachedListBloc: chatListBloc,
      paginationSettingsBloc: paginationSettingsBloc,
      maximumCachedPagesCount: null,
    )..disposeWith(this);

    chatPaginationListWithNewItemsBloc =
        PleromaChatWithLastMessagePaginationListWithNewItemsBloc(
      paginationBloc: chatPaginationBloc,
      cachedListBloc: chatListBloc,
      mergeNewItemsImmediately: true,
    )..disposeWith(this);

    if (pleromaApiChatService.isPleroma) {
      webSocketsHandlerManagerBloc
          .listenPleromaChatChannel(
            handlerType: handlerType,
          )
          .disposeWith(this);
    }
  }

  static PleromaChatWithLastMessageListBloc createFromContext(
    BuildContext context, {
    required WebSocketsChannelHandlerType handlerType,
  }) =>
      PleromaChatWithLastMessageListBloc(
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
        pleromaApiChatService:
            Provider.of<IUnifediApiChatService>(context, listen: false),
        chatWithLastMessageRepository:
            IPleromaChatWithLastMessageRepository.of(context, listen: false),
        chatMessageRepository:
            IPleromaChatMessageRepository.of(context, listen: false),
        chatRepository: IPleromaChatRepository.of(context, listen: false),
        webSocketsHandlerManagerBloc: IWebSocketsHandlerManagerBloc.of(
          context,
          listen: false,
        ),
        handlerType: handlerType,
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
      );
}
