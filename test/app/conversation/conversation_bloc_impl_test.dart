import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc_impl.dart';
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
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_service.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_api_conversation_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/status/auth/pleroma_api_auth_status_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';

import '../../rxdart/rxdart_test_helper.dart';
import '../account/account_test_helper.dart';
import '../account/my/my_account_test_helper.dart';
import '../status/status_test_helper.dart';
import 'conversation_bloc_impl_test.mocks.dart';
import 'conversation_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
@GenerateMocks([
  IPleromaApiConversationService,
  IPleromaApiAuthStatusService,
  IPleromaApiMyAccountService,
])
void main() {
  late IConversationChat conversation;
  late IConversationChatBloc conversationBloc;
  late MockIPleromaApiConversationService pleromaConversationServiceMock;
  late MockIPleromaApiAuthStatusService pleromaAuthStatusServiceMock;
  late MockIPleromaApiMyAccountService pleromaMyAccountServiceMock;
  late AppDatabase database;
  late IAccountRepository accountRepository;
  late IStatusRepository statusRepository;
  late IConversationChatRepository conversationRepository;
  late IMyAccountBloc myAccountBloc;
  late IMyAccount myAccount;

  late AuthInstance authInstance;
  late ILocalPreferencesService preferencesService;
  late IMyAccountLocalPreferenceBloc myAccountLocalPreferenceBloc;

  setUp(
    () async {
      database = AppDatabase(VmDatabase.memory());
      accountRepository = AccountRepository(appDatabase: database);
      statusRepository = StatusRepository(
        appDatabase: database,
        accountRepository: accountRepository,
      );
      conversationRepository = ConversationChatRepository(
        appDatabase: database,
        accountRepository: accountRepository,
        statusRepository: statusRepository,
      );

      pleromaConversationServiceMock = MockIPleromaApiConversationService();
      pleromaMyAccountServiceMock = MockIPleromaApiMyAccountService();
      pleromaAuthStatusServiceMock = MockIPleromaApiAuthStatusService();
      preferencesService = MemoryLocalPreferencesService();

      myAccount =
          await MyAccountTestHelper.createTestMyAccount(seed: 'myAccount');
      authInstance = AuthInstance(
        urlHost: 'fedi.app',
        acct: myAccount.acct,
        token: null,
        authCode: null,
        isPleroma: false,
        application: null,
        info: null,
        urlSchema: null,
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

      when(pleromaConversationServiceMock.isConnected).thenReturn(true);
      when(pleromaConversationServiceMock.pleromaApiState).thenReturn(
        PleromaApiState.validAuth,
      );

      conversation =
          await ConversationTestHelper.createTestConversation(seed: 'seed1');

      conversationBloc = ConversationChatBloc(
        conversation: conversation,
        pleromaConversationService: pleromaConversationServiceMock,
        accountRepository: accountRepository,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        delayInit: false,
        myAccountBloc: myAccountBloc,
        lastChatMessage: null,
        pleromaAuthStatusService: pleromaAuthStatusServiceMock,
      );
    },
  );

  tearDown(() async {
    await conversationBloc.dispose();
    await conversationRepository.dispose();
    await statusRepository.dispose();
    await accountRepository.dispose();
    await database.close();
    await myAccountLocalPreferenceBloc.dispose();
    await preferencesService.dispose();
  });

  Future _update(
    IConversationChat conversation, {
    IStatus? lastStatus,
    required List<IAccount> accounts,
  }) async {
    await conversationRepository.upsertInRemoteType(
      conversation.toPleromaConversation(
        lastStatus: lastStatus,
        accounts: accounts,
      ),
    );

    await RxDartTestHelper.waitToExecuteRxCallbacks();
  }

  test('conversation', () async {
    ConversationTestHelper.expectConversation(
      conversationBloc.conversation,
      conversation,
    );

    var newValue = await ConversationTestHelper.createTestConversation(
      seed: 'seed2',
      remoteId: conversation.remoteId,
    );

    var listened;

    var subscription = conversationBloc.conversationStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartTestHelper.waitForData(() => listened);
    ConversationTestHelper.expectConversation(
      listened,
      conversation,
    );

    await _update(newValue, accounts: []);

    ConversationTestHelper.expectConversation(
      conversationBloc.conversation,
      newValue,
    );
    ConversationTestHelper.expectConversation(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('lastStatus', () async {
    var status1 = await StatusTestHelper.createTestStatus(
      seed: 'status1',
      createdAt: DateTime(2001),
    );
    var status2 = await StatusTestHelper.createTestStatus(
      seed: 'status2',
      createdAt: DateTime(2002),
    );

    var newValue = await ConversationTestHelper.createTestConversation(
      seed: 'seed2',
      remoteId: conversation.remoteId,
    );

    var listened;

    var subscription = conversationBloc.lastStatusStream.listen((newValue) {
      listened = newValue;
    });

    await _update(
      newValue,
      lastStatus: status1,
      accounts: [],
    );

    StatusTestHelper.expectStatus(
      conversationBloc.lastStatus,
      status1,
    );
    StatusTestHelper.expectStatus(
      listened,
      status1,
    );

    await _update(
      newValue,
      lastStatus: status2,
      accounts: [],
    );

    StatusTestHelper.expectStatus(
      conversationBloc.lastStatus,
      status2,
    );
    StatusTestHelper.expectStatus(
      listened,
      status2,
    );

    await subscription.cancel();
  });

  test('accounts', () async {
    var account1 = await AccountTestHelper.createTestAccount(seed: 'account1');
    var account2 = await AccountTestHelper.createTestAccount(seed: 'account2');
    var account3 = await AccountTestHelper.createTestAccount(seed: 'account3');

    var newValue = await ConversationTestHelper.createTestConversation(
      seed: 'seed2',
      remoteId: conversation.remoteId,
    );

    late var listened;

    var subscription = conversationBloc.accountsStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartTestHelper.waitForData(() => listened);

    await _update(
      newValue,
      accounts: [account1],
    );

    AccountTestHelper.expectAccount(
      conversationBloc.accounts[0],
      account1,
    );
    AccountTestHelper.expectAccount(
      listened[0],
      account1,
    );

    await _update(
      newValue,
      accounts: [account2, account3],
    );

    AccountTestHelper.expectAccount(
      conversationBloc.accounts[0],
      account1,
    );
    AccountTestHelper.expectAccount(
      conversationBloc.accounts[1],
      account2,
    );
    AccountTestHelper.expectAccount(
      conversationBloc.accounts[2],
      account3,
    );
    AccountTestHelper.expectAccount(
      listened[0],
      account1,
    );
    AccountTestHelper.expectAccount(
      listened[1],
      account2,
    );
    AccountTestHelper.expectAccount(
      listened[2],
      account3,
    );

    await subscription.cancel();
  });

  test('accountsWithoutMe', () async {
    var account1 = await AccountTestHelper.createTestAccount(seed: 'account1');
    var account2 = await AccountTestHelper.createTestAccount(
      seed: 'account2',
      remoteId: myAccount.remoteId,
    );
    var account3 = await AccountTestHelper.createTestAccount(seed: 'account3');

    var newValue = await ConversationTestHelper.createTestConversation(
      seed: 'seed2',
      remoteId: conversation.remoteId,
    );

    late var listened;

    var subscription =
        conversationBloc.accountsWithoutMeStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartTestHelper.waitForData(() => listened);

    await _update(
      newValue,
      accounts: [account1],
    );

    AccountTestHelper.expectAccount(
      conversationBloc.accountsWithoutMe[0],
      account1,
    );
    AccountTestHelper.expectAccount(
      listened[0],
      account1,
    );

    await _update(
      newValue,
      accounts: [account2, account3],
    );

    AccountTestHelper.expectAccount(
      conversationBloc.accountsWithoutMe[0],
      account1,
    );
    AccountTestHelper.expectAccount(
      conversationBloc.accountsWithoutMe[1],
      account3,
    );
    AccountTestHelper.expectAccount(
      listened[0],
      account1,
    );
    AccountTestHelper.expectAccount(
      listened[1],
      account3,
    );

    await subscription.cancel();
  });

  test('refreshFromNetwork', () async {
    ConversationTestHelper.expectConversation(
      conversationBloc.conversation,
      conversation,
    );

    var newValue = await ConversationTestHelper.createTestConversation(
      seed: 'seed2',
      remoteId: conversation.remoteId,
    );

    var listened;

    var subscription = conversationBloc.conversationStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartTestHelper.waitForData(() => listened);
    ConversationTestHelper.expectConversation(
      listened,
      conversation,
    );

    when(pleromaConversationServiceMock.getConversation(
      conversationRemoteId: conversation.remoteId,
    )).thenAnswer(
      (_) async => newValue.toPleromaConversation(
        accounts: [],
        lastStatus: null,
      ),
    );

    await conversationBloc.refreshFromNetwork();

    listened = null;
    await RxDartTestHelper.waitForData(() => listened);

    ConversationTestHelper.expectConversation(
      conversationBloc.conversation,
      newValue,
    );
    ConversationTestHelper.expectConversation(listened, newValue);
    await subscription.cancel();
  });
}
