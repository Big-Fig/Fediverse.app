import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:mastodon_fediverse_api/src/mastodon/api/account/mastodon_api_account_model.dart';
import 'package:mastodon_fediverse_api/src/mastodon/api/status/mastodon_api_status_model.dart';

abstract class IMastodonApiNotification implements IJsonObject {
  IMastodonApiAccount? get account;

  DateTime get createdAt;

  String get id;

  String get type;

  MastodonApiNotificationType get typeAsMastodonApi;

  IMastodonApiStatus? get status;
}

enum MastodonApiNotificationType {
  follow,
  favourite,
  reblog,
  mention,
  poll,
  move,
  followRequest,
  unknown,
}

const unknownMastodonApiNotificationType = MastodonApiNotificationType.unknown;

const _followMastodonApiNotificationTypeJsonValue = 'follow';
const _favouriteMastodonApiNotificationTypeJsonValue = 'favourite';
const _reblogMastodonApiNotificationTypeJsonValue = 'reblog';
const _mentionMastodonApiNotificationTypeJsonValue = 'mention';
const _pollMastodonApiNotificationTypeJsonValue = 'poll';
const _moveMastodonApiNotificationTypeJsonValue = 'move';
const _followRequestMastodonApiNotificationTypeJsonValue = 'follow_request';
const _unknownRequestMastodonApiNotificationTypeJsonValue = 'unknown';

extension MastodonApiNotificationTypeExtension on MastodonApiNotificationType {
  String toJsonValue() {
    String result;

    switch (this) {
      case MastodonApiNotificationType.follow:
        result = _followMastodonApiNotificationTypeJsonValue;
        break;
      case MastodonApiNotificationType.favourite:
        result = _favouriteMastodonApiNotificationTypeJsonValue;
        break;
      case MastodonApiNotificationType.reblog:
        result = _reblogMastodonApiNotificationTypeJsonValue;
        break;
      case MastodonApiNotificationType.mention:
        result = _mentionMastodonApiNotificationTypeJsonValue;
        break;
      case MastodonApiNotificationType.poll:
        result = _pollMastodonApiNotificationTypeJsonValue;
        break;
      case MastodonApiNotificationType.move:
        result = _moveMastodonApiNotificationTypeJsonValue;
        break;
      case MastodonApiNotificationType.followRequest:
        result = _followRequestMastodonApiNotificationTypeJsonValue;
        break;
      case MastodonApiNotificationType.unknown:
        result = _unknownRequestMastodonApiNotificationTypeJsonValue;
        break;
    }

    return result;
  }
}

extension MastodonApiNotificationTypeStringExtension on String {
  MastodonApiNotificationType toMastodonApiNotificationType() {
    MastodonApiNotificationType result;

    switch (this) {
      case _followMastodonApiNotificationTypeJsonValue:
        result = MastodonApiNotificationType.follow;
        break;
      case _moveMastodonApiNotificationTypeJsonValue:
        result = MastodonApiNotificationType.move;
        break;
      case _favouriteMastodonApiNotificationTypeJsonValue:
        result = MastodonApiNotificationType.favourite;
        break;
      case _pollMastodonApiNotificationTypeJsonValue:
        result = MastodonApiNotificationType.poll;
        break;
      case _mentionMastodonApiNotificationTypeJsonValue:
        result = MastodonApiNotificationType.mention;
        break;
      case _reblogMastodonApiNotificationTypeJsonValue:
        result = MastodonApiNotificationType.reblog;
        break;
      case _followRequestMastodonApiNotificationTypeJsonValue:
        result = MastodonApiNotificationType.followRequest;
        break;
      case _unknownRequestMastodonApiNotificationTypeJsonValue:
        result = MastodonApiNotificationType.unknown;
        break;
      // cant parse, default value
      default:
        result = unknownMastodonApiNotificationType;
        break;
    }

    return result;
  }
}
