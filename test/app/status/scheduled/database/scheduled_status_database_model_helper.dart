import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore_for_file: no-magic-number
Future<DbScheduledStatus> createTestDbScheduledStatus({
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
        PleromaMediaAttachment.only(
          remoteUrl: seed + "remoteUrl1",
          type: MastodonMediaAttachmentType.audio.toJsonValue(),
          url: seed + "url",
          id: seed + "id",
        ),
      ],
      params: PleromaScheduledStatusParams(
        text: seed + "text1",
        mediaIds: [seed + "mediaIds1"],
        sensitive: seed.hashCode % 2 == 0,
        spoilerText: seed + "spoilerText1",
        visibility: PleromaVisibility.public.toJsonValue(),
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

void expectDbScheduledStatus(
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
