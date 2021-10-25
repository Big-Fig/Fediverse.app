import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../../service/mastodon_api_service_impl.dart';
import '../../../mastodon_api_notification_model.dart';
import '../../../mastodon_api_notification_model_impl.dart';
import '../../../type/mastodon_api_notification_type_sealed.dart';
import 'mastodon_api_notification_user_access_service.dart';

class MastodonApiNotificationUserAccessService extends MastodonApiService
    implements IMastodonApiNotificationUserAccessService {
  final notificationRelativeUrlPath = 'api/v1/notifications';

  MastodonApiNotificationUserAccessService({
    required IMastodonApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<IMastodonApiNotification> getNotification({
    required String notificationId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getNotificationFeature,
        fieldFeatures: null,
        request: createGetNotificationRequest(
          notificationId: notificationId,
        ),
        jsonParser: (json) => MastodonApiNotification.fromJson(json),
      );

  RestRequest createGetNotificationRequest({
    required String notificationId,
  }) =>
      RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            notificationRelativeUrlPath,
            notificationId,
          ],
        ),
      );

  @override
  Future<List<IMastodonApiNotification>> getNotifications({
    required IMastodonApiPagination? pagination,
    required List<MastodonApiNotificationType>? excludeTypes,
    required String? onlyFromAccountId,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getNotificationsFeature,
        fieldFeatures: [
          if (pagination?.minId != null) getNotificationsMinIdFeature,
          if (onlyFromAccountId != null)
            getNotificationsOnlyFromAccountWithIdFeature,
          if (excludeTypes
                  ?.contains(MastodonApiNotificationType.followRequestValue) ==
              true)
            getNotificationsFollowRequestTypeFeature,
        ],
        request: createGetNotificationsRequest(
          pagination: pagination,
          excludeTypes: excludeTypes,
          onlyFromAccountId: onlyFromAccountId,
        ),
        jsonParser: (json) => MastodonApiNotification.fromJson(json),
      );

  RestRequest createGetNotificationsRequest({
    required IMastodonApiPagination? pagination,
    required List<MastodonApiNotificationType>? excludeTypes,
    required String? onlyFromAccountId,
  }) =>
      RestRequest.get(
        relativePath: notificationRelativeUrlPath,
        queryArgs: [
          if (pagination != null) ...pagination.toQueryArgs(),
          if (onlyFromAccountId != null)
            UrlQueryArg(
              key: 'account_id',
              value: onlyFromAccountId,
            ),
          if (excludeTypes != null && excludeTypes.isNotEmpty)
            ...excludeTypes.map(
              (excludeType) => UrlQueryArg(
                key: 'exclude_types[]',
                value: excludeType.stringValue,
              ),
            ),
        ],
      );

  @override
  Future<void> dismissNotification({
    required String notificationId,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: dismissNotificationFeature,
        fieldFeatures: null,
        request: createDismissNotificationRequest(
          notificationId: notificationId,
        ),
      );

  RestRequest createDismissNotificationRequest({
    required String notificationId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            notificationRelativeUrlPath,
            notificationId,
            'dismiss',
          ],
        ),
      );

  @override
  Future<void> dismissAll() => restService.sendHttpRequestAndProcessEmpty(
        requestFeature: dismissAllFeature,
        fieldFeatures: null,
        request: createDismissAllRequest(),
      );

  RestRequest createDismissAllRequest() => RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            notificationRelativeUrlPath,
            'clear',
          ],
        ),
      );

  @override
  IMastodonApiFeature get dismissAllFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeNotifications,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature get dismissNotificationFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeNotifications,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast1_3_0,
      );

  @override
  IMastodonApiFeature get getNotificationFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readNotifications,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  MastodonApiFeature get getNotificationsFeature => MastodonApiFeature(
        accessLevelRequirement:
            MastodonApiAccessLevelRequirement.userRequirement,
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.readNotifications,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.any,
      );

  @override
  IMastodonApiFeature get getNotificationsMinIdFeature =>
      getNotificationsFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_6_0,
      );

  @override
  IMastodonApiFeature get getNotificationsOnlyFromAccountWithIdFeature =>
      getNotificationsFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast2_9_0,
      );

  @override
  IMastodonApiFeature get getNotificationsFollowRequestTypeFeature =>
      getNotificationsFeature.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_1_0,
      );

  @override
  List<MastodonApiNotificationType>
      calculatePossibleExcludeNotificationTypes() =>
          MastodonApiNotificationType.values;
}
