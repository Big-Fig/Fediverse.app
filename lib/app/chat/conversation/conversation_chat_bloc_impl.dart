import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_model.dart';
import 'package:fedi/app/chat/chat_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/status/post/post_status_data_status_status_adapter.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/id/fake_id_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('conversation_chat_bloc_impl.dart');

class ConversationChatBloc extends ChatBloc implements IConversationChatBloc {
  // ignore: close_sinks
  final BehaviorSubject<IConversationChat> _chatSubject;

  // ignore: close_sinks
  final BehaviorSubject<IConversationChatMessage?> _lastMessageSubject;

  // ignore: close_sinks
  final BehaviorSubject<IConversationChatMessage> _lastPublishedMessageSubject =
      BehaviorSubject();

  final BehaviorSubject<List<IAccount>> _accountsSubject;

  @override
  List<IAccount> get accounts => _accountsSubject.value;

  @override
  Stream<List<IAccount>> get accountsStream =>
      _accountsSubject.stream.distinct((a, b) => listEquals(a, b));

  @override
  IConversationChat get chat => _chatSubject.value;

  @override
  Stream<IConversationChat> get chatStream => _chatSubject.stream;

  @override
  IConversationChatMessage? get lastChatMessage =>
      _lastMessageSubject.valueOrNull;

  @override
  Stream<IConversationChatMessage?> get lastChatMessageStream =>
      _lastMessageSubject.stream;

  final StreamController<IConversationChatMessage>
      onMessageLocallyHiddenStreamController = StreamController.broadcast();

  @override
  Stream<IConversationChatMessage> get onMessageLocallyHiddenStream =>
      onMessageLocallyHiddenStreamController.stream;

  final IMyAccountBloc myAccountBloc;
  final IUnifediApiConversationService pleromaConversationService;
  final IUnifediApiStatusService unifediApiStatusService;
  final IConversationChatRepository conversationRepository;
  final IStatusRepository statusRepository;
  final IAccountRepository accountRepository;

  @override
  List<IAccount> get accountsWithoutMe => accounts;

  @override
  Stream<List<IAccount>> get accountsWithoutMeStream => accountsStream;

  void listenForAccounts(IConversationChat conversation) {
    accountRepository
        .watchFindAllInAppType(
      filters: AccountRepositoryFilters.createForOnlyInConversation(
        conversation: conversation,
      ),
      pagination: null,
      orderingTerms: null,
    )
        .listen(
      (accounts) {
        var accountsWithoutMe = IAccount.excludeAccountFromList(
          accounts,
          (account) => !myAccountBloc.checkAccountIsMe(account),
        );
        accountsWithoutMe.sort(
          (a, b) => a.remoteId.compareTo(b.remoteId),
        );
        _accountsSubject.add(accountsWithoutMe);
      },
    ).disposeWith(this);
  }

  ConversationChatBloc({
    required this.pleromaConversationService,
    required this.myAccountBloc,
    required this.conversationRepository,
    required this.unifediApiStatusService,
    required this.statusRepository,
    required this.accountRepository,
    required IConversationChat conversation,
    required IConversationChatMessage? lastChatMessage,
    bool needRefreshFromNetworkOnInit = false,
    bool isNeedWatchLocalRepositoryForUpdates =
        true, // todo: remove hack. Dont init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
  })  : _accountsSubject = BehaviorSubject.seeded([]),
        _chatSubject = BehaviorSubject.seeded(conversation),
        _lastMessageSubject = BehaviorSubject.seeded(lastChatMessage),
        super(
          needRefreshFromNetworkOnInit: needRefreshFromNetworkOnInit,
          isNeedWatchLocalRepositoryForUpdates:
              isNeedWatchLocalRepositoryForUpdates,
          delayInit: delayInit,
        ) {
    _logger.finest(() => 'conversation chat bloc');

    _chatSubject.disposeWith(this);
    _lastMessageSubject.disposeWith(this);
    _lastPublishedMessageSubject.disposeWith(this);
    _accountsSubject.disposeWith(this);
    onMessageLocallyHiddenStreamController.disposeWith(this);

    listenForAccounts(conversation);
  }

  @override
  void watchLocalRepositoryForUpdates() {
    conversationRepository.watchByRemoteIdInAppType(chat.remoteId).listen(
      (updatedChat) {
        if (updatedChat != null) {
          _chatSubject.add(updatedChat);
        }
      },
    ).disposeWith(this);

    statusRepository
        .watchConversationLastStatus(
      conversation: chat,
    )
        .listen(
      (lastStatus) {
        if (lastStatus != null) {
          var conversationChatMessageStatusAdapter =
              ConversationChatMessageStatusAdapter(
            status: lastStatus,
          );
          _lastMessageSubject.add(
            conversationChatMessageStatusAdapter,
          );

          if (conversationChatMessageStatusAdapter
              .isPendingStatePublishedOrNull) {
            _lastPublishedMessageSubject.add(
              conversationChatMessageStatusAdapter,
            );
          }
        }
      },
    ).disposeWith(this);
  }

