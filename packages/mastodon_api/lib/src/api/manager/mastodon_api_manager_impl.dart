import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

import '../access/mastodon_api_access_bloc.dart';
import '../account/my/service/access/user/mastodon_api_my_account_user_access_service_impl.dart';
import '../account/service/access/application/mastodon_api_account_application_access_service_impl.dart';
import '../account/service/access/public/mastodon_api_account_public_access_service_impl.dart';
import '../account/service/access/user/mastodon_api_account_user_access_service_impl.dart';
import '../announcement/service/access/user/mastodon_api_announcement_user_access_service_impl.dart';
import '../conversation/service/access/user/mastodon_api_conversation_user_access_service_impl.dart';
import '../filter/service/access/user/mastodon_api_filter_user_access_service_impl.dart';
import '../instance/service/access/public/mastodon_api_instance_public_access_service_impl.dart';
import '../list/service/access/user/mastodon_api_list_user_access_service_impl.dart';
import '../marker/service/access/user/mastodon_api_marker_user_access_service_impl.dart';
import '../media/attachment/service/access/user/mastodon_api_media_attachment_user_access_service_impl.dart';
import '../notification/service/access/user/mastodon_api_notification_user_access_service_impl.dart';
import '../poll/service/access/public/mastodon_api_poll_public_access_service_impl.dart';
import '../poll/service/access/user/mastodon_api_poll_user_access_service_impl.dart';
import '../push/subscription/service/access/user/mastodon_api_push_subscription_user_access_service_impl.dart';
import '../rest/mastodon_api_rest_service_impl.dart';
import '../search/service/access/user/mastodon_api_search_user_access_service_impl.dart';
import '../status/service/access/public/mastodon_api_status_public_access_service_impl.dart';
import '../status/service/access/user/mastodon_api_status_user_access_service_impl.dart';
import '../timeline/service/access/public/mastodon_api_timeline_public_access_service_impl.dart';
import '../timeline/service/access/user/mastodon_api_timeline_user_access_service_impl.dart';
import '../web_sockets/mastodon_api_web_sockets_service_impl.dart';
import 'mastodon_api_manager.dart';

class MastodonApiManager extends DisposableOwner
    implements IMastodonApiManager {
  @override
  final IMastodonApiAccessBloc accessBloc;

  @override
  final MastodonApiRestService apiRestService;
  @override
  final IWebSocketsService webSocketsService;
  @override
  final IRestService restService;

  MastodonApiManager({
    required this.accessBloc,
    required this.restService,
    required this.webSocketsService,
  }) : apiRestService = MastodonApiRestService(
          accessBloc: accessBloc,
          restService: restService,
        );

  @override
  MastodonApiAccountApplicationAccessService
      createAccountApplicationAccessService() =>
          MastodonApiAccountApplicationAccessService(
            restService: apiRestService,
          );

  @override
  MastodonApiAccountPublicAccessService createAccountPublicAccessService() =>
      MastodonApiAccountPublicAccessService(
        restService: apiRestService,
      );

  @override
  MastodonApiAccountUserAccessService createAccountUserAccessService() =>
      MastodonApiAccountUserAccessService(
        restService: apiRestService,
      );

  @override
  MastodonApiAnnouncementUserAccessService
      createAnnouncementUserAccessService() =>
          MastodonApiAnnouncementUserAccessService(
            restService: apiRestService,
          );

  @override
  MastodonApiMyAccountUserAccessService createMyAccountUserAccessService() =>
      MastodonApiMyAccountUserAccessService(
        restService: apiRestService,
      );

  @override
  MastodonApiConversationUserAccessService
      createConversationUserAccessService() =>
          MastodonApiConversationUserAccessService(
            restService: apiRestService,
          );

  @override
  MastodonApiFilterUserAccessService createFilterUserAccessService() =>
      MastodonApiFilterUserAccessService(
        restService: apiRestService,
      );

  @override
  MastodonApiInstancePublicAccessService createInstancePublicAccessService() =>
      MastodonApiInstancePublicAccessService(
        restService: apiRestService,
      );

  @override
  MastodonApiListUserAccessService createListUserAccessService() =>
      MastodonApiListUserAccessService(
        restService: apiRestService,
      );

  @override
  MastodonApiMarkerUserAccessService createMarkerUserAccessService() =>
      MastodonApiMarkerUserAccessService(
        restService: apiRestService,
      );

  @override
  MastodonApiMediaAttachmentUserAccessService
      createMediaAttachmentUserAccessService() =>
          MastodonApiMediaAttachmentUserAccessService(
            restService: apiRestService,
          );

  @override
  MastodonApiNotificationUserAccessService
      createNotificationUserAccessService() =>
          MastodonApiNotificationUserAccessService(
            restService: apiRestService,
          );

  @override
  MastodonApiPushSubscriptionUserAccessService
      createPushSubscriptionUserAccessService() =>
          MastodonApiPushSubscriptionUserAccessService(
            restService: apiRestService,
          );

  @override
  MastodonApiSearchUserAccessService createSearchUserAccessService() =>
      MastodonApiSearchUserAccessService(
        restService: apiRestService,
      );

  @override
  MastodonApiStatusPublicAccessService createStatusPublicAccessService() =>
      MastodonApiStatusPublicAccessService(
        restService: apiRestService,
      );

  @override
  MastodonApiStatusUserAccessService createStatusUserAccessService() =>
      MastodonApiStatusUserAccessService(
        restService: apiRestService,
      );

  @override
  MastodonApiTimelinePublicAccessService createTimelinePublicAccessService() =>
      MastodonApiTimelinePublicAccessService(
        restService: apiRestService,
      );

  @override
  MastodonApiTimelineUserAccessService createTimelineUserAccessService() =>
      MastodonApiTimelineUserAccessService(
        restService: apiRestService,
      );

  @override
  MastodonApiPollUserAccessService createPollUserAccessService() =>
      MastodonApiPollUserAccessService(
        restService: apiRestService,
      );

  @override
  MastodonApiPollPublicAccessService createPollPublicAccessService() =>
      MastodonApiPollPublicAccessService(
        restService: apiRestService,
      );

  @override
  MastodonApiWebSocketsService createWebSocketsService() =>
      MastodonApiWebSocketsService(
        accessBloc: accessBloc,
        webSocketsService: webSocketsService,
      );
}
