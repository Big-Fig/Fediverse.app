// ignore_for_file: cascade_invocations

import 'package:fediverse_api/fediverse_api.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../api/access/level/unifedi_api_access_level_model_impl.dart';
import '../api/access/scopes/item/unifedi_api_access_scopes_item_model_impl.dart';
import '../api/access/scopes/unifedi_api_access_scopes_model_impl.dart';
import '../api/access/token/application/unifedi_api_access_application_token_model_impl.dart';
import '../api/access/token/user/unifedi_api_access_user_token_model_impl.dart';
import '../api/access/unifedi_api_access_model_impl.dart';
import '../api/account/identity_proof/unifedi_api_account_identity_proof_model_impl.dart';
import '../api/account/my/edit/unifedi_api_edit_my_account_model_impl.dart';
import '../api/account/my/notifications_settings/unifedi_api_my_account_notifications_settings_model_impl.dart';
import '../api/account/my/unifedi_api_my_account_model_impl.dart';
import '../api/account/relationship/unifedi_api_account_relationship_model_impl.dart';
import '../api/account/report/unifedi_api_account_report_model_impl.dart';
import '../api/account/unifedi_api_account_model_impl.dart';
import '../api/announcement/unifedi_api_announcement_model_impl.dart';
import '../api/application/client/unifedi_api_client_application_model_impl.dart';
import '../api/application/unifedi_api_application_model_impl.dart';
import '../api/captcha/unifedi_api_captcha_model_impl.dart';
import '../api/card/unifedi_api_card_model_impl.dart';
import '../api/chat/message/unifedi_api_chat_message_model_impl.dart';
import '../api/chat/unifedi_api_chat_model_impl.dart';
import '../api/content/variants/unifedi_api_content_variants_model_impl.dart';
import '../api/conversation/unifedi_api_conversation_model_impl.dart';
import '../api/emoji/unifedi_api_emoji_model_impl.dart';
import '../api/field/unifedi_api_field_model_impl.dart';
import '../api/filter/post/unifedi_api_post_filter_model_impl.dart';
import '../api/filter/unifedi_api_filter_model_impl.dart';
import '../api/frontend_configurations/unifedi_api_frontend_configurations_model_impl.dart';
import '../api/instance/activity/item/unifedi_api_instance_activity_item_model_impl.dart';
import '../api/instance/activity/unifedi_api_instance_activity_model_impl.dart';
import '../api/instance/federation/mfr/object_age/unifedi_api_instance_federation_mfr_object_age_model_impl.dart';
import '../api/instance/federation/unifedi_api_instance_federation_model_impl.dart';
import '../api/instance/limits/chat/unifedi_api_instance_chat_limits_model_impl.dart';
import '../api/instance/limits/field/unifedi_api_instance_field_limits_model_impl.dart';
import '../api/instance/limits/media/unifedi_api_instance_media_limits_model_impl.dart';
import '../api/instance/limits/poll/unifedi_api_instance_poll_limits_model_impl.dart';
import '../api/instance/limits/status/unifedi_api_instance_status_limits_model_impl.dart';
import '../api/instance/limits/unifedi_api_instance_limits_model_impl.dart';
import '../api/instance/stats/unifedi_api_instance_stats_model_impl.dart';
import '../api/instance/unifedi_api_instance_model_impl.dart';
import '../api/instance/urls/unifedi_api_instance_urls_model_impl.dart';
import '../api/list/unifedi_api_list_model_impl.dart';
import '../api/marker/unifedi_api_marker_model_impl.dart';
import '../api/media/attachment/focus/unifedi_api_media_attachment_focus_model_impl.dart';
import '../api/media/attachment/meta/unifedi_api_media_attachment_meta_model_impl.dart';
import '../api/media/attachment/size/unifedi_api_media_attachment_size_model_impl.dart';
import '../api/media/attachment/unifedi_api_media_attachment_model_impl.dart';
import '../api/mention/unifedi_api_mention_model_impl.dart';
import '../api/notification/unifedi_api_notification_model_impl.dart';
import '../api/oauth/unifedi_api_oauth_model_impl.dart';
import '../api/pagination/unifedi_api_pagination_model_impl.dart';
import '../api/poll/option/unifedi_api_poll_option_model_impl.dart';
import '../api/poll/unifedi_api_poll_model_impl.dart';
import '../api/push/payload/unifedi_api_push_payload_model_impl.dart';
import '../api/push/subscription/alerts/unifedi_api_push_subscription_alerts_model_impl.dart';
import '../api/push/subscription/keys/unifedi_api_push_subscription_keys_model_impl.dart';
import '../api/push/subscription/metadata/unifedi_api_push_subscription_metadata_model_impl.dart';
import '../api/push/subscription/unifedi_api_push_subscription_model_impl.dart';
import '../api/search/unifedi_api_search_model_impl.dart';
import '../api/status/context/unifedi_api_status_context_model_impl.dart';
import '../api/status/post/poll/unifedi_api_post_status_poll_model_impl.dart';
import '../api/status/post/schedule/unifedi_api_schedule_post_status_model_impl.dart';
import '../api/status/post/unifedi_api_post_status_model_impl.dart';
import '../api/status/scheduled/params/unifedi_api_scheduled_status_params_model_impl.dart';
import '../api/status/scheduled/unifedi_api_scheduled_status_model_impl.dart';
import '../api/status/unifedi_api_status_model_impl.dart';
import '../api/tag/history/item/unifedi_api_tag_history_item_model_impl.dart';
import '../api/tag/unifedi_api_tag_model_impl.dart';
import '../api/web_sockets/channel/unifedi_api_web_sockets_channel_model_impl.dart';
import '../api/web_sockets/event/unifedi_api_web_sockets_event_model_impl.dart';
import '../mastodon/access/level/unifedi_api_access_level_model_mastodon_adapter.dart';
import '../mastodon/access/scopes/item/unifedi_api_access_scopes_item_model_mastodon_adapter.dart';
import '../mastodon/access/scopes/unifedi_api_access_scopes_model_mastodon_adapter.dart';
import '../mastodon/access/unifedi_api_access_model_mastodon_adapter.dart';
import '../mastodon/account/identity_proof/unifedi_api_account_identity_proof_model_mastodon_adapter.dart';
import '../mastodon/account/my/unifedi_api_my_account_model_mastodon_adapter.dart';
import '../mastodon/account/relationship/unifedi_api_account_relationship_model_mastodon_adapter.dart';
import '../mastodon/account/unifedi_api_account_model_mastodon_adapter.dart';
import '../mastodon/announcement/emoji_reaction/unifedi_api_announcement_emoji_reaction_model_mastodon_adapter.dart';
import '../mastodon/announcement/unifedi_api_announcement_model_mastodon_adapter.dart';
import '../mastodon/application/client/unifedi_api_client_application_model_mastodon_adapter.dart';
import '../mastodon/application/unifedi_api_application_model_mastodon_adapter.dart';
import '../mastodon/card/unifedi_api_card_model_mastodon_adapter.dart';
import '../mastodon/conversation/unifedi_api_conversation_model_mastodon_adapter.dart';
import '../mastodon/emoji/unifedi_api_emoji_model_mastodon_adapter.dart';
import '../mastodon/feature/unifedi_api_feature_model_mastodon_adapter.dart';
import '../mastodon/featured_tags/unifedi_api_featured_tags_model_mastodon_adapter.dart';
import '../mastodon/field/unifedi_api_field_model_mastodon_adapter.dart';
import '../mastodon/filter/unifedi_api_filter_model_mastodon_adapter.dart';
import '../mastodon/instance/activity/item/unifedi_api_instance_activity_item_model_mastodon_adapter.dart';
import '../mastodon/instance/stats/unifedi_api_instance_stats_model_mastodon_adapter.dart';
import '../mastodon/instance/unifedi_api_instance_model_mastodon_adapter.dart';
import '../mastodon/instance/urls/unifedi_api_instance_urls_model_mastodon_adapter.dart';
import '../mastodon/list/unifedi_api_list_model_mastodon_adapter.dart';
import '../mastodon/marker/unifedi_api_marker_model_mastodon_adapter.dart';
import '../mastodon/media/attachment/focus/unifedi_api_media_attachment_focus_model_mastodon_adapter.dart';
import '../mastodon/media/attachment/meta/unifedi_api_media_attachment_meta_model_mastodon_adapter.dart';
import '../mastodon/media/attachment/size/unifedi_api_media_attachment_size_model_mastodon_adapter.dart';
import '../mastodon/media/attachment/unifedi_api_media_attachment_model_mastodon_adapter.dart';
import '../mastodon/mention/unifedi_api_mention_model_mastodon_adapter.dart';
import '../mastodon/notification/unifedi_api_notification_model_mastodon_adapter.dart';
import '../mastodon/oauth/unifedi_api_oauth_model_mastodon_adapter.dart';
import '../mastodon/pagination/unifedi_api_pagination_model_mastodon_adapter.dart';
import '../mastodon/poll/option/unifedi_api_poll_option_model_mastodon_adapter.dart';
import '../mastodon/poll/unifedi_api_poll_model_mastodon_adapter.dart';
import '../mastodon/push/payload/unifedi_api_push_payload_model_mastodon_adapter.dart';
import '../mastodon/push/subscription/alerts/unifedi_api_push_subscription_alerts_model_mastodon_adapter.dart';
import '../mastodon/push/subscription/keys/unifedi_api_push_subscription_keys_model_mastodon_adapter.dart';
import '../mastodon/push/subscription/metadata/unifedi_api_push_subscription_metadata_model_mastodon_adapter.dart';
import '../mastodon/push/subscription/unifedi_api_push_subscription_model_mastodon_adapter.dart';
import '../mastodon/requirement/access/level/unifedi_api_access_level_requirement_model_mastodon_adapter.dart';
import '../mastodon/requirement/access/scopes/unifedi_api_access_scopes_requirement_model_mastodon_adapter.dart';
import '../mastodon/requirement/instance/metadata/version/unifedi_api_instance_metadata_version_requirement_model_mastodon_adapter.dart';
import '../mastodon/search/unifedi_api_search_model_mastodon_adapter.dart';
import '../mastodon/status/context/unifedi_api_status_context_model_mastodon_adapter.dart';
import '../mastodon/status/post/poll/unifedi_api_post_status_poll_model_mastodon_adapter.dart';
import '../mastodon/status/post/schedule/unifedi_api_schedule_post_status_model_mastodon_adapter.dart';
import '../mastodon/status/post/unifedi_api_post_status_model_mastodon_adapter.dart';
import '../mastodon/status/scheduled/params/unifedi_api_scheduled_status_params_model_mastodon_adapter.dart';
import '../mastodon/status/scheduled/unifedi_api_scheduled_status_model_mastodon_adapter.dart';
import '../mastodon/status/unifedi_api_status_model_mastodon_adapter.dart';
import '../mastodon/tag/history/unifedi_api_tag_history_model_mastodon_adapter.dart';
import '../mastodon/tag/unifedi_api_tag_model_mastodon_adapter.dart';
import '../mastodon/version/range/unifedi_api_version_range_model_mastodon_adapter.dart';
import '../mastodon/version/unifedi_api_version_model_mastodon_adapter.dart';
import '../mastodon/web_sockets/channel/unifedi_api_web_sockets_channel_model_mastodon_adapter.dart';
import '../mastodon/web_sockets/event/unifedi_api_web_sockets_event_model_mastodon_adapter.dart';
import '../pleroma/access/level/unifedi_api_access_level_model_pleroma_adapter.dart';
import '../pleroma/access/scopes/item/unifedi_api_access_scopes_item_model_pleroma_adapter.dart';
import '../pleroma/access/scopes/unifedi_api_access_scopes_model_pleroma_adapter.dart';
import '../pleroma/access/unifedi_api_access_model_pleroma_adapter.dart';
import '../pleroma/account/identity_proof/unifedi_api_account_identity_proof_model_pleroma_adapter.dart';
import '../pleroma/account/my/notifications_settings/unifedi_api_my_account_notifications_settings_model_pleroma_adapter.dart';
import '../pleroma/account/my/unifedi_api_my_account_model_pleroma_adapter.dart';
import '../pleroma/account/relationship/unifedi_api_account_relationship_model_pleroma_adapter.dart';
import '../pleroma/account/report/unifedi_api_account_report_model_pleroma_adapter.dart';
import '../pleroma/account/unifedi_api_account_model_pleroma_adapter.dart';
import '../pleroma/announcement/emoji_reaction/unifedi_api_announcement_emoji_reaction_model_pleroma_adapter.dart';
import '../pleroma/announcement/unifedi_api_announcement_model_pleroma_adapter.dart';
import '../pleroma/application/client/unifedi_api_client_application_model_pleroma_adapter.dart';
import '../pleroma/application/unifedi_api_application_model_pleroma_adapter.dart';
import '../pleroma/captcha/unifedi_api_captcha_model_pleroma_adapter.dart';
import '../pleroma/card/unifedi_api_card_model_pleroma_adapter.dart';
import '../pleroma/chat/message/unifedi_api_chat_message_model_pleroma_adapter.dart';
import '../pleroma/chat/unifedi_api_chat_model_pleroma_adapter.dart';
import '../pleroma/content/variants/unifedi_api_content_variants_model_pleroma_adapter.dart';
import '../pleroma/conversation/unifedi_api_conversation_model_pleroma_adapter.dart';
import '../pleroma/emoji/custom/unifedi_api_custom_emoji_model_pleroma_adapter.dart';
import '../pleroma/emoji/unifedi_api_emoji_model_pleroma_adapter.dart';
import '../pleroma/feature/unifedi_api_feature_model_pleroma_adapter.dart';
import '../pleroma/featured_tags/unifedi_api_featured_tags_model_pleroma_adapter.dart';
import '../pleroma/field/unifedi_api_field_model_pleroma_adapter.dart';
import '../pleroma/filter/unifedi_api_filter_model_pleroma_adapter.dart';
import '../pleroma/frontend_configurations/unifedi_api_frontend_configurations_model_pleroma_adapter.dart';
import '../pleroma/instance/activity/item/unifedi_api_instance_activity_item_model_pleroma_adapter.dart';
import '../pleroma/instance/federation/mfr/object_age/unifedi_api_instance_federation_mfr_object_age_model_pleroma_adapter.dart';
import '../pleroma/instance/federation/unifedi_api_instance_federation_model_pleroma_adapter.dart';
import '../pleroma/instance/limits/chat/unifedi_api_instance_chat_limits_model_pleroma_adapter.dart';
import '../pleroma/instance/limits/field/unifedi_api_instance_field_limits_model_pleroma_adapter.dart';
import '../pleroma/instance/limits/media/unifedi_api_instance_media_limits_model_pleroma_adapter.dart';
import '../pleroma/instance/limits/poll/unifedi_api_instance_poll_limits_model_pleroma_adapter.dart';
import '../pleroma/instance/limits/status/unifedi_api_instance_status_limits_model_pleroma_adapter.dart';
import '../pleroma/instance/stats/unifedi_api_instance_stats_model_pleroma_adapter.dart';
import '../pleroma/instance/unifedi_api_instance_model_pleroma_adapter.dart';
import '../pleroma/instance/urls/unifedi_api_instance_urls_model_pleroma_adapter.dart';
import '../pleroma/list/unifedi_api_list_model_pleroma_adapter.dart';
import '../pleroma/marker/unifedi_api_marker_model_pleroma_adapter.dart';
import '../pleroma/media/attachment/focus/unifedi_api_media_attachment_focus_model_pleroma_adapter.dart';
import '../pleroma/media/attachment/meta/unifedi_api_media_attachment_meta_model_pleroma_adapter.dart';
import '../pleroma/media/attachment/size/unifedi_api_media_attachment_size_model_pleroma_adapter.dart';
import '../pleroma/media/attachment/unifedi_api_media_attachment_model_pleroma_adapter.dart';
import '../pleroma/mention/unifedi_api_mention_model_pleroma_adapter.dart';
import '../pleroma/notification/unifedi_api_notification_model_pleroma_adapter.dart';
import '../pleroma/oauth/unifedi_api_oauth_model_pleroma_adapter.dart';
import '../pleroma/pagination/unifedi_api_pagination_model_pleroma_adapter.dart';
import '../pleroma/poll/option/unifedi_api_poll_option_model_pleroma_adapter.dart';
import '../pleroma/poll/unifedi_api_poll_model_pleroma_adapter.dart';
import '../pleroma/push/payload/unifedi_api_push_payload_model_pleroma_adapter.dart';
import '../pleroma/push/subscription/alerts/unifedi_api_push_subscription_alerts_model_pleroma_adapter.dart';
import '../pleroma/push/subscription/keys/unifedi_api_push_subscription_keys_model_pleroma_adapter.dart';
import '../pleroma/push/subscription/metadata/unifedi_api_push_subscription_metadata_model_pleroma_adapter.dart';
import '../pleroma/push/subscription/unifedi_api_push_subscription_model_pleroma_adapter.dart';
import '../pleroma/requirement/access/level/unifedi_api_access_level_requirement_model_pleroma_adapter.dart';
import '../pleroma/requirement/access/scopes/unifedi_api_access_scopes_requirement_model_pleroma_adapter.dart';
import '../pleroma/requirement/instance/metadata/version/unifedi_api_instance_metadata_version_requirement_model_pleroma_adapter.dart';
import '../pleroma/search/unifedi_api_search_model_pleroma_adapter.dart';
import '../pleroma/status/context/unifedi_api_status_context_model_pleroma_adapter.dart';
import '../pleroma/status/emoji_reaction/unifedi_api_status_emoji_reaction_model_pleroma_adapter.dart';
import '../pleroma/status/post/poll/unifedi_api_post_status_poll_model_pleroma_adapter.dart';
import '../pleroma/status/post/schedule/unifedi_api_schedule_post_status_model_pleroma_adapter.dart';
import '../pleroma/status/post/unifedi_api_post_status_model_pleroma_adapter.dart';
import '../pleroma/status/scheduled/params/unifedi_api_scheduled_status_params_model_pleroma_adapter.dart';
import '../pleroma/status/scheduled/unifedi_api_scheduled_status_model_pleroma_adapter.dart';
import '../pleroma/status/unifedi_api_status_model_pleroma_adapter.dart';
import '../pleroma/tag/history/unifedi_api_tag_history_model_pleroma_adapter.dart';
import '../pleroma/tag/unifedi_api_tag_model_pleroma_adapter.dart';
import '../pleroma/version/range/unifedi_api_version_range_model_pleroma_adapter.dart';
import '../pleroma/version/unifedi_api_version_model_pleroma_adapter.dart';
import '../pleroma/web_sockets/channel/unifedi_api_web_sockets_channel_model_pleroma_adapter.dart';
import '../pleroma/web_sockets/event/unifedi_api_web_sockets_event_model_pleroma_adapter.dart';

