import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/message/repository/chat_message_repository.dart';
import 'package:fedi/app/chat/repository/chat_repository.dart';
import 'package:fedi/app/chat/repository/chat_repository_model.dart';
import 'package:fedi/app/chat/share/chat_share_bloc.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc_impl.dart';
import 'package:fedi/app/share/select/share_select_account_bloc.dart';
import 'package:fedi/app/share/select/share_select_account_bloc_impl.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';

abstract class ChatShareBloc extends DisposableOwner implements IChatShareBloc {
  final IChatRepository chatRepository;
  final IChatMessageRepository chatMessageRepository;
  final IPleromaChatService pleromaChatService;

  String get message {
    var message = shareMessageInputBloc.messageField.currentValue;

    if (message?.isNotEmpty != true) {
      message = null;
    }

    return message;
  }

  @override
  IShareMessageInputBloc shareMessageInputBloc = ShareMessageInputBloc();
  @override
  IShareSelectAccountBloc shareSelectAccountBloc = ShareSelectAccountBloc();

  ChatShareBloc({
    @required this.chatRepository,
    @required this.chatMessageRepository,
    @required this.pleromaChatService,
  }) {
    addDisposable(disposable: shareMessageInputBloc);
    addDisposable(disposable: shareSelectAccountBloc);
  }

  @override
  Future share() async {
    var messageSendData = createSendData();

    var targetAccounts = shareSelectAccountBloc.targetAccounts;
    List<IPleromaChat> pleromaChatsByAccounts;
    if (targetAccounts?.isNotEmpty == true) {
      var chatsByAccountsFuture = targetAccounts.map((account) =>
          pleromaChatService.getOrCreateChatByAccountId(
              accountId: account.remoteId));

      pleromaChatsByAccounts = await Future.wait(chatsByAccountsFuture);
      await chatRepository.upsertRemoteChats(pleromaChatsByAccounts);
    } else {
      pleromaChatsByAccounts = [];
    }

    var allChatsId =
        pleromaChatsByAccounts.map((pleromaChat) => pleromaChat.id).toList();

    var pleromaChatMessagesFuture = allChatsId.map((chatId) {
      return pleromaChatService.sendMessage(
          chatId: chatId, data: messageSendData);
    });

    var pleromaChatMessages = await Future.wait(pleromaChatMessagesFuture);

    await chatMessageRepository.upsertRemoteChatMessages(pleromaChatMessages);
  }

  PleromaChatMessageSendData createSendData();

  @override
  Future<List<IAccount>> customDefaultLocalAccountListLoader({
    @required int limit,
    @required IAccount newerThan,
    @required IAccount olderThan,
  }) async {
    if (newerThan != null || olderThan != null) {
      return [];
    }
    var chats = await chatRepository.getChats(
      olderThan: null,
      newerThan: null,
      limit: limit,
      offset: null,
      orderingTermData: ChatOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderByType: ChatOrderByType.updatedAt),
    );

    return chats.map((chat) => chat.accounts.first).toList();
  }

  @override
  Future<List<IPleromaAccount>> customDefaultRemoteAccountListLoader({
    @required int limit,
    @required IAccount newerThan,
    @required IAccount olderThan,
  }) async {
    if (newerThan != null || olderThan != null) {
      return [];
    }
    var pleromaChats = await pleromaChatService.getChats(
      limit: limit,
    );

    await chatRepository.upsertRemoteChats(pleromaChats);

    return pleromaChats.map((pleromaChat) => pleromaChat.account).toList();
  }
}
