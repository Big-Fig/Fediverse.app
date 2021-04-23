import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:fedi/pleroma/api/account/my/pleroma_my_account_service_impl.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/api/field/pleroma_field_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';

import '../../status/database/status_database_model_helper.dart';
import '../account_model_helper.dart';
import '../database/account_database_model_helper.dart';
import 'my_account_bloc_impl_test.mocks.dart';
import 'my_account_model_helper.dart';
// ignore_for_file: no-magic-number
@GenerateMocks([PleromaMyAccountService])
void main() {
  late IMyAccount myAccount;
  late IMyAccountBloc myAccountBloc;
  late MockPleromaMyAccountService pleromaMyAccountServiceMock;
  late AppDatabase database;
  late IAccountRepository accountRepository;
  late MyAccountLocalPreferenceBloc myAccountLocalPreferenceBloc;

  late AuthInstance authInstance;
  late ILocalPreferencesService preferencesService;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);

    pleromaMyAccountServiceMock = MockPleromaMyAccountService();

    when(pleromaMyAccountServiceMock.isConnected).thenReturn(true);
    when(pleromaMyAccountServiceMock.pleromaApiState).thenReturn(
      PleromaApiState.validAuth,
    );

    preferencesService = MemoryLocalPreferencesService();

    myAccount = await createTestMyAccount(seed: "seed1");
    authInstance = AuthInstance(
      urlHost: "fedi.app",
      acct: myAccount.acct,
      urlSchema: null,
      token: null,
      authCode: null,
      isPleroma: true,
      application: null,
      info: null,
    );

    myAccountLocalPreferenceBloc = MyAccountLocalPreferenceBloc(
      preferencesService,
      userAtHost: authInstance.userAtHost,
    );

    await myAccountLocalPreferenceBloc
        .setValue(myAccount as PleromaMyAccountWrapper?);
    await Future.delayed(Duration(milliseconds: 1));

    myAccountBloc = MyAccountBloc(
      pleromaMyAccountService: pleromaMyAccountServiceMock,
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

    await Future.delayed(Duration(microseconds: 100));
    await database.close();
  });

  Future _update(IMyAccount account) async {
    await myAccountLocalPreferenceBloc.setValue(
      account.toPleromaMyAccountWrapper(),
    );
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
  }

  test('account', () async {
    expectAccount(myAccountBloc.account, myAccount);

    var newValue =
        await createTestMyAccount(seed: "seed2", remoteId: myAccount.remoteId);

    var listenedValue;

    var subscription = myAccountBloc.accountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expectAccount(listenedValue, myAccount);

    await _update(newValue);

    expectAccount(myAccountBloc.account, newValue);
    expectAccount(listenedValue, newValue);
    await subscription.cancel();
  });

  test('acct', () async {
    expect(myAccountBloc.acct, myAccount.acct);

    var newValue = "newAcct";

    var listenedValue;

    var subscription = myAccountBloc.acctStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, myAccount.acct);

    await _update(myAccount.copyWith(acct: newValue));

    expect(myAccountBloc.acct, newValue);
    expect(listenedValue, newValue);
    await subscription.cancel();
  });
  test('note', () async {
    expect(myAccountBloc.note, myAccount.note);

    var newValue = "newNote";

    var listenedValue;

    var subscription = myAccountBloc.noteStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, myAccount.note);

    await _update(myAccount.copyWith(note: newValue));

    expect(myAccountBloc.note, newValue);
    expect(listenedValue, newValue);
    await subscription.cancel();
  });
  test('header', () async {
    expect(myAccountBloc.header, myAccount.header);

    var newValue = "newHeader";

    var listenedValue;

    var subscription = myAccountBloc.headerStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, myAccount.header);

    await _update(myAccount.copyWith(header: newValue));

    expect(myAccountBloc.header, newValue);
    expect(listenedValue, newValue);
    await subscription.cancel();
  });
  test('avatar', () async {
    expect(myAccountBloc.avatar, myAccount.avatar);

    var newValue = "newAvatar";

    var listenedValue;

    var subscription = myAccountBloc.avatarStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, myAccount.avatar);

    await _update(myAccount.copyWith(avatar: newValue));

    expect(myAccountBloc.avatar, newValue);
    expect(listenedValue, newValue);
    await subscription.cancel();
  });
  test('displayName', () async {
    expect(myAccountBloc.displayName, myAccount.displayName);

    var newValue = "newDisplayName";

    var listenedValue;

    var subscription = myAccountBloc.displayNameStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, myAccount.displayName);

    await _update(myAccount.copyWith(displayName: newValue));

    expect(myAccountBloc.displayName, newValue);
    expect(listenedValue, newValue);
    await subscription.cancel();
  });
  test('fields', () async {
    expect(myAccountBloc.fields, myAccount.fields ?? []);

    var newValue = [
      PleromaField(
        name: "newName",
        value: "newValue",
        verifiedAt: null,
      ),
    ];

    var listenedValue;

    var subscription = myAccountBloc.fieldsStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, myAccount.fields ?? []);

    await _update(myAccount.copyWith(fields: newValue));

    expect(myAccountBloc.fields, newValue);
    expect(listenedValue, newValue);
    await subscription.cancel();
  });

  test('statusesCount', () async {
    expect(myAccountBloc.statusesCount, myAccount.statusesCount);

    var newValue = myAccount.statusesCount + 1;

    var listenedValue;

    var subscription = myAccountBloc.statusesCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, myAccount.statusesCount);

    await _update(myAccount.copyWith(statusesCount: newValue));

    expect(myAccountBloc.statusesCount, newValue);
    expect(listenedValue, newValue);
    await subscription.cancel();
  });
  test('statusesCount', () async {
    expect(myAccountBloc.statusesCount, myAccount.statusesCount);

    var newValue = myAccount.statusesCount + 1;

    var listenedValue;

    var subscription = myAccountBloc.statusesCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, myAccount.statusesCount);

    await _update(myAccount.copyWith(statusesCount: newValue));

    expect(myAccountBloc.statusesCount, newValue);
    expect(listenedValue, newValue);
    await subscription.cancel();
  });
  test('followingCount', () async {
    expect(myAccountBloc.followingCount, myAccount.followingCount);

    var newValue = myAccount.followingCount + 1;

    var listenedValue;

    var subscription = myAccountBloc.followingCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, myAccount.followingCount);

    await _update(myAccount.copyWith(followingCount: newValue));

    expect(myAccountBloc.followingCount, newValue);
    expect(listenedValue, newValue);
    await subscription.cancel();
  });
  test('followersCount', () async {
    expect(myAccountBloc.followersCount, myAccount.followersCount);

    var newValue = myAccount.followersCount + 1;

    var listenedValue;

    var subscription = myAccountBloc.followersCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, myAccount.followersCount);

    await _update(myAccount.copyWith(followersCount: newValue));

    expect(myAccountBloc.followersCount, newValue);
    expect(listenedValue, newValue);
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

    var newDisplayNameValue = "newDisplayName";

    var listenedValue;

    var subscription =
        myAccountBloc.displayNameEmojiTextStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      EmojiText(
        text: myAccount.displayName!,
        emojis: myAccount.emojis,
      ),
    );

    await _update(
      myAccount.copyWith(
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
      listenedValue,
      EmojiText(
        text: newDisplayNameValue,
        emojis: myAccount.emojis,
      ),
    );
    await subscription.cancel();

    var newEmojis = [
      PleromaEmoji(
        url: "url",
        staticUrl: "staticUrl",
        visibleInPicker: null,
        shortcode: null,
        category: null,
      ),
    ];

    subscription = myAccountBloc.displayNameEmojiTextStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      EmojiText(text: newDisplayNameValue, emojis: myAccount.emojis),
    );

    await _update(myAccount.copyWith(
      displayName: newDisplayNameValue,
      emojis: newEmojis,
    ));

    expect(
      myAccountBloc.displayNameEmojiText,
      equals(EmojiText(text: newDisplayNameValue, emojis: newEmojis)),
    );
    expect(
      listenedValue,
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
    expectAccount(myAccountBloc.account, myAccount);

    var newValue =
        await createTestMyAccount(seed: "seed2", remoteId: myAccount.remoteId);

    var listenedValue;

    var subscription = myAccountBloc.accountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expectAccount(listenedValue, myAccount);

    when(pleromaMyAccountServiceMock.verifyCredentials()).thenAnswer(
      (_) async => newValue.pleromaAccount,
    );

    await myAccountBloc.refreshFromNetwork(isNeedPreFetchRelationship: false);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expectAccount(myAccountBloc.account, newValue);
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
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(myAccountBloc.isLocalCacheExist, false);
  });

  test('updateMyAccountByRemote', () async {
    expectAccount(myAccountBloc.account, myAccount);

    var newValue =
        await createTestMyAccount(seed: "seed2", remoteId: myAccount.remoteId);
    await myAccountBloc
        .updateMyAccountByMyPleromaAccount(newValue.pleromaAccount);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expectAccount(myAccountBloc.account, newValue);
  });

  test('checkAccountIsMe', () async {
    expect(myAccountBloc.checkAccountIsMe(myAccount), true);
    expect(
      myAccountBloc
          .checkAccountIsMe(myAccount.copyWith(remoteId: "invalidRemoteId")),
      false,
    );
    expect(
      myAccountBloc.checkAccountIsMe((await createTestAccount(
        seed: "seed3",
        remoteId: myAccount.remoteId,
      ))),
      true,
    );
  });

  test('checkIsStatusFromMe', () async {
    var dbAccount = await createTestDbAccount(seed: "seed3");
    var dbStatus =
        await createTestDbStatus(seed: "seed4", dbAccount: dbAccount);

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
          dbAccount: dbAccount.copyWith(remoteId: "invalidRemoteId"),
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
