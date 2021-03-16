import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc_impl.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc_impl.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/repository/repository_model.dart';

abstract class PleromaChatShareBloc extends ShareToAccountBloc
    implements IPleromaChatShareBloc {
  final IPleromaChatRepository chatRepository;
  final IPleromaChatMessageRepository chatMessageRepository;
  final IPleromaChatService pleromaChatService;

  String? get message {
    String? message = shareMessageInputBloc.messageField.currentValue;

    if (message?.isNotEmpty != true) {
      message = null;
    }

    return message;
  }

  @override
  IShareMessageInputBloc shareMessageInputBloc = ShareMessageInputBloc();

  PleromaChatShareBloc({
    required this.chatRepository,
    required this.chatMessageRepository,
    required this.pleromaChatService,
    required IMyAccountBloc myAccountBloc,
    required IAccountRepository accountRepository,
    required IPleromaAccountService pleromaAccountService,
  }) : super(
          myAccountBloc: myAccountBloc,
          accountRepository: accountRepository,
          pleromaAccountService: pleromaAccountService,
        ) {
    addDisposable(disposable: shareMessageInputBloc);
  }

  @override
  Future<bool> actuallyShareToAccount(IAccount account) async {
    var messageSendData = createPleromaChatMessageSendData();

    var targetAccounts = [account];
    List<IPleromaChat> pleromaChatsByAccounts;
    if (targetAccounts?.isNotEmpty == true) {
      var chatsByAccountsFuture = targetAccounts.map(
        (account) => pleromaChatService.getOrCreateChatByAccountId(
          accountId: account.remoteId,
        ),
      );

      pleromaChatsByAccounts = await Future.wait(chatsByAccountsFuture);
      await chatRepository.upsertRemoteChats(pleromaChatsByAccounts);
    } else {
      pleromaChatsByAccounts = [];
    }

    var allChatsIds = pleromaChatsByAccounts
        .map(
          (pleromaChat) => pleromaChat.id,
        )
        .toList();

    var pleromaChatMessagesFuture = allChatsIds.map(
      (chatId) {
        return pleromaChatService.sendMessage(
          chatId: chatId,
          data: messageSendData,
        );
      },
    );

    var pleromaChatMessages = await Future.wait(pleromaChatMessagesFuture);

    await chatMessageRepository.upsertRemoteChatMessages(pleromaChatMessages);
    return true;
  }

  PleromaChatMessageSendData createPleromaChatMessageSendData();

  @override
  Future<List<IAccount>> customLocalAccountListLoader({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  }) async {
    if (newerThan != null || olderThan != null) {
      return [];
    }
    var chats = await chatRepository.getChats(
      filters: null,
      pagination: RepositoryPagination(
        limit: limit,
      ),
      orderingTermData: PleromaChatOrderingTermData.updatedAtDesc,
    );

    return chats.map((chat) => chat.accounts.first).toList();
  }

  @override
  Future<List<IPleromaAccount>> customRemoteAccountListLoader({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  }) async {
    if (newerThan != null || olderThan != null) {
      return [];
    }
    var pleromaChats = await pleromaChatService.getChats(
      pagination: PleromaPaginationRequest(
        limit: limit,
      ),
    );

    await chatRepository.upsertRemoteChats(pleromaChats);

    return pleromaChats
        .map(
          (pleromaChat) => pleromaChat.account,
        )
        .toList();
  }
}
