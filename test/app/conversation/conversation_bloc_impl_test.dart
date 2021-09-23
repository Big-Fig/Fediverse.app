import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
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
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';
import 'package:unifedi_api/unifedi_api.dart';

import '../../rxdart/rxdart_test_helper.dart';
import '../account/account_test_helper.dart';
import '../account/my/my_account_test_helper.dart';
import '../status/status_test_helper.dart';
import 'conversation_bloc_impl_test.mocks.dart';
import 'conversation_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
@GenerateMocks([
  IUnifediApiConversationService,
  IUnifediApiStatusService,
  IUnifediApiMyAccountService,
  IConnectionService,
])
void main() {
  late IConversationChat conversation;
  late IConversationChatBloc conversationBloc;
  late MockIUnifediApiConversationService pleromaConversationServiceMock;
  late MockIUnifediApiStatusService unifediApiStatusServiceMock;
  late MockIUnifediApiMyAccountService unifediApiMyAccountServiceMock;
  late AppDatabase database;
  late IAccountRepository accountRepository;
  late IStatusRepository statusRepository;
  late IConversationChatRepository conversationRepository;
  late IMyAccountBloc myAccountBloc;
  late IMyAccount myAccount;

  late UnifediApiAccess authInstance;
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

      pleromaConversationServiceMock = MockIUnifediApiConversationService();
      unifediApiMyAccountServiceMock = MockIUnifediApiMyAccountService();
      unifediApiStatusServiceMock = MockIUnifediApiStatusService();
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

      conversation =
          await ConversationMockHelper.createTestConversation(seed: 'seed1');

      conversationBloc = ConversationChatBloc(
        conversation: conversation,
        connectionService: MockIConnectionService(),
        pleromaConversationService: pleromaConversationServiceMock,
        accountRepository: accountRepository,
        statusRepository: statusRepository,
        conversationRepository: conversationRepository,
        delayInit: false,
        myAccountBloc: myAccountBloc,
        lastChatMessage: null,
        unifediApiStatusService: unifediApiStatusServiceMock,
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

    await RxDartMockHelper.waitToExecuteRxCallbacks();
  }

  test('conversation', () async {
    ConversationMockHelper.expectConversation(
      conversationBloc.conversation,
      conversation,
    );

    var newValue = await ConversationMockHelper.createTestConversation(
      seed: 'seed2',
      remoteId: conversation.remoteId,
    );

    var listened;

    var subscription = conversationBloc.conversationStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);
    ConversationMockHelper.expectConversation(
      listened,
      conversation,
    );

    await _update(newValue, accounts: []);

    ConversationMockHelper.expectConversation(
      conversationBloc.conversation,
      newValue,
    );
    ConversationMockHelper.expectConversation(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('lastStatus', () async {
    var status1 = await StatusMockHelper.createTestStatus(
      seed: 'status1',
      createdAt: DateTime(2001),
    );
    var status2 = await StatusMockHelper.createTestStatus(
      seed: 'status2',
      createdAt: DateTime(2002),
    );

    var newValue = await ConversationMockHelper.createTestConversation(
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

    StatusMockHelper.expectStatus(
      conversationBloc.lastStatus,
      status1,
    );
    StatusMockHelper.expectStatus(
      listened,
      status1,
    );

    await _update(
      newValue,
      lastStatus: status2,
      accounts: [],
    );

    StatusMockHelper.expectStatus(
      conversationBloc.lastStatus,
      status2,
    );
    StatusMockHelper.expectStatus(
      listened,
      status2,
    );

    await subscription.cancel();
  });

  test('accounts', () async {
    var account1 = await AccountMockHelper.createTestAccount(seed: 'account1');
    var account2 = await AccountMockHelper.createTestAccount(seed: 'account2');
    var account3 = await AccountMockHelper.createTestAccount(seed: 'account3');

    var newValue = await ConversationMockHelper.createTestConversation(
      seed: 'seed2',
      remoteId: conversation.remoteId,
    );

    late var listened;

    var subscription = conversationBloc.accountsStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    await _update(
      newValue,
      accounts: [account1],
    );

    AccountMockHelper.expectAccount(
      conversationBloc.accounts[0],
      account1,
    );
    AccountMockHelper.expectAccount(
      listened[0],
      account1,
    );

    await _update(
      newValue,
      accounts: [account2, account3],
    );

    AccountMockHelper.expectAccount(
      conversationBloc.accounts[0],
      account1,
    );
    AccountMockHelper.expectAccount(
      conversationBloc.accounts[1],
      account2,
    );
    AccountMockHelper.expectAccount(
      conversationBloc.accounts[2],
      account3,
    );
    AccountMockHelper.expectAccount(
      listened[0],
      account1,
    );
    AccountMockHelper.expectAccount(
      listened[1],
      account2,
    );
    AccountMockHelper.expectAccount(
      listened[2],
      account3,
    );

    await subscription.cancel();
  });

  test('accountsWithoutMe', () async {
    var account1 = await AccountMockHelper.createTestAccount(seed: 'account1');
    var account2 = await AccountMockHelper.createTestAccount(
      seed: 'account2',
      remoteId: myAccount.remoteId,
    );
    var account3 = await AccountMockHelper.createTestAccount(seed: 'account3');

    var newValue = await ConversationMockHelper.createTestConversation(
      seed: 'seed2',
      remoteId: conversation.remoteId,
    );

    late var listened;

    var subscription =
        conversationBloc.accountsWithoutMeStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    await _update(
      newValue,
      accounts: [account1],
    );

    AccountMockHelper.expectAccount(
      conversationBloc.accountsWithoutMe[0],
      account1,
    );
    AccountMockHelper.expectAccount(
      listened[0],
      account1,
    );

    await _update(
      newValue,
      accounts: [account2, account3],
    );

    AccountMockHelper.expectAccount(
      conversationBloc.accountsWithoutMe[0],
      account1,
    );
    AccountMockHelper.expectAccount(
      conversationBloc.accountsWithoutMe[1],
      account3,
    );
    AccountMockHelper.expectAccount(
      listened[0],
      account1,
    );
    AccountMockHelper.expectAccount(
      listened[1],
      account3,
    );

    await subscription.cancel();
  });

  test('refreshFromNetwork', () async {
    ConversationMockHelper.expectConversation(
      conversationBloc.conversation,
      conversation,
    );

    var newValue = await ConversationMockHelper.createTestConversation(
      seed: 'seed2',
      remoteId: conversation.remoteId,
    );

    var listened;

    var subscription = conversationBloc.conversationStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);
    ConversationMockHelper.expectConversation(
      listened,
      conversation,
    );

    when(pleromaConversationServiceMock.getConversation(
      conversationId: conversation.remoteId,
    )).thenAnswer(
      (_) async => newValue.toPleromaConversation(
        accounts: [],
        lastStatus: null,
      ),
    );

    await conversationBloc.refreshFromNetwork();

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    ConversationMockHelper.expectConversation(
      conversationBloc.conversation,
      newValue,
    );
    ConversationMockHelper.expectConversation(listened, newValue);
    await subscription.cancel();
  });
}