  @override
  Future internalAsyncInit() async {
    var conversationLastStatus =
        await statusRepository.getConversationLastStatus(
      conversation: chat,
    );

    if (conversationLastStatus != null) {
      var conversationChatMessageStatusAdapter =
          conversationLastStatus.toConversationChatMessageStatusAdapter();
      if (!_lastMessageSubject.isClosed) {
        _lastMessageSubject.add(
          conversationChatMessageStatusAdapter,
        );
      }

      var pendingStatePublishedOrNull =
          conversationChatMessageStatusAdapter.isPendingStatePublishedOrNull;
      if (pendingStatePublishedOrNull) {
        _lastPublishedMessageSubject.add(
          conversationChatMessageStatusAdapter,
        );
      } else {
        var conversationLastPublishedStatus =
            await statusRepository.getConversationLastStatus(
          conversation: chat,
          onlyPendingStatePublishedOrNull: true,
        );
        if (!_lastPublishedMessageSubject.isClosed &&
            conversationLastPublishedStatus != null) {
          _lastPublishedMessageSubject.add(
            conversationLastPublishedStatus
                .toConversationChatMessageStatusAdapter(),
          );
        }
      }
    }
  }

  @override
  Future refreshFromNetwork() async {
    var remoteConversation = await pleromaConversationService.getConversation(
      conversationId: chat.remoteId,
    );

    await accountRepository.batch((batch) {
      if (remoteConversation.accounts.isNotEmpty) {
        for (var account in remoteConversation.accounts) {
          accountRepository.upsertConversationRemoteAccount(
            account,
            conversationRemoteId: remoteConversation.id,
            batchTransaction: batch,
          );
        }
      }
      var lastStatus = remoteConversation.lastStatus;
      if (lastStatus != null) {
        statusRepository.upsertRemoteStatusForConversation(
          lastStatus,
          conversationRemoteId: remoteConversation.id,
          batchTransaction: batch,
        );
      }

      _updateByRemoteChat(
        remoteConversation,
        batchTransaction: batch,
      );
    });
  }

  Future _updateByRemoteChat(
    IUnifediApiConversation remoteChat, {
    required Batch batchTransaction,
  }) =>
      conversationRepository.updateAppTypeByRemoteType(
        appItem: chat,
        remoteItem: remoteChat,
        batchTransaction: batchTransaction,
      );

  static ConversationChatBloc createFromContext(
    BuildContext context, {
    required IConversationChat chat,
    required IConversationChatMessage? lastChatMessage,
    bool needRefreshFromNetworkOnInit = false,
  }) {
    return ConversationChatBloc(
      pleromaConversationService:
          Provider.of<IUnifediApiConversationService>(context, listen: false),
      myAccountBloc: IMyAccountBloc.of(context, listen: false),
      conversation: chat,
      lastChatMessage: lastChatMessage,
      needRefreshFromNetworkOnInit: needRefreshFromNetworkOnInit,
      conversationRepository:
          IConversationChatRepository.of(context, listen: false),
      statusRepository: IStatusRepository.of(context, listen: false),
      accountRepository: IAccountRepository.of(context, listen: false),
      unifediApiStatusService: Provider.of<IUnifediApiStatusService>(
        context,
        listen: false,
      ),
    );
  }

  @override
  Future markAsRead() async {
    if (chat.unread > 0) {
      if (pleromaConversationService.isApiReadyToUse) {
        var lastReadChatMessageId = lastChatMessage?.remoteId;
        if (lastReadChatMessageId == null) {
          var lastStatus = await statusRepository.getConversationLastStatus(
            conversation: chat,
          );
          lastReadChatMessageId = lastStatus?.remoteId;
        }
        var updatedRemoteChat =
            await pleromaConversationService.markConversationAsRead(
          conversationId: chat.remoteId,
        );

        await conversationRepository.upsertInRemoteType(
          updatedRemoteChat,
        );
      } else {
        // TODO: mark as read once app receive network connection
        await conversationRepository.markAsRead(
          conversation: chat,
          batchTransaction: null,
        );
      }
    }
  }

  @override
  bool get isCountInUnreadSupported => false;

  @override
  Future deleteMessages(List<IChatMessage> chatMessages) async {
    // create queue instead of parallel requests to avoid throttle limit on server
    for (var chatMessage in chatMessages) {
      if (chatMessage.isPendingStatePublishedOrNull) {
        await unifediApiStatusService.deleteStatus(
          statusId: chatMessage.remoteId,
        );
      }
    }

    for (var chatMessage in chatMessages) {
      // todo: rework in one request
      await statusRepository.markStatusAsDeleted(
        statusRemoteId: chatMessage.remoteId,
      );
    }
  }

