import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
class DraftStatusDatabaseTestHelper {
  static Future<DbDraftStatus> createTestDbDraftStatus({
    required String seed,
    String? remoteId,
    bool? canceled,
    DateTime? draftAt,
  }) async =>
      DbDraftStatus(
        id: null,
        updatedAt: draftAt ?? DateTime(2000 + seed.hashCode % 10),
        data: PostStatusData(
          subject: seed + "subject",
          text: seed + "text",
          scheduledAt: draftAt ?? DateTime(2000 + seed.hashCode % 2),
          visibility: visibility,
          to: [
            seed + "1",
            seed + "2",
          ],
          mediaAttachments: mediaAttachments,
          poll: poll,
          inReplyToPleromaStatus: inReplyToPleromaStatus,
          inReplyToConversationId: inReplyToConversationId,
          isNsfwSensitiveEnabled: isNsfwSensitiveEnabled,
          language: language,
          expiresInSeconds: expiresInSeconds,
        ),
      );

  static void expectDbDraftStatus(
    IDraftStatus? actual,
    DbDraftStatus? expected,
  ) {
    if (actual == null && expected == null) {
      return;
    } else {
      expect(actual != null, true);

      if (actual != null) {
        expect(actual.localId != null, true);
        expect(actual.updatedAt, expected!.updatedAt);
        expect(actual.postStatusData, expected.data);
      }
    }
  }
}
