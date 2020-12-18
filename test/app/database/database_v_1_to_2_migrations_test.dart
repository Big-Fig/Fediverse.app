import 'dart:io';

import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

void main() {
  AppDatabase database;

  File dbFile;
  setUp(() async {
    var filePath = 'test_resources/app/database/fedi2_database_dump_v1.sqlite';
    var file = File(filePath);
    dbFile = await file.copy(filePath + ".temp");
    database = AppDatabase(VmDatabase(
        dbFile));
  });

  tearDown(() async {
    await database.close();
    await dbFile.delete();
  });

  test('test updated chat message schema', () async {
    var pleromaCardTitle = "pleromaCardTitle";
    var chatMessageDao = database.chatMessageDao;
    var updatedRemoteId = "updatedRemoteId";

    var alreadyExist = await chatMessageDao.findByRemoteId(updatedRemoteId);

    if(alreadyExist != null) {
      await chatMessageDao.deleteById(alreadyExist.dbChatMessage.id);
    }
    await chatMessageDao.insert(
      DbChatMessage(
        id: null,
        remoteId: updatedRemoteId,
        chatRemoteId: "chatRemoteId",
        accountRemoteId: "accountRemoteId",
        createdAt: DateTime.now(),
        content: "content",
        card: PleromaCard(title: pleromaCardTitle),
      ),
    );
    var found = await chatMessageDao.findByRemoteId(updatedRemoteId);

    expect(pleromaCardTitle, found.dbChatMessage.card.title);
  });
}
