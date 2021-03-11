import 'package:fedi/enum/enum_values.dart';
import 'package:fedi/mastodon/account/mastodon_account_model.dart';
import 'package:fedi/mastodon/status/mastodon_status_model.dart';

abstract class IMastodonNotification {
  IMastodonAccount get account;

  DateTime get createdAt;

  String get id;

  String get type;

  MastodonNotificationType get typeMastodon;

  IMastodonStatus get status;
}

enum MastodonNotificationType {
  follow,
  favourite,
  reblog,
  mention,
  poll,
  move,
  followRequest,
}

extension MastodonNotificationTypeExtension on MastodonNotificationType {
  String toJsonValue() => mastodonNotificationTypeValues.enumToValueMap[this];
}

final mastodonNotificationTypeValues = EnumValues(
  {
    "follow": MastodonNotificationType.follow,
    "favourite": MastodonNotificationType.favourite,
    "reblog": MastodonNotificationType.reblog,
    "mention": MastodonNotificationType.mention,
    "poll": MastodonNotificationType.poll,
    "move": MastodonNotificationType.move,
    "follow_request": MastodonNotificationType.followRequest,
  },
);
