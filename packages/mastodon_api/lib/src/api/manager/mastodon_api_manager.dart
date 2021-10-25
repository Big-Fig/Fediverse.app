import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

import '../access/mastodon_api_access_bloc.dart';
import '../account/my/service/access/user/mastodon_api_my_account_user_access_service.dart';
import '../account/service/access/application/mastodon_api_account_application_access_service.dart';
import '../account/service/access/public/mastodon_api_account_public_access_service.dart';
import '../account/service/access/user/mastodon_api_account_user_access_service.dart';
import '../announcement/service/access/user/mastodon_api_announcement_user_access_service.dart';
import '../conversation/service/access/user/mastodon_api_conversation_user_access_service.dart';
import '../filter/service/access/user/mastodon_api_filter_user_access_service.dart';
import '../instance/service/access/public/mastodon_api_instance_public_access_service.dart';
import '../list/service/access/user/mastodon_api_list_user_access_service.dart';
import '../marker/service/access/user/mastodon_api_marker_user_access_service.dart';
import '../media/attachment/service/access/user/mastodon_api_media_attachment_user_access_service.dart';
import '../notification/service/access/user/mastodon_api_notification_user_access_service.dart';
import '../poll/service/access/public/mastodon_api_poll_public_access_service.dart';
import '../poll/service/access/user/mastodon_api_poll_user_access_service.dart';
import '../push/subscription/service/access/user/mastodon_api_push_subscription_user_access_service.dart';
import '../rest/mastodon_api_rest_service.dart';
import '../search/service/access/user/mastodon_api_search_user_access_service.dart';
import '../status/service/access/public/mastodon_api_status_public_access_service.dart';
import '../status/service/access/user/mastodon_api_status_user_access_service.dart';
import '../timeline/service/access/public/mastodon_api_timeline_public_access_service.dart';
import '../timeline/service/access/user/mastodon_api_timeline_user_access_service.dart';
import '../web_sockets/mastodon_api_web_sockets_service.dart';

abstract class IMastodonApiManager implements IDisposable {
  IMastodonApiAccessBloc get accessBloc;

  IRestService get restService;

  IWebSocketsService get webSocketsService;

  IMastodonApiRestService get apiRestService;

  IMastodonApiAccountPublicAccessService createAccountPublicAccessService();

  IMastodonApiAccountApplicationAccessService
      createAccountApplicationAccessService();

  IMastodonApiAccountUserAccessService createAccountUserAccessService();

  IMastodonApiMyAccountUserAccessService createMyAccountUserAccessService();

  IMastodonApiAnnouncementUserAccessService
      createAnnouncementUserAccessService();

  IMastodonApiConversationUserAccessService
      createConversationUserAccessService();

  IMastodonApiFilterUserAccessService createFilterUserAccessService();

  IMastodonApiInstancePublicAccessService createInstancePublicAccessService();

  IMastodonApiListUserAccessService createListUserAccessService();

  IMastodonApiMarkerUserAccessService createMarkerUserAccessService();

  IMastodonApiMediaAttachmentUserAccessService
      createMediaAttachmentUserAccessService();

  IMastodonApiNotificationUserAccessService
      createNotificationUserAccessService();

  IMastodonApiPushSubscriptionUserAccessService
      createPushSubscriptionUserAccessService();

  IMastodonApiSearchUserAccessService createSearchUserAccessService();

  IMastodonApiStatusPublicAccessService createStatusPublicAccessService();

  IMastodonApiStatusUserAccessService createStatusUserAccessService();

  IMastodonApiTimelinePublicAccessService createTimelinePublicAccessService();

  IMastodonApiTimelineUserAccessService createTimelineUserAccessService();

  IMastodonApiPollPublicAccessService createPollPublicAccessService();

  IMastodonApiPollUserAccessService createPollUserAccessService();

  IMastodonApiWebSocketsService createWebSocketsService();
}
