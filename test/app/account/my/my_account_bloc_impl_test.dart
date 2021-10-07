import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';
import 'package:unifedi_api/unifedi_api.dart';

import '../../../rxdart/rxdart_test_helper.dart';
import '../../status/database/status_database_test_helper.dart';
import '../account_test_helper.dart';
import '../database/account_database_test_helper.dart';
import 'my_account_bloc_impl_test.mocks.dart';
import 'my_account_test_helper.dart';
// ignore_for_file: no-magic-number, avoid-late-keyword

@GenerateMocks([
  IUnifediApiMyAccountService,
])
void main() {
  late IMyAccount myAccount;
  late IMyAccountBloc myAccountBloc;
  late MockIUnifediApiMyAccountService unifediApiMyAccountServiceMock;
  late AppDatabase database;
  late IAccountRepository accountRepository;
  late MyAccountLocalPreferenceBloc myAccountLocalPreferenceBloc;

  late UnifediApiAccess authInstance;
  late ILocalPreferencesService preferencesService;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);

    unifediApiMyAccountServiceMock = MockIUnifediApiMyAccountService();

    preferencesService = MemoryLocalPreferencesService();

    myAccount = await MyAccountMockHelper.createTestMyAccount(seed: 'seed1');
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

    await myAccountLocalPreferenceBloc
        .setValue(myAccount as UnifediApiMyAccountWrapper?);
    await Future.delayed(Duration(milliseconds: 1));

    myAccountBloc = MyAccountBloc(
      apiMyAccountService: unifediApiMyAccountServiceMock,
      accountRepository: accountRepository,
      myAccountLocalPreferenceBloc: myAccountLocalPreferenceBloc,
      instance: authInstance,
    );
  });

  tearDown(() async {
    await myAccountBloc.dispose();
    await accountRepository.dispose();
    await myAccountLocalPreferenceBloc.dispose();
    await preferencesService.dispose();

    await RxDartMockHelper.waitToExecuteRxCallbacks();
    await database.close();
  });

  Future _update(IMyAccount account) async {
    await myAccountLocalPreferenceBloc.setValue(
      account.toUnifediApiMyAccountWrapper(),
    );

    await RxDartMockHelper.waitToExecuteRxCallbacks();
  }

  test('account', () async {
    AccountMockHelper.expectAccount(myAccountBloc.account, myAccount);

    var newValue = await MyAccountMockHelper.createTestMyAccount(
      seed: 'seed2',
      remoteId: myAccount.remoteId,
    );

    var listened;

    var subscription = myAccountBloc.accountStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartMockHelper.waitToExecuteRxCallbacks();
    AccountMockHelper.expectAccount(listened, myAccount);

    await _update(newValue);

    AccountMockHelper.expectAccount(myAccountBloc.account, newValue);
    AccountMockHelper.expectAccount(listened, newValue);
    await subscription.cancel();
  });

  test('acct', () async {
    expect(myAccountBloc.acct, myAccount.acct);

    var newValue = 'newAcct';

    var listened;

    var subscription = myAccountBloc.acctStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartMockHelper.waitToExecuteRxCallbacks();
    expect(listened, myAccount.acct);

    await _update(myAccount.copyWithTemp(acct: newValue));

    expect(myAccountBloc.acct, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });
  test('note', () async {
    expect(myAccountBloc.note, myAccount.note);

    var newValue = 'newNote';

    var listened;

    var subscription = myAccountBloc.noteStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartMockHelper.waitToExecuteRxCallbacks();
    expect(listened, myAccount.note);

    await _update(myAccount.copyWithTemp(note: newValue));

    expect(myAccountBloc.note, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });
  test('header', () async {
    expect(myAccountBloc.header, myAccount.header);

    var newValue = 'newHeader';

    var listened;

    var subscription = myAccountBloc.headerStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartMockHelper.waitToExecuteRxCallbacks();
    expect(listened, myAccount.header);

    await _update(myAccount.copyWithTemp(header: newValue));

    expect(myAccountBloc.header, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });
  test('avatar', () async {
    expect(myAccountBloc.avatar, myAccount.avatar);

    var newValue = 'newAvatar';

    var listened;

    var subscription = myAccountBloc.avatarStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartMockHelper.waitToExecuteRxCallbacks();
    expect(listened, myAccount.avatar);

    await _update(myAccount.copyWithTemp(avatar: newValue));

    expect(myAccountBloc.avatar, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });
  test('displayName', () async {
    expect(myAccountBloc.displayName, myAccount.displayName);

    var newValue = 'newDisplayName';

    var listened;

    var subscription = myAccountBloc.displayNameStream.listen((newValue) {
      listened = newValue;
    });

    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, myAccount.displayName);

    await _update(myAccount.copyWithTemp(displayName: newValue));

    expect(myAccountBloc.displayName, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });
  test('fields', () async {
    expect(myAccountBloc.fields, myAccount.fields ?? []);

    var newValue = [
      UnifediApiField(
        name: 'newName',
        value: 'newValue',
        verifiedAt: null,
      ),
    ];

    var listened;

    var subscription = myAccountBloc.fieldsStream.listen((newValue) {
      listened = newValue;
    });

    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, myAccount.fields ?? []);

    await _update(myAccount.copyWithTemp(fields: newValue));

    expect(myAccountBloc.fields, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });

  test('statusesCount', () async {
    expect(myAccountBloc.statusesCount, myAccount.statusesCount);

    var newValue = myAccount.statusesCount! + 1;

    var listened;

    var subscription = myAccountBloc.statusesCountStream.listen((newValue) {
      listened = newValue;
    });

    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, myAccount.statusesCount);

    await _update(myAccount.copyWithTemp(statusesCount: newValue));

    expect(myAccountBloc.statusesCount, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });
  test('statusesCount', () async {
    expect(myAccountBloc.statusesCount, myAccount.statusesCount);

    var newValue = myAccount.statusesCount! + 1;

    var listened;

    var subscription = myAccountBloc.statusesCountStream.listen((newValue) {
      listened = newValue;
    });

    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, myAccount.statusesCount);

    await _update(myAccount.copyWithTemp(statusesCount: newValue));

    expect(myAccountBloc.statusesCount, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });
  test('followingCount', () async {
    expect(myAccountBloc.followingCount, myAccount.followingCount);

    var newValue = myAccount.followingCount! + 1;

    var listened;

    var subscription = myAccountBloc.followingCountStream.listen((newValue) {
      listened = newValue;
    });

    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, myAccount.followingCount);

    await _update(myAccount.copyWithTemp(followingCount: newValue));

    expect(myAccountBloc.followingCount, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });
  test('followersCount', () async {
    expect(myAccountBloc.followersCount, myAccount.followersCount);

    var newValue = myAccount.followersCount! + 1;

    var listened;

    var subscription = myAccountBloc.followersCountStream.listen((newValue) {
      listened = newValue;
    });

    await Future.delayed(Duration(milliseconds: 1));
    expect(listened, myAccount.followersCount);

    await _update(myAccount.copyWithTemp(followersCount: newValue));

    expect(myAccountBloc.followersCount, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });

  test('displayNameEmojiText', () async {
    expect(
      myAccountBloc.displayNameEmojiText,
      EmojiText(
        text: myAccount.displayName!,
        emojis: myAccount.emojis,
      ),
    );

    var newDisplayNameValue = 'newDisplayName';

    var listened;

    var subscription =
        myAccountBloc.displayNameEmojiTextStream.listen((newValue) {
      listened = newValue;
    });

    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listened,
      EmojiText(
        text: myAccount.displayName!,
        emojis: myAccount.emojis,
      ),
    );

    await _update(
      myAccount.copyWithTemp(
        displayName: newDisplayNameValue,
      ),
    );

    expect(
      myAccountBloc.displayNameEmojiText,
      EmojiText(
        text: newDisplayNameValue,
        emojis: myAccount.emojis,
      ),
    );
    expect(
      listened,
      EmojiText(
        text: newDisplayNameValue,
        emojis: myAccount.emojis,
      ),
    );
    await subscription.cancel();

    var newEmojis = [
      UnifediApiEmoji(
        url: 'url',
        staticUrl: 'staticUrl',
        visibleInPicker: null,
        name: 'asd',
        tags: null,
      ),
    ];

    subscription = myAccountBloc.displayNameEmojiTextStream.listen((newValue) {
      listened = newValue;
    });

    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listened,
      EmojiText(text: newDisplayNameValue, emojis: myAccount.emojis),
    );

    await _update(myAccount.copyWithTemp(
      displayName: newDisplayNameValue,
      emojis: newEmojis,
    ));

    expect(
      myAccountBloc.displayNameEmojiText,
      equals(EmojiText(text: newDisplayNameValue, emojis: newEmojis)),
    );
    expect(
      listened,
      equals(EmojiText(text: newDisplayNameValue, emojis: newEmojis)),
    );
    await subscription.cancel();
  });

  test('accountRelationship', () async {
    expect(
      () => myAccountBloc.relationship,
      throwsA(isInstanceOf<SelfActionNotPossibleException>()),
    );
    expect(
      () => myAccountBloc.relationshipStream,
      throwsA(isInstanceOf<SelfActionNotPossibleException>()),
    );
  });

  test('refreshFromNetwork', () async {
    AccountMockHelper.expectAccount(myAccountBloc.account, myAccount);

    var newValue = await MyAccountMockHelper.createTestMyAccount(
      seed: 'seed2',
      remoteId: myAccount.remoteId,
    );

    var listened;

    var subscription = myAccountBloc.accountStream.listen((newValue) {
      listened = newValue;
    });

    await Future.delayed(Duration(milliseconds: 1));
    AccountMockHelper.expectAccount(listened, myAccount);

    when(unifediApiMyAccountServiceMock.verifyMyCredentials()).thenAnswer(
      (_) async => newValue.unifediApiAccount,
    );

    await myAccountBloc.refreshFromNetwork(isNeedPreFetchRelationship: false);

    await Future.delayed(Duration(milliseconds: 1));

    AccountMockHelper.expectAccount(myAccountBloc.account, newValue);
    await subscription.cancel();
  });

  test('toggleBlock', () async {
    expect(
      () => myAccountBloc.toggleBlock(),
      throwsA(isInstanceOf<SelfActionNotPossibleException>()),
    );
  });
  test('toggleFollow', () async {
    expect(
      () => myAccountBloc.toggleFollow(),
      throwsA(isInstanceOf<SelfActionNotPossibleException>()),
    );
  });
  test('mute', () async {
    expect(
      () => myAccountBloc.mute(
        notifications: false,
        duration: null,
      ),
      throwsA(isInstanceOf<SelfActionNotPossibleException>()),
    );
  });
  test('unMute', () async {
    expect(
      () => myAccountBloc.unMute(),
      throwsA(isInstanceOf<SelfActionNotPossibleException>()),
    );
  });
  test('togglePin', () async {
    expect(
      () => myAccountBloc.togglePin(),
      throwsA(isInstanceOf<SelfActionNotPossibleException>()),
    );
  });

  test('isLocalCacheExist', () async {
    expect(myAccountBloc.isLocalCacheExist, true);
    await myAccountLocalPreferenceBloc.setValue(null);

    await Future.delayed(Duration(milliseconds: 1));
    expect(myAccountBloc.isLocalCacheExist, false);
  });

  test('updateMyAccountByRemote', () async {
    AccountMockHelper.expectAccount(myAccountBloc.account, myAccount);

    var newValue = await MyAccountMockHelper.createTestMyAccount(
      seed: 'seed2',
      remoteId: myAccount.remoteId,
    );
    await myAccountBloc
        .updateMyAccountByMyUnifediApiAccount(newValue.unifediApiAccount);

    await Future.delayed(Duration(milliseconds: 1));
    AccountMockHelper.expectAccount(myAccountBloc.account, newValue);
  });

  test('checkAccountIsMe', () async {
    expect(myAccountBloc.checkAccountIsMe(myAccount), true);
    expect(
      myAccountBloc.checkAccountIsMe(
        myAccount.copyWithTemp(
          remoteId: 'invalidRemoteId',
        ),
      ),
      false,
    );
    expect(
      myAccountBloc.checkAccountIsMe((await AccountMockHelper.createTestAccount(
        seed: 'seed3',
        remoteId: myAccount.remoteId,
      ))),
      true,
    );
  });

  test('checkIsStatusFromMe', () async {
    var dbAccount =
        await AccountDatabaseMockHelper.createTestDbAccount(seed: 'seed3');
    var dbStatus = await StatusDatabaseMockHelper.createTestDbStatus(
      seed: 'seed4',
      dbAccount: dbAccount,
    );

    expect(
      myAccountBloc.checkIsStatusFromMe(
        DbStatusPopulatedWrapper(
          dbStatusPopulated: DbStatusPopulated(
            dbStatus: dbStatus,
            dbAccount: dbAccount.copyWith(remoteId: myAccount.remoteId),
            reblogDbStatusAccount: null,
            reblogDbStatus: null,
            replyReblogDbStatusAccount: null,
            replyDbStatusAccount: null,
            replyDbStatus: null,
            replyReblogDbStatus: null,
          ),
        ),
      ),
      true,
    );

    expect(
      myAccountBloc.checkIsStatusFromMe(DbStatusPopulatedWrapper(
        dbStatusPopulated: DbStatusPopulated(
          dbStatus: dbStatus,
          dbAccount: dbAccount.copyWith(remoteId: 'invalidRemoteId'),
          reblogDbStatus: null,
          reblogDbStatusAccount: null,
          replyReblogDbStatusAccount: null,
          replyDbStatusAccount: null,
          replyDbStatus: null,
          replyReblogDbStatus: null,
        ),
      )),
      false,
    );
  });
}
