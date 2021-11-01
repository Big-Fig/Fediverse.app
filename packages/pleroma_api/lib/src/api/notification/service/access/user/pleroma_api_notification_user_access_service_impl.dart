import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../requirement/access/level/pleroma_api_access_level_requirement_model_impl.dart';
import '../../../../requirement/access/scopes/pleroma_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/pleroma_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../../service/pleroma_api_service_impl.dart';
import '../../../../visibility/pleroma_api_visibility_sealed.dart';
import '../../../pleroma_api_notification_model.dart';
import '../../../pleroma_api_notification_model_impl.dart';
import '../../../type/pleroma_api_notification_type_sealed.dart';
import 'pleroma_api_notification_user_access_service.dart';

class PleromaApiNotificationUserAccessService extends PleromaApiService
    implements IPleromaApiNotificationUserAccessService {
  static const pleromaNotificationRelativeUrlPath =
      'api/v1/pleroma/notifications';

  final MastodonApiNotificationUserAccessService
      mastodonApiNotificationUserAccessService;

  PleromaApiNotificationUserAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiNotificationUserAccessService =
            MastodonApiNotificationUserAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(
          restService: restService,
        ) {
    mastodonApiNotificationUserAccessService.disposeWith(this);
  }

  @override
  Future<IPleromaApiNotification> getNotification({
    required String notificationId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getNotificationFeature,
        fieldFeatures: null,
        request: mastodonApiNotificationUserAccessService
            .createGetNotificationRequest(
          notificationId: notificationId,
        ),
        jsonParser: (json) => PleromaApiNotification.fromJson(json),
      );

  @override
  Future<IPleromaApiNotification> markAsReadSingle({
    required String notificationId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: markAsReadSingleFeature,
        fieldFeatures: null,
        request: RestRequest.post(
          relativePath: UrlPathHelper.join(
            [
              pleromaNotificationRelativeUrlPath,
              'read',
            ],
          ),
          bodyJson: <String, dynamic>{
            'id': notificationId,
          },
        ),
        jsonParser: (json) => PleromaApiNotification.fromJson(json),
      );

  @override
  Future<List<IPleromaApiNotification>> markAsReadList({
    required String? maxNotificationId,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: markAsReadListFeature,
        fieldFeatures: null,
        request: RestRequest.post(
          relativePath: UrlPathHelper.join(
            [
              pleromaNotificationRelativeUrlPath,
              'read',
            ],
          ),
          bodyJson: <String, dynamic>{
            if (maxNotificationId != null) 'max_id': maxNotificationId,
          },
        ),
        jsonParser: (json) => PleromaApiNotification.fromJson(json),
      );

  @override
  Future<List<IPleromaApiNotification>> getNotifications({
    required IPleromaApiPagination? pagination,
    required List<PleromaApiNotificationType>? excludeTypes,
    required String? onlyFromAccountId,
    required List<PleromaApiNotificationType>? includeTypes,
    required List<PleromaApiVisibility>? excludeVisibilities,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getNotificationsFeature,
        fieldFeatures: [
          if (pagination?.minId != null) getNotificationsMinIdFeature,
          if (onlyFromAccountId != null)
            getNotificationsOnlyFromAccountWithIdFeature,
          if (excludeTypes
                  ?.contains(PleromaApiNotificationType.followRequestValue) ==
              true)
            getNotificationsFollowRequestTypeFeature,
        ],
        request: mastodonApiNotificationUserAccessService
            .createGetNotificationsRequest(
          pagination: pagination,
          excludeTypes: null,
          onlyFromAccountId: onlyFromAccountId,
        )
            .copyAndAppend(
          queryArgs: [
            if (excludeTypes != null && excludeTypes.isNotEmpty)
              ...excludeTypes.map(
                (excludeType) => UrlQueryArg(
                  key: 'exclude_types[]',
                  value: excludeType.stringValue,
                ),
              ),
            if (includeTypes != null && includeTypes.isNotEmpty)
              ...includeTypes.map(
                (includeType) => UrlQueryArg(
                  key: 'include_types[]',
                  value: includeType.stringValue,
                ),
              ),
            if (excludeVisibilities != null && excludeVisibilities.isNotEmpty)
              ...excludeVisibilities.map(
                (excludeVisibility) => UrlQueryArg(
                  key: 'exclude_visibilities[]',
                  value: excludeVisibility.stringValue,
                ),
              ),
          ],
        ),
        jsonParser: (json) => PleromaApiNotification.fromJson(json),
      );

  @override
  Future<void> dismissNotification({
    required String notificationId,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: dismissNotificationFeature,
        fieldFeatures: null,
        request: mastodonApiNotificationUserAccessService
            .createDismissNotificationRequest(
          notificationId: notificationId,
        ),
      );

  @override
  Future<void> dismissAll() => restService.sendHttpRequestAndProcessEmpty(
        requestFeature: dismissAllFeature,
        fieldFeatures: null,
        request:
            mastodonApiNotificationUserAccessService.createDismissAllRequest(),
      );

  @override
  IPleromaApiFeature get dismissAllFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiNotificationUserAccessService.dismissAllFeature,
      );

  @override
  IPleromaApiFeature get dismissNotificationFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiNotificationUserAccessService.dismissNotificationFeature,
      );

  @override
  IPleromaApiFeature get getNotificationFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiNotificationUserAccessService.getNotificationFeature,
      );

  @override
  IPleromaApiFeature get getNotificationsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiNotificationUserAccessService.getNotificationsFeature,
      );

  @override
  IPleromaApiFeature get markAsReadListFeature => PleromaApiFeature(
        mastodonApiFeature: null,
        accessLevelRequirement:
            PleromaApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            PleromaApiAccessScopesRequirement.writeNotifications,
        instanceVersionRequirement:
            PleromaApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IPleromaApiFeature get markAsReadSingleFeature => PleromaApiFeature(
        mastodonApiFeature: null,
        accessLevelRequirement:
            PleromaApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            PleromaApiAccessScopesRequirement.writeNotifications,
        instanceVersionRequirement:
            PleromaApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IPleromaApiFeature get getNotificationsFollowRequestTypeFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiNotificationUserAccessService
            .getNotificationsFollowRequestTypeFeature,
      );

  @override
  IPleromaApiFeature get getNotificationsMinIdFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiNotificationUserAccessService.getNotificationsMinIdFeature,
      );

  @override
  IPleromaApiFeature get getNotificationsOnlyFromAccountWithIdFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiNotificationUserAccessService
            .getNotificationsOnlyFromAccountWithIdFeature,
      );

  @override
  List<PleromaApiNotificationType>
      calculatePossibleExcludeNotificationTypes() =>
          PleromaApiNotificationType.values;

  @override
  List<PleromaApiVisibility> calculatePossibleExcludeVisibilitiesValues() =>
      PleromaApiVisibility.calculatePossibleExcludeVisibilitiesValues();

  @override
  List<PleromaApiNotificationType>
      calculatePossibleIncludeNotificationTypes() =>
          PleromaApiNotificationType.values;
}
