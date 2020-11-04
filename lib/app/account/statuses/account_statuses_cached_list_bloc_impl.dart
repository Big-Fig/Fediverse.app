import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/websockets/account_websockets_handler_impl.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';

abstract class AccountStatusesCachedListBloc extends IStatusCachedListBloc {
  final IAccount account;
  final IPleromaAccountService pleromaAccountService;
  final IStatusRepository statusRepository;
  final INotificationRepository notificationRepository;
  final IConversationChatRepository conversationRepository;
  final IPleromaWebSocketsService pleromaWebSocketsService;

  AccountStatusesCachedListBloc({
    @required this.account,
    @required this.pleromaAccountService,
    @required this.statusRepository,
    @required this.notificationRepository,
    @required this.conversationRepository,
    @required this.pleromaWebSocketsService,
    @required bool listenWebSocketsChanges,
    @required IChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc,
  }) : super() {
    if (listenWebSocketsChanges) {
      addDisposable(
          disposable: AccountWebSocketsHandler(
        statusRepository: statusRepository,
        accountId: account.remoteId,
        notificationRepository: notificationRepository,
        conversationRepository: conversationRepository,
        pleromaWebSocketsService: pleromaWebSocketsService,
        chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc,
        notification: false,
      ));
    }
  }

  @override
  IPleromaApi get pleromaApi => pleromaAccountService;

  @override
  Stream<bool> get settingsChangedStream => Stream.empty();
}