  @override
  Future performActualDelete() async {
    var remoteId = conversation.remoteId;
    await pleromaConversationService.deleteConversation(
      conversationId: remoteId,
    );

    await conversationRepository.deleteByRemoteId(
      remoteId,
      batchTransaction: null,
    );
  }

  @override
  // todo: refactor
  // ignore: long-method
  Future postMessage({
    required IPostStatusData postStatusData,
    required IConversationChatMessage? oldPendingFailedConversationChatMessage,
  }) async {
    DbStatus dbStatus;
    int? localStatusId;

    UnifediApiPostStatus postStatus;
    String? idempotencyKey;
    var oldMessageExist = oldPendingFailedConversationChatMessage != null;
    if (oldMessageExist) {
      localStatusId = oldPendingFailedConversationChatMessage!.status.localId!;
      dbStatus = oldPendingFailedConversationChatMessage.status
          .toDbStatus()
          .copyWith(id: localStatusId);

      idempotencyKey = dbStatus.wasSentWithIdempotencyKey;
      postStatus = postStatusData.topostStatus();

      await statusRepository.updateByDbIdInDbType(
        dbId: localStatusId,
        dbItem: dbStatus.copyWith(
          pendingState: PendingState.pending,
        ),
        batchTransaction: null,
      );
    } else {
      var createdAt = DateTime.now();
      var fakeUniqueRemoteRemoteId = FakeIdHelper.generateUniqueId();
      var account = myAccountBloc.account;
      var postStatusDataStatusStatusAdapter = PostStatusDataStatusStatusAdapter(
        account: account.toDbAccountWrapper(),
        postStatusData: postStatusData.toPostStatusData(),
        localId: null,
        createdAt: createdAt,
        pendingState: PendingState.pending,
        oldPendingRemoteId: fakeUniqueRemoteRemoteId,
        // ignore: no-equal-arguments
        wasSentWithIdempotencyKey: fakeUniqueRemoteRemoteId,
      );

      dbStatus = postStatusDataStatusStatusAdapter.toDbStatus(
        fakeUniqueRemoteRemoteId: fakeUniqueRemoteRemoteId,
      );

      localStatusId = await statusRepository.upsertInDbType(
        dbStatus,
      );

      await statusRepository.addStatusToConversation(
        statusRemoteId: fakeUniqueRemoteRemoteId,
        conversationRemoteId: chat.remoteId,
        batchTransaction: null,
      );

      idempotencyKey = fakeUniqueRemoteRemoteId;
      postStatus = postStatusData.topostStatus();
    }

    try {
      var unifediApiStatus = await unifediApiStatusService.postStatus(
        idempotencyKey:idempotencyKey,
        postStatus: postStatus,
      );

      onMessageLocallyHiddenStreamController.add(
        unifediApiStatus.toConversationChatMessageStatusAdapter().copyWith(
              remoteId: dbStatus.remoteId,
            ),
      );

      await statusRepository.updateByDbIdInDbType(
        dbId: localStatusId,
        dbItem: dbStatus.copyWith(
          hiddenLocallyOnDevice: true,
          pendingState: PendingState.published,
        ),
        batchTransaction: null,
      );

      await statusRepository.upsertRemoteStatusForConversation(
        unifediApiStatus,
        conversationRemoteId: chat.remoteId,
        batchTransaction: null,
      );
    } catch (e, stackTrace) {
      _logger.warning(() => 'postMessage error', e, stackTrace);
      await statusRepository.updateByDbIdInDbType(
        dbId: localStatusId,
        dbItem: dbStatus.copyWith(
          pendingState: PendingState.fail,
        ),
        batchTransaction: null,
      );
      rethrow;
    }
  }

  @override
  Future deleteMessage({
    required IConversationChatMessage conversationChatMessage,
  }) async {
    if (conversationChatMessage.isPendingStatePublishedOrNull) {
      await unifediApiStatusService.deleteStatus(
        statusId: conversationChatMessage.status.remoteId!,
      );

      await statusRepository.markStatusAsDeleted(
        statusRemoteId: conversationChatMessage.status.remoteId!,
      );
    } else {
      await statusRepository.markStatusAsHiddenLocallyOnDevice(
        localId: conversationChatMessage.status.localId!,
      );

      onMessageLocallyHiddenStreamController.add(conversationChatMessage);
    }
  }

  @override
  IConversationChatMessage? get lastPublishedChatMessage =>
      _lastPublishedMessageSubject.valueOrNull;

  @override
  bool get isDeletePossible => true;
}
