import '../../feature/unifedi_api_feature_model.dart';
import '../../pagination/unifedi_api_pagination_model.dart';
import '../../unifedi_api_service.dart';
import '../../visibility/unifedi_api_visibility_sealed.dart';
import '../type/unifedi_api_notification_type_sealed.dart';
import '../unifedi_api_notification_model.dart';

abstract class IUnifediApiNotificationService extends IUnifediApiService {
  IUnifediApiFeature get getNotificationsFeature;

  IUnifediApiFeature get getNotificationFeature;
  IUnifediApiFeature get getNotificationIncludeTypesFeature;
  IUnifediApiFeature get getNotificationExcludeVisibilitiesFeature;

  IUnifediApiFeature get dismissNotificationFeature;

  IUnifediApiFeature get dismissAllFeature;

  IUnifediApiFeature get markAsReadSingleFeature;

  IUnifediApiFeature get markAsReadListFeature;

  IUnifediApiFeature get getNotificationsMinIdFeature;

  IUnifediApiFeature get getNotificationsOnlyFromAccountWithIdFeature;

  IUnifediApiFeature get getNotificationsFollowRequestTypeFeature;

  List<UnifediApiVisibility> calculatePossibleExcludeVisibilitiesValues();
  List<UnifediApiNotificationType> calculatePossibleExcludeNotificationTypes();
  List<UnifediApiNotificationType> calculatePossibleIncludeNotificationTypes();

  Future<List<IUnifediApiNotification>> getNotifications({
    required IUnifediApiPagination? pagination,
    required List<UnifediApiNotificationType>? excludeTypes,
    required String? onlyFromAccountId,
    required List<UnifediApiNotificationType>? includeTypes,
    required List<UnifediApiVisibility>? excludeVisibilities,
  });

  Future<IUnifediApiNotification> getNotification({
    required String notificationId,
  });

  Future<IUnifediApiNotification> markAsReadSingle({
    required String notificationId,
  });

  Future<List<IUnifediApiNotification>> markAsReadList({
    required String maxNotificationId,
  });

  Future<void> dismissNotification({
    required String notificationId,
  });

  Future<void> dismissAll();
}
