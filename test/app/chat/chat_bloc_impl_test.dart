import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';

import '../../rxdart/rxdart_test_helper.dart';
import '../account/account_test_helper.dart';
import '../account/my/my_account_test_helper.dart';
import 'chat_bloc_impl_test.mocks.dart';
import 'chat_test_helper.dart';
import 'message/chat_message_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
@GenerateMocks([
  IPleromaApiChatService,
  IPleromaApiMyAccountService,
])
void main() {
  late IPleromaChat chat;
  late IPleromaChatBloc chatBloc;
  late MockIPleromaApiChatService pleromaChatServiceMock;
  late MockIPleromaApiMyAccountService pleromaMyAccountServiceMock;
  late AppDatabase database;
  late IAccountRepository accountRepository;
  late IPleromaChatMessageRepository chatMessageRepository;
  late IPleromaChatRepository chatRepository;
  late IMyAccountBloc myAccountBloc;
  late IMyAccount myAccount;

  late AuthInstance authInstance;
  late ILocalPreferencesService preferencesService;
  late IMyAccountLocalPreferenceBloc myAccountLocalPreferenceBloc;

  setUp(() async {
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

    pleromaChatServiceMock = MockIPleromaApiChatService();
    pleromaMyAccountServiceMock = MockIPleromaApiMyAccountService();

    preferencesService = MemoryLocalPreferencesService();

    myAccount =
        await MyAccountTestHelper.createTestMyAccount(seed: 'myAccount');
    authInstance = AuthInstance(
      urlHost: 'fedi.app',
      acct: myAccount.acct,
      urlSchema: 'https',
      token: null,
      authCode: null,
      isPleroma: false,
      application: null,
      info: null,
    );

    myAccountLocalPreferenceBloc = MyAccountLocalPreferenceBloc(
      preferencesService,
      userAtHost: authInstance.userAtHost,
    );

    await myAccountLocalPreferenceBloc.setValue(
      myAccount.toPleromaApiMyAccountWrapper(),
    );

    myAccountBloc = MyAccountBloc(
      pleromaMyAccountService: pleromaMyAccountServiceMock,
      accountRepository: accountRepository,
      myAccountLocalPreferenceBloc: myAccountLocalPreferenceBloc,
      instance: authInstance,
    );

    when(pleromaChatServiceMock.isConnected).thenReturn(true);
    when(pleromaChatServiceMock.pleromaApiState).thenReturn(
      PleromaApiState.validAuth,
    );

    chat = await ChatTestHelper.createTestChat(seed: 'seed1');

    chatBloc = PleromaChatBloc(
      chat: chat,
      pleromaChatService: pleromaChatServiceMock,
      accountRepository: accountRepository,
      chatMessageRepository: chatMessageRepository,
      chatRepository: chatRepository,
      delayInit: false,
      myAccountBloc: myAccountBloc,
      lastChatMessage: null,
    );
  });

  tearDown(() async {
    await chatBloc.dispose();
    await chatRepository.dispose();
    await chatMessageRepository.dispose();
    await accountRepository.dispose();
    await database.close();
    await myAccountLocalPreferenceBloc.dispose();
    await preferencesService.dispose();
  });

  Future _update(
    IPleromaChat chat, {
    IPleromaChatMessage? lastChatMessage,
    required List<IAccount> accounts,
  }) async {
    await accountRepository.upsertChatRemoteAccounts(
      accounts
          .map(
            (account) => account.toPleromaApiAccount(),
          )
          .toList(),
      chatRemoteId: chat.remoteId,
      batchTransaction: null,
    );
    await chatRepository.upsertInRemoteType(chat.toPleromaApiChat(
      lastChatMessage: lastChatMessage,
      accounts: accounts,
    ));

    await RxDartTestHelper.waitToExecuteRxCallbacks();
  }

  test('chat', () async {
    ChatTestHelper.expectChat(chatBloc.chat, chat);

    var newValue = await ChatTestHelper.createTestChat(
      seed: 'seed2',
      remoteId: chat.remoteId,
    );

    var listened;

    var subscription = chatBloc.chatStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartTestHelper.waitForData(() => listened);

    ChatTestHelper.expectChat(listened, chat);

    var account1 = await AccountTestHelper.createTestAccount(seed: 'account1');

    await _update(newValue, accounts: [account1]);

    ChatTestHelper.expectChat(chatBloc.chat, newValue);
    ChatTestHelper.expectChat(listened, newValue);
    await subscription.cancel();
  });

  test('updatedAt', () async {
    expect(chatBloc.updatedAt, chat.updatedAt);

    var newValue = DateTime(1990);

    var listened;

    var subscription = chatBloc.updatedAtStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartTestHelper.waitForData(() => listened);

    expect(listened, chat.updatedAt);

    await _update(chat.copyWith(updatedAt: newValue), accounts: chat.accounts);

    expect(chatBloc.updatedAt, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });

  test('lastChatMessage', () async {
    var account1 = await AccountTestHelper.createTestAccount(
      seed: 'chatMessage1',
    );
    var account2 = await AccountTestHelper.createTestAccount(
      seed: 'chatMessage1',
    );

    var chatMessage1 = await ChatMessageTestHelper.createTestChatMessage(
      seed: 'chatMessage1',
      chatRemoteId: chat.remoteId,
      createdAt: DateTime(2001),
      account: account1,
    );
    var chatMessage2 = await ChatMessageTestHelper.createTestChatMessage(
      seed: 'chatMessage2',
      chatRemoteId: chat.remoteId,
      createdAt: DateTime(2002),
      account: account2,
    );

    var newValue = await ChatTestHelper.createTestChat(
      seed: 'seed2',
      remoteId: chat.remoteId,
      account: account2,
    );

    var listened;

    var subscription = chatBloc.lastChatMessageStream.listen((newValue) {
      listened = newValue;
    });

    await _update(
      newValue,
      accounts: [chatMessage1.account!],
      lastChatMessage: chatMessage1,
    );

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    ChatMessageTestHelper.expectChatMessage(
      chatBloc.lastChatMessage,
      chatMessage1,
    );
    ChatMessageTestHelper.expectChatMessage(listened, chatMessage1);

    await chatMessageRepository.upsertInRemoteType(
      chatMessage2.toPleromaApiChatMessage(),
    );

    await _update(
      newValue,
      accounts: [chatMessage2.account!],
      lastChatMessage: chatMessage1,
    );

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    ChatMessageTestHelper.expectChatMessage(
      chatBloc.lastChatMessage,
      chatMessage2,
    );
    ChatMessageTestHelper.expectChatMessage(listened, chatMessage2);

    await subscription.cancel();
  });

// todo: rework after backend chats with several accounts rework
  test('accounts', () async {
    var account1 = await AccountTestHelper.createTestAccount(seed: 'account1');
    var account2 = await AccountTestHelper.createTestAccount(seed: 'account2');

    var newValue = await ChatTestHelper.createTestChat(
      seed: 'seed2',
      remoteId: chat.remoteId,
    );

    late var listened;

    var subscription = chatBloc.accountsStream.listen((newValue) {
      listened = newValue;
    });

    await _update(newValue, accounts: [account1]);

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    AccountTestHelper.expectAccount(chatBloc.accounts[0], account1);
    AccountTestHelper.expectAccount(listened[0], account1);

    await _update(newValue, accounts: [
      account2, //      account3
    ]);

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    AccountTestHelper.expectAccount(chatBloc.accounts[0], account2);
//    AccountTestHelper.expectAccount(chatBloc.accounts[2], account3);
    AccountTestHelper.expectAccount(listened[0], account2);
//    AccountTestHelper.expectAccount(listened[2], account3);

    await subscription.cancel();
  });

//
//  test('accounts', () async {
//    var account1 = await AccountTestHelper.createTestAccount(seed: 'account1');
//    var account2 = await AccountTestHelper.createTestAccount(seed: 'account2');
////    var account3 = await AccountTestHelper.createTestAccount(seed: 'account3');
//
//    var newValue = await ChatTestHelper.createTestChat(seed: 'seed2', remoteId: chat.remoteId);
//
//    var listened;
//
//    var subscription = chatBloc.accountsStream.listen((newValue) {
//      listened = newValue;
//    });
//
//    await _update(newValue, accounts: [account1]);
//
//
//     listened = null;
//     await RxDartTestHelper.waitForData(() => listened);

//
//    AccountTestHelper.expectAccount(chatBloc.accounts[0], account1);
//    AccountTestHelper.expectAccount(listened[0], account1);
//
//    await _update(newValue, accounts: [
//      account2, //      account3
//    ]);
//
//
//
//     listened = null;
//     await RxDartTestHelper.waitForData(() => listened);

//
//    AccountTestHelper.expectAccount(chatBloc.accounts[0], account1);
//    AccountTestHelper.expectAccount(chatBloc.accounts[1], account2);
////    AccountTestHelper.expectAccount(chatBloc.accounts[2], account3);
//    AccountTestHelper.expectAccount(listened[0], account1);
//    AccountTestHelper.expectAccount(listened[1], account2);
////    AccountTestHelper.expectAccount(listened[2], account3);
//
//    await subscription.cancel();
//  });

//  test('refreshFromNetwork', () async {
//    ChatTestHelper.expectChat(chatBloc.chat, chat);
//
//    var newValue = await ChatTestHelper.createTestChat(
//        seed: 'seed2', remoteId: chat.remoteId);
//
//    var listened;
//
//    var subscription = chatBloc.chatStream.listen((newValue) {
//      listened = newValue;
//    });
//
//
//     listened = null;
//     await RxDartTestHelper.waitForData(() => listened);

//    ChatTestHelper.expectChat(listened, chat);
//
//    when(pleromaChatServiceMock.getChat(
//            chatRemoteId: chat.remoteId))
//        .thenAnswer((_) async => mapLocalChatToRemoteChat(
//            newValue,
//            accounts: [],
//            lastChatMessage: null));
//
//    await chatBloc.refreshFromNetwork();
//
//
//     listened = null;
//     await RxDartTestHelper.waitForData(() => listened);

//
//    ChatTestHelper.expectChat(chatBloc.chat, newValue);
//    ChatTestHelper.expectChat(listened, newValue);
//    await subscription.cancel();
//  });
}
