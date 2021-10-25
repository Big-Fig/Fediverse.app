import 'package:easy_dispose/easy_dispose.dart';

import '../account/my/service/unifedi_api_my_account_service.dart';
import '../account/service/unifedi_api_account_service.dart';
import '../announcement/service/unifedi_api_announcement_service.dart';
import '../chat/service/unifedi_api_chat_service.dart';
import '../conversation/service/unifedi_api_conversation_service.dart';
import '../filter/service/unifedi_api_filter_service.dart';
import '../instance/service/unifedi_api_instance_service.dart';
import '../list/service/unifedi_api_list_service.dart';
import '../marker/service/unifedi_api_marker_service.dart';
import '../media/attachment/service/unifedi_api_media_attachment_service.dart';
import '../notification/service/unifedi_api_notification_service.dart';
import '../poll/service/unifedi_api_poll_service.dart';
import '../push/subscription/service/unifedi_api_push_subscription_service.dart';
import '../search/service/unifedi_api_search_service.dart';
import '../status/service/unifedi_api_status_service.dart';
import '../timeline/service/unifedi_api_timeline_service.dart';
import '../web_sockets/unifedi_api_web_sockets_service.dart';

abstract class IUnifediApiManager implements ICompositeDisposable {
  IUnifediApiAccountService createAccountService();

  IUnifediApiMyAccountService createMyAccountService();

  IUnifediApiAnnouncementService createAnnouncementService();

  IUnifediApiChatService createChatService();

  IUnifediApiConversationService createConversationService();

  IUnifediApiFilterService createFilterService();

  IUnifediApiInstanceService createInstanceService();

  IUnifediApiListService createListService();

  IUnifediApiMarkerService createMarkerService();

  IUnifediApiMediaAttachmentService createMediaAttachmentService();

  IUnifediApiNotificationService createNotificationService();

  IUnifediApiPushSubscriptionService createPushSubscriptionService();

  IUnifediApiSearchService createSearchService();

  IUnifediApiStatusService createStatusService();

  IUnifediApiTimelineService createTimelineService();

  IUnifediApiPollService createPollService();

  IUnifediApiWebSocketsService createWebSocketsService();
}
