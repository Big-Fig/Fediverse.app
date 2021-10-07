import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/websockets/my_account_websockets_handler_impl.dart';
import 'package:fedi/app/account/websockets/account_websockets_handler_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/websockets/conversation_chat_websockets_handler_impl.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/pleroma/websockets/pleroma_chat_websockets_handler_impl.dart';
import 'package:fedi/app/custom_list/status/list/custom_list_status_list_websockets_handler_impl.dart';
import 'package:fedi/app/hashtag/status_list/hashtag_status_list_websockets_handler_impl.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/public/public_timeline_websockets_handler_impl.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_manager_bloc.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:unifedi_api/unifedi_api.dart';

class WebSocketsHandlerManagerBloc extends DisposableOwner
    implements IWebSocketsHandlerManagerBloc {
  final IUnifediApiWebSocketsService unifediApiWebSocketsService;
  final IConversationChatRepository conversationRepository;
  final INotificationRepository notificationRepository;
  final IInstanceAnnouncementRepository instanceAnnouncementRepository;
  final IStatusRepository statusRepository;
  final IPleromaChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc;
  final IConversationChatNewMessagesHandlerBloc
      conversationChatNewMessagesHandlerBloc;
  final IMyAccountBloc myAccountBloc;

  WebSocketsHandlerManagerBloc({
    required this.unifediApiWebSocketsService,
    required this.conversationRepository,
    required this.notificationRepository,
    required this.instanceAnnouncementRepository,
    required this.statusRepository,
    required this.chatNewMessagesHandlerBloc,
    required this.conversationChatNewMessagesHandlerBloc,
    required this.myAccountBloc,
  });

  @override
  IDisposable listenMyAccountChannel({
    required WebSocketsChannelHandlerType handlerType,
    required bool notification,
    required bool chat,
  }) =>
      MyAccountWebSocketsHandler(
        myAccountBloc: myAccountBloc,
        handlerType: handlerType,
        notification: notification,
        chat: chat,
        unifediApiWebSocketsService: unifediApiWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        instanceAnnouncementRepository: instanceAnnouncementRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        conversationChatNewMessagesHandlerBloc:
            conversationChatNewMessagesHandlerBloc,
      );

  @override
  IDisposable listenAccountChannel({
    required WebSocketsChannelHandlerType handlerType,
    required String accountId,
    required bool notification,
  }) =>
      AccountWebSocketsHandler(
        handlerType: handlerType,
        unifediApiWebSocketsService: unifediApiWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        instanceAnnouncementRepository: instanceAnnouncementRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        conversationChatNewMessagesHandlerBloc:
            conversationChatNewMessagesHandlerBloc,
        accountId: accountId,
        notification: notification,
        myAccountBloc: myAccountBloc,
      );

  @override
  IDisposable listenPleromaChatChannel({
    required WebSocketsChannelHandlerType handlerType,
  }) =>
      PleromaChatWebSocketsHandler(
        handlerType: handlerType,
        notificationRepository: notificationRepository,
        instanceAnnouncementRepository: instanceAnnouncementRepository,
        conversationRepository: conversationRepository,
        statusRepository: statusRepository,
        unifediApiWebSocketsService: unifediApiWebSocketsService,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        conversationChatNewMessagesHandlerBloc:
            conversationChatNewMessagesHandlerBloc,
        myAccountBloc: myAccountBloc,
      );

  @override
  IDisposable listenConversationChannel({
    required WebSocketsChannelHandlerType handlerType,
  }) =>
      ConversationChatWebSocketsHandler(
        unifediApiWebSocketsService: unifediApiWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        instanceAnnouncementRepository: instanceAnnouncementRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        conversationChatNewMessagesHandlerBloc:
            conversationChatNewMessagesHandlerBloc,
        accountId: null,
        handlerType: handlerType,
        myAccountBloc: myAccountBloc,
      );

  @override
  IDisposable listenPublicChannel({
    required WebSocketsChannelHandlerType handlerType,
    required bool? onlyLocal,
    required bool? onlyMedia,
    required bool? onlyRemote,
    required String? onlyFromInstance,
  }) =>
      PublicTimelineWebSocketsHandler(
        handlerType: handlerType,
        onlyLocal: onlyLocal,
        onlyMedia: onlyMedia,
        onlyRemote: onlyRemote,
        onlyFromInstance: onlyFromInstance,
        unifediApiWebSocketsService: unifediApiWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        instanceAnnouncementRepository: instanceAnnouncementRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        conversationChatNewMessagesHandlerBloc:
            conversationChatNewMessagesHandlerBloc,
        myAccountBloc: myAccountBloc,
      );

  @override
  IDisposable listenHashtagChannel({
    required WebSocketsChannelHandlerType handlerType,
    required String hashtag,
    required bool? local,
  }) =>
      HashtagStatusListWebSocketsHandler(
        handlerType: handlerType,
        hashtag: hashtag,
        local: local,
        unifediApiWebSocketsService: unifediApiWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        instanceAnnouncementRepository: instanceAnnouncementRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        conversationChatNewMessagesHandlerBloc:
            conversationChatNewMessagesHandlerBloc,
        myAccountBloc: myAccountBloc,
      );

  @override
  IDisposable listenListChannel({
    required WebSocketsChannelHandlerType handlerType,
    required String listId,
  }) =>
      CustomListStatusListWebSocketsHandler(
        handlerType: handlerType,
        customListRemoteId: listId,
        unifediApiWebSocketsService: unifediApiWebSocketsService,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        notificationRepository: notificationRepository,
        instanceAnnouncementRepository: instanceAnnouncementRepository,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        conversationChatNewMessagesHandlerBloc:
            conversationChatNewMessagesHandlerBloc,
        myAccountBloc: myAccountBloc,
      );
}
