import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../../../pleroma/account/pleroma_account_service_mock.dart';
import '../../../pleroma/chat/pleroma_chat_service_mock.dart';
import 'chat_message_model_helper.dart';

void main() {
  IChatMessage chatMessage;
  IChatMessageBloc chatMessageBloc;
  PleromaChatServiceMock pleromaChatServiceMock;
  PleromaAccountServiceMock pleromaAccountServiceMock;
  AppDatabase database;
  IAccountRepository accountRepository;
  IChatMessageRepository chatMessageRepository;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
    chatMessageRepository = ChatMessageRepository(
        appDatabase: database, accountRepository: accountRepository);

    pleromaChatServiceMock = PleromaChatServiceMock();
    pleromaAccountServiceMock = PleromaAccountServiceMock();

    when(pleromaChatServiceMock.isApiReadyToUse).thenReturn(true);
    when(pleromaAccountServiceMock.isApiReadyToUse).thenReturn(true);

    chatMessage = await createTestChatMessage(seed: "seed1");
    await accountRepository.upsertRemoteAccount(
        mapLocalAccountToRemoteAccount(chatMessage.account),
        conversationRemoteId: null,
        chatRemoteId: chatMessage.chatRemoteId);

    chatMessageBloc = ChatMessageBloc(
      chatMessage: chatMessage,
      pleromaChatService: pleromaChatServiceMock,
      chatMessageRepository: chatMessageRepository,
      delayInit: false,
      isNeedWatchLocalRepositoryForUpdates: true,
      accountRepository: accountRepository,
      pleromaAccountService: pleromaAccountServiceMock,
    );
  });

  tearDown(() async {
    await chatMessageBloc.dispose();
    await chatMessageRepository.dispose();
    await accountRepository.dispose();
    await database.close();
  });

  Future _update(IChatMessage chatMessage) async {
    await chatMessageRepository.upsertRemoteChatMessage(
        mapLocalChatMessageToRemoteChatMessage(chatMessage));
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
  }

  test('chatMessage', () async {
    expectChatMessage(chatMessageBloc.chatMessage, chatMessage);

    var newValue = await createTestChatMessage(
        seed: "seed2", remoteId: chatMessage.remoteId);
    await accountRepository.upsertRemoteAccount(
        mapLocalAccountToRemoteAccount(newValue.account),
        conversationRemoteId: null,
        chatRemoteId: newValue.chatRemoteId);

    var listenedValue;

    var subscription = chatMessageBloc.chatMessageStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expectChatMessage(listenedValue, chatMessage);

    await _update(newValue);

    expectChatMessage(chatMessageBloc.chatMessage, newValue);
    expectChatMessage(listenedValue, newValue);
    await await subscription.cancel();
  });

  test('content', () async {
    expect(chatMessageBloc.content, chatMessage.content);

    var newValue = "newContent";

    var listenedValue;

    var subscription = chatMessageBloc.contentStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, chatMessage.content);

    await _update(chatMessage.copyWith(content: newValue));

    expect(chatMessageBloc.content, newValue);
    expect(listenedValue, newValue);
    await await subscription.cancel();
  });

  test('contentHtmlWithEmojis', () async {
    var newValue = "newContent :emoji: :emoji1: :emoji2:";

    var listenedValue;

    var subscription =
        chatMessageBloc.contentWithEmojisStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    // same if emojis is empty or null
    await _update(chatMessage.copyWith(content: newValue, emojis: <PleromaEmoji>[]));

    expect(chatMessageBloc.contentWithEmojis, "<html><body><p>$newValue</p></body></html>");
    expect(listenedValue, "<html><body><p>$newValue</p></body></html>");

    // same if emojis is empty or null
    await _update(chatMessage.copyWith(content: newValue, emojis: [
      PleromaEmoji(shortcode: "emoji1", url: "https://fedi.app/emoji1.png"),
      PleromaEmoji(shortcode: "emoji2", url: "https://fedi.app/emoji2.png")
    ]));

    expect(
        chatMessageBloc.contentWithEmojis,
        "<html><body><p>newContent :emoji: "
        "<img src=\"https://fedi.app/emoji1.png\" width=\"20\"> "
        "<img src=\"https://fedi.app/emoji2.png\" width=\"20\">"
        "</p></body></html>");
    expect(
        listenedValue,
        "<html><body><p>newContent :emoji: "
        "<img src=\"https://fedi.app/emoji1.png\" width=\"20\"> "
        "<img src=\"https://fedi.app/emoji2.png\" width=\"20\">"
        "</p></body></html>");

    await await subscription.cancel();
  });

  test('createdAt', () async {
    expect(chatMessageBloc.createdAt, chatMessage.createdAt);

    var newValue = DateTime(1990);

    var listenedValue;

    var subscription = chatMessageBloc.createdAtStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, chatMessage.createdAt);

    await _update(chatMessage.copyWith(createdAt: newValue));

    expect(chatMessageBloc.createdAt, newValue);
    expect(listenedValue, newValue);
    await subscription.cancel();
  });

//  test('refreshFromNetwork', () async {
//    expectChatMessage(chatMessageBloc.chatMessage, chatMessage);
//
//    var id = await chatMessageRepository.upsertRemoteChatMessage(
//        mapLocalChatMessageToRemoteChatMessage(chatMessage),
//        listRemoteId: null,
//        conversationRemoteId: null);
//    chatMessage = chatMessage.copyWith(id: id);
//
//    var newValue = await createTestChatMessage(
//        seed: "seed2", remoteId: chatMessage.remoteId);
//
//    var listenedValue;
//
//    var subscription = chatMessageBloc.chatMessageStream.listen((newValue) {
//      listenedValue = newValue;
//    });
//    // hack to execute notify callbacks
//    await Future.delayed(Duration(milliseconds: 1));
//    expectChatMessage(listenedValue, chatMessage);
//
//    when(pleromaChatServiceMock.getChatMessage(
//            chatMessageRemoteId: chatMessage.remoteId))
//        .thenAnswer(
//            (_) async => mapLocalChatMessageToRemoteChatMessage(newValue));
//
//    await chatMessageBloc.refreshFromNetwork();
//    // hack to execute notify callbacks
//    await Future.delayed(Duration(milliseconds: 1));
//
//    expectChatMessage(listenedValue, newValue);
//    await subscription.cancel();
//  });
}
