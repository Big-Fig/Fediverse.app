import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/notification/pleroma_api_notification_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/visibility/pleroma_api_visibility_model.dart';

abstract class IPleromaApiNotificationService extends IPleromaApiAuth {
  static const List<PleromaApiNotificationType> validMastodonTypesToExclude = [
    PleromaApiNotificationType.follow,
    PleromaApiNotificationType.favourite,
    PleromaApiNotificationType.reblog,
    PleromaApiNotificationType.mention,
    PleromaApiNotificationType.poll,
    PleromaApiNotificationType.move,
    PleromaApiNotificationType.followRequest,
  ];
  static const List<PleromaApiNotificationType> validPleromaTypesToExclude = [
    PleromaApiNotificationType.follow,
    PleromaApiNotificationType.favourite,
    PleromaApiNotificationType.reblog,
    PleromaApiNotificationType.mention,
    PleromaApiNotificationType.poll,
    PleromaApiNotificationType.move,
    PleromaApiNotificationType.followRequest,
    PleromaApiNotificationType.pleromaEmojiReaction,
    PleromaApiNotificationType.pleromaChatMention,
    PleromaApiNotificationType.pleromaReport,
  ];
  static const List<PleromaApiVisibility> validPleromaVisibilityToExclude = [
    PleromaApiVisibility.public,
    PleromaApiVisibility.unlisted,
    PleromaApiVisibility.private,
    PleromaApiVisibility.direct,
  ];

  static const List<PleromaApiNotificationType> validPleromaTypesToInclude = [
    PleromaApiNotificationType.mention,
    PleromaApiNotificationType.follow,
    PleromaApiNotificationType.reblog,
    PleromaApiNotificationType.favourite,
    PleromaApiNotificationType.move,
    PleromaApiNotificationType.pleromaEmojiReaction,
    PleromaApiNotificationType.pleromaChatMention,
    PleromaApiNotificationType.pleromaReport,
    PleromaApiNotificationType.followRequest,
  ];

  Future<List<IPleromaApiNotification>> getNotifications({
    IPleromaApiPaginationRequest? pagination,
    List<PleromaApiNotificationType>? excludeTypes,
    String? onlyFromAccountRemoteId,
    List<PleromaApiNotificationType>? includeTypes,
    List<PleromaApiVisibility>? excludeVisibilities,
  });

  Future<IPleromaApiNotification> getNotification({
    required String notificationRemoteId,
  });

  Future<IPleromaApiNotification> markAsReadSingle({
    required String notificationRemoteId,
  });

  Future<List<IPleromaApiNotification>> markAsReadList({
    required String maxNotificationRemoteId,
  });

  Future dismissNotification({
    required String notificationRemoteId,
  });

  Future dismissAll();
}
