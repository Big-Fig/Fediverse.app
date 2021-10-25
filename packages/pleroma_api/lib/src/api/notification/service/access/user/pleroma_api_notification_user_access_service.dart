import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../service/pleroma_api_service.dart';
import '../../../../visibility/pleroma_api_visibility_sealed.dart';
import '../../../pleroma_api_notification_model.dart';
import '../../../type/pleroma_api_notification_type_sealed.dart';

abstract class IPleromaApiNotificationUserAccessService
    extends IPleromaApiService {
  List<PleromaApiVisibility> calculatePossibleExcludeVisibilitiesValues();
  List<PleromaApiNotificationType> calculatePossibleExcludeNotificationTypes();
  List<PleromaApiNotificationType> calculatePossibleIncludeNotificationTypes();

  IPleromaApiFeature get getNotificationsFeature;

  IPleromaApiFeature get getNotificationFeature;

  IPleromaApiFeature get dismissNotificationFeature;

  IPleromaApiFeature get dismissAllFeature;

  IPleromaApiFeature get markAsReadSingleFeature;

  IPleromaApiFeature get markAsReadListFeature;

  IPleromaApiFeature get getNotificationsMinIdFeature;

  IPleromaApiFeature get getNotificationsOnlyFromAccountWithIdFeature;

  IPleromaApiFeature get getNotificationsFollowRequestTypeFeature;

  Future<List<IPleromaApiNotification>> getNotifications({
    required IPleromaApiPagination? pagination,
    required List<PleromaApiNotificationType>? excludeTypes,
    required String? onlyFromAccountId,
    required List<PleromaApiNotificationType>? includeTypes,
    required List<PleromaApiVisibility>? excludeVisibilities,
  });

  Future<IPleromaApiNotification> getNotification({
    required String notificationId,
  });

  Future<IPleromaApiNotification> markAsReadSingle({
    required String notificationId,
  });

  Future<List<IPleromaApiNotification>> markAsReadList({
    required String maxNotificationId,
  });

  Future<void> dismissNotification({
    required String notificationId,
  });

  Future<void> dismissAll();
}
