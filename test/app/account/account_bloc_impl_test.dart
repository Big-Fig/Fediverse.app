import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/local_account_bloc_impl.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';
import 'package:unifedi_api/unifedi_api.dart';

import '../../rxdart/rxdart_test_helper.dart';
import 'account_bloc_impl_test.mocks.dart';
import 'account_test_helper.dart';
// ignore_for_file: avoid-late-keyword

@GenerateMocks([
  IUnifediApiAccountService,
  IUnifediApiWebSocketsService,
])
void main() {
  late IAccount account;
  late IAccountBloc accountBloc;
  late MockIUnifediApiAccountService pleromaAuthAccountServiceMock;
  late AppDatabase database;
  late IAccountRepository accountRepository;
  late IStatusRepository statusRepository;
  late MockIUnifediApiWebSocketsService unifediApiWebSocketsService;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
    statusRepository = StatusRepository(
      appDatabase: database,
      accountRepository: accountRepository,
    );

    pleromaAuthAccountServiceMock = MockIUnifediApiAccountService();

    account = await AccountMockHelper.createTestAccount(seed: 'seed1');

    unifediApiWebSocketsService = MockIUnifediApiWebSocketsService();

    await accountRepository.upsertInRemoteType(
      account.toUnifediApiAccount(),
    );
    account = (await accountRepository.findByRemoteIdInAppType(
      account.remoteId,
    ))!;

    accountBloc = LocalAccountBloc(
      account: account,
      pleromaAuthAccountService: pleromaAuthAccountServiceMock,
      accountRepository: accountRepository,
      delayInit: false,
      unifediApiWebSocketsService: unifediApiWebSocketsService,
      statusRepository: statusRepository,
      myAccount: null,
    );
  });

  tearDown(() async {
    await accountBloc.dispose();
    await accountRepository.dispose();
    await database.close();
  });

  Future _update(IAccount account) async {
    await accountRepository.upsertInRemoteType(
      account.toUnifediApiAccount(),
    );

    await RxDartMockHelper.waitToExecuteRxCallbacks();
  }

  test('account', () async {
    AccountMockHelper.expectAccount(accountBloc.account, account);

    var newValue = await AccountMockHelper.createTestAccount(
      seed: 'seed2',
      remoteId: account.remoteId,
    );

    IAccount? listened;

    var subscription = accountBloc.accountStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    AccountMockHelper.expectAccount(listened, account);

    await _update(newValue);

    AccountMockHelper.expectAccount(accountBloc.account, newValue);
    AccountMockHelper.expectAccount(listened, newValue);
    await subscription.cancel();
  });

  test('acct', () async {
    expect(accountBloc.acct, account.acct);

    var newValue = 'newAcct';

    String? listened;

    var subscription = accountBloc.acctStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(listened, account.acct);

    await _update(
      account.copyWithTemp(
        acct: newValue,
      ),
    );

    expect(accountBloc.acct, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });
  test('note', () async {
    expect(accountBloc.note, account.note);

    var newValue = 'newNote';

    String? listened;

    var subscription = accountBloc.noteStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(listened, account.note);

    await _update(account.copyWithTemp(note: newValue));

    expect(accountBloc.note, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });
  test('header', () async {
    expect(accountBloc.header, account.header);

    var newValue = 'newHeader';

    String? listened;

    var subscription = accountBloc.headerStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(listened, account.header);

    await _update(account.copyWithTemp(header: newValue));

    expect(accountBloc.header, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });
  test('avatar', () async {
    expect(accountBloc.avatar, account.avatar);

    var newValue = 'newAvatar';

    String? listened;

    var subscription = accountBloc.avatarStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(listened, account.avatar);

    await _update(account.copyWithTemp(avatar: newValue));

    expect(accountBloc.avatar, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });
  test('displayName', () async {
    expect(accountBloc.displayName, account.displayName);

    var newValue = 'newDisplayName';

    String? listened;

    var subscription = accountBloc.displayNameStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(listened, account.displayName);

    await _update(account.copyWithTemp(displayName: newValue));

    expect(accountBloc.displayName, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });
  test('fields', () async {
    expect(accountBloc.fields, account.fields ?? []);

    var newValue = [
      UnifediApiField(
        name: 'newName',
        value: 'newValue',
        verifiedAt: null,
      ),
    ];

    List<IUnifediApiField>? listened;

    var subscription = accountBloc.fieldsStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(listened, account.fields ?? []);

    await _update(account.copyWithTemp(fields: newValue));

    expect(accountBloc.fields, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });

  test('statusesCount', () async {
    expect(accountBloc.statusesCount, account.statusesCount);

    var newValue = account.statusesCount! + 1;

    int? listened;

    var subscription = accountBloc.statusesCountStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(listened, account.statusesCount);

    await _update(account.copyWithTemp(statusesCount: newValue));

    expect(accountBloc.statusesCount, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });
  test('statusesCount', () async {
    expect(accountBloc.statusesCount, account.statusesCount);

    var newValue = account.statusesCount! + 1;

    int? listened;

    var subscription = accountBloc.statusesCountStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(listened, account.statusesCount);

    await _update(account.copyWithTemp(statusesCount: newValue));

    expect(accountBloc.statusesCount, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });
  test('followingCount', () async {
    expect(accountBloc.followingCount, account.followingCount);

    var newValue = account.followingCount! + 1;

    int? listened;

    var subscription = accountBloc.followingCountStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(listened, account.followingCount);

    await _update(account.copyWithTemp(followingCount: newValue));

    expect(accountBloc.followingCount, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });
  test('followersCount', () async {
    expect(accountBloc.followersCount, account.followersCount);

    var newValue = account.followersCount! + 1;

    int? listened;

    var subscription = accountBloc.followersCountStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(listened, account.followersCount);

    await _update(account.copyWithTemp(followersCount: newValue));

    expect(accountBloc.followersCount, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });

  test('displayNameEmojiText', () async {
    expect(
      accountBloc.displayNameEmojiText,
      EmojiText(
        text: account.displayName!,
        emojis: account.emojis,
      ),
    );

    var newDisplayNameValue = 'newDisplayName';

    EmojiText? listened;

    var subscription =
        accountBloc.displayNameEmojiTextStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(
      listened,
      EmojiText(
        text: account.displayName!,
        emojis: account.emojis,
      ),
    );

    await _update(
      account.copyWithTemp(
        displayName: newDisplayNameValue,
      ),
    );

    expect(
      accountBloc.displayNameEmojiText,
      EmojiText(
        text: newDisplayNameValue,
        emojis: account.emojis,
      ),
    );
    expect(
      listened,
      EmojiText(
        text: newDisplayNameValue,
        emojis: account.emojis,
      ),
    );
    await subscription.cancel();

    var newEmojis = [
      UnifediApiEmoji(
        url: 'url',
        staticUrl: 'staticUrl',
        visibleInPicker: null,
        name: 'name',
        tags: null,
      ),
    ];

    subscription = accountBloc.displayNameEmojiTextStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(
      listened,
      EmojiText(text: newDisplayNameValue, emojis: account.emojis),
    );

    await _update(
      account.copyWithTemp(
        displayName: newDisplayNameValue,
        emojis: newEmojis,
      ),
    );

    expect(
      accountBloc.displayNameEmojiText,
      equals(
        EmojiText(
          text: newDisplayNameValue,
          emojis: newEmojis,
        ),
      ),
    );
    expect(
      listened,
      equals(
        EmojiText(text: newDisplayNameValue, emojis: newEmojis),
      ),
    );
    await subscription.cancel();
  });

  test('accountRelationship', () async {
    expect(accountBloc.relationship, account.relationship);

    var newValue =
        AccountMockHelper.createTestAccountRelationship(seed: 'seed0');

    IUnifediApiAccountRelationship? listened;

    var subscription = accountBloc.relationshipStream!.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(accountBloc.relationship, account.relationship);

    await _update(account.copyWithTemp(relationship: newValue));

    expect(accountBloc.relationship, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });

  test('refreshFromNetwork', () async {
    AccountMockHelper.expectAccount(accountBloc.account, account);

    var newValue = await AccountMockHelper.createTestAccount(
      seed: 'seed2',
      remoteId: account.remoteId,
    );

    IAccount? listened;

    var subscription = accountBloc.accountStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    AccountMockHelper.expectAccount(listened, account);

    var newRelationship =
        AccountMockHelper.createTestAccountRelationship(seed: 'seed11');
    when(pleromaAuthAccountServiceMock.getAccount(
      accountId: account.remoteId,
      withRelationship: false,
    )).thenAnswer((_) async => newValue.toUnifediApiAccount());

    when(
      pleromaAuthAccountServiceMock.getRelationshipWithAccounts(
        accountIds: [
          account.remoteId,
        ],
      ),
    ).thenAnswer((_) async => [newRelationship]);

    await accountBloc.refreshFromNetwork(isNeedPreFetchRelationship: true);

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    AccountMockHelper.expectAccount(
      accountBloc.account,
      newValue.copyWithTemp(relationship: newRelationship),
    );
    AccountMockHelper.expectAccount(
      listened,
      newValue.copyWithTemp(relationship: newRelationship),
    );
    await subscription.cancel();
  });

  test('toggleBlock', () async {
    expect(accountBloc.relationship, account.relationship);

    IUnifediApiAccountRelationship? listened;

    var subscription = accountBloc.relationshipStream!.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(accountBloc.relationship, account.relationship);

    when(
      pleromaAuthAccountServiceMock.blockAccount(
        accountId: account.remoteId,
      ),
    ).thenAnswer(
      (_) async =>
          account.relationship!.toUnifediApiAccountRelationship().copyWith(
                blocking: true,
              ),
    );

    when(
      pleromaAuthAccountServiceMock.unBlockAccount(
        accountId: account.remoteId,
      ),
    ).thenAnswer(
      (_) async =>
          account.relationship!.toUnifediApiAccountRelationship().copyWith(
                blocking: false,
              ),
    );

    var initialValue = account.relationship!.blocking!;

    await accountBloc.toggleBlock();

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(accountBloc.relationship!.blocking, !initialValue);
    expect(listened!.blocking, !initialValue);

    await accountBloc.toggleBlock();

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(accountBloc.relationship!.blocking, initialValue);
    expect(listened!.blocking, initialValue);

    await subscription.cancel();
  });
  test('toggleFollow', () async {
    expect(accountBloc.relationship, account.relationship);

    IUnifediApiAccountRelationship? listened;

    var subscription = accountBloc.relationshipStream!.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(accountBloc.relationship, account.relationship);

    when(pleromaAuthAccountServiceMock.followAccount(
      accountId: account.remoteId,
    )).thenAnswer(
      (_) async => account.relationship!
          .toUnifediApiAccountRelationship()
          .copyWith(following: true),
    );

    when(pleromaAuthAccountServiceMock.unFollowAccount(
      accountId: account.remoteId,
    )).thenAnswer((_) async =>
        account.relationship!.toUnifediApiAccountRelationship().copyWith(
              following: false,
              requested: false,
            ));

    var initialValue = account.relationship!.following!;

    await accountBloc.toggleFollow();

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(accountBloc.relationship!.following, !initialValue);
    expect(listened!.following, !initialValue);

    await accountBloc.toggleFollow();

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(accountBloc.relationship!.following, initialValue);
    expect(listened!.following, initialValue);

    await subscription.cancel();
  });
  test('mute & unmute', () async {
    expect(accountBloc.relationship, account.relationship);

    IUnifediApiAccountRelationship? listened;

    var subscription = accountBloc.relationshipStream!.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(accountBloc.relationship, account.relationship);

    when(pleromaAuthAccountServiceMock.muteAccount(
      accountId: account.remoteId,
      notifications: true,
      expireIn: null,
    )).thenAnswer((_) async =>
        account.relationship!.toUnifediApiAccountRelationship().copyWith(
              muting: true,
              mutingNotifications: true,
            ));

    when(pleromaAuthAccountServiceMock.muteAccount(
      accountId: account.remoteId,
      notifications: false,
      expireIn: null,
    )).thenAnswer((_) async =>
        account.relationship!.toUnifediApiAccountRelationship().copyWith(
              muting: true,
              mutingNotifications: false,
            ));

    when(pleromaAuthAccountServiceMock.unMuteAccount(
      accountId: account.remoteId,
    )).thenAnswer(
      (_) async => account.relationship!
          .toUnifediApiAccountRelationship()
          .copyWith(muting: false),
    );

    if (accountBloc.relationshipMuting == true) {
      await accountBloc.unMute();
    }

    var initialValue = account.relationship!.muting!;

    await accountBloc.mute(
      notifications: false,
      duration: null,
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(accountBloc.relationship!.muting, !initialValue);
    expect(listened!.muting, !initialValue);

    await accountBloc.unMute();

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(accountBloc.relationship!.muting, initialValue);
    expect(listened!.muting, initialValue);

    await subscription.cancel();
  });
  test('togglePin', () async {
    expect(accountBloc.relationship, account.relationship);

    IUnifediApiAccountRelationship? listened;

    var subscription = accountBloc.relationshipStream!.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(accountBloc.relationship, account.relationship);

    when(pleromaAuthAccountServiceMock.pinAccount(
      accountId: account.remoteId,
    )).thenAnswer(
      (_) async => account.relationship!
          .toUnifediApiAccountRelationship()
          .copyWith(muting: true),
    );

    when(pleromaAuthAccountServiceMock.unPinAccount(
      accountId: account.remoteId,
    )).thenAnswer(
      (_) async => account.relationship!
          .toUnifediApiAccountRelationship()
          .copyWith(muting: false),
    );

    var initialValue = account.relationship!.muting!;

    await accountBloc.togglePin();

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(accountBloc.relationship!.muting, !initialValue);
    expect(listened!.muting, !initialValue);

    await accountBloc.togglePin();

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(accountBloc.relationship!.muting, initialValue);
    expect(listened!.muting, initialValue);

    await subscription.cancel();
  });
}
