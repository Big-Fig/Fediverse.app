import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/mastodon/api/media/attachment/mastodon_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
class ScheduledStatusDatabaseTestHelper {
  static Future<DbScheduledStatus> createTestDbScheduledStatus({
    required String seed,
    String? remoteId,
    bool? canceled,
    DateTime? scheduledAt,
  }) async =>
      DbScheduledStatus(
        id: null,
        canceled: canceled ?? seed.hashCode % 2 == 0,
        remoteId: remoteId ?? seed + "remoteId1",
        scheduledAt: scheduledAt ?? DateTime(seed.hashCode % 10),
        mediaAttachments: [
          PleromaApiMediaAttachment.only(
            remoteUrl: seed + "remoteUrl1",
            type: MastodonApiMediaAttachmentType.audio.toJsonValue(),
            url: seed + "url",
            id: seed + "id",
          ),
        ],
        params: PleromaApiScheduledStatusParams(
          text: seed + "text1",
          mediaIds: [seed + "mediaIds1"],
          sensitive: seed.hashCode % 2 == 0,
          spoilerText: seed + "spoilerText1",
          visibility: PleromaApiVisibility.public.toJsonValue(),
          scheduledAt: DateTime(seed.hashCode % 10),
          poll: null,
          idempotency: seed + "idempotency1",
          inReplyToId: seed + "inReplyToId1",
          applicationId: seed + "textId1",
          to: null,
          expiresInSeconds: null,
          language: null,
          inReplyToConversationId: null,
        ),
      );

  static void expectDbScheduledStatus(
    IScheduledStatus? actual,
    DbScheduledStatus? expected,
  ) {
    if (actual == null && expected == null) {
      return;
    } else {
      expect(actual != null, true);

      if (actual != null) {
        expect(actual.localId != null, true);
        expect(actual.remoteId, expected!.remoteId);
        expect(actual.scheduledAt, expected.scheduledAt);
        expect(actual.params, expected.params);
        expect(actual.mediaAttachments, expected.mediaAttachments);
      }
    }
  }
}
