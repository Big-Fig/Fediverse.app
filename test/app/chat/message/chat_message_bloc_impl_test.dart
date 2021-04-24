import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/my/my_account_bloc_impl.dart';
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
import 'package:fedi/pleroma/api/account/auth/pleroma_api_auth_account_service_impl.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_service_impl.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';

import '../chat_test_helper.dart';
import 'chat_message_bloc_impl_test.mocks.dart';
import 'chat_message_test_helper.dart';

// ignore_for_file: no-magic-number
@GenerateMocks([
  PleromaApiChatService,
  PleromaApiAuthAccountService,
  MyAccountBloc,
])
void main() {
  late IPleromaChat chat;
  late IPleromaChatMessage chatMessage;
  late IPleromaChatMessageBloc chatMessageBloc;
  late MockPleromaApiChatService pleromaChatServiceMock;
  late MockPleromaApiAuthAccountService pleromaAccountServiceMock;
  late AppDatabase database;
  late IAccountRepository accountRepository;
  late IPleromaChatRepository chatRepository;
  late IPleromaChatMessageRepository chatMessageRepository;
  late MockMyAccountBloc myAccountBloc;

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

      myAccountBloc = MockMyAccountBloc();
      pleromaChatServiceMock = MockPleromaApiChatService();
      pleromaAccountServiceMock = MockPleromaApiAuthAccountService();

      when(pleromaChatServiceMock.isConnected).thenReturn(true);
      when(pleromaChatServiceMock.pleromaApiState).thenReturn(
        PleromaApiState.validAuth,
      );
      when(pleromaAccountServiceMock.isConnected).thenReturn(true);
      when(pleromaAccountServiceMock.pleromaApiState).thenReturn(
        PleromaApiState.validAuth,
      );

      chat = await ChatTestHelper.createTestChat(seed: "seed1");
      chatMessage = await ChatMessageTestHelper.createTestChatMessage(
        seed: "seed1",
        chatRemoteId: chat.remoteId,
      );

      await accountRepository.upsertChatRemoteAccount(
        chatMessage.account!.toPleromaApiAccount(),
        chatRemoteId: chatMessage.chatRemoteId,
        batchTransaction: null,
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
          delayInit: false,
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
    await chatMessageRepository.upsertInRemoteType(
      chatMessage.toPleromaApiChatMessage(),
    );
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
  }

  test('chatMessage', () async {
    ChatMessageTestHelper.expectChatMessage(
        chatMessageBloc.chatMessage, chatMessage);

    var newValue = await ChatMessageTestHelper.createTestChatMessage(
      seed: "seed2",
      remoteId: chatMessage.remoteId,
    );
    await accountRepository.upsertChatRemoteAccount(
      newValue.account!.toPleromaApiAccount(),
      chatRemoteId: newValue.chatRemoteId,
      batchTransaction: null,
    );

    var listenedValue;

    var subscription = chatMessageBloc.chatMessageStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    ChatMessageTestHelper.expectChatMessage(listenedValue, chatMessage);

    await _update(newValue);

    ChatMessageTestHelper.expectChatMessage(
        chatMessageBloc.chatMessage, newValue);
    ChatMessageTestHelper.expectChatMessage(listenedValue, newValue);
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
      chatMessage.copyWith(content: newValue, emojis: <PleromaApiEmoji>[]),
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
          PleromaApiEmoji(
            shortcode: "emoji1",
            url: "https://fedi.app/emoji1.png",
            category: null,
            staticUrl: null,
            visibleInPicker: null,
          ),
          PleromaApiEmoji(
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
          PleromaApiEmoji(
            shortcode: "emoji1",
            url: "https://fedi.app/emoji1.png",
            staticUrl: null,
            visibleInPicker: null,
            category: null,
          ),
          PleromaApiEmoji(
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
          PleromaApiEmoji(
            shortcode: "emoji1",
            url: "https://fedi.app/emoji1.png",
            staticUrl: null,
            visibleInPicker: null,
            category: null,
          ),
          PleromaApiEmoji(
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
//    ChatMessageTestHelper.expectChatMessage(chatMessageBloc.chatMessage, chatMessage);
//
//    var id = await chatMessageRepository.upsertRemoteChatMessage(
//        mapLocalChatMessageToRemoteChatMessage(chatMessage),
//        listRemoteId: null,
//        conversationRemoteId: null);
//    chatMessage = chatMessage.copyWith(id: id);
//
//    var newValue = await ChatMessageTestHelper.createTestChatMessage(
//        seed: "seed2", remoteId: chatMessage.remoteId);
//
//    var listenedValue;
//
//    var subscription = chatMessageBloc.chatMessageStream.listen((newValue) {
//      listenedValue = newValue;
//    });
//    // hack to execute notify callbacks
//    await Future.delayed(Duration(milliseconds: 1));
//    ChatMessageTestHelper.expectChatMessage(listenedValue, chatMessage);
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
//    ChatMessageTestHelper.expectChatMessage(listenedValue, newValue);
//    await subscription.cancel();
//  });
}
