import 'package:collection/collection.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/repository/account_repository.dart';
import 'package:fedi_app/app/chat/message/chat_message_bloc_impl.dart';
import 'package:fedi_app/app/chat/unifedi/message/repository/unifedi_chat_message_repository.dart';
import 'package:fedi_app/app/chat/unifedi/message/unifedi_chat_message_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi_app/app/chat/unifedi/unifedi_chat_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

class UnifediChatMessageBloc extends ChatMessageBloc
    implements IUnifediChatMessageBloc {
  static UnifediChatMessageBloc createFromContext(
    BuildContext context,
    IUnifediChatMessage chatMessage, {
    bool isNeedWatchLocalRepositoryForUpdates = true,
    bool delayInit = true,
  }) =>
      UnifediChatMessageBloc(
        unifediApiChatService:
            Provider.of<IUnifediApiChatService>(context, listen: false),
        unifediApiAccountService:
            Provider.of<IUnifediApiAccountService>(context, listen: false),
        chatMessageRepository:
            IUnifediChatMessageRepository.of(context, listen: false),
        accountRepository: IAccountRepository.of(context, listen: false),
        chatMessage: chatMessage,
        needRefreshFromNetworkOnInit: false,
        delayInit: delayInit,
        isNeedWatchLocalRepositoryForUpdates:
            isNeedWatchLocalRepositoryForUpdates,
        unifediChatBloc: IUnifediChatBloc.of(
          context,
          listen: false,
        ),
      );

  final BehaviorSubject<IUnifediChatMessage> _chatMessageSubject;

  final IUnifediApiChatService unifediApiChatService;
  final IUnifediApiAccountService unifediApiAccountService;
  final IUnifediChatMessageRepository chatMessageRepository;
  final IAccountRepository accountRepository;
  final IUnifediChatBloc unifediChatBloc;

  UnifediChatMessageBloc({
    required this.unifediApiChatService,
    required this.unifediApiAccountService,
    required this.chatMessageRepository,
    required this.accountRepository,
    required this.unifediChatBloc,
    required IUnifediChatMessage chatMessage, // for better performance we dont
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
    chatMessageRepository.watchByRemoteIdInAppType(chatMessage.remoteId).listen(
      (updatedChatMessage) {
        if (updatedChatMessage != null) {
          _chatMessageSubject.add(updatedChatMessage);
        }
      },
    ).disposeWith(this);

    var oldPendingRemoteId = chatMessage.oldPendingRemoteId;
    if (oldPendingRemoteId != null) {
      chatMessageRepository
          .watchByOldPendingRemoteId(oldPendingRemoteId)
          .listen(
        (updatedChatMessage) {
          if (updatedChatMessage != null) {
            _chatMessageSubject.add(updatedChatMessage);
          }
        },
      ).disposeWith(this);
    }
  }

  @override
  IUnifediChatMessage get chatMessage => _chatMessageSubject.value;

  @override
  Stream<IUnifediChatMessage> get chatMessageStream =>
      _chatMessageSubject.stream.distinct();

  @override
  IAccount? get account => chatMessage.account;

  @override
  Future<void> refreshFromNetwork() async {
    throw Exception('not supported by API yet');
  }

  @override
  Future<void> delete() => unifediChatBloc.deleteMessage(
        chatMessage: chatMessage,
      );

  @override
  Future<void> resendPendingFailed() {
    var mediaId = chatMessage.mediaAttachments?.singleOrNull?.id;

    var unifediApiPostChatMessage = UnifediApiPostChatMessage(
      content: chatMessage.content,
      mediaId: mediaId,
    );

    return unifediChatBloc.postMessage(
      idempotencyKey: chatMessage.wasSentWithIdempotencyKey,
      unifediApiPostChatMessage: unifediApiPostChatMessage,
      oldPendingFailedUnifediChatMessage: chatMessage,
      unifediApiPostChatMessageMediaAttachment:
          chatMessage.mediaAttachments?.singleOrNull,
    );
  }

  @override
  String get accountRemoteId => chatMessage.accountRemoteId;

  @override
  Stream<String> get accountRemoteIdStream => chatMessageStream.map(
        (chatMessage) => chatMessage.accountRemoteId,
      );
}
