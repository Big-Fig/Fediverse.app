//import 'package:fedi/Pleroma/timeline/pleroma_timeline_service_impl.dart';
//import 'package:fedi/app/database/app_database.dart';
//import 'package:fedi/app/status/status_repository_impl.dart';
//import 'package:flutter_test/flutter_test.dart';
//import 'package:moor_ffi/moor_ffi.dart';
//
//import '../../pleroma/rest/pleroma_rest_service_mock.dart';
//
//final String baseUrl = "https://pleroma.com";
//
//void main() {
//  AppDatabase database;
//  StatusRepository statusRepository;
//
//  setUp(() async {
//    database = AppDatabase(VmDatabase.memory());
//    statusRepository = StatusRepository(
//        dao: database.statusDao,
//        pleromaTimelineService: PleromaTimelineService(
//            restService: PleromaRestServiceMock(baseUrl: baseUrl)));
//  });
//
//  tearDown(() async {
//    await database.close();
//  });
//
//  test('insert & find by id', () async {
//    var id = await statusRepository.insert(dbStatus);
//    assert(id != null, true);
//    expectDbStatus(await statusRepository.findById(id), dbStatusPopulated);
//  });
//
//  test('updateById', () async {
//    var id = await statusRepository.insert(dbStatus);
//    assert(id != null, true);
//
//    await statusRepository.updateById(
//        id, dbStatus.copyWith(remoteId: "newRemoteId"));
//
//    expect((await statusRepository.findById(id)).remoteId, "newRemoteId");
//  });
//
//  test('findByRemoteId', () async {
//    await statusRepository.insert(dbStatus);
//    expectDbStatus(await statusRepository.findByRemoteId(dbStatus.remoteId),
//        dbStatusPopulated);
//  });
//  test('findByRemoteIdOrCreate exist', () async {
//    var id = await statusRepository.insert(dbStatus);
//    var actual = await statusRepository.findByRemoteIdOrCreate(dbStatus);
//    expect(id, actual.localId);
//    expectDbStatus(actual, dbStatusPopulated);
//  });
//  test('findByRemoteIdOrCreate not exist', () async {
//    var actual = await statusRepository.findByRemoteIdOrCreate(dbStatus);
//    expectDbStatus(actual, dbStatusPopulated);
//  });
//
//  test('findByQuery', () async {
//    var id = await statusRepository.insert(dbStatus);
//    assert(id != null, true);
//
//    expect(
//        (await statusRepository.findByProfileIdAndQuery(_profileId, "body"))
//            .length,
//        1);
//
//    expect(
//        (await statusRepository.findByProfileIdAndQuery(_profileId, "bod"))
//            .length,
//        1);
//
//    expect(
//        (await statusRepository.findByProfileIdAndQuery(0, "body")).length, 0);
//
//    expect(
//        (await statusRepository.findByProfileIdAndQuery(_profileId, "body3"))
//            .length,
//        0);
//  });
//}
//
//DbContact createTestContact(String seed) => DbContact(
//    id: null, remoteId: "remoteId" + seed, phoneNumber: "phoneNumber" + seed);
//
//Future<DbStatusPopulated> createTestMessagePopulated(
//    DbStatus dbStatus, ContactsRepository contactRepository) async {
//  DbStatusPopulated dbStatusPopulated = DbStatusPopulated(
//    message: dbStatus,
//    fromContact:
//        (await contactRepository.findById(dbStatus.fromContactId)).dbContact,
//    toContact:
//        (await contactRepository.findById(dbStatus.toContactId)).dbContact,
//  );
//  return dbStatusPopulated;
//}
//
//Future<DbStatus> createTestMessage(
//  String seed,
//  ContactsRepository contactRepository,
//  DbContact dbContactFrom,
//  DbContact dbContactTo,
//) async {
//  DbStatus dbStatus = DbStatus(
//      id: null,
//      conversationId: 1,
//      conversationItemId: seed.hashCode,
//      profileId: _profileId,
//      remoteId: "remoteId" + seed,
//      accountRemoteId: "accountRemoteId" + seed,
//      profileRemoteId: "profileRemoteId" + seed,
//      conversationRemoteId: "conversationRemoteId" + seed,
//      conversationItemRemoteId: "conversationItemRemoteId" + seed,
//      fromContactId: (await contactRepository.findOrCreateByDbContact(
//              dbContact: dbContactFrom))
//          .localId,
//      fromAddress: NumberMessageAddress.name(
//          contact: NumberContact.name(
//              remoteId: dbContactFrom.remoteId,
//              phoneNumber: dbContactFrom.phoneNumber),
//          lineType: "fromLineType" + seed,
//          status: NumberMessageAddressStatus.delivered,
//          carrier: "fromCarrier" + seed),
//      toContactId: (await contactRepository.findOrCreateByDbContact(
//              dbContact: dbContactTo))
//          .localId,
//      toAddress: NumberMessageAddress.name(
//          contact: NumberContact.name(
//              remoteId: dbContactTo.remoteId,
//              phoneNumber: dbContactTo.phoneNumber),
//          lineType: "toLineType" + seed,
//          status: NumberMessageAddressStatus.deliveryUnconfirmed,
//          carrier: "toCarrier" + seed),
//      completedAt: DateTime.fromMicrosecondsSinceEpoch(1),
//      telnyxErrors: [
//        NumberMessageError.name(code: 1, title: "title", detail: "detail")
//      ],
//      direction: NumberMessageDirection.outbound,
//      encoding: "encoding" + seed,
//      media: [
//        NumberFile.name(
//            url: "url" + seed,
//            mimeType: "mimeType" + seed,
//            sha256: "sha256" + seed,
//            size: 10,
//            remoteId: "remoteId" + seed,
//            originalFilename: "originalFilename" + seed)
//      ],
//      telnyxOrganizationId: "telnyxOrganizationId" + seed,
//      telnyxId: "telnyxId" + seed,
//      receivedAt: DateTime.fromMicrosecondsSinceEpoch(2),
//      recordType: NumberMessageRecordType.message,
//      sentAt: DateTime.fromMicrosecondsSinceEpoch(3),
//      tags: ["tag" + seed],
//      body: "body" + seed,
//      subject: "subjet" + seed,
//      type: NumberMessageType.SMS,
//      validUntil: DateTime.fromMicrosecondsSinceEpoch(4));
//  return dbStatus;
//}
//
//
//expectDbStatus(IMessage actual, DbStatusPopulated except) {
//  expect(actual.localId != null, true);
//  expect(actual.remoteId, except.message.remoteId);
//
//  expectDbContact(actual.from.contact, except.fromContact);
//  expectDbContact(actual.to.contact, except.toContact);
//  expect(actual.direction, except.message.direction);
//}
