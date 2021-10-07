import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
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
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:moor/ffi.dart';
import 'package:unifedi_api/unifedi_api.dart';

import '../../rxdart/rxdart_test_helper.dart';
import '../account/account_test_helper.dart';
import '../account/my/my_account_test_helper.dart';
import 'chat_bloc_impl_test.mocks.dart';
import 'chat_test_helper.dart';
import 'message/chat_message_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
@GenerateMocks([
  IUnifediApiChatService,
  IUnifediApiMyAccountService,
  IConnectionService,
])
void main() {
  late IPleromaChat chat;
  late IPleromaChatBloc chatBloc;
  late MockIUnifediApiChatService pleromaApiChatServiceMock;
  late MockIUnifediApiMyAccountService unifediApiMyAccountServiceMock;
  late AppDatabase database;
  late IAccountRepository accountRepository;
  late IPleromaChatMessageRepository chatMessageRepository;
  late IPleromaChatRepository chatRepository;
  late IMyAccountBloc myAccountBloc;
  late IMyAccount myAccount;

  late UnifediApiAccess authInstance;
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

    pleromaApiChatServiceMock = MockIUnifediApiChatService();
    unifediApiMyAccountServiceMock = MockIUnifediApiMyAccountService();

    preferencesService = MemoryLocalPreferencesService();

    myAccount =
        await MyAccountMockHelper.createTestMyAccount(seed: 'myAccount');
    authInstance = UnifediApiAccess(
      url: 'https:/fedi.app',
      instance: null,
      applicationAccessToken: null,
      userAccessToken: UnifediApiAccessUserToken(
        user: 'user',
        scopes: UnifediApiAccessScopes(
          globalPermissions: [],
          targetPermissions: [],
        ),
        oauthToken: UnifediApiOAuthToken(
          accessToken: 'accessToken',
          tokenType: 'tokenType',
          id: 'id',
          me: 'me',
        ),
        myAccount: null,
      ),
    );

    myAccountLocalPreferenceBloc = MyAccountLocalPreferenceBloc(
      preferencesService,
      userAtHost: authInstance.userAtHost,
    );

    await myAccountLocalPreferenceBloc.setValue(
      myAccount.toUnifediApiMyAccountWrapper(),
    );

    myAccountBloc = MyAccountBloc(
      apiMyAccountService: unifediApiMyAccountServiceMock,
      accountRepository: accountRepository,
      myAccountLocalPreferenceBloc: myAccountLocalPreferenceBloc,
      instance: authInstance,
    );

    chat = await ChatMockHelper.createTestChat(seed: 'seed1');

    chatBloc = PleromaChatBloc(
      connectionService: MockIConnectionService(),
      chat: chat,
      unifediApiChatService: pleromaApiChatServiceMock,
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
            (account) => account.toUnifediApiAccount(),
          )
          .toList(),
      chatRemoteId: chat.remoteId,
      batchTransaction: null,
    );
    await chatRepository.upsertInRemoteType(chat.toUnifediApiChat(
      lastChatMessage: lastChatMessage,
      accounts: accounts,
    ));

    await RxDartMockHelper.waitToExecuteRxCallbacks();
  }

  test('chat', () async {
    ChatMockHelper.expectChat(chatBloc.chat, chat);

    var newValue = await ChatMockHelper.createTestChat(
      seed: 'seed2',
      remoteId: chat.remoteId,
    );

    var listened;

    var subscription = chatBloc.chatStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    ChatMockHelper.expectChat(listened, chat);

    var account1 = await AccountMockHelper.createTestAccount(seed: 'account1');

    await _update(newValue, accounts: [account1]);

    ChatMockHelper.expectChat(chatBloc.chat, newValue);
    ChatMockHelper.expectChat(listened, newValue);
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
    await RxDartMockHelper.waitForData(() => listened);

    expect(listened, chat.updatedAt);

    var dbPleromaChatPopulatedWrapper = chat.toDbPleromaChatPopulatedWrapper();
    await _update(
      dbPleromaChatPopulatedWrapper.copyWith(
        dbChatPopulated: dbPleromaChatPopulatedWrapper.dbChatPopulated.copyWith(
          dbChat: dbPleromaChatPopulatedWrapper.dbChatPopulated.dbChat.copyWith(
            updatedAt: newValue,
          ),
        ),
      ),
      accounts: chat.accounts,
    );

    expect(chatBloc.updatedAt, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });

  test('lastChatMessage', () async {
    var account1 = await AccountMockHelper.createTestAccount(
      seed: 'chatMessage1',
    );
    var account2 = await AccountMockHelper.createTestAccount(
      seed: 'chatMessage1',
    );

    var chatMessage1 = await ChatMessageMockHelper.createTestChatMessage(
      seed: 'chatMessage1',
      chatRemoteId: chat.remoteId,
      createdAt: DateTime(2001),
      account: account1,
    );
    var chatMessage2 = await ChatMessageMockHelper.createTestChatMessage(
      seed: 'chatMessage2',
      chatRemoteId: chat.remoteId,
      createdAt: DateTime(2002),
      account: account2,
    );

    var newValue = await ChatMockHelper.createTestChat(
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

    await RxDartMockHelper.waitToExecuteRxCallbacks();

    ChatMessageMockHelper.expectChatMessage(
      chatBloc.lastChatMessage,
      chatMessage1,
    );
    ChatMessageMockHelper.expectChatMessage(listened, chatMessage1);

    await chatMessageRepository.upsertInRemoteType(
      chatMessage2.toUnifediApiChatMessage(),
    );

    await _update(
      newValue,
      accounts: [chatMessage2.account!],
      lastChatMessage: chatMessage1,
    );

    await RxDartMockHelper.waitToExecuteRxCallbacks();

    ChatMessageMockHelper.expectChatMessage(
      chatBloc.lastChatMessage,
      chatMessage2,
    );
    ChatMessageMockHelper.expectChatMessage(listened, chatMessage2);

    await subscription.cancel();
  });

// todo: rework after backend chats with several accounts rework
  test('accounts', () async {
    var account1 = await AccountMockHelper.createTestAccount(seed: 'account1');
    var account2 = await AccountMockHelper.createTestAccount(seed: 'account2');

    var newValue = await ChatMockHelper.createTestChat(
      seed: 'seed2',
      remoteId: chat.remoteId,
    );

    late var listened;

    var subscription = chatBloc.accountsStream.listen((newValue) {
      listened = newValue;
    });

    await _update(newValue, accounts: [account1]);

    await RxDartMockHelper.waitToExecuteRxCallbacks();

    AccountMockHelper.expectAccount(chatBloc.accounts[0], account1);
    AccountMockHelper.expectAccount(listened[0], account1);

    await _update(newValue, accounts: [
      account2, //      account3
    ]);

    await RxDartMockHelper.waitToExecuteRxCallbacks();

    AccountMockHelper.expectAccount(chatBloc.accounts[0], account2);
//    AccountMockHelper.expectAccount(chatBloc.accounts[2], account3);
    AccountMockHelper.expectAccount(listened[0], account2);
//    AccountMockHelper.expectAccount(listened[2], account3);

    await subscription.cancel();
  });

//
//  test('accounts', () async {
//    var account1 = await AccountMockHelper.createTestAccount(seed: 'account1');
//    var account2 = await AccountMockHelper.createTestAccount(seed: 'account2');
////    var account3 = await AccountMockHelper.createTestAccount(seed: 'account3');
//
//    var newValue = await ChatMockHelper.createTestChat(seed: 'seed2', remoteId: chat.remoteId);
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
//     await RxDartMockHelper.waitForData(() => listened);

//
//    AccountMockHelper.expectAccount(chatBloc.accounts[0], account1);
//    AccountMockHelper.expectAccount(listened[0], account1);
//
//    await _update(newValue, accounts: [
//      account2, //      account3
//    ]);
//
//
//
//     listened = null;
//     await RxDartMockHelper.waitForData(() => listened);

//
//    AccountMockHelper.expectAccount(chatBloc.accounts[0], account1);
//    AccountMockHelper.expectAccount(chatBloc.accounts[1], account2);
////    AccountMockHelper.expectAccount(chatBloc.accounts[2], account3);
//    AccountMockHelper.expectAccount(listened[0], account1);
//    AccountMockHelper.expectAccount(listened[1], account2);
////    AccountMockHelper.expectAccount(listened[2], account3);
//
//    await subscription.cancel();
//  });

//  test('refreshFromNetwork', () async {
//    ChatMockHelper.expectChat(chatBloc.chat, chat);
//
//    var newValue = await ChatMockHelper.createTestChat(
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
//     await RxDartMockHelper.waitForData(() => listened);

//    ChatMockHelper.expectChat(listened, chat);
//
//    when(pleromaApiChatServiceMock.getChat(
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
//     await RxDartMockHelper.waitForData(() => listened);

//
//    ChatMockHelper.expectChat(chatBloc.chat, newValue);
//    ChatMockHelper.expectChat(listened, newValue);
//    await subscription.cancel();
//  });
}
