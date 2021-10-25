// ignore_for_file: cascade_invocations

import 'package:hive/hive.dart';

import '../api/access/level/mastodon_api_access_level_model_impl.dart';
import '../api/access/mastodon_api_access_model_impl.dart';
import '../api/access/scopes/item/mastodon_api_access_scopes_item_model_impl.dart';
import '../api/access/scopes/mastodon_api_access_scopes_model_impl.dart';
import '../api/account/identity_proof/mastodon_api_account_identity_proof_model_impl.dart';
import '../api/account/mastodon_api_account_model_impl.dart';
import '../api/account/my/edit/mastodon_api_edit_my_account_model_impl.dart';
import '../api/account/my/mastodon_api_my_account_model_impl.dart';
import '../api/account/my/source/mastodon_api_my_account_source_model_impl.dart';
import '../api/account/relationship/mastodon_api_account_relationship_model_impl.dart';
import '../api/announcement/emoji_reaction/mastodon_api_announcement_emoji_reaction_model_impl.dart';
import '../api/announcement/mastodon_api_announcement_model_impl.dart';
import '../api/application/client/mastodon_api_client_application_model_impl.dart';
import '../api/application/mastodon_api_application_model_impl.dart';
import '../api/card/mastodon_api_card_model_impl.dart';
import '../api/conversation/mastodon_api_conversation_model_impl.dart';
import '../api/emoji/mastodon_api_emoji_model_impl.dart';
import '../api/feature/mastodon_api_feature_model_impl.dart';
import '../api/featured_tags/mastodon_api_featured_tags_model_impl.dart';
import '../api/field/mastodon_api_field_model_impl.dart';
import '../api/filter/mastodon_api_filter_model_impl.dart';
import '../api/filter/post/mastodon_api_post_filter_model_impl.dart';
import '../api/instance/activity/item/mastodon_api_instance_activity_item_model_impl.dart';
import '../api/instance/mastodon_api_instance_model_impl.dart';
import '../api/instance/stats/mastodon_api_instance_stats_model_impl.dart';
import '../api/instance/urls/mastodon_api_instance_urls_model_impl.dart';
import '../api/list/mastodon_api_list_model_impl.dart';
import '../api/marker/mastodon_api_marker_model_impl.dart';
import '../api/media/attachment/focus/mastodon_api_media_attachment_focus_model_impl.dart';
import '../api/media/attachment/mastodon_api_media_attachment_model_impl.dart';
import '../api/media/attachment/meta/mastodon_api_media_attachment_meta_model_impl.dart';
import '../api/media/attachment/size/mastodon_api_media_attachment_size_model_impl.dart';
import '../api/mention/mastodon_api_mention_model_impl.dart';
import '../api/notification/mastodon_api_notification_model_impl.dart';
import '../api/oauth/mastodon_api_oauth_model_impl.dart';
import '../api/pagination/mastodon_api_pagination_model_impl.dart';
import '../api/poll/mastodon_api_poll_model_impl.dart';
import '../api/poll/option/mastodon_api_poll_option_model_impl.dart';
import '../api/push/payload/mastodon_api_push_payload_model_impl.dart';
import '../api/push/subscription/alerts/mastodon_api_push_subscription_alerts_model_impl.dart';
import '../api/push/subscription/keys/mastodon_api_push_subscription_keys_model_impl.dart';
import '../api/push/subscription/mastodon_api_push_subscription_model_impl.dart';
import '../api/push/subscription/metadata/mastodon_api_push_subscription_metadata_model_impl.dart';
import '../api/requirement/access/level/mastodon_api_access_level_requirement_model_impl.dart';
import '../api/requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../api/requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../api/search/mastodon_api_search_model_impl.dart';
import '../api/status/context/mastodon_api_status_context_model_impl.dart';
import '../api/status/mastodon_api_status_model_impl.dart';
import '../api/status/post/mastodon_api_post_status_model_impl.dart';
import '../api/status/post/poll/mastodon_api_post_status_poll_model_impl.dart';
import '../api/status/post/schedule/mastodon_api_schedule_post_status_model_impl.dart';
import '../api/status/scheduled/mastodon_api_scheduled_status_model_impl.dart';
import '../api/status/scheduled/params/mastodon_api_scheduled_status_params_model_impl.dart';
import '../api/tag/history/item/mastodon_api_tag_history_item_model_impl.dart';
import '../api/tag/mastodon_api_tag_model_impl.dart';
import '../api/version/mastodon_api_version_model_impl.dart';
import '../api/version/range/mastodon_api_version_range_model_impl.dart';
import '../api/web_sockets/channel/mastodon_api_web_sockets_channel_model_impl.dart';
import '../api/web_sockets/event/mastodon_api_web_sockets_event_model_impl.dart';

