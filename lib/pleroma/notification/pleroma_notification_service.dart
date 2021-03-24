import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaNotificationService extends IPleromaAuthApi {
  static IPleromaNotificationService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaNotificationService>(context, listen: listen);

  static const List<PleromaNotificationType> validMastodonTypesToExclude = [
    PleromaNotificationType.follow,
    PleromaNotificationType.favourite,
    PleromaNotificationType.reblog,
    PleromaNotificationType.mention,
    PleromaNotificationType.poll,
    PleromaNotificationType.move,
    PleromaNotificationType.followRequest,
  ];
  static const List<PleromaNotificationType> validPleromaTypesToExclude = [
    PleromaNotificationType.follow,
    PleromaNotificationType.favourite,
    PleromaNotificationType.reblog,
    PleromaNotificationType.mention,
    PleromaNotificationType.poll,
    PleromaNotificationType.move,
    // "Not supported on Pleroma. "
    //     "MastodonNotificationType.followRequest added only in Mastodon 3.1.0 "
    //     "but Pleroma targets Mastodon 2.7.2 API",
    // PleromaNotificationType.followRequest,
    PleromaNotificationType.pleromaEmojiReaction,
    PleromaNotificationType.pleromaChatMention,
    PleromaNotificationType.pleromaReport,
  ];
  static const List<PleromaVisibility> validPleromaVisibilityToExclude = [
    PleromaVisibility.public,
    PleromaVisibility.unlisted,
    PleromaVisibility.private,
    PleromaVisibility.direct,
  ];

  static const List<PleromaNotificationType> validPleromaTypesToInclude = [
    PleromaNotificationType.mention,
    PleromaNotificationType.follow,
    PleromaNotificationType.reblog,
    PleromaNotificationType.favourite,
    PleromaNotificationType.move,
    PleromaNotificationType.pleromaEmojiReaction,
    PleromaNotificationType.pleromaChatMention,
    PleromaNotificationType.pleromaReport,
  ];

  Future<List<IPleromaNotification>> getNotifications({
    IPleromaPaginationRequest? pagination,
    List<PleromaNotificationType>? excludeTypes,
    String? onlyFromAccountRemoteId,
    List<PleromaNotificationType>? includeTypes,
    List<PleromaVisibility>? excludeVisibilities,
  });

  Future<IPleromaNotification> getNotification({
    required String notificationRemoteId,
  });

  Future<IPleromaNotification> markAsReadSingle({
    required String notificationRemoteId,
  });

  Future<List<IPleromaNotification>> markAsReadList({
    required String maxNotificationRemoteId,
  });

  Future dismissNotification({
    required String notificationRemoteId,
  });

  Future dismissAll();
}
