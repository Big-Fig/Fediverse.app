import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_bloc_impl.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/account_model_adapter.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/account/repository/account_repository_impl.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/emoji/emoji_text_model.dart';
import 'package:fedi/refactored/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/refactored/pleroma/field/pleroma_field_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../../pleroma/account/pleroma_account_service_mock.dart';
import 'account_model_helper.dart';

void main() {
  IAccount account;
  IAccountBloc accountBloc;
  PleromaAccountServiceMock pleromaAccountServiceMock;
  AppDatabase database;
  IAccountRepository accountRepository;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);

    pleromaAccountServiceMock = PleromaAccountServiceMock();

    account = await createTestAccount(seed: "seed1");

    accountBloc = AccountBloc(
        account: account,
        pleromaAccountService: pleromaAccountServiceMock,
        accountRepository: accountRepository,
        delayInit: false);
  });

  tearDown(() async {
    await database.close();
  });

  Future _update(IAccount account) async {
    await accountRepository.upsertRemoteAccount(
        mapLocalAccountToRemoteAccount(account),
        conversationRemoteId: null);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
  }

  test('account', () async {
    expectAccount(accountBloc.account, account);

    var newValue =
        await createTestAccount(seed: "seed2", remoteId: account.remoteId);

    var listenedValue;

    var subscription = accountBloc.accountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expectAccount(listenedValue, account);

    await _update(newValue);

    expectAccount(accountBloc.account, newValue);
    expectAccount(listenedValue, newValue);
    subscription.cancel();
  });

  test('acct', () async {
    expect(accountBloc.acct, account.acct);

    var newValue = "newAcct";

    var listenedValue;

    var subscription = accountBloc.acctStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, account.acct);

    await _update(account.copyWith(acct: newValue));

    expect(accountBloc.acct, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });
  test('note', () async {
    expect(accountBloc.note, account.note);

    var newValue = "newNote";

    var listenedValue;

    var subscription = accountBloc.noteStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, account.note);

    await _update(account.copyWith(note: newValue));

    expect(accountBloc.note, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });
  test('header', () async {
    expect(accountBloc.header, account.header);

    var newValue = "newHeader";

    var listenedValue;

    var subscription = accountBloc.headerStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, account.header);

    await _update(account.copyWith(header: newValue));

    expect(accountBloc.header, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });
  test('avatar', () async {
    expect(accountBloc.avatar, account.avatar);

    var newValue = "newAvatar";

    var listenedValue;

    var subscription = accountBloc.avatarStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, account.avatar);

    await _update(account.copyWith(avatar: newValue));

    expect(accountBloc.avatar, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });
  test('displayName', () async {
    expect(accountBloc.displayName, account.displayName);

    var newValue = "newDisplayName";

    var listenedValue;

    var subscription = accountBloc.displayNameStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, account.displayName);

    await _update(account.copyWith(displayName: newValue));

    expect(accountBloc.displayName, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });
  test('fields', () async {
    expect(accountBloc.fields, account.fields);

    var newValue = [PleromaField(name: "newName", value: "newValue")];

    var listenedValue;

    var subscription = accountBloc.fieldsStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, account.fields);

    await _update(account.copyWith(fields: newValue));

    expect(accountBloc.fields, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });

  test('statusesCount', () async {
    expect(accountBloc.statusesCount, account.statusesCount);

    var newValue = account.statusesCount + 1;

    var listenedValue;

    var subscription = accountBloc.statusesCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, account.statusesCount);

    await _update(account.copyWith(statusesCount: newValue));

    expect(accountBloc.statusesCount, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });
  test('statusesCount', () async {
    expect(accountBloc.statusesCount, account.statusesCount);

    var newValue = account.statusesCount + 1;

    var listenedValue;

    var subscription = accountBloc.statusesCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, account.statusesCount);

    await _update(account.copyWith(statusesCount: newValue));

    expect(accountBloc.statusesCount, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });
  test('followingCount', () async {
    expect(accountBloc.followingCount, account.followingCount);

    var newValue = account.followingCount + 1;

    var listenedValue;

    var subscription = accountBloc.followingCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, account.followingCount);

    await _update(account.copyWith(followingCount: newValue));

    expect(accountBloc.followingCount, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });
  test('followersCount', () async {
    expect(accountBloc.followersCount, account.followersCount);

    var newValue = account.followersCount + 1;

    var listenedValue;

    var subscription = accountBloc.followersCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, account.followersCount);

    await _update(account.copyWith(followersCount: newValue));

    expect(accountBloc.followersCount, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });

  test('displayNameEmojiText', () async {
    expect(accountBloc.displayNameEmojiText,
        EmojiText(text: account.displayName, emojis: account.emojis));

    var newDisplayNameValue = "newDisplayName";

    var listenedValue;

    var subscription =
        accountBloc.displayNameEmojiTextStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue,
        EmojiText(text: account.displayName, emojis: account.emojis));

    await _update(account.copyWith(displayName: newDisplayNameValue));

    expect(accountBloc.displayNameEmojiText,
        EmojiText(text: newDisplayNameValue, emojis: account.emojis));
    expect(listenedValue,
        EmojiText(text: newDisplayNameValue, emojis: account.emojis));
    subscription.cancel();

    var newEmojis = [PleromaEmoji(url: "url", staticUrl: "staticUrl")];

    subscription = accountBloc.displayNameEmojiTextStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue,
        EmojiText(text: newDisplayNameValue, emojis: account.emojis));

    await _update(
        account.copyWith(displayName: newDisplayNameValue, emojis: newEmojis));

    expect(accountBloc.displayNameEmojiText,
        equals(EmojiText(text: newDisplayNameValue, emojis: newEmojis)));
    expect(listenedValue,
        equals(EmojiText(text: newDisplayNameValue, emojis: newEmojis)));
    subscription.cancel();
  });

  test('accountRelationship', () async {
    expect(accountBloc.accountRelationship, account.pleromaRelationship);

    var newValue = createTestAccountRelationship();

    var listenedValue;

    var subscription = accountBloc.accountRelationshipStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(accountBloc.accountRelationship, account.pleromaRelationship);

    await _update(account.copyWith(pleromaRelationship: newValue));

    expect(accountBloc.accountRelationship, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });
}
