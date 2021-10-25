import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/chat/unifedi/message/repository/unifedi_chat_message_repository.dart';
import 'package:fedi_app/app/chat/unifedi/repository/unifedi_chat_repository.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/list/cached/unifedi_chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/list/cached/unifedi_chat_with_last_message_cached_list_bloc_impl.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/list/unifedi_chat_with_last_message_list_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/pagination/list/unifedi_chat_with_last_message_pagination_list_with_new_items_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/pagination/list/unifedi_chat_with_last_message_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/pagination/unifedi_chat_with_last_message_pagination_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/pagination/unifedi_chat_with_last_message_pagination_bloc_impl.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/repository/unifedi_chat_with_last_message_repository.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/unifedi_chat_with_last_message_model.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/app/web_sockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('unifedi_chat_with_last_message_list_bloc_impl.dart');

class UnifediChatWithLastMessageListBloc extends DisposableOwner
    implements IUnifediChatWithLastMessageListBloc {
  @override
  // ignore: avoid-late-keyword
  late IUnifediChatWithLastMessageCachedListBloc chatListBloc;

  @override
  // ignore: avoid-late-keyword
  late IUnifediChatWithLastMessagePaginationBloc chatPaginationBloc;

  @override
  IPaginationListBloc<PaginationPage<IUnifediChatWithLastMessage>,
          IUnifediChatWithLastMessage>
      get chatPaginationListBloc => chatPaginationListWithNewItemsBloc;

  @override
  // ignore: avoid-late-keyword
  late IUnifediChatWithLastMessagePaginationListWithNewItemsBloc<
          CachedPaginationPage<IUnifediChatWithLastMessage>>
      chatPaginationListWithNewItemsBloc;

  final IUnifediChatMessageRepository chatMessageRepository;
  final IUnifediChatRepository chatRepository;
  final IUnifediChatWithLastMessageRepository chatWithLastMessageRepository;
  final IPaginationSettingsBloc paginationSettingsBloc;

  UnifediChatWithLastMessageListBloc({
    required IUnifediApiChatService unifediApiChatService,
    required this.chatMessageRepository,
    required this.chatRepository,
    required this.chatWithLastMessageRepository,
    required this.paginationSettingsBloc,
    required IConnectionService connectionService,
    required IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc,
    required WebSocketsChannelHandlerType handlerType,
  }) {
    _logger.finest(() => 'constructor');
    chatListBloc = UnifediChatWithLastMessageCachedListBloc(
      unifediApiChatService: unifediApiChatService,
      chatWithLastMessageRepository: chatWithLastMessageRepository,
      chatRepository: chatRepository,
    )..disposeWith(this);
    chatPaginationBloc = UnifediChatWithLastMessagePaginationBloc(
      connectionService: connectionService,
      cachedListBloc: chatListBloc,
      paginationSettingsBloc: paginationSettingsBloc,
      maximumCachedPagesCount: null,
    )..disposeWith(this);

    chatPaginationListWithNewItemsBloc =
        UnifediChatWithLastMessagePaginationListWithNewItemsBloc(
      paginationBloc: chatPaginationBloc,
      cachedListBloc: chatListBloc,
      mergeNewItemsImmediately: true,
    )..disposeWith(this);

    if (unifediApiChatService.isPleroma) {
      webSocketsHandlerManagerBloc
          .listenUnifediChatChannel(
            handlerType: handlerType,
          )
          .disposeWith(this);
    }
  }

  static UnifediChatWithLastMessageListBloc createFromContext(
    BuildContext context, {
    required WebSocketsChannelHandlerType handlerType,
  }) =>
      UnifediChatWithLastMessageListBloc(
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
        unifediApiChatService:
            Provider.of<IUnifediApiChatService>(context, listen: false),
        chatWithLastMessageRepository:
            IUnifediChatWithLastMessageRepository.of(context, listen: false),
        chatMessageRepository:
            IUnifediChatMessageRepository.of(context, listen: false),
        chatRepository: IUnifediChatRepository.of(context, listen: false),
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
