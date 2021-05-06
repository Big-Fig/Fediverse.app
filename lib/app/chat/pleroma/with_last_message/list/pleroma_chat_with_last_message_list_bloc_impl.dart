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
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_service.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("pleroma_chat_with_last_message_list_bloc_impl.dart");

class PleromaChatWithLastMessageListBloc extends DisposableOwner
    implements IPleromaChatWithLastMessageListBloc {
  @override
  late IPleromaChatWithLastMessageCachedListBloc chatListBloc;

  @override
  late IPleromaChatWithLastMessagePaginationBloc chatPaginationBloc;

  @override
  IPaginationListBloc<PaginationPage<IPleromaChatWithLastMessage>,
          IPleromaChatWithLastMessage>
      get chatPaginationListBloc => chatPaginationListWithNewItemsBloc;

  @override
  late IPleromaChatWithLastMessagePaginationListWithNewItemsBloc<
          CachedPaginationPage<IPleromaChatWithLastMessage>>
      chatPaginationListWithNewItemsBloc;

  final IPleromaChatMessageRepository chatMessageRepository;
  final IPleromaChatRepository chatRepository;
  final IPleromaChatWithLastMessageRepository chatWithLastMessageRepository;
  final IPaginationSettingsBloc paginationSettingsBloc;

  PleromaChatWithLastMessageListBloc({
    required IPleromaApiChatService pleromaChatService,
    required this.chatMessageRepository,
    required this.chatRepository,
    required this.chatWithLastMessageRepository,
    required this.paginationSettingsBloc,
    required IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc,
    required WebSocketsListenType webSocketsListenType,
  }) {
    _logger.finest(() => "constructor");
    chatListBloc = PleromaChatWithLastMessageCachedListBloc(
      pleromaChatService: pleromaChatService,
      chatWithLastMessageRepository: chatWithLastMessageRepository,
      chatRepository: chatRepository,
    );
    addDisposable(disposable: chatListBloc);
    chatPaginationBloc = PleromaChatWithLastMessagePaginationBloc(
      cachedListBloc: chatListBloc,
      paginationSettingsBloc: paginationSettingsBloc,
      maximumCachedPagesCount: null,
    );
    addDisposable(
      disposable: chatListBloc,
    );
    chatPaginationListWithNewItemsBloc =
        PleromaChatWithLastMessagePaginationListWithNewItemsBloc(
      paginationBloc: chatPaginationBloc,
      cachedListBloc: chatListBloc,
      mergeNewItemsImmediately: true,
    );
    addDisposable(disposable: chatPaginationListWithNewItemsBloc);

    if (pleromaChatService.isPleroma) {
      addDisposable(
        disposable: webSocketsHandlerManagerBloc.listenPleromaChatChannel(
          listenType: webSocketsListenType,
        ),
      );
    }
  }

  static PleromaChatWithLastMessageListBloc createFromContext(
    BuildContext context, {
    required WebSocketsListenType webSocketsListenType,
  }) =>
      PleromaChatWithLastMessageListBloc(
        pleromaChatService: IPleromaApiChatService.of(context, listen: false),
        chatWithLastMessageRepository:
            IPleromaChatWithLastMessageRepository.of(context, listen: false),
        chatMessageRepository:
            IPleromaChatMessageRepository.of(context, listen: false),
        chatRepository: IPleromaChatRepository.of(context, listen: false),
        webSocketsHandlerManagerBloc: IWebSocketsHandlerManagerBloc.of(
          context,
          listen: false,
        ),
        webSocketsListenType: webSocketsListenType,
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
      );
}
