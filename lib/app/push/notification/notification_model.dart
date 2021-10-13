enum NotificationActionType {
  acceptFollowRequest,
  rejectFollowRequest,
  reply,
}

const _acceptFollowRequestActionKey = 'acceptFollowRequestActionKey';
const _rejectFollowRequestActionKey = 'rejectFollowRequestActionKey';
const _replyActionKey = 'replyActionKey';

extension NotificationActionTypeExtension on NotificationActionType {
  String toJsonValue() {
    String result;

    switch (this) {
      case NotificationActionType.acceptFollowRequest:
        result = _acceptFollowRequestActionKey;
        break;
      case NotificationActionType.rejectFollowRequest:
        result = _rejectFollowRequestActionKey;
        break;
      case NotificationActionType.reply:
        result = _replyActionKey;
        break;
    }

    return result;
  }
}

extension NotificationActionTypeStringExtension on String {
  NotificationActionType toNotificationActionType() {
    NotificationActionType result;

    switch (this) {
      case _acceptFollowRequestActionKey:
        result = NotificationActionType.acceptFollowRequest;
        break;
      case _rejectFollowRequestActionKey:
        result = NotificationActionType.rejectFollowRequest;
        break;
      case _replyActionKey:
        result = NotificationActionType.reply;
        break;
      // cant parse
      default:
        throw 'Unknown NotificationActionType $this';
    }

    return result;
  }
}
