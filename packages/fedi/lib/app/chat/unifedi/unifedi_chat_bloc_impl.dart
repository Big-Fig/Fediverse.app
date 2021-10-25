import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/chat_bloc_impl.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/unifedi/message/repository/unifedi_chat_message_repository.dart';
import 'package:fedi/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi/app/chat/unifedi/repository/unifedi_chat_repository.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_bloc.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/id/fake_id_helper.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('unifedi_chat_bloc_impl.dart');

class UnifediChatBloc extends ChatBloc implements IUnifediChatBloc {
  // ignore: close_sinks
  final BehaviorSubject<IUnifediChat> _chatSubject;

  // ignore: close_sinks
  final BehaviorSubject<IUnifediChatMessage?> _lastMessageSubject;

  // ignore: close_sinks
  final BehaviorSubject<IUnifediChatMessage> _lastPublishedMessageSubject =
      BehaviorSubject();

  @override
  IUnifediChat get chat => _chatSubject.value;

  @override
  Stream<IUnifediChat> get chatStream => _chatSubject.stream.distinct();

  @override
  IUnifediChatMessage? get lastChatMessage => _lastMessageSubject.valueOrNull;

  @override
  Stream<IUnifediChatMessage?> get lastChatMessageStream =>
      _lastMessageSubject.stream;

  final IMyAccountBloc myAccountBloc;
  final IUnifediApiChatService unifediApiChatService;
  final IUnifediChatRepository chatRepository;
  final IUnifediChatMessageRepository chatMessageRepository;
  final IAccountRepository accountRepository;
  final IConnectionService connectionService;

  final StreamController<IUnifediChatMessage>
      onMessageLocallyHiddenStreamController = StreamController.broadcast();

  @override
  Stream<IUnifediChatMessage> get onMessageLocallyHiddenStream =>
      onMessageLocallyHiddenStreamController.stream;

  UnifediChatBloc({
    required this.unifediApiChatService,
    required this.myAccountBloc,
    required this.chatRepository,
    required this.chatMessageRepository,
    required this.accountRepository,
    required this.connectionService,
    required IUnifediChat chat,
    required IUnifediChatMessage? lastChatMessage,
    bool needRefreshFromNetworkOnInit = false,
    bool isNeedWatchLocalRepositoryForUpdates =
        true, // todo: remove hack. Dont init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
  })  : _chatSubject = BehaviorSubject.seeded(chat),
        _lastMessageSubject = BehaviorSubject.seeded(lastChatMessage),
        super(
          needRefreshFromNetworkOnInit: needRefreshFromNetworkOnInit,
          isNeedWatchLocalRepositoryForUpdates:
              isNeedWatchLocalRepositoryForUpdates,
          delayInit: delayInit,
        ) {
    _logger.finest(
      () => 'UnifediChatBloc \n'
          ' chat ${chat.remoteId} \n'
          ' lastMessage $lastChatMessage',
    );

    _chatSubject.disposeWith(this);
    _lastMessageSubject.disposeWith(this);
    _lastPublishedMessageSubject.disposeWith(this);
    onMessageLocallyHiddenStreamController.disposeWith(this);
  }

  @override
  void watchLocalRepositoryForUpdates() {
    chatRepository.watchByRemoteIdInAppType(chat.remoteId).listen(
      (updatedChat) {
        if (updatedChat != null) {
          _chatSubject.add(updatedChat);
        }
      },
    ).disposeWith(this);

    chatMessageRepository.watchChatLastChatMessage(chat: chat).listen(
      (lastMessage) {
        _logger.finest(
          () => 'watchChatLastChatMessage \n'
              ' chat ${chat.remoteId} \n'
              ' lastMessage $lastMessage',
        );
        if (lastMessage != null) {
          _lastMessageSubject.add(lastMessage);

          if (lastMessage.isPendingStatePublishedOrNull) {
            _lastPublishedMessageSubject.add(lastMessage);
          }
        }
      },
    ).disposeWith(this);
  }

