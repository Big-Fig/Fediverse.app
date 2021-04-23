import 'package:fedi/mastodon/api/account/mastodon_account_model.dart';
import 'package:fedi/mastodon/api/status/mastodon_status_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart';

abstract class IMastodonNotification {
  IMastodonAccount? get account;

  DateTime get createdAt;

  String get id;

  String get type;

  MastodonNotificationType get typeMastodon;

  IMastodonStatus? get status;
}

enum MastodonNotificationType {
  follow,
  favourite,
  reblog,
  mention,
  poll,
  move,
  followRequest,
  unknown,
}



const unknownMastodonNotificationType = MastodonNotificationType.unknown;

const _followMastodonNotificationTypeJsonValue = "follow";
const _favouriteMastodonNotificationTypeJsonValue = "favourite";
const _reblogMastodonNotificationTypeJsonValue = "reblog";
const _mentionMastodonNotificationTypeJsonValue = "mention";
const _pollMastodonNotificationTypeJsonValue = "poll";
const _moveMastodonNotificationTypeJsonValue = "move";
const _followRequestMastodonNotificationTypeJsonValue = "follow_request";
const _unknownRequestMastodonNotificationTypeJsonValue = "unknown";


extension MastodonNotificationTypeListExtension on List<MastodonNotificationType> {
  List<String> toMastodonNotificationTypeStrings() => map(
        (notificationType) => notificationType.toJsonValue(),
  ).toList();
}


extension MastodonNotificationTypeExtension on MastodonNotificationType {
  String toJsonValue() {
    String result;

    switch (this) {
      case MastodonNotificationType.follow:
        result = _followMastodonNotificationTypeJsonValue;
        break;
      case MastodonNotificationType.favourite:
        result = _favouriteMastodonNotificationTypeJsonValue;
        break;
      case MastodonNotificationType.reblog:
        result = _reblogMastodonNotificationTypeJsonValue;
        break;
      case MastodonNotificationType.mention:
        result = _mentionMastodonNotificationTypeJsonValue;
        break;
      case MastodonNotificationType.poll:
        result = _pollMastodonNotificationTypeJsonValue;
        break;
      case MastodonNotificationType.move:
        result = _moveMastodonNotificationTypeJsonValue;
        break;
      case MastodonNotificationType.followRequest:
        result = _followRequestMastodonNotificationTypeJsonValue;
        break;
      case MastodonNotificationType.unknown:
        result = _unknownRequestMastodonNotificationTypeJsonValue;
        break;
    }

    return result;
  }
}

extension MastodonNotificationTypeStringExtension on String {
  MastodonNotificationType toMastodonNotificationType() {
    MastodonNotificationType result;

    switch (this) {
      case _followMastodonNotificationTypeJsonValue:
        result = MastodonNotificationType.follow;
        break;
      case _moveMastodonNotificationTypeJsonValue:
        result = MastodonNotificationType.move;
        break;
      case _favouriteMastodonNotificationTypeJsonValue:
        result = MastodonNotificationType.favourite;
        break;
      case _pollMastodonNotificationTypeJsonValue:
        result = MastodonNotificationType.poll;
        break;
      case _mentionMastodonNotificationTypeJsonValue:
        result = MastodonNotificationType.mention;
        break;
      case _reblogMastodonNotificationTypeJsonValue:
        result = MastodonNotificationType.reblog;
        break;
      case _followRequestMastodonNotificationTypeJsonValue:
        result = MastodonNotificationType.followRequest;
        break;
      case _unknownRequestMastodonNotificationTypeJsonValue:
        result = MastodonNotificationType.unknown;
        break;
      // can't parse, default value
      default:
        result = unknownMastodonNotificationType;
        break;
    }

    return result;
  }
}

extension MastodonNotificationTypeStringPollExtension on List<String> {
  List<MastodonNotificationType> toPleromaVisibilities() => map(
        (notificationTypeString) => notificationTypeString.toMastodonNotificationType(),
      ).toList();
}

class MastodonNotificationTypeTypeConverter
    implements
        JsonConverter<MastodonNotificationType, String?>,
        TypeConverter<MastodonNotificationType, String?> {
  const MastodonNotificationTypeTypeConverter();

  @override
  MastodonNotificationType fromJson(String? value) =>
      value?.toMastodonNotificationType() ?? unknownMastodonNotificationType;

  @override
  String? toJson(MastodonNotificationType? value) => value?.toJsonValue();

  @override
  MastodonNotificationType? mapToDart(String? fromDb) => fromJson(fromDb);

  @override
  String? mapToSql(MastodonNotificationType? value) => toJson(value);
}
