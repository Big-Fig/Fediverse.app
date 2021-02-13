import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/message/chat_message_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class PleromaChatMessageBloc extends ChatMessageBloc
    implements IPleromaChatMessageBloc {
  static PleromaChatMessageBloc createFromContext(
    BuildContext context,
    IPleromaChatMessage chatMessage, {
    bool isNeedWatchLocalRepositoryForUpdates = true,
    bool delayInit = true,
  }) =>
      PleromaChatMessageBloc(
          pleromaChatService: IPleromaChatService.of(context, listen: false),
          pleromaAccountService:
              IPleromaAccountService.of(context, listen: false),
          chatMessageRepository:
              IPleromaChatMessageRepository.of(context, listen: false),
          accountRepository: IAccountRepository.of(context, listen: false),
          chatMessage: chatMessage,
          needRefreshFromNetworkOnInit: false,
          delayInit: delayInit,
          isNeedWatchLocalRepositoryForUpdates:
              isNeedWatchLocalRepositoryForUpdates);

  final BehaviorSubject<IPleromaChatMessage> _chatMessageSubject;

  final IPleromaChatService pleromaChatService;
  final IPleromaAccountService pleromaAccountService;
  final IPleromaChatMessageRepository chatMessageRepository;
  final IAccountRepository accountRepository;

  PleromaChatMessageBloc({
    @required this.pleromaChatService,
    @required this.pleromaAccountService,
    @required this.chatMessageRepository,
    @required this.accountRepository,
    @required
        IPleromaChatMessage chatMessage, // for better performance we don't
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
          chatMessageRepository.watchByRemoteId(chatMessage.remoteId).listen(
        (updatedChatMessage) {
          if (updatedChatMessage != null) {
            _chatMessageSubject.add(updatedChatMessage);
          }
        },
      ),
    );

    if(chatMessage.oldPendingRemoteId != null) {
      addDisposable(
        streamSubscription:
        chatMessageRepository.watchByOldPendingRemoteId(chatMessage.oldPendingRemoteId).listen(
              (updatedChatMessage) {
            if (updatedChatMessage != null) {
              _chatMessageSubject.add(updatedChatMessage);
            }
          },
        ),
      );
    }
  }

  @override
  IPleromaChatMessage get chatMessage => _chatMessageSubject.value;

  @override
  Stream<IPleromaChatMessage> get chatMessageStream =>
      _chatMessageSubject.stream.distinct();

  @override
  IAccount get account => chatMessage?.account;

  @override
  Future refreshFromNetwork() async {
    throw "not supported by API yet";
  }
}
