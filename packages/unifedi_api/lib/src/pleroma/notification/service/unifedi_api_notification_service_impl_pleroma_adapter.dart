import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/feature/type/unifedi_api_type_supported_feature_model_impl.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/notification/service/unifedi_api_notification_service.dart';
import '../../../api/notification/type/unifedi_api_notification_type_sealed.dart';
import '../../../api/notification/unifedi_api_notification_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../../api/visibility/unifedi_api_visibility_sealed.dart';
import '../../feature/unifedi_api_feature_model_pleroma_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_pleroma_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../../service/unifedi_api_service_pleroma_adapter.dart';
import '../../visibility/unifedi_api_visibility_sealed_pleroma_converter.dart';
import '../type/unifedi_api_notification_type_sealed_pleroma_converter.dart';
import '../unifedi_api_notification_model_pleroma_adapter.dart';

class UnifediApiNotificationServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter
    implements IUnifediApiNotificationService {
  final IPleromaApiNotificationUserAccessService
      pleromaApiNotificationUserAccessService;

  UnifediApiNotificationServicePleromaAdapter({
    required this.pleromaApiNotificationUserAccessService,
  });

  @override
  IUnifediApiRestService get restService => UnifediApiRestServicePleromaAdapter(
        pleromaApiRestService:
            pleromaApiNotificationUserAccessService.restService,
      );

  @override
  Future<void> dismissAll() =>
      pleromaApiNotificationUserAccessService.dismissAll();

  @override
  IUnifediApiFeature get dismissAllFeature =>
      pleromaApiNotificationUserAccessService.dismissAllFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<void> dismissNotification({
    required String notificationId,
  }) =>
      pleromaApiNotificationUserAccessService.dismissNotification(
        notificationId: notificationId,
      );

  @override
  IUnifediApiFeature get dismissNotificationFeature =>
      pleromaApiNotificationUserAccessService.dismissNotificationFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiNotification> getNotification({
    required String notificationId,
  }) =>
      pleromaApiNotificationUserAccessService
          .getNotification(
            notificationId: notificationId,
          )
          .then(
            (value) => value.toUnifediApiNotificationPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get getNotificationFeature =>
      pleromaApiNotificationUserAccessService.getNotificationFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiNotification>> getNotifications({
    required IUnifediApiPagination? pagination,
    required List<UnifediApiNotificationType>? excludeTypes,
    required String? onlyFromAccountId,
    required List<UnifediApiNotificationType>? includeTypes,
    required List<UnifediApiVisibility>? excludeVisibilities,
  }) =>
      pleromaApiNotificationUserAccessService
          .getNotifications(
            pagination: pagination?.toPleromaApiPagination(),
            excludeTypes: excludeTypes?.toPleromaApiNotificationTypeList(),
            onlyFromAccountId: onlyFromAccountId,
            includeTypes: includeTypes?.toPleromaApiNotificationTypeList(),
            excludeVisibilities:
                excludeVisibilities?.toPleromaApiVisibilityList(),
          )
          .then(
            (value) => value.toUnifediApiNotificationPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getNotificationsFeature =>
      pleromaApiNotificationUserAccessService.getNotificationsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getNotificationsFollowRequestTypeFeature =>
      pleromaApiNotificationUserAccessService
          .getNotificationsFollowRequestTypeFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getNotificationsMinIdFeature =>
      pleromaApiNotificationUserAccessService.getNotificationsMinIdFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getNotificationsOnlyFromAccountWithIdFeature =>
      pleromaApiNotificationUserAccessService
          .getNotificationsOnlyFromAccountWithIdFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiNotification>> markAsReadList({
    required String maxNotificationId,
  }) =>
      pleromaApiNotificationUserAccessService
          .markAsReadList(
            maxNotificationId: maxNotificationId,
          )
          .then(
            (value) => value.toUnifediApiNotificationPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get markAsReadListFeature =>
      pleromaApiNotificationUserAccessService.markAsReadListFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiNotification> markAsReadSingle({
    required String notificationId,
  }) =>
      pleromaApiNotificationUserAccessService
          .markAsReadSingle(
            notificationId: notificationId,
          )
          .then(
            (value) => value.toUnifediApiNotificationPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get markAsReadSingleFeature =>
      pleromaApiNotificationUserAccessService.markAsReadSingleFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getNotificationIncludeTypesFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get getNotificationExcludeVisibilitiesFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  List<UnifediApiNotificationType>
      calculatePossibleExcludeNotificationTypes() =>
          pleromaApiNotificationUserAccessService
              .calculatePossibleExcludeNotificationTypes()
              .toUnifediApiNotificationTypeList();

  @override
  List<UnifediApiVisibility> calculatePossibleExcludeVisibilitiesValues() =>
      pleromaApiNotificationUserAccessService
          .calculatePossibleExcludeVisibilitiesValues()
          .toUnifediApiVisibilityList();

  @override
  List<UnifediApiNotificationType>
      calculatePossibleIncludeNotificationTypes() =>
          pleromaApiNotificationUserAccessService
              .calculatePossibleIncludeNotificationTypes()
              .toUnifediApiNotificationTypeList();
}
