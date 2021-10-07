import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_bloc.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi/app/chat/message/chat_message_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

class ConversationChatMessageBloc extends ChatMessageBloc
    implements IConversationChatMessageBloc {
  final IUnifediApiInstancePollLimits? pollLimits;

  static ConversationChatMessageBloc createFromContext(
    BuildContext context,
    IConversationChatMessage chatMessage, {
    bool isNeedWatchLocalRepositoryForUpdates = true,
    bool delayInit = true,
  }) =>
      ConversationChatMessageBloc(
        pollLimits: ICurrentUnifediApiAccessBloc.of(
          context,
          listen: false,
        ).currentInstance?.info?.limits?.poll,
        conversationChatService:
            Provider.of<IUnifediApiConversationService>(context, listen: false),
        authStatusService:
            Provider.of<IUnifediApiStatusService>(context, listen: false),
        unifediApiAccountService:
            Provider.of<IUnifediApiAccountService>(context, listen: false),
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

  final IUnifediApiConversationService conversationChatService;
  final IUnifediApiStatusService authStatusService;
  final IUnifediApiAccountService unifediApiAccountService;
  final IStatusRepository statusRepository;
  final IAccountRepository accountRepository;
  final IConversationChatBloc conversationChatBloc;

  ConversationChatMessageBloc({
    required this.conversationChatService,
    required this.unifediApiAccountService,
    required this.statusRepository,
    required this.authStatusService,
    required this.accountRepository,
    required this.conversationChatBloc,
    required this.pollLimits,
    required IConversationChatMessage
        chatMessage, // for better performance we dont
    // update
    // account too often
    bool needRefreshFromNetworkOnInit =
        false, // todo: remove hack. Dont init when bloc quickly disposed. Help
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
    _chatMessageSubject.disposeWith(this);
  }

  @override
  void watchLocalRepositoryChanges() {
    statusRepository.watchByRemoteIdInAppType(chatMessage.remoteId).listen(
      (updatedChatMessage) {
        if (updatedChatMessage != null) {
          _chatMessageSubject.add(
            updatedChatMessage.toConversationChatMessageStatusAdapter(),
          );
        }
      },
    ).disposeWith(this);

    var oldPendingRemoteId = chatMessage.oldPendingRemoteId;
    if (oldPendingRemoteId != null) {
      statusRepository.watchByOldPendingRemoteId(oldPendingRemoteId).listen(
        (updatedChatMessage) {
          if (updatedChatMessage != null) {
            _chatMessageSubject.add(
              updatedChatMessage.toConversationChatMessageStatusAdapter(),
            );
          }
        },
      ).disposeWith(this);
    }
  }

  @override
  IConversationChatMessage get chatMessage => _chatMessageSubject.value;

  @override
  Stream<IConversationChatMessage> get chatMessageStream =>
      _chatMessageSubject.stream.distinct();

  @override
  IAccount get account => chatMessage.account!;

  @override
  Future refreshFromNetwork() async {
    var remoteStatus = await authStatusService.getStatus(
      statusId: chatMessage.remoteId,
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
          limits: pollLimits,
        ),
        oldPendingFailedConversationChatMessage: chatMessage,
      );

  @override
  String get accountRemoteId => chatMessage.accountRemoteId;

  @override
  Stream<String> get accountRemoteIdStream => chatMessageStream.map(
        (chatMessage) => chatMessage.accountRemoteId,
      );
}
