import 'package:fedi_app/app/account/repository/account_repository_impl.dart';
import 'package:fedi_app/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unifedi_api/unifedi_api.dart';

class ChatMessageDatabaseMockHelper {
  static Future<DbChatMessagePopulated> createTestDbChatMessagePopulated(
    DbChatMessage dbChatMessage,
    AccountRepository accountRepository,
  ) async {
    var dbChatMessagePopulated = DbChatMessagePopulated(
      dbChatMessage: dbChatMessage,
      dbAccount: await accountRepository.findByRemoteIdInDbType(
        dbChatMessage.accountRemoteId,
      ),
    );

    return dbChatMessagePopulated;
  }

  static Future<DbChatMessage> createTestDbChatMessage({
    required String seed,
    DateTime? createdAt,
    required DbAccount dbAccount,
    bool threadMuted = false,
    String? remoteId,
    String? chatRemoteId,
    UnifediApiCard? card,
  }) async {
    var dbChatMessage = DbChatMessage(
      id: null,
      remoteId: remoteId ?? seed + 'remoteId',
      createdAt: createdAt ?? DateTime(1),
      content: seed + 'content',
      accountRemoteId: dbAccount.remoteId,
      emojis: null,
      card: card,
      chatRemoteId: chatRemoteId ?? seed + 'chatRemoteId',
    );

    return dbChatMessage;
  }

  static void expectDbChatMessagePopulated(
    IUnifediChatMessage? actual,
    DbChatMessagePopulated? expected,
  ) {
    if (actual == null && expected == null) {
      return;
    }

    expect(actual!.localId != null, true);
    var dbChatMessage = expected!.dbChatMessage;
    ChatMessageDatabaseMockHelper.expectDbChatMessage(actual, dbChatMessage);
  }

  static void expectDbChatMessage(
    IUnifediChatMessage? actual,
    DbChatMessage? expected,
  ) {
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
        listEquals(
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
}
