import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/websockets/my_account_websockets_handler_impl.dart';
import 'package:fedi/app/account/websockets/account_websockets_handler_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/websockets/conversation_chat_websockets_handler_impl.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/pleroma/websockets/pleroma_chat_websockets_handler_impl.dart';
import 'package:fedi/app/custom_list/status/list/custom_list_status_list_websockets_handler_impl.dart';
import 'package:fedi/app/hashtag/status/list/hashtag_status_list_websockets_handler_impl.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/public/public_timeline_websockets_handler_impl.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/web_sockets/pleroma_api_web_sockets_service.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';

class WebSocketsHandlerManagerBloc extends DisposableOwner
    implements IWebSocketsHandlerManagerBloc {
  final IPleromaWebSocketsService pleromaWebSocketsService;
  final IConversationChatRepository conversationRepository;
  final INotificationRepository notificationRepository;
  final IStatusRepository statusRepository;
  final IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;
  final IConversationChatNewMessagesHandlerBloc
      conversationChatNewMessagesHandlerBloc;
  final IMyAccountBloc myAccountBloc;

  WebSocketsHandlerManagerBloc({
    required this.pleromaWebSocketsService,
    required this.conversationRepository,
    required this.notificationRepository,
    required this.statusRepository,
    required this.chatNewMessagesHandlerBloc,
    required this.conversationChatNewMessagesHandlerBloc,
    required this.myAccountBloc,
  });

  @override
  IDisposable listenMyAccountChannel({
    required WebSocketsListenType listenType,
    required bool notification,
    required bool chat,
  }) =>
      MyAccountWebSocketsHandler(
        myAccountBloc: myAccountBloc,
        listenType: listenType,
        notification: notification,
        chat: chat,
        pleromaWebSocketsService: pleromaWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        conversationChatNewMessagesHandlerBloc:
            conversationChatNewMessagesHandlerBloc,
      );

  @override
  IDisposable listenAccountChannel({
    required WebSocketsListenType listenType,
    required String? accountId,
    required bool notification,
  }) =>
      AccountWebSocketsHandler(
        listenType: listenType,
        pleromaWebSocketsService: pleromaWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        conversationChatNewMessagesHandlerBloc:
            conversationChatNewMessagesHandlerBloc,
        accountId: accountId,
        notification: notification,
        myAccountBloc: myAccountBloc,
      );

  @override
  IDisposable listenPleromaChatChannel({
    required WebSocketsListenType listenType,
  }) =>
      PleromaChatWebSocketsHandler(
        listenType: listenType,
        notificationRepository: notificationRepository,
        conversationRepository: conversationRepository,
        statusRepository: statusRepository,
        pleromaWebSocketsService: pleromaWebSocketsService,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        conversationChatNewMessagesHandlerBloc:
            conversationChatNewMessagesHandlerBloc,
        myAccountBloc: myAccountBloc,
      );

  @override
  IDisposable listenConversationChannel({
    required WebSocketsListenType listenType,
  }) =>
      ConversationChatWebSocketsHandler(
        pleromaWebSocketsService: pleromaWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        conversationChatNewMessagesHandlerBloc:
            conversationChatNewMessagesHandlerBloc,
        accountId: null,
        listenType: listenType,
        myAccountBloc: myAccountBloc,
      );

  @override
  IDisposable listenPublicChannel({
    required WebSocketsListenType listenType,
    required bool? onlyLocal,
    required bool? onlyMedia,
    required bool? onlyRemote,
    required String? onlyFromInstance,
  }) =>
      PublicTimelineWebSocketsHandler(
        listenType: listenType,
        onlyLocal: onlyLocal,
        onlyMedia: onlyMedia,
        onlyRemote: onlyRemote,
        onlyFromInstance: onlyFromInstance,
        pleromaWebSocketsService: pleromaWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        conversationChatNewMessagesHandlerBloc:
            conversationChatNewMessagesHandlerBloc,
        myAccountBloc: myAccountBloc,
      );

  @override
  IDisposable listenHashtagChannel({
    required WebSocketsListenType listenType,
    required String? hashtag,
    required bool? local,
  }) =>
      HashtagStatusListWebSocketsHandler(
        listenType: listenType,
        hashtag: hashtag,
        local: local,
        pleromaWebSocketsService: pleromaWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        conversationChatNewMessagesHandlerBloc:
            conversationChatNewMessagesHandlerBloc,
        myAccountBloc: myAccountBloc,
      );

  @override
  IDisposable listenListChannel({
    required WebSocketsListenType listenType,
    required String? listId,
  }) =>
      CustomListStatusListWebSocketsHandler(
        listenType: listenType,
        customListRemoteId: listId,
        pleromaWebSocketsService: pleromaWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        conversationChatNewMessagesHandlerBloc:
            conversationChatNewMessagesHandlerBloc,
        myAccountBloc: myAccountBloc,
      );
}
