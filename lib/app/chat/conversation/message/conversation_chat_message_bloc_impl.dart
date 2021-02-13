import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_bloc.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi/app/chat/message/chat_message_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class ConversationChatMessageBloc extends ChatMessageBloc
    implements IConversationChatMessageBloc {
  static ConversationChatMessageBloc createFromContext(
    BuildContext context,
    IConversationChatMessage chatMessage, {
    bool isNeedWatchLocalRepositoryForUpdates = true,
    bool delayInit = true,
  }) =>
      ConversationChatMessageBloc(
          conversationChatService:
              IPleromaConversationService.of(context, listen: false),
          statusService: IPleromaStatusService.of(context, listen: false),
          pleromaAccountService:
              IPleromaAccountService.of(context, listen: false),
          statusRepository: IStatusRepository.of(context, listen: false),
          accountRepository: IAccountRepository.of(context, listen: false),
          chatMessage: chatMessage,
          needRefreshFromNetworkOnInit: false,
          delayInit: delayInit,
          isNeedWatchLocalRepositoryForUpdates:
              isNeedWatchLocalRepositoryForUpdates);

  final BehaviorSubject<IConversationChatMessage> _chatMessageSubject;

  final IPleromaConversationService conversationChatService;
  final IPleromaStatusService statusService;
  final IPleromaAccountService pleromaAccountService;
  final IStatusRepository statusRepository;
  final IAccountRepository accountRepository;

  ConversationChatMessageBloc({
    @required this.conversationChatService,
    @required this.pleromaAccountService,
    @required this.statusRepository,
    @required this.statusService,
    @required this.accountRepository,
    @required
        IConversationChatMessage chatMessage, // for better performance we don't
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
      streamSubscription:
          statusRepository.watchByRemoteId(chatMessage.remoteId).listen(
        (updatedChatMessage) {
          if (updatedChatMessage != null) {
            _chatMessageSubject.add(
              ConversationChatMessageStatusAdapter(
                updatedChatMessage,
              ),
            );
          }
        },
      ),
    );

    if (chatMessage.oldPendingRemoteId != null) {
      addDisposable(
        streamSubscription: statusRepository
            .watchByOldPendingRemoteId(chatMessage.oldPendingRemoteId)
            .listen(
          (updatedChatMessage) {
            if (updatedChatMessage != null) {
              _chatMessageSubject.add(
                ConversationChatMessageStatusAdapter(
                  updatedChatMessage,
                ),
              );
            }
          },
        ),
      );
    }
  }

  @override
  IConversationChatMessage get chatMessage => _chatMessageSubject.value;

  @override
  Stream<IConversationChatMessage> get chatMessageStream =>
      _chatMessageSubject.stream.distinct();

  @override
  IAccount get account => chatMessage?.account;

  @override
  Future refreshFromNetwork() async {
    var remoteStatus =
        await statusService.getStatus(statusRemoteId: chatMessage.remoteId);

    await statusRepository.updateLocalStatusByRemoteStatus(
      oldLocalStatus: chatMessage.status,
      newRemoteStatus: remoteStatus,
    );
  }
}
