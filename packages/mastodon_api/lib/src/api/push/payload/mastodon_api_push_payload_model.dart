import '../../mastodon_api_model.dart';
import '../../notification/type/mastodon_api_notification_type_sealed.dart';

abstract class IMastodonApiPushPayload implements IMastodonApiResponse {
  String get notificationId;

  String get notificationType;

  String? get title;

  String? get body;

  String? get icon;
}

extension IMastodonApiPushPayloadNotificationTypeExtension
    on IMastodonApiPushPayload {
  MastodonApiNotificationType get notificationTypeAsMastodonApi =>
      notificationType.toMastodonApiNotificationType();
}