  @override
  Future<void> internalAsyncInit() async {
    var chatLastChatMessage =
        await chatMessageRepository.getChatLastChatMessage(chat: chat);
    if (chatLastChatMessage != null) {
      if (!_lastMessageSubject.isClosed) {
        _lastMessageSubject.add(chatLastChatMessage);
      }

      if (chatLastChatMessage.isPendingStatePublishedOrNull) {
        _lastPublishedMessageSubject.add(chatLastChatMessage);
      } else {
        var lastPublishedChatMessage =
            await chatMessageRepository.getChatLastChatMessage(
          chat: chat,
          onlyPendingStatePublishedOrNull: true,
        );
        if (lastPublishedChatMessage != null) {
          if (!_lastPublishedMessageSubject.isClosed) {
            _lastPublishedMessageSubject.add(
              lastPublishedChatMessage,
            );
          }
        }
      }
    }
  }

  @override
  Future<void> refreshFromNetwork() async {
    var remoteChat = await unifediApiChatService.getChat(id: chat.remoteId);

    await accountRepository.batch((batch) {
      accountRepository.upsertChatRemoteAccount(
        remoteChat.account,
        chatRemoteId: remoteChat.id,
        batchTransaction: batch,
      );

      var lastMessage = remoteChat.lastMessage;
      if (lastMessage != null) {
        chatMessageRepository.upsertInRemoteTypeBatch(
          lastMessage,
          batchTransaction: batch,
        );
      }

      _updateByRemoteChat(
        remoteChat,
        batchTransaction: batch,
      );
    });
  }

  Future<void> _updateByRemoteChat(
    IUnifediApiChat unifediApiChat, {
    required Batch? batchTransaction,
  }) =>
      chatRepository.updateAppTypeByRemoteType(
        appItem: chat,
        remoteItem: unifediApiChat,
        batchTransaction: batchTransaction,
      );

  static UnifediChatBloc createFromContext(
    BuildContext context, {
    required IUnifediChat chat,
    required IUnifediChatMessage? lastChatMessage,
    bool needRefreshFromNetworkOnInit = false,
  }) =>
      UnifediChatBloc(
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
        unifediApiChatService:
            Provider.of<IUnifediApiChatService>(context, listen: false),
        myAccountBloc: IMyAccountBloc.of(context, listen: false),
        chat: chat,
        lastChatMessage: lastChatMessage,
        needRefreshFromNetworkOnInit: needRefreshFromNetworkOnInit,
        chatRepository: IUnifediChatRepository.of(context, listen: false),
        chatMessageRepository:
            IUnifediChatMessageRepository.of(context, listen: false),
        accountRepository: IAccountRepository.of(context, listen: false),
      );

  @override
  Future<void> markAsRead() async {
    if (chat.unread > 0) {
      if (connectionService.isConnected) {
        var lastReadChatMessageId = lastChatMessage?.remoteId;
        if (lastReadChatMessageId == null) {
          var lastMessage = await chatMessageRepository.getChatLastChatMessage(
            chat: chat,
          );
          lastReadChatMessageId = lastMessage?.remoteId;
        }

        if (lastReadChatMessageId != null) {
          var updatedRemoteChat = await unifediApiChatService.markChatAsRead(
            chatId: chat.remoteId,
            lastReadChatMessageId: lastReadChatMessageId,
          );

          // ignore: avoid-ignoring-return-values
          await chatRepository.upsertInRemoteType(updatedRemoteChat);
        }
      } else {
        // TODO: mark as read once app receive network connection
        await chatRepository.markAsRead(chat: chat, batchTransaction: null);
      }
    }
  }

  @override
  bool get isCountInUnreadSupported => true;

  @override
  Future<void> deleteMessages(List<IChatMessage> chatMessages) async {
    // create queue instead of parallel requests to avoid throttle limit on server
    for (final chatMessage in chatMessages) {
      var remoteId = chatMessage.remoteId;
      if (chatMessage.isPendingStatePublishedOrNull) {
        await unifediApiChatService.deleteChatMessage(
          chatId: chat.remoteId,
          chatMessageId: remoteId,
        );
      }

      await chatMessageRepository.markChatMessageAsDeleted(
        chatMessageRemoteId: remoteId,
      );
    }
  }

  @override
  Future<void> performActualDelete() {
    throw UnsupportedError('It is not possible to delete unifedi chat');
  }

