import 'package:fedi/Pleroma/timeline/pleroma_timeline_service_impl.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/account/account_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../../pleroma/rest/pleroma_rest_service_mock.dart';
import '../account/account_repository_impl_test.dart';
import '../account/account_repository_model_helper.dart';
import 'status_repository_model_helper.dart';

final String baseUrl = "https://pleroma.com";

expectDbStatus(IStatus actual, DbStatusPopulated expected) {
  expect(actual.localId != null, true);
  expect(actual.remoteId, expected.status.remoteId);

  expect(actual.createdAt, expected.status.createdAt);
  expect(actual.inReplyToRemoteId, expected.status.inReplyToRemoteId);
  expect(actual.inReplyToAccountRemoteId,
      expected.status.inReplyToAccountRemoteId);
  expect(actual.sensitive, expected.status.sensitive);
  expect(actual.spoilerText, expected.status.spoilerText);
  expect(actual.uri, expected.status.uri);
  expect(actual.url, expected.status.url);
  expect(actual.repliesCount, expected.status.repliesCount);
  expect(actual.reblogsCount, expected.status.reblogsCount);
  expect(actual.favouritesCount, expected.status.favouritesCount);
  expect(actual.favourited, expected.status.favourited);
  expect(actual.reblogged, expected.status.reblogged);
  expect(actual.bookmarked, expected.status.bookmarked);
  expect(actual.content, expected.status.content);
  expect(actual.reblog, expected.status.reblog);
  expect(actual.application, expected.status.application);
  expect(actual.mediaAttachments, expected.status.mediaAttachments);
  expect(actual.mentions, expected.status.mentions);
  expect(actual.tags, expected.status.tags);
  expect(actual.emojis, expected.status.emojis);
  expect(actual.poll, expected.status.poll);
  expect(actual.card, expected.status.card);
  expect(actual.visibility, expected.status.visibility);
  expect(actual.language, expected.status.language);

  expect(actual.pleromaContent, expected.status.pleromaContent);
  expect(actual.pleromaConversationId, expected.status.pleromaConversationId);
  expect(actual.pleromaDirectConversationId,
      expected.status.pleromaDirectConversationId);
  expect(actual.pleromaInReplyToAccountAcct,
      expected.status.pleromaInReplyToAccountAcct);
  expect(actual.pleromaLocal, expected.status.pleromaLocal);
  expect(actual.pleromaSpoilerText, expected.status.pleromaSpoilerText);
  expect(actual.pleromaExpiresAt, expected.status.pleromaExpiresAt);
  expect(actual.pleromaEmojiReactions, expected.status.pleromaEmojiReactions);
  expect(actual.pleromaThreadMuted, expected.status.pleromaThreadMuted);

  expectDbAccount(actual.account, expected.account);
}

void main() {
  AppDatabase database;
  AccountRepository accountRepository;
  StatusRepository statusRepository;

  DbStatusPopulated dbStatusPopulated;
  DbStatus dbStatus;

  DbAccount dbAccount;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(dao: database.accountDao);
    statusRepository = StatusRepository(
        dao: database.statusDao,
        accountRepository: accountRepository,
        pleromaTimelineService: PleromaTimelineService(
            restService: PleromaRestServiceMock(baseUrl: baseUrl)));

    dbAccount = createTestAccount("seed1");

    accountRepository.insert(dbAccount);

    dbStatus = await createTestStatus("seed3", dbAccount);

    dbStatusPopulated =
        await createTestStatusPopulated(dbStatus, accountRepository);
  });

  tearDown(() async {
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await statusRepository.insert(dbStatus);
    assert(id != null, true);
    expectDbStatus(await statusRepository.findById(id), dbStatusPopulated);
  });

  test('updateById', () async {
    var id = await statusRepository.insert(dbStatus);
    assert(id != null, true);

    await statusRepository.updateById(
        id, dbStatus.copyWith(remoteId: "newRemoteId"));

    expect((await statusRepository.findById(id)).remoteId, "newRemoteId");
  });

  test('findByRemoteId', () async {
    await statusRepository.insert(dbStatus);
    expectDbStatus(await statusRepository.findByRemoteId(dbStatus.remoteId),
        dbStatusPopulated);
  });
}

Future<DbStatusPopulated> createTestStatusPopulated(
    DbStatus dbStatus, AccountRepository accountRepository) async {
  DbStatusPopulated dbStatusPopulated = DbStatusPopulated(
    status: dbStatus,
    account:
        (await accountRepository.findByRemoteId(dbStatus.accountRemoteId)).dbAccount,
  );
  return dbStatusPopulated;
}
