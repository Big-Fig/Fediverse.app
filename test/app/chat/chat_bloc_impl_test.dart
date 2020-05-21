import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/chat_bloc_impl.dart';
import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/chat_model_adapter.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/message/chat_message_model_adapter.dart';
import 'package:fedi/app/chat/message/repository/chat_message_repository.dart';
import 'package:fedi/app/chat/message/repository/chat_message_repository_impl.dart';
import 'package:fedi/app/chat/repository/chat_repository.dart';
import 'package:fedi/app/chat/repository/chat_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/local_preferences/local_preferences_service_memory_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../../pleroma/account/my/pleroma_my_account_service_mock.dart';
import '../../pleroma/chat/pleroma_chat_service_mock.dart';
import '../account/account_model_helper.dart';
import '../account/my/my_acount_model_helper.dart';
import 'chat_model_helper.dart';
import 'message/chat_message_model_helper.dart';

void main() {
  IChat chat;
  IChatBloc chatBloc;
  PleromaChatServiceMock pleromaChatServiceMock;
  PleromaMyAccountServiceMock pleromaMyAccountServiceMock;
  AppDatabase database;
  IAccountRepository accountRepository;
  IChatMessageRepository chatMessageRepository;
  IChatRepository chatRepository;
  IMyAccountBloc myAccountBloc;
  IMyAccount myAccount;

  AuthInstance authInstance;
  ILocalPreferencesService preferencesService;
  IMyAccountLocalPreferenceBloc myAccountLocalPreferenceBloc;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
    chatMessageRepository = ChatMessageRepository(
        appDatabase: database, accountRepository: accountRepository);
    chatRepository = ChatRepository(
        appDatabase: database,
        accountRepository: accountRepository,
        chatMessageRepository: chatMessageRepository);

    pleromaChatServiceMock = PleromaChatServiceMock();
    pleromaMyAccountServiceMock = PleromaMyAccountServiceMock();

    preferencesService = MemoryLocalPreferencesService();

    myAccount = await createTestMyAccount(seed: "myAccount");
    authInstance = AuthInstance(urlHost: "fedi.app", acct: myAccount.acct);

    myAccountLocalPreferenceBloc = MyAccountLocalPreferenceBloc(
        preferencesService, authInstance.userAtHost);

    await myAccountLocalPreferenceBloc.setValue(myAccount);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    myAccountBloc = MyAccountBloc(
        pleromaMyAccountService: pleromaMyAccountServiceMock,
        accountRepository: accountRepository,
        myAccountLocalPreferenceBloc: myAccountLocalPreferenceBloc,
        instance: authInstance);

    when(pleromaChatServiceMock.isApiReadyToUse).thenReturn(true);

    chat = await createTestChat(seed: "seed1");

    chatBloc = ChatBloc(
        chat: chat,
        pleromaChatService: pleromaChatServiceMock,
        accountRepository: accountRepository,
        chatMessageRepository: chatMessageRepository,
        chatRepository: chatRepository,
        delayInit: false,
        myAccountBloc: myAccountBloc);
  });

  tearDown(() async {
    chatBloc.dispose();
    chatRepository.dispose();
    chatMessageRepository.dispose();
    accountRepository.dispose();
    await database.close();
    myAccountLocalPreferenceBloc.dispose();
    preferencesService.dispose();
  });

  Future _update(IChat chat,
      {IChatMessage lastChatMessage, @required List<IAccount> accounts}) async {
    await chatRepository.upsertRemoteChat(mapLocalChatToRemoteChat(chat,
        lastChatMessage: lastChatMessage, accounts: accounts));
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
  }

  test('chat', () async {
    expectChat(chatBloc.chat, chat);

    var newValue = await createTestChat(seed: "seed2", remoteId: chat.remoteId);

    var listenedValue;

    var subscription = chatBloc.chatStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expectChat(listenedValue, chat);

    var account1 = await createTestAccount(seed: "account1");

    await _update(newValue, accounts: [account1]);

    expectChat(chatBloc.chat, newValue);
    expectChat(listenedValue, newValue);
    await subscription.cancel();
  });

  test('lastChatMessage', () async {
    var chatMessage1 = await createTestChatMessage(
        seed: "chatMessage1",
        chatRemoteId: chat.remoteId,
        createdAt: DateTime(2001));
    var chatMessage2 = await createTestChatMessage(
        seed: "chatMessage2",
        chatRemoteId: chat.remoteId,
        createdAt: DateTime(2002));

    var newValue = await createTestChat(seed: "seed2", remoteId: chat.remoteId);

    var listenedValue;

    var subscription = chatBloc.lastChatMessageStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    await _update(newValue,
        accounts: [chatMessage1.account], lastChatMessage: chatMessage1);

    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expectChatMessage(chatBloc.lastChatMessage, chatMessage1);
    expectChatMessage(listenedValue, chatMessage1);

    await chatMessageRepository.upsertRemoteChatMessage(
        mapLocalChatMessageToRemoteChatMessage(chatMessage2));

    await _update(newValue,
        accounts: [chatMessage2.account], lastChatMessage: chatMessage1);

// hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expectChatMessage(chatBloc.lastChatMessage, chatMessage2);
    expectChatMessage(listenedValue, chatMessage2);

    await subscription.cancel();
  });

  test('accounts', () async {
    var account1 = await createTestAccount(seed: "account1");
    var account2 = await createTestAccount(seed: "account2");
//    var account3 = await createTestAccount(seed: "account3");

    var newValue = await createTestChat(seed: "seed2", remoteId: chat.remoteId);

    var listenedValue;

    var subscription = chatBloc.accountsStream.listen((newValue) {
      listenedValue = newValue;
    });

    await _update(newValue, accounts: [account1]);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expectAccount(chatBloc.accounts[0], account1);
    expectAccount(listenedValue[0], account1);

    await _update(newValue, accounts: [
      account2, //      account3
    ]);

    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expectAccount(chatBloc.accounts[0], account1);
    expectAccount(chatBloc.accounts[1], account2);
//    expectAccount(chatBloc.accounts[2], account3);
    expectAccount(listenedValue[0], account1);
    expectAccount(listenedValue[1], account2);
//    expectAccount(listenedValue[2], account3);

    await subscription.cancel();
  });

//  test('refreshFromNetwork', () async {
//    expectChat(chatBloc.chat, chat);
//
//    var newValue = await createTestChat(
//        seed: "seed2", remoteId: chat.remoteId);
//
//    var listenedValue;
//
//    var subscription = chatBloc.chatStream.listen((newValue) {
//      listenedValue = newValue;
//    });
//    // hack to execute notify callbacks
//    await Future.delayed(Duration(milliseconds: 1));
//    expectChat(listenedValue, chat);
//
//    when(pleromaChatServiceMock.getChat(
//            chatRemoteId: chat.remoteId))
//        .thenAnswer((_) async => mapLocalChatToRemoteChat(
//            newValue,
//            accounts: [],
//            lastChatMessage: null));
//
//    await chatBloc.refreshFromNetwork();
//    // hack to execute notify callbacks
//    await Future.delayed(Duration(milliseconds: 1));
//
//    expectChat(chatBloc.chat, newValue);
//    expectChat(listenedValue, newValue);
//    await subscription.cancel();
//  });
}
