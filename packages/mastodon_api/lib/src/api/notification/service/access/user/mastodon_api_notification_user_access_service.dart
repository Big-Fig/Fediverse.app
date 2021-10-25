import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../service/mastodon_api_service.dart';
import '../../../mastodon_api_notification_model.dart';
import '../../../type/mastodon_api_notification_type_sealed.dart';

abstract class IMastodonApiNotificationUserAccessService
    extends IMastodonApiService {
  List<MastodonApiNotificationType> calculatePossibleExcludeNotificationTypes();

  IMastodonApiFeature get getNotificationsFeature;

  IMastodonApiFeature get getNotificationsMinIdFeature;

  IMastodonApiFeature get getNotificationsOnlyFromAccountWithIdFeature;

  IMastodonApiFeature get getNotificationsFollowRequestTypeFeature;

  IMastodonApiFeature get getNotificationFeature;

  IMastodonApiFeature get dismissNotificationFeature;

  IMastodonApiFeature get dismissAllFeature;

  Future<List<IMastodonApiNotification>> getNotifications({
    required IMastodonApiPagination? pagination,
    required List<MastodonApiNotificationType>? excludeTypes,
    required String? onlyFromAccountId,
  });

  Future<IMastodonApiNotification> getNotification({
    required String notificationId,
  });

  Future<void> dismissNotification({
    required String notificationId,
  });

  Future<void> dismissAll();
}
