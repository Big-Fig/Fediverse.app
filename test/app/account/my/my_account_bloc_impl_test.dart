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
import 'package:fedi/local_preferences/local_preferences_service_memory_impl.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../../../pleroma/account/my/pleroma_my_account_service_mock.dart';
import '../../status/database/status_database_model_helper.dart';
import '../account_model_helper.dart';
import '../database/account_database_model_helper.dart';
import 'my_acount_model_helper.dart';

void main() {
  IMyAccount myAccount;
  IMyAccountBloc myAccountBloc;
  PleromaMyAccountServiceMock pleromaMyAccountServiceMock;
  AppDatabase database;
  IAccountRepository accountRepository;
  MyAccountLocalPreferenceBloc myAccountLocalPreferenceBloc;

  AuthInstance authInstance;
  ILocalPreferencesService preferencesService;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);

    pleromaMyAccountServiceMock = PleromaMyAccountServiceMock();

    when(pleromaMyAccountServiceMock.isApiReadyToUse).thenReturn(true);

    preferencesService = MemoryLocalPreferencesService();

    myAccount = await createTestMyAccount(seed: "seed1");
    authInstance = AuthInstance(urlHost: "fedi.app", acct: myAccount.acct);

    myAccountLocalPreferenceBloc = MyAccountLocalPreferenceBloc(
        preferencesService, authInstance.userAtHost);

    await myAccountLocalPreferenceBloc.setValue(myAccount);
    await Future.delayed(Duration(milliseconds: 1));

    myAccountBloc = MyAccountBloc(
        pleromaMyAccountService: pleromaMyAccountServiceMock,
        accountRepository: accountRepository,
        myAccountLocalPreferenceBloc: myAccountLocalPreferenceBloc,
        instance: authInstance);
  });

  tearDown(() async {
    myAccountBloc.dispose();
    accountRepository.dispose();
    await database.close();
    myAccountLocalPreferenceBloc.dispose();
    preferencesService.dispose();
  });

  Future _update(IMyAccount account) async {
    await myAccountLocalPreferenceBloc.setValue(account);
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
    expect(myAccountBloc.fields, myAccount.fields);

    var newValue = [PleromaField(name: "newName", value: "newValue")];

    var listenedValue;

    var subscription = myAccountBloc.fieldsStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, myAccount.fields);

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
    expect(myAccountBloc.displayNameEmojiText,
        EmojiText(text: myAccount.displayName, emojis: myAccount.emojis));

    var newDisplayNameValue = "newDisplayName";

    var listenedValue;

    var subscription =
        myAccountBloc.displayNameEmojiTextStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue,
        EmojiText(text: myAccount.displayName, emojis: myAccount.emojis));

    await _update(myAccount.copyWith(displayName: newDisplayNameValue));

    expect(myAccountBloc.displayNameEmojiText,
        EmojiText(text: newDisplayNameValue, emojis: myAccount.emojis));
    expect(listenedValue,
        EmojiText(text: newDisplayNameValue, emojis: myAccount.emojis));
    await subscription.cancel();

    var newEmojis = [PleromaEmoji(url: "url", staticUrl: "staticUrl")];

    subscription = myAccountBloc.displayNameEmojiTextStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue,
        EmojiText(text: newDisplayNameValue, emojis: myAccount.emojis));

    await _update(myAccount.copyWith(
        displayName: newDisplayNameValue, emojis: newEmojis));

    expect(myAccountBloc.displayNameEmojiText,
        equals(EmojiText(text: newDisplayNameValue, emojis: newEmojis)));
    expect(listenedValue,
        equals(EmojiText(text: newDisplayNameValue, emojis: newEmojis)));
    await subscription.cancel();
  });

  test('accountRelationship', () async {
    expect(() => myAccountBloc.accountRelationship,
        throwsA(isInstanceOf<SelfActionNotPossibleException>()));
    expect(() => myAccountBloc.accountRelationshipStream,
        throwsA(isInstanceOf<SelfActionNotPossibleException>()));
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

    when(pleromaMyAccountServiceMock.verifyCredentials())
        .thenAnswer((_) async => newValue.remoteAccount);

    await myAccountBloc.refreshFromNetwork(false);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expectAccount(myAccountBloc.account, newValue);
    await subscription.cancel();
  });

  test('toggleBlock', () async {
    expect(() => myAccountBloc.toggleBlock(),
        throwsA(isInstanceOf<SelfActionNotPossibleException>()));
  });
  test('toggleFollow', () async {
    expect(() => myAccountBloc.toggleFollow(),
        throwsA(isInstanceOf<SelfActionNotPossibleException>()));
  });
  test('toggleMute', () async {
    expect(() => myAccountBloc.toggleMute(),
        throwsA(isInstanceOf<SelfActionNotPossibleException>()));
  });
  test('togglePin', () async {
    expect(() => myAccountBloc.togglePin(),
        throwsA(isInstanceOf<SelfActionNotPossibleException>()));
  });

  test('report', () async {
    expect(() => myAccountBloc.report(),
        throwsA(isInstanceOf<SelfActionNotPossibleException>()));
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
    await myAccountBloc.updateMyAccountByRemote(newValue.remoteAccount);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expectAccount(myAccountBloc.account, newValue);
  });

  test('checkAccountIsMe', () async {
    expect(myAccountBloc.checkAccountIsMe(myAccount), true);
    expect(
        myAccountBloc
            .checkAccountIsMe(myAccount.copyWith(remoteId: "invalidRemoteId")),
        false);
    expect(
        myAccountBloc.checkAccountIsMe((await createTestAccount(
            seed: "seed3", remoteId: myAccount.remoteId))),
        true);
  });

  test('checkIsStatusFromMe', () async {
    var dbAccount = await createTestDbAccount(seed: "seed3");
    var dbStatus =
        await createTestDbStatus(seed: "seed4", dbAccount: dbAccount);

    expect(
        myAccountBloc.checkIsStatusFromMe(
          DbStatusPopulatedWrapper(
            DbStatusPopulated(
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
        true);

    expect(
        myAccountBloc
            .checkIsStatusFromMe(DbStatusPopulatedWrapper(DbStatusPopulated(
          dbStatus: dbStatus,
          dbAccount: dbAccount.copyWith(remoteId: "invalidRemoteId"),
          reblogDbStatus: null,
          reblogDbStatusAccount: null,
          replyReblogDbStatusAccount: null,
          replyDbStatusAccount: null,
          replyDbStatus: null,
          replyReblogDbStatus: null,
        ))),
        false);
  });
}
