import 'package:fedi/app/account/my/websockets/my_account_websockets_handler_impl.dart';
import 'package:fedi/app/account/websockets/account_websockets_handler_impl.dart';
import 'package:fedi/app/chat/chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/app/conversation/websockets/my_account_conversations_websockets_handler_impl.dart';
import 'package:fedi/app/custom_list/status/list/custom_list_status_list_websockets_handler_impl.dart';
import 'package:fedi/app/hashtag/status/list/hashtag_status_list_websockets_handler_impl.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/public/public_timeline_websockets_handler_impl.dart';
import 'package:fedi/app/websockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/widgets.dart';

// todo: handle listen to one endpoint from different place
// we should have only one websockets connection to one endpoint
class WebSocketsHandlerManagerBloc extends DisposableOwner
    implements IWebSocketsHandlerManagerBloc {
  final IPleromaWebSocketsService pleromaWebSocketsService;
  final IConversationRepository conversationRepository;
  final INotificationRepository notificationRepository;
  final IStatusRepository statusRepository;
  final IChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;

  WebSocketsHandlerManagerBloc({
    @required this.pleromaWebSocketsService,
    @required this.conversationRepository,
    @required this.notificationRepository,
    @required this.statusRepository,
    @required this.chatNewMessagesHandlerBloc,
  });

  @override
  Disposable listenMyAccountChannel({
    @required bool notification,
    @required bool chat,
  }) =>
      MyAccountWebSocketsHandler(
        notification: notification,
        chat: chat,
        pleromaWebSocketsService: pleromaWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
      );

  @override
  Disposable listenAccountChannel({
    @required String accountId,
    @required bool notification,
  }) =>
      AccountWebSocketsHandler(
        pleromaWebSocketsService: pleromaWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        accountId: accountId,
        notification: notification,
      );

  @override
  Disposable listenDirectChannel() => MyAccountConversationsWebSocketsHandler(
        pleromaWebSocketsService: pleromaWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        accountId: null,
      );

  @override
  Disposable listenPublicChannel({
    @required bool local,
    @required bool onlyMedia,
  }) =>
      PublicTimelineWebSocketsHandler(
        local: local,
        onlyMedia: local,
        pleromaWebSocketsService: pleromaWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
      );

  @override
  Disposable listenHashtagChannel({
    @required String hashtag,
    @required bool local,
  }) =>
      HashtagStatusListWebSocketsHandler(
        hashtag: hashtag,
        local: local,
        pleromaWebSocketsService: pleromaWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
      );

  @override
  Disposable listenListChannel({
    @required String listId,
  }) =>
      CustomListStatusListWebSocketsHandler(
        customListRemoteId: listId,
        pleromaWebSocketsService: pleromaWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
      );
}
