import '../account/mastodon_api_account_model.dart';
import '../mastodon_api_model.dart';
import '../status/mastodon_api_status_model.dart';
import 'type/mastodon_api_notification_type_sealed.dart';

abstract class IMastodonApiNotification implements IMastodonApiResponse {
  IMastodonApiAccount? get account;

  DateTime get createdAt;

  String get id;

  String get type;

  IMastodonApiStatus? get status;
}

extension IMastodonApiNotificationExtension on IMastodonApiNotification {
  MastodonApiNotificationType get typeAsMastodonApi =>
      type.toMastodonApiNotificationType();
}