// ignore_for_file: no-magic-number

abstract class UnifediHiveHelper {
  static void registerFediverseAdapters(TypeRegistry typeRegistry) =>
      FediverseHiveHelper.registerFediverseAdapters(typeRegistry);

  static void registerMastodonAdapters(TypeRegistry typeRegistry) =>
      MastodonHiveHelper.registerMastodonAdapters(typeRegistry);

  static void registerPleromaAdapters(TypeRegistry typeRegistry) =>
      PleromaHiveHelper.registerPleromaAdapters(typeRegistry);

  // ignore: long-method
  static void registerUnifediAdapters(TypeRegistry typeRegistry) {
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        1,
        UnifediApiAccessLevelAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        2,
        UnifediApiAccessScopesAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        3,
        UnifediApiAccessScopesItemAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        4,
        UnifediApiAccessAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        5,
        UnifediApiAccountIdentityProofAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        6,
        UnifediApiEditMyAccountAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        7,
        UnifediApiMyAccountNotificationsSettingsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        9,
        UnifediApiMyAccountAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        11,
        UnifediApiAccountAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        13,
        UnifediApiMyAccountAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        15,
        UnifediApiAnnouncementAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        17,
        UnifediApiClientApplicationAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        18,
        UnifediApiApplicationAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        19,
        UnifediApiCaptchaAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        20,
        UnifediApiCardAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        21,
        UnifediApiChatAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        22,
        UnifediApiChatMessageAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        23,
        UnifediApiContentVariantsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        24,
        UnifediApiConversationAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        26,
        UnifediApiEmojiAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        30,
        UnifediApiFieldAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        31,
        UnifediApiFilterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        32,
        UnifediApiPostFilterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        33,
        UnifediApiFrontendConfigurationsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        37,
        UnifediApiInstanceFederationAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        38,
        UnifediApiInstanceFederationMfrObjectAgeAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        39,
        UnifediApiInstanceFieldLimitsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        40,
        UnifediApiInstancePollLimitsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        42,
        UnifediApiInstanceStatsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        43,
        UnifediApiInstanceUrlsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        44,
        UnifediApiInstanceAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        46,
        UnifediApiListAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        47,
        UnifediApiMarkerAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        49,
        UnifediApiMediaAttachmentAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        51,
        UnifediApiMediaAttachmentFocusAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        52,
        UnifediApiMediaAttachmentMetaAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        53,
        UnifediApiMediaAttachmentSizeAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        54,
        UnifediApiMentionAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        55,
        UnifediApiNotificationAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        57,
        UnifediApiOAuthTokenAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        58,
        UnifediApiPaginationAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        59,
        UnifediApiPollAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        60,
        UnifediApiPollOptionAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        61,
        UnifediApiPushPayloadAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        62,
        UnifediApiPushSubscriptionAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        63,
        UnifediApiPushSubscriptionAlertsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        64,
        UnifediApiPushSubscriptionKeysAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        65,
        UnifediApiPushSubscriptionMetadataAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        69,
        UnifediApiSearchResultAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        70,
        UnifediApiStatusAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        72,
        UnifediApiStatusContextAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        74,
        UnifediApiPostStatusPollAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        75,
        UnifediApiSchedulePostStatusAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        76,
        UnifediApiPostStatusAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        77,
        UnifediApiScheduledStatusAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        78,
        UnifediApiScheduledStatusParamsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        79,
        UnifediApiTagAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        80,
        UnifediApiTagHistoryItemAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        83,
        UnifediApiWebSocketsChannelAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        84,
        UnifediApiWebSocketsEventAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        85,
        UnifediApiInstanceActivityItemAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        86,
        UnifediApiAccountReportAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        87,
        UnifediApiAccountRelationshipAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        88,
        UnifediApiInstanceLimitsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        89,
        UnifediApiInstanceChatLimitsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        90,
        UnifediApiInstanceMediaLimitsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        91,
        UnifediApiInstanceStatusLimitsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        92,
        UnifediApiInstanceActivityAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        93,
        UnifediApiAccessApplicationTokenAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        94,
        UnifediApiAccessUserTokenAdapter(),
      ),
    );
  }

  // ignore: long-method
  static void registerUnifediMastodonAdapters(TypeRegistry typeRegistry) {
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        1,
        UnifediApiAccessLevelMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        2,
        UnifediApiAccessScopesMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        3,
        UnifediApiAccessScopesItemMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        4,
        UnifediApiAccessMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        5,
        UnifediApiAccountIdentityProofMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        9,
        UnifediApiMyAccountMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        11,
        UnifediApiAccountMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        13,
        UnifediApiMyAccountMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        14,
        UnifediApiAnnouncementEmojiReactionMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        15,
        UnifediApiAnnouncementMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        17,
        UnifediApiClientApplicationMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        18,
        UnifediApiApplicationMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        20,
        UnifediApiCardMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        24,
        UnifediApiConversationMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        26,
        UnifediApiEmojiMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        28,
        UnifediApiFeatureMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        29,
        UnifediApiFeaturedTagMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        30,
        UnifediApiFieldMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        31,
        UnifediApiFilterMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        42,
        UnifediApiInstanceStatsMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        43,
        UnifediApiInstanceUrlsMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        44,
        UnifediApiInstanceMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        46,
        UnifediApiListMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        47,
        UnifediApiMarkerMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        49,
        UnifediApiMediaAttachmentMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        51,
        UnifediApiMediaAttachmentFocusMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        52,
        UnifediApiMediaAttachmentMetaMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        53,
        UnifediApiMediaAttachmentSizeMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        54,
        UnifediApiMentionMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        55,
        UnifediApiNotificationMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        57,
        UnifediApiOAuthTokenMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        58,
        UnifediApiPaginationMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        59,
        UnifediApiPollMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        60,
        UnifediApiPollOptionMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        61,
        UnifediApiPushPayloadMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        62,
        UnifediApiPushSubscriptionMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        63,
        UnifediApiPushSubscriptionAlertsMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        64,
        UnifediApiPushSubscriptionKeysMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        65,
        UnifediApiPushSubscriptionMetadataMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        66,
        UnifediApiAccessLevelRequirementMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        67,
        UnifediApiAccessScopesRequirementMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        68,
        UnifediApiInstanceMetadataVersionRequirementMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        69,
        UnifediApiSearchResultMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        70,
        UnifediApiStatusMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        72,
        UnifediApiStatusContextMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        74,
        UnifediApiPostStatusPollMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        75,
        UnifediApiSchedulePostStatusMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        76,
        UnifediApiPostStatusMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        77,
        UnifediApiScheduledStatusMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        78,
        UnifediApiScheduledStatusParamsMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        79,
        UnifediApiTagMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        80,
        UnifediApiTagHistoryItemMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        81,
        UnifediApiVersionMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        82,
        UnifediApiVersionRangeMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        83,
        UnifediApiWebSocketsChannelMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        84,
        UnifediApiWebSocketsEventMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        85,
        UnifediApiInstanceActivityItemMastodonAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        87,
        UnifediApiAccountRelationshipMastodonAdapterAdapter(),
      ),
    );
  }

  // ignore: long-method
  static void registerUnifediPleromaAdapters(TypeRegistry typeRegistry) {
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        1,
        UnifediApiAccessLevelPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        2,
        UnifediApiAccessScopesPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        3,
        UnifediApiAccessScopesItemPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        4,
        UnifediApiAccessPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        5,
        UnifediApiAccountIdentityProofPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        7,
        UnifediApiMyAccountNotificationsSettingsPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        9,
        UnifediApiMyAccountPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        11,
        UnifediApiAccountPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        13,
        UnifediApiMyAccountPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        14,
        UnifediApiAnnouncementEmojiReactionPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        15,
        UnifediApiAnnouncementPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        17,
        UnifediApiClientApplicationPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        18,
        UnifediApiApplicationPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        19,
        UnifediApiCaptchaPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        20,
        UnifediApiCardPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        21,
        UnifediApiChatPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        22,
        UnifediApiChatMessagePleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        23,
        UnifediApiContentVariantsPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        24,
        UnifediApiConversationPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        26,
        UnifediApiEmojiPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        27,
        UnifediApiCustomEmojiPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        28,
        UnifediApiFeaturePleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        29,
        UnifediApiFeaturedTagPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        30,
        UnifediApiFieldPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        31,
        UnifediApiFilterPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        33,
        UnifediApiFrontendConfigurationsPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        37,
        UnifediApiInstanceFederationPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        38,
        UnifediApiInstanceFederationMfrObjectAgePleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        39,
        UnifediApiInstanceFieldLimitsPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        40,
        UnifediApiInstancePollLimitsPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        42,
        UnifediApiInstanceStatsPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        43,
        UnifediApiInstanceUrlsPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        44,
        UnifediApiInstancePleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        46,
        UnifediApiListPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        47,
        UnifediApiMarkerPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        49,
        UnifediApiMediaAttachmentPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        51,
        UnifediApiMediaAttachmentFocusPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        52,
        UnifediApiMediaAttachmentMetaPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        53,
        UnifediApiMediaAttachmentSizePleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        54,
        UnifediApiMentionPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        55,
        UnifediApiNotificationPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        57,
        UnifediApiOAuthTokenPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        58,
        UnifediApiPaginationPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        59,
        UnifediApiPollPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        60,
        UnifediApiPollOptionPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        61,
        UnifediApiPushPayloadPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        62,
        UnifediApiPushSubscriptionPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        63,
        UnifediApiPushSubscriptionAlertsPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        64,
        UnifediApiPushSubscriptionKeysPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        65,
        UnifediApiPushSubscriptionMetadataPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        66,
        UnifediApiAccessLevelRequirementPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        67,
        UnifediApiAccessScopesRequirementPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        68,
        UnifediApiInstanceMetadataVersionRequirementPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        69,
        UnifediApiSearchResultPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        70,
        UnifediApiStatusPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        72,
        UnifediApiStatusContextPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        73,
        UnifediApiStatusEmojiReactionPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        74,
        UnifediApiPostStatusPollPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        75,
        UnifediApiSchedulePostStatusPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        76,
        UnifediApiPostStatusPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        77,
        UnifediApiScheduledStatusPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        78,
        UnifediApiScheduledStatusParamsPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        79,
        UnifediApiTagPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        80,
        UnifediApiTagHistoryItemPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        81,
        UnifediApiVersionPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        82,
        UnifediApiVersionRangePleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        83,
        UnifediApiWebSocketsChannelPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        84,
        UnifediApiWebSocketsEventPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        85,
        UnifediApiInstanceActivityItemPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        86,
        UnifediApiAccountReportPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        87,
        UnifediApiAccountRelationshipPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        88,
        UnifediApiInstanceStatusLimitsPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        89,
        UnifediApiInstanceMediaLimitsPleromaAdapterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        90,
        UnifediApiInstanceChatLimitsPleromaAdapterAdapter(),
      ),
    );
  }
}