// ignore_for_file: no-magic-number
abstract class MastodonHiveHelper {
// ignore: long-method
  static void registerMastodonAdapters(TypeRegistry typeRegistry) {
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        1,
        MastodonApiAccessLevelAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        2,
        MastodonApiAccessScopesAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        3,
        MastodonApiAccessScopesItemAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        4,
        MastodonApiAccessAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        5,
        MastodonApiAccountIdentityProofAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        6,
        MastodonApiEditMyAccountAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        8,
        MastodonApiMyAccountSourceAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        9,
        MastodonApiMyAccountAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        11,
        MastodonApiAccountAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        13,
        MastodonApiMyAccountAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        14,
        MastodonApiAnnouncementEmojiReactionAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        15,
        MastodonApiAnnouncementAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        16,
        MastodonApiAnnouncementEmojiReactionAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        17,
        MastodonApiClientApplicationAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        18,
        MastodonApiApplicationAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        20,
        MastodonApiCardAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        24,
        MastodonApiConversationAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        26,
        MastodonApiEmojiAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        28,
        MastodonApiFeatureAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        29,
        MastodonApiFeaturedTagAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        30,
        MastodonApiFieldAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        31,
        MastodonApiFilterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        32,
        MastodonApiPostFilterAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        42,
        MastodonApiInstanceStatsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        43,
        MastodonApiInstanceUrlsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        44,
        MastodonApiInstanceAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        46,
        MastodonApiListAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        47,
        MastodonApiMarkerAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        49,
        MastodonApiMediaAttachmentAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        51,
        MastodonApiMediaAttachmentFocusAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        52,
        MastodonApiMediaAttachmentMetaAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        53,
        MastodonApiMediaAttachmentSizeAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        54,
        MastodonApiMentionAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        55,
        MastodonApiNotificationAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        57,
        MastodonApiOAuthTokenAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        58,
        MastodonApiPaginationAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        59,
        MastodonApiPollAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        60,
        MastodonApiPollOptionAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        61,
        MastodonApiPushPayloadAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        62,
        MastodonApiPushSubscriptionAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        63,
        MastodonApiPushSubscriptionAlertsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        64,
        MastodonApiPushSubscriptionKeysAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        65,
        MastodonApiPushSubscriptionMetadataAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        66,
        MastodonApiAccessLevelRequirementAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        67,
        MastodonApiAccessScopesRequirementAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        68,
        MastodonApiInstanceMetadataVersionRequirementAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        69,
        MastodonApiSearchResultAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        70,
        MastodonApiStatusAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        72,
        MastodonApiStatusContextAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        74,
        MastodonApiPostStatusPollAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        75,
        MastodonApiSchedulePostStatusAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        76,
        MastodonApiPostStatusAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        77,
        MastodonApiScheduledStatusAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        78,
        MastodonApiScheduledStatusParamsAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        79,
        MastodonApiTagAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        80,
        MastodonApiTagHistoryItemAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        81,
        MastodonApiVersionAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        82,
        MastodonApiVersionRangeAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        83,
        MastodonApiWebSocketsChannelAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        84,
        MastodonApiWebSocketsEventAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        85,
        MastodonApiInstanceActivityItemAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        87,
        MastodonApiAccountRelationshipAdapter(),
      ),
    );
  }
}