  @override
  // todo: refactor
  // ignore: long-method
  Future<void> postMessage({
    required String? idempotencyKey,
    required IUnifediApiPostChatMessage unifediApiPostChatMessage,
    required IUnifediApiMediaAttachment?
        unifediApiPostChatMessageMediaAttachment,
    required IUnifediChatMessage? oldPendingFailedUnifediChatMessage,
  }) async {
    DbChatMessage dbChatMessage;
    int? localChatMessageId;

    var actualIdempotencyKey = idempotencyKey;
    localChatMessageId = oldPendingFailedUnifediChatMessage?.localId;
    if (oldPendingFailedUnifediChatMessage != null &&
        localChatMessageId != null) {
      dbChatMessage =
          oldPendingFailedUnifediChatMessage.toDbChatMessage().copyWith(
                id: localChatMessageId,
              );

      actualIdempotencyKey = dbChatMessage.wasSentWithIdempotencyKey;

      await chatMessageRepository.updateByDbIdInDbType(
        dbId: localChatMessageId,
        dbItem: dbChatMessage.copyWith(
          pendingState: PendingState.pending,
        ),
        batchTransaction: null,
      );
    } else {
      var createdAt = DateTime.now();
      var fakeUniqueRemoteRemoteId = FakeIdHelper.generateUniqueId();

      dbChatMessage = DbChatMessage(
        id: null,
        remoteId: fakeUniqueRemoteRemoteId,
        chatRemoteId: chat.remoteId,
        accountRemoteId: myAccountBloc.account.remoteId,
        createdAt: createdAt,
        content: unifediApiPostChatMessage.content,
        emojis: null,
        mediaAttachment: unifediApiPostChatMessageMediaAttachment
            ?.toUnifediApiMediaAttachment(),
        card: null,
        pendingState: PendingState.pending,
        // ignore: no-equal-arguments
        oldPendingRemoteId: fakeUniqueRemoteRemoteId,
        deleted: false,
        hiddenLocallyOnDevice: false,
        wasSentWithIdempotencyKey: null,
      );
      localChatMessageId = await chatMessageRepository.insertInDbType(
        dbChatMessage,
        mode: null,
      );

      actualIdempotencyKey = fakeUniqueRemoteRemoteId;
    }

    try {
      var unifediApiChatMessage = await unifediApiChatService.sendMessage(
        idempotencyKey: actualIdempotencyKey,
        chatId: chat.remoteId,
        postChatMessage: unifediApiPostChatMessage,
      );
      onMessageLocallyHiddenStreamController.add(
        DbUnifediChatMessagePopulatedWrapper(
          dbChatMessagePopulated: DbChatMessagePopulated(
            dbChatMessage: dbChatMessage,
            // todo: rework
            dbAccount: myAccountBloc.myAccount!.toDbAccount(),
          ),
        ),
      );

      await chatMessageRepository.batch((batch) {
        chatMessageRepository.updateByDbIdInDbType(
          dbId: localChatMessageId!,
          dbItem: dbChatMessage.copyWith(
            hiddenLocallyOnDevice: true,
            pendingState: PendingState.published,
          ),
          batchTransaction: batch,
        );

        // ignore: cascade_invocations
        chatMessageRepository.upsertInRemoteTypeBatch(
          unifediApiChatMessage,
          batchTransaction: batch,
        );
      });
      // ignore: avoid_catches_without_on_clauses
    } catch (e, stackTrace) {
      _logger.warning(() => 'postMessage error', e, stackTrace);
      await chatMessageRepository.updateByDbIdInDbType(
        dbId: localChatMessageId,
        dbItem: dbChatMessage.copyWith(
          pendingState: PendingState.fail,
        ),
        batchTransaction: null,
      );
      rethrow;
    }
  }

  @override
  Future<void> deleteMessage({
    required IUnifediChatMessage chatMessage,
  }) async {
    if (chatMessage.isPendingStatePublishedOrNull) {
      await unifediApiChatService.deleteChatMessage(
        chatMessageId: chatMessage.remoteId,
        chatId: chatMessage.chatRemoteId,
      );

      await chatMessageRepository.markChatMessageAsDeleted(
        chatMessageRemoteId: chatMessage.remoteId,
      );
    } else {
      await chatMessageRepository.markChatMessageAsHiddenLocallyOnDevice(
        chatMessageLocalId: chatMessage.localId!,
      );
      onMessageLocallyHiddenStreamController.add(chatMessage);
    }
  }

  @override
  IUnifediChatMessage? get lastPublishedChatMessage =>
      _lastPublishedMessageSubject.valueOrNull;

  @override
  bool get isDeletePossible => false;
}
