import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/feature/type/unifedi_api_type_not_supported_feature_model_impl.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/notification/service/unifedi_api_notification_service.dart';
import '../../../api/notification/type/unifedi_api_notification_type_sealed.dart';
import '../../../api/notification/unifedi_api_notification_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../../api/visibility/unifedi_api_visibility_sealed.dart';
import '../../feature/unifedi_api_feature_model_mastodon_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_mastodon_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_mastodon_adapter.dart';
import '../../service/unifedi_api_service_mastodon_adapter.dart';
import '../type/unifedi_api_notification_type_sealed_mastodon_converter.dart';
import '../unifedi_api_notification_model_mastodon_adapter.dart';

class UnifediApiNotificationServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter
    implements IUnifediApiNotificationService {
  final IMastodonApiNotificationUserAccessService
      mastodonApiNotificationUserAccessService;

  UnifediApiNotificationServiceMastodonAdapter({
    required this.mastodonApiNotificationUserAccessService,
  });

  @override
  IUnifediApiRestService get restService =>
      UnifediApiRestServiceMastodonAdapter(
        mastodonApiRestService:
            mastodonApiNotificationUserAccessService.restService,
      );

  @override
  Future<void> dismissAll() =>
      mastodonApiNotificationUserAccessService.dismissAll();

  @override
  IUnifediApiFeature get dismissAllFeature =>
      mastodonApiNotificationUserAccessService.dismissAllFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<void> dismissNotification({
    required String notificationId,
  }) =>
      mastodonApiNotificationUserAccessService.dismissNotification(
        notificationId: notificationId,
      );

  @override
  IUnifediApiFeature get dismissNotificationFeature =>
      mastodonApiNotificationUserAccessService.dismissNotificationFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiNotification> getNotification({
    required String notificationId,
  }) =>
      mastodonApiNotificationUserAccessService
          .getNotification(
            notificationId: notificationId,
          )
          .then(
            (value) => value.toUnifediApiNotificationMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get getNotificationFeature =>
      mastodonApiNotificationUserAccessService.getNotificationFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiNotification>> getNotifications({
    required IUnifediApiPagination? pagination,
    required List<UnifediApiNotificationType>? excludeTypes,
    required String? onlyFromAccountId,
    required List<UnifediApiNotificationType>? includeTypes,
    required List<UnifediApiVisibility>? excludeVisibilities,
  }) {
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: includeTypes,
      feature: getNotificationIncludeTypesFeature,
    );
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: excludeVisibilities,
      feature: getNotificationExcludeVisibilitiesFeature,
    );

    return mastodonApiNotificationUserAccessService
        .getNotifications(
          pagination: pagination?.toMastodonApiPagination(),
          excludeTypes: excludeTypes?.toMastodonApiNotificationTypeList(),
          onlyFromAccountId: onlyFromAccountId,
        )
        .then(
          (value) => value.toUnifediApiNotificationMastodonAdapterList(),
        );
  }

  @override
  IUnifediApiFeature get getNotificationsFeature =>
      mastodonApiNotificationUserAccessService.getNotificationsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getNotificationsFollowRequestTypeFeature =>
      mastodonApiNotificationUserAccessService
          .getNotificationsFollowRequestTypeFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getNotificationsMinIdFeature =>
      mastodonApiNotificationUserAccessService.getNotificationsMinIdFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getNotificationsOnlyFromAccountWithIdFeature =>
      mastodonApiNotificationUserAccessService
          .getNotificationsOnlyFromAccountWithIdFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiNotification>> markAsReadList({
    required String maxNotificationId,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: markAsReadListFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get markAsReadListFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'markAsReadListFeature',
      );

  @override
  Future<IUnifediApiNotification> markAsReadSingle({
    required String notificationId,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: markAsReadSingleFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get markAsReadSingleFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'markAsReadSingleFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature get getNotificationIncludeTypesFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getNotificationIncludeTypesFeature',
      );

  @override
  UnifediApiTypeNotSupportedFeature
      get getNotificationExcludeVisibilitiesFeature =>
          const UnifediApiTypeNotSupportedFeature(
            target: 'getNotificationExcludeVisibilitiesFeature',
          );

  @override
  List<UnifediApiNotificationType>
      calculatePossibleExcludeNotificationTypes() =>
          mastodonApiNotificationUserAccessService
              .calculatePossibleExcludeNotificationTypes()
              .toUnifediApiNotificationTypeList();

  @override
  List<UnifediApiVisibility> calculatePossibleExcludeVisibilitiesValues() {
    throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
      feature: getNotificationExcludeVisibilitiesFeature,
    );
  }

  @override
  List<UnifediApiNotificationType> calculatePossibleIncludeNotificationTypes() {
    throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
      feature: getNotificationIncludeTypesFeature,
    );
  }
}
