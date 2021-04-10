import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_bloc.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi/app/chat/message/chat_message_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/pleroma/status/auth/pleroma_auth_status_service.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class ConversationChatMessageBloc extends ChatMessageBloc
    implements IConversationChatMessageBloc {
  final PleromaInstancePollLimits pleromaInstancePollLimits;

  static ConversationChatMessageBloc createFromContext(
    BuildContext context,
    IConversationChatMessage chatMessage, {
    bool isNeedWatchLocalRepositoryForUpdates = true,
    bool delayInit = true,
  }) =>
      ConversationChatMessageBloc(
        pleromaInstancePollLimits: ICurrentAuthInstanceBloc.of(
              context,
              listen: false,
            ).currentInstance?.info?.pollLimits ??
            PleromaInstancePollLimits.defaultLimits,
        conversationChatService:
            IPleromaConversationService.of(context, listen: false),
        authStatusService: IPleromaAuthStatusService.of(context, listen: false),
        pleromaAccountService:
            IPleromaAccountService.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        accountRepository: IAccountRepository.of(context, listen: false),
        chatMessage: chatMessage,
        needRefreshFromNetworkOnInit: false,
        delayInit: delayInit,
        isNeedWatchLocalRepositoryForUpdates:
            isNeedWatchLocalRepositoryForUpdates,
        conversationChatBloc: IConversationChatBloc.of(
          context,
          listen: false,
        ),
      );

  final BehaviorSubject<IConversationChatMessage> _chatMessageSubject;

  final IPleromaConversationService conversationChatService;
  final IPleromaAuthStatusService authStatusService;
  final IPleromaAccountService pleromaAccountService;
  final IStatusRepository statusRepository;
  final IAccountRepository accountRepository;
  final IConversationChatBloc conversationChatBloc;

  ConversationChatMessageBloc({
    required this.conversationChatService,
    required this.pleromaAccountService,
    required this.statusRepository,
    required this.authStatusService,
    required this.accountRepository,
    required this.conversationChatBloc,
    required this.pleromaInstancePollLimits,
    required IConversationChatMessage
        chatMessage, // for better performance we don't
    // update
    // account too often
    bool needRefreshFromNetworkOnInit =
        false, // todo: remove hack. Don't init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
    bool isNeedWatchLocalRepositoryForUpdates = true,
  })  : _chatMessageSubject = BehaviorSubject.seeded(chatMessage),
        super(
          isNeedWatchLocalRepositoryForUpdates:
              isNeedWatchLocalRepositoryForUpdates,
          needRefreshFromNetworkOnInit: needRefreshFromNetworkOnInit,
          delayInit: delayInit,
        ) {
    addDisposable(subject: _chatMessageSubject);
  }

  @override
  void watchLocalRepositoryChanges() {
    addDisposable(
      streamSubscription: statusRepository
          .watchByRemoteIdInAppType(chatMessage.remoteId)
          .listen(
        (updatedChatMessage) {
          if (updatedChatMessage != null) {
            _chatMessageSubject.add(
              updatedChatMessage.toConversationChatMessageStatusAdapter(),
            );
          }
        },
      ),
    );

    var oldPendingRemoteId = chatMessage.oldPendingRemoteId;
    if (oldPendingRemoteId != null) {
      addDisposable(
        streamSubscription: statusRepository
            .watchByOldPendingRemoteId(oldPendingRemoteId)
            .listen(
          (updatedChatMessage) {
            if (updatedChatMessage != null) {
              _chatMessageSubject.add(
                updatedChatMessage.toConversationChatMessageStatusAdapter(),
              );
            }
          },
        ),
      );
    }
  }

  @override
  IConversationChatMessage get chatMessage => _chatMessageSubject.value!;

  @override
  Stream<IConversationChatMessage> get chatMessageStream =>
      _chatMessageSubject.stream.distinct();

  @override
  IAccount get account => chatMessage.account;

  @override
  Future refreshFromNetwork() async {
    var remoteStatus = await authStatusService.getStatus(
      statusRemoteId: chatMessage.remoteId,
    );

    await statusRepository.updateAppTypeByRemoteType(
      appItem: chatMessage.status,
      remoteItem: remoteStatus,
      batchTransaction: null,
    );
  }

  @override
  Future delete() => conversationChatBloc.deleteMessage(
        conversationChatMessage: chatMessage,
      );

  @override
  Future resendPendingFailed() => conversationChatBloc.postMessage(
        postStatusData: chatMessage.status.calculatePostStatusData(
          limits: pleromaInstancePollLimits,
        ),
        oldPendingFailedConversationChatMessage: chatMessage,
      );
}
