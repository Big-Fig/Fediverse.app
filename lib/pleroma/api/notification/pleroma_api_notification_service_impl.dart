import 'package:fedi/pleroma/api/notification/pleroma_api_notification_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:path/path.dart';

class PleromaApiNotificationService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaApiNotificationService {
  final notificationRelativeUrlPath = 'api/v1/notifications';
  final pleromaNotificationRelativeUrlPath = 'api/v1/pleroma/notifications';

  @override
  final IPleromaApiAuthRestService restApiAuthService;

  PleromaApiNotificationService({
    required this.restApiAuthService,
  }) : super(
          restService: restApiAuthService,
        );

  @override
  Future<IPleromaApiNotification> getNotification({
    required String notificationRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: join(
          notificationRelativeUrlPath,
          notificationRemoteId,
        ),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiNotification.fromJson,
    );
  }

  @override
  Future<IPleromaApiNotification> markAsReadSingle({
    required String? notificationRemoteId,
  }) async {
    assert(
    restApiAuthService.isPleroma,
      'markAsRead notification works only on pleroma',
    );

    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: join(
          pleromaNotificationRelativeUrlPath,
          'read',
        ),
        bodyJson: <String, dynamic>{
          'id': notificationRemoteId,
        },
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiNotification.fromJson,
    );
  }

  @override
  Future<List<IPleromaApiNotification>> markAsReadList({
    required String? maxNotificationRemoteId,
  }) async {
    assert(
    restApiAuthService.isPleroma,
      'markAsRead notification works only on pleroma',
    );

    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: join(
          pleromaNotificationRelativeUrlPath,
          'read',
        ),
        bodyJson: <String, dynamic>{
          if (maxNotificationRemoteId != null)
            'max_id': maxNotificationRemoteId,
        },
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiNotification.fromJson,
    );
  }

  @override
  Future<List<IPleromaApiNotification>> getNotifications({
    IPleromaApiPaginationRequest? pagination,
    List<PleromaApiNotificationType>? excludeTypes,
    String? onlyFromAccountRemoteId,
    List<PleromaApiNotificationType>? includeTypes,
    List<PleromaApiVisibility>? excludeVisibilities,
  }) async {
    _checkGetNotificationsIncludeTypes(includeTypes);

    _checkGetNotificationsExcludeVisibilities(excludeVisibilities);
    excludeTypes = _checkGetNotificationsExcludeTypes(excludeTypes);

    _checkGetNotificationsOnlyFromAccountRemoteId(onlyFromAccountRemoteId);

    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: notificationRelativeUrlPath,
        queryArgs: [
          if (pagination != null) ...pagination.toQueryArgs(),
          if (excludeTypes?.isNotEmpty == true)
            ...excludeTypes?.map(
                  (excludeType) => RestRequestQueryArg(
                    key: 'exclude_types[]',
                    value: excludeType.toJsonValue(),
                  ),
                ) ??
                [],
          if (includeTypes?.isNotEmpty == true)
            ...includeTypes?.map(
                  (includeType) => RestRequestQueryArg(
                    key: 'include_types[]',
                    value: includeType.toJsonValue(),
                  ),
                ) ??
                [],
          if (excludeVisibilities?.isNotEmpty == true)
            ...excludeVisibilities?.map(
                  (excludeVisibility) => RestRequestQueryArg(
                    key: 'exclude_visibilities[]',
                    value: excludeVisibility.toJsonValue(),
                  ),
                ) ??
                [],
        ],
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiNotification.fromJson,
    );
  }

  void _checkGetNotificationsOnlyFromAccountRemoteId(
    String? onlyFromAccountRemoteId,
  ) {
    if (onlyFromAccountRemoteId != null) {
      // todo: remove when pleroma will support
      assert(
      restApiAuthService.isMastodon,
        'Not supported on Pleroma. '
        'onlyFromAccountRemoteId added only in Mastodon 2.9.0 '
        'but Pleroma targets Mastodon 2.7.2 API',
      );
    }
  }

  List<PleromaApiNotificationType>? _checkGetNotificationsExcludeTypes(
    List<PleromaApiNotificationType>? excludeTypes,
  ) {
    if (excludeTypes?.isNotEmpty == true) {
      if (restApiAuthService.isMastodon) {
        excludeTypes = excludeTypes!
            .where(
              (excludeType) => IPleromaApiNotificationService
                  .validMastodonTypesToExclude
                  .contains(excludeType),
            )
            .toList();
      } else if (restApiAuthService.isPleroma) {
        excludeTypes = excludeTypes!
            .where(
              (excludeType) => IPleromaApiNotificationService
                  .validPleromaTypesToExclude
                  .contains(excludeType),
            )
            .toList();
      }
    }

    return excludeTypes;
  }

  void _checkGetNotificationsExcludeVisibilities(
    List<PleromaApiVisibility>? excludeVisibilities,
  ) {
    if (excludeVisibilities?.isNotEmpty == true) {
      assert(restApiAuthService.isPleroma);
      for (var excludeVisibility in excludeVisibilities!) {
        assert(
          IPleromaApiNotificationService.validPleromaVisibilityToExclude
              .contains(excludeVisibility),
          'excludeVisibility $excludeVisibility not supported on backend',
        );
      }
    }
  }

  void _checkGetNotificationsIncludeTypes(
    List<PleromaApiNotificationType>? includeTypes,
  ) {
    if (includeTypes?.isNotEmpty == true) {
      assert(restApiAuthService.isPleroma);
      for (var includeType in includeTypes!) {
        assert(
          IPleromaApiNotificationService.validPleromaTypesToInclude
              .contains(includeType),
          'includeType $includeType not supported on backend',
        );
      }
    }
  }

  @override
  Future dismissNotification({
    required String? notificationRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: join(
          notificationRelativeUrlPath,
          notificationRemoteId,
          'dismiss',
        ),
      ),
    );

    return restService.processEmptyResponse(httpResponse);
  }

  @override
  Future dismissAll() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: join(
          notificationRelativeUrlPath,
          'clear',
        ),
      ),
    );

    return restService.processEmptyResponse(httpResponse);
  }
}
