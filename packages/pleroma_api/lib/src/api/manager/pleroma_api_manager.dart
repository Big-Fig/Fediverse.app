import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

import '../access/pleroma_api_access_bloc.dart';
import '../account/my/service/access/user/pleroma_api_my_account_user_access_service.dart';
import '../account/service/access/application/pleroma_api_account_application_access_service.dart';
import '../account/service/access/public/pleroma_api_account_public_access_service.dart';
import '../account/service/access/user/pleroma_api_account_user_access_service.dart';
import '../announcement/service/access/user/pleroma_api_announcement_user_access_service.dart';
import '../chat/service/access/user/pleroma_api_chat_user_access_service.dart';
import '../conversation/service/access/user/pleroma_api_conversation_user_access_service.dart';
import '../filter/service/access/user/pleroma_api_filter_user_access_service.dart';
import '../instance/service/access/public/pleroma_api_instance_public_access_service.dart';
import '../list/service/access/user/pleroma_api_list_user_access_service.dart';
import '../marker/service/access/user/pleroma_api_marker_user_access_service.dart';
import '../media/attachment/service/access/user/pleroma_api_media_attachment_user_access_service.dart';
import '../notification/service/access/user/pleroma_api_notification_user_access_service.dart';
import '../poll/service/access/public/pleroma_api_poll_public_access_service.dart';
import '../poll/service/access/user/pleroma_api_poll_user_access_service.dart';
import '../push/subscription/service/access/user/pleroma_api_push_subscription_user_access_service.dart';
import '../rest/pleroma_api_rest_service.dart';
import '../search/service/access/user/pleroma_api_search_user_access_service.dart';
import '../status/service/access/public/pleroma_api_status_public_access_service.dart';
import '../status/service/access/user/pleroma_api_status_user_access_service.dart';
import '../timeline/service/access/public/pleroma_api_timeline_public_access_service.dart';
import '../timeline/service/access/user/pleroma_api_timeline_user_access_service.dart';
import '../web_sockets/pleroma_api_web_sockets_service.dart';

abstract class IPleromaApiManager implements IDisposable {
  IPleromaApiAccessBloc get accessBloc;

  IRestService get restService;

  IWebSocketsService get webSocketsService;

  IPleromaApiRestService get apiRestService;

  IPleromaApiAccountPublicAccessService createAccountPublicAccessService();

  IPleromaApiAccountApplicationAccessService
      createAccountApplicationAccessService();

  IPleromaApiAccountUserAccessService createAccountUserAccessService();

  IPleromaApiMyAccountUserAccessService createMyAccountUserAccessService();

  IPleromaApiAnnouncementUserAccessService
      createAnnouncementUserAccessService();

  IPleromaApiChatUserAccessService createChatUserAccessService();

  IPleromaApiConversationUserAccessService
      createConversationUserAccessService();

  IPleromaApiFilterUserAccessService createFilterUserAccessService();

  IPleromaApiInstancePublicAccessService createInstancePublicAccessService();

  IPleromaApiListUserAccessService createListUserAccessService();

  IPleromaApiMarkerUserAccessService createMarkerUserAccessService();

  IPleromaApiMediaAttachmentUserAccessService
      createMediaAttachmentUserAccessService();

  IPleromaApiNotificationUserAccessService
      createNotificationUserAccessService();

  IPleromaApiPushSubscriptionUserAccessService
      createPushSubscriptionUserAccessService();

  IPleromaApiSearchUserAccessService createSearchUserAccessService();

  IPleromaApiStatusPublicAccessService createStatusPublicAccessService();

  IPleromaApiStatusUserAccessService createStatusUserAccessService();

  IPleromaApiTimelinePublicAccessService createTimelinePublicAccessService();

  IPleromaApiTimelineUserAccessService createTimelineUserAccessService();

  IPleromaApiPollUserAccessService createPollUserAccessService();

  IPleromaApiPollPublicAccessService createPollPublicAccessService();

  IPleromaApiWebSocketsService createWebSocketsService();
}
