import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../pleroma/api/media/pleroma_api_media_test_helper.dart';
import '../../../../pleroma/api/status/pleroma_api_status_test_helper.dart';
import '../../post/post_status_model_helper.dart';

// ignore_for_file: no-magic-number
class DraftStatusDatabaseTestHelper {
  static Future<DbDraftStatus> createTestDbDraftStatus({
    required String seed,
    DateTime? updatedAt,
  }) async =>
      DbDraftStatus(
        id: null,
        updatedAt: updatedAt ?? DateTime(2000 + seed.hashCode % 10),
        data: PostStatusData(
          subject: seed + 'subject',
          text: seed + 'text',
          scheduledAt: DateTime(2000 + seed.hashCode % 7),
          visibilityString: PleromaApiVisibility
              .values[seed.hashCode % PleromaApiVisibility.values.length]
              .toJsonValue(),
          to: [
            seed + '1',
            seed + '2',
          ],
          mediaAttachments: [
            PleromaApiMediaTestHelper.createTestPleromaApiMediaAttachment(
              seed: seed + '1',
            ),
            PleromaApiMediaTestHelper.createTestPleromaApiMediaAttachment(
              seed: seed + '2',
            ),
          ],
          poll: PostStatusModelTestHelper.createTestPostStatusPoll(seed: seed),
          inReplyToPleromaStatus:
              PleromaApiStatusTestHelper.createTestPleromaApiStatus(
            seed: seed + 'inReplyToPleromaStatus',
          ),
          inReplyToConversationId: seed + 'inReplyToConversationId',
          isNsfwSensitiveEnabled: seed.hashCode % 2 == 0,
          language: seed + 'language',
          expiresInSeconds: seed.hashCode % 60,
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
