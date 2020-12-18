import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model_adapter.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';

import '../../pleroma/account/my/pleroma_my_account_service_mock.dart';
import '../../pleroma/conversation/pleroma_conversation_service_mock.dart';
import '../account/account_model_helper.dart';
import '../account/my/my_account_model_helper.dart';
import '../status/status_model_helper.dart';
import 'conversation_model_helper.dart';

void main() {
  IConversationChat conversation;
  IConversationChatBloc conversationBloc;
  PleromaConversationServiceMock pleromaConversationServiceMock;
  PleromaMyAccountServiceMock pleromaMyAccountServiceMock;
  AppDatabase database;
  IAccountRepository accountRepository;
  IStatusRepository statusRepository;
  IConversationChatRepository conversationRepository;
  IMyAccountBloc myAccountBloc;
  IMyAccount myAccount;

  AuthInstance authInstance;
  ILocalPreferencesService preferencesService;
  IMyAccountLocalPreferenceBloc myAccountLocalPreferenceBloc;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
    statusRepository = StatusRepository(
        appDatabase: database, accountRepository: accountRepository);
    conversationRepository = ConversationChatRepository(
        appDatabase: database,
        accountRepository: accountRepository,
        statusRepository: statusRepository);

    pleromaConversationServiceMock = PleromaConversationServiceMock();
    pleromaMyAccountServiceMock = PleromaMyAccountServiceMock();

    preferencesService = MemoryLocalPreferencesService();

    myAccount = await createTestMyAccount(seed: "myAccount");
    authInstance = AuthInstance(urlHost: "fedi.app", acct: myAccount.acct);

    myAccountLocalPreferenceBloc = MyAccountLocalPreferenceBloc(
      preferencesService,
      userAtHost: authInstance.userAtHost,
    );

    await myAccountLocalPreferenceBloc.setValue(myAccount);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    myAccountBloc = MyAccountBloc(
        pleromaMyAccountService: pleromaMyAccountServiceMock,
        accountRepository: accountRepository,
        myAccountLocalPreferenceBloc: myAccountLocalPreferenceBloc,
        instance: authInstance);

    when(pleromaConversationServiceMock.isApiReadyToUse).thenReturn(true);

    conversation = await createTestConversation(seed: "seed1");

    conversationBloc = ConversationChatBloc(
      conversation: conversation,
      pleromaConversationService: pleromaConversationServiceMock,
      accountRepository: accountRepository,
      statusRepository: statusRepository,
      conversationRepository: conversationRepository,
      delayInit: false,
      myAccountBloc: myAccountBloc,
      lastChatMessage: null,
    );
  });

  tearDown(() async {
    await conversationBloc.dispose();
    await conversationRepository.dispose();
    await statusRepository.dispose();
    await accountRepository.dispose();
    await database.close();
    await myAccountLocalPreferenceBloc.dispose();
    await preferencesService.dispose();
  });

  Future _update(IConversationChat conversation,
      {IStatus lastStatus, List<IAccount> accounts}) async {
    await conversationRepository.upsertRemoteConversation(
        mapLocalConversationChatToRemoteConversation(conversation,
            lastStatus: lastStatus, accounts: accounts));
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
  }

  test('conversation', () async {
    expectConversation(conversationBloc.conversation, conversation);

    var newValue = await createTestConversation(
        seed: "seed2", remoteId: conversation.remoteId);

    var listenedValue;

    var subscription = conversationBloc.conversationStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expectConversation(listenedValue, conversation);

    await _update(newValue);

    expectConversation(conversationBloc.conversation, newValue);
    expectConversation(listenedValue, newValue);
    await subscription.cancel();
  });

  test('lastStatus', () async {
    var status1 = await createTestStatus(seed: "status1");
    var status2 = await createTestStatus(seed: "status2");

    var newValue = await createTestConversation(
        seed: "seed2", remoteId: conversation.remoteId);

    var listenedValue;

    var subscription = conversationBloc.lastStatusStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    await _update(newValue, lastStatus: status1);

    expectStatus(conversationBloc.lastStatus, status1);
    expectStatus(listenedValue, status1);

    await _update(newValue, lastStatus: status2);

    expectStatus(conversationBloc.lastStatus, status2);
    expectStatus(listenedValue, status2);

    await subscription.cancel();
  });

  test('accounts', () async {
    var account1 = await createTestAccount(seed: "account1");
    var account2 = await createTestAccount(seed: "account2");
    var account3 = await createTestAccount(seed: "account3");

    var newValue = await createTestConversation(
        seed: "seed2", remoteId: conversation.remoteId);

    var listenedValue;

    var subscription = conversationBloc.accountsStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    await _update(newValue, accounts: [account1]);

    expectAccount(conversationBloc.accounts[0], account1);
    expectAccount(listenedValue[0], account1);

    await _update(newValue, accounts: [account2, account3]);

    expectAccount(conversationBloc.accounts[0], account1);
    expectAccount(conversationBloc.accounts[1], account2);
    expectAccount(conversationBloc.accounts[2], account3);
    expectAccount(listenedValue[0], account1);
    expectAccount(listenedValue[1], account2);
    expectAccount(listenedValue[2], account3);

    await subscription.cancel();
  });

  test('accountsWithoutMe', () async {
    var account1 = await createTestAccount(seed: "account1");
    var account2 =
        await createTestAccount(seed: "account2", remoteId: myAccount.remoteId);
    var account3 = await createTestAccount(seed: "account3");

    var newValue = await createTestConversation(
        seed: "seed2", remoteId: conversation.remoteId);

    var listenedValue;

    var subscription =
        conversationBloc.accountsWithoutMeStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    await _update(newValue, accounts: [account1]);

    expectAccount(conversationBloc.accountsWithoutMe[0], account1);
    expectAccount(listenedValue[0], account1);

    await _update(newValue, accounts: [account2, account3]);

    expectAccount(conversationBloc.accountsWithoutMe[0], account1);
    expectAccount(conversationBloc.accountsWithoutMe[1], account3);
    expectAccount(listenedValue[0], account1);
    expectAccount(listenedValue[1], account3);

    await subscription.cancel();
  });

  test('refreshFromNetwork', () async {
    expectConversation(conversationBloc.conversation, conversation);

    var newValue = await createTestConversation(
        seed: "seed2", remoteId: conversation.remoteId);

    var listenedValue;

    var subscription = conversationBloc.conversationStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expectConversation(listenedValue, conversation);

    when(pleromaConversationServiceMock.getConversation(
            conversationRemoteId: conversation.remoteId))
        .thenAnswer((_) async => mapLocalConversationChatToRemoteConversation(
            newValue,
            accounts: [],
            lastStatus: null));

    await conversationBloc.refreshFromNetwork();
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expectConversation(conversationBloc.conversation, newValue);
    expectConversation(listenedValue, newValue);
    await subscription.cancel();
  });
}
