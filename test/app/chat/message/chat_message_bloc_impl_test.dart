import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';

import '../../../pleroma/account/my/my_account_bloc_mock.dart';
import '../../../pleroma/account/pleroma_account_service_mock.dart';
import '../../../pleroma/chat/pleroma_chat_service_mock.dart';
import '../chat_model_helper.dart';
import 'chat_message_model_helper.dart';

void main() {
  late IPleromaChat chat;
  late IPleromaChatMessage chatMessage;
  late IPleromaChatMessageBloc chatMessageBloc;
  late PleromaChatServiceMock pleromaChatServiceMock;
  late PleromaAuthAccountServiceMock pleromaAccountServiceMock;
  late AppDatabase database;
  late IAccountRepository accountRepository;
  late IPleromaChatRepository chatRepository;
  late IPleromaChatMessageRepository chatMessageRepository;
  late IMyAccountBloc myAccountBloc;

  setUp(
    () async {
      database = AppDatabase(VmDatabase.memory());
      accountRepository = AccountRepository(appDatabase: database);

      chatMessageRepository = PleromaChatMessageRepository(
        appDatabase: database,
        accountRepository: accountRepository,
      );
      chatRepository = PleromaChatRepository(
        appDatabase: database,
        accountRepository: accountRepository,
        chatMessageRepository: chatMessageRepository,
      );

      myAccountBloc = MyAccountBlocMock();
      pleromaChatServiceMock = PleromaChatServiceMock();
      pleromaAccountServiceMock = PleromaAuthAccountServiceMock();

      when(pleromaChatServiceMock.isApiReadyToUse).thenReturn(true);
      when(pleromaAccountServiceMock.isApiReadyToUse).thenReturn(true);

      chat = await createTestChat(seed: "seed1");
      chatMessage = await createTestChatMessage(
        seed: "seed1",
        chatRemoteId: chat.remoteId,
      );

      await accountRepository.upsertRemoteAccount(
        chatMessage.account.toPleromaAccount(),
        conversationRemoteId: null,
        chatRemoteId: chatMessage.chatRemoteId,
      );

      chatMessageBloc = PleromaChatMessageBloc(
        chatMessage: chatMessage,
        pleromaChatService: pleromaChatServiceMock,
        chatMessageRepository: chatMessageRepository,
        delayInit: false,
        isNeedWatchLocalRepositoryForUpdates: true,
        accountRepository: accountRepository,
        pleromaAccountService: pleromaAccountServiceMock,
        pleromaChatBloc: PleromaChatBloc(
          pleromaChatService: pleromaChatServiceMock,
          myAccountBloc: myAccountBloc,
          chatRepository: chatRepository,
          chatMessageRepository: chatMessageRepository,
          accountRepository: accountRepository,
          chat: chat,
          lastChatMessage: null,
        ),
      );
    },
  );

  tearDown(() async {
    await chatMessageBloc.dispose();
    await chatMessageRepository.dispose();
    await accountRepository.dispose();
    await database.close();
  });

  Future _update(IPleromaChatMessage chatMessage) async {
    await chatMessageRepository.upsertRemoteChatMessage(
      chatMessage.toPleromaChatMessage(),
    );
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
  }

  test('chatMessage', () async {
    expectChatMessage(chatMessageBloc.chatMessage, chatMessage);

    var newValue = await createTestChatMessage(
      seed: "seed2",
      remoteId: chatMessage.remoteId,
    );
    await accountRepository.upsertRemoteAccount(
      newValue.account.toPleromaAccount(),
      conversationRemoteId: null,
      chatRemoteId: newValue.chatRemoteId,
    );

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
    await subscription.cancel();
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
    await subscription.cancel();
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
    await _update(
      chatMessage.copyWith(content: newValue, emojis: <PleromaEmoji>[]),
    );

    expect(
      chatMessageBloc.contentWithEmojis,
      EmojiText(
        text: newValue,
        emojis: null,
      ),
    );
    expect(
      listenedValue,
      EmojiText(
        text: newValue,
        emojis: null,
      ),
    );

    // same if emojis is empty or null
    await _update(
      chatMessage.copyWith(
        content: newValue,
        emojis: [
          PleromaEmoji(
            shortcode: "emoji1",
            url: "https://fedi.app/emoji1.png",
            category: null,
            staticUrl: null,
            visibleInPicker: null,
          ),
          PleromaEmoji(
            shortcode: "emoji2",
            url: "https://fedi.app/emoji2.png",
            category: null,
            staticUrl: null,
            visibleInPicker: null,
          ),
        ],
      ),
    );

    expect(
      chatMessageBloc.contentWithEmojis,
      EmojiText(
        text: "newContent :emoji: :emoji1: :emoji2:",
        emojis: [
          PleromaEmoji(
            shortcode: "emoji1",
            url: "https://fedi.app/emoji1.png",
            staticUrl: null,
            visibleInPicker: null,
            category: null,
          ),
          PleromaEmoji(
            shortcode: "emoji2",
            url: "https://fedi.app/emoji2.png",
            staticUrl: null,
            visibleInPicker: null,
            category: null,
          ),
        ],
      ),
    );
    expect(
      listenedValue,
      EmojiText(
        text: "newContent :emoji: :emoji1: :emoji2:",
        emojis: [
          PleromaEmoji(
            shortcode: "emoji1",
            url: "https://fedi.app/emoji1.png",
            staticUrl: null,
            visibleInPicker: null,
            category: null,
          ),
          PleromaEmoji(
            shortcode: "emoji2",
            url: "https://fedi.app/emoji2.png",
            staticUrl: null,
            visibleInPicker: null,
            category: null,
          ),
        ],
      ),
    );

    await subscription.cancel();
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
