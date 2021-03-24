import 'package:collection/collection.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:flutter_test/flutter_test.dart';

Function eq = const ListEquality().equals;

Future<DbChatMessagePopulated> createTestDbChatMessagePopulated(
  DbChatMessage dbChatMessage,
  AccountRepository accountRepository,
) async {
  DbChatMessagePopulated dbChatMessagePopulated = DbChatMessagePopulated(
    dbChatMessage: dbChatMessage,
    dbAccount:
        (await accountRepository.findByRemoteId(dbChatMessage.accountRemoteId))!
            .dbAccount,
  );
  return dbChatMessagePopulated;
}

Future<DbChatMessage> createTestDbChatMessage({
  required String seed,
  DateTime? createdAt,
  required DbAccount dbAccount,
  bool pleromaThreadMuted = false,
  String? remoteId,
  String? chatRemoteId,
  PleromaCard? card,
}) async {
  DbChatMessage dbChatMessage = DbChatMessage(
    id: null,
    remoteId: remoteId ?? seed + "remoteId",
    createdAt: createdAt ?? DateTime(1),
    content: seed + "content",
    accountRemoteId: dbAccount.remoteId,
    emojis: null,
    card: card,
    chatRemoteId: chatRemoteId ?? seed + "chatRemoteId",
  );
  return dbChatMessage;
}

void expectDbChatMessagePopulated(
  IPleromaChatMessage? actual,
  DbChatMessagePopulated? expected,
) {
  if (actual == null && expected == null) {
    return;
  }

  expect(actual!.localId != null, true);
  var dbChatMessage = expected!.dbChatMessage;
  expectDbChatMessage(actual, dbChatMessage);
}

void expectDbChatMessage(IPleromaChatMessage? actual, DbChatMessage? expected) {
  if (actual == null && expected == null) {
    return;
  }
  expect(actual != null, true);

  if (actual != null) {
    expect(actual.remoteId, expected!.remoteId);

    expect(actual.createdAt, expected.createdAt);
    expect(actual.content, expected.content);
    expect(actual.emojis, expected.emojis);

    expect(
      eq(
        actual.mediaAttachments,
        expected.mediaAttachment != null
            ? [
                expected.mediaAttachment,
              ]
            : null,
      ),
      true,
    );
    expect(actual.chatRemoteId, expected.chatRemoteId);
    expect(actual.card, expected.card);
  }
}
