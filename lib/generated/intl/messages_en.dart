// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(domain) => "Block domain ${domain}";

  static m1(domain) => "Unblock domain ${domain}";

  static m2(accountAcct) => "${accountAcct} followers";

  static m3(accountAcct) => "${accountAcct} followings";

  static m4(number) => "Link field #${number}";

  static m5(message) => "Message: ${message}";

  static m6(content) => "${content}";

  static m7(userAtHost) => "Can\'t load ${userAtHost} instance.\nApp error or session expired";

  static m8(userAtHost) => "${userAtHost}";

  static m9(error) => "Details: ${error}";

  static m10(userAtHost) => "Log out of ${userAtHost}";

  static m11(count) => "${Intl.plural(count, one: '1 new conversation. Tap to load.', other: '${count} new conversations. Tap to load.')}";

  static m12(count) => "${Intl.plural(count, one: '1 new chat. Tap to load.', other: '${count} new chats. Tap to load.')}";

  static m13(message) => "You: ${message}";

  static m14(listTitle) => "List ${listTitle}";

  static m15(mediaType) => "Not supported type ${mediaType}";

  static m16(formattedFileSize, formattedMaxFileSize) => "File size is ${formattedFileSize} MB, but max is ${formattedMaxFileSize} MB";

  static m17(status) => "Liked: ${status}";

  static m18(status) => "<b>Mentioned you:</b> ${status}";

  static m19(status) => "Chat mention in \"${status}\"";

  static m20(status, emoji) => "${emoji} for: \"${status}";

  static m21(status) => "Reblogged: ${status}";

  static m22(status) => "Unknown: ${status}";

  static m23(count) => "${Intl.plural(count, one: '1 new notification. Tap to load.', other: '${count} new notifications. Tap to load.')}";

  static m24(dayCount) => " ${dayCount} left";

  static m25(count) => "${Intl.plural(count, zero: 'No votes', one: '1 vote', other: '${count} votes')}";

  static m26(errorMessage) => "Error: ${errorMessage}";

  static m27(count) => "${Intl.plural(count, one: '1 new post. Tap to load.', other: '${count} new posts. Tap to load.')}";

  static m28(errorMessage) => "Error: ${errorMessage}";

  static m29(optionNumber) => "Option ${optionNumber}";

  static m30(accountAcct) => "Replying to ${accountAcct}";

  static m31(accountAcct) => "Reply to @${accountAcct}";

  static m32(timeline) => "${timeline} Timeline";

  static m33(timeline) => "Are you sure you want to delete ${timeline} Timeline?";

  static m34(errorMessage) => "Failed to init ${errorMessage}";

  static m35(errorMessage) => "An error has occurred. Please retry your action again. \n${errorMessage}";

  static m36(count) => "${Intl.plural(count, one: '1 day', other: '${count} days')}";

  static m37(count) => "${Intl.plural(count, one: '1 hour', other: '${count} hours')}";

  static m38(count) => "${Intl.plural(count, one: '1 minute', other: '${count} minutes')}";

  static m39(maxCharactersCount) => "Must be less than ${maxCharactersCount} characters";

  static m40(minCharactersCount, maxCharactersCount) => "Must be between ${minCharactersCount} and ${maxCharactersCount} characters";

  static m41(minCharactersCount) => "Must be at least ${minCharactersCount} characters";

  static m42(url) => "URL ${url} have invalid format";

  static m43(hours) => "~1 d";

  static m44(seconds) => "1 min";

  static m45(days) => "~1 mo";

  static m46(year) => "~1 y";

  static m47(minutes) => "~1 h";

  static m48(days) => "${Intl.plural(days, one: '1 d', other: '${days} d')}";

  static m49(hours) => "${Intl.plural(hours, one: '1 h', other: '${hours} h')}";

  static m50(seconds) => "now";

  static m51(minutes) => "${Intl.plural(minutes, one: '1 min', other: '${minutes} min')}";

  static m52(months) => "${Intl.plural(months, one: '1 mo', other: '${months} mo')}";

  static m53(years) => "${Intl.plural(years, one: '1 y', other: '${years} y')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "app_account_action_block" : MessageLookupByLibrary.simpleMessage("Block"),
    "app_account_action_blockDomain" : m0,
    "app_account_action_follow" : MessageLookupByLibrary.simpleMessage("Follow"),
    "app_account_action_followRequested" : MessageLookupByLibrary.simpleMessage("Requested"),
    "app_account_action_message" : MessageLookupByLibrary.simpleMessage("Message"),
    "app_account_action_mute" : MessageLookupByLibrary.simpleMessage("Mute"),
    "app_account_action_openInBrowser" : MessageLookupByLibrary.simpleMessage("Open in browser"),
    "app_account_action_popup_title" : MessageLookupByLibrary.simpleMessage("More actions for:"),
    "app_account_action_report_fail_dialog_content" : MessageLookupByLibrary.simpleMessage("Something wrong"),
    "app_account_action_report_fail_dialog_title" : MessageLookupByLibrary.simpleMessage("Failed to report"),
    "app_account_action_report_label" : MessageLookupByLibrary.simpleMessage("Report"),
    "app_account_action_report_success_toast" : MessageLookupByLibrary.simpleMessage("Successfully reported"),
    "app_account_action_unblock" : MessageLookupByLibrary.simpleMessage("Unblock"),
    "app_account_action_unblockDomain" : m1,
    "app_account_action_unfollow" : MessageLookupByLibrary.simpleMessage("Unfollow"),
    "app_account_action_unmute" : MessageLookupByLibrary.simpleMessage("Unmute"),
    "app_account_follower_title" : m2,
    "app_account_following_title" : m3,
    "app_account_info_followers" : MessageLookupByLibrary.simpleMessage("Followers"),
    "app_account_info_following" : MessageLookupByLibrary.simpleMessage("Following"),
    "app_account_info_statuses" : MessageLookupByLibrary.simpleMessage("Statuses"),
    "app_account_list_privacy" : MessageLookupByLibrary.simpleMessage("Some information may be missed due to privacy settings"),
    "app_account_my_accountBlock_title" : MessageLookupByLibrary.simpleMessage("Account blocks"),
    "app_account_my_accountMute_title" : MessageLookupByLibrary.simpleMessage("Account mutes"),
    "app_account_my_domainBlock_add_dialog_field_domain_hint" : MessageLookupByLibrary.simpleMessage("mastodon.social"),
    "app_account_my_domainBlock_add_dialog_title" : MessageLookupByLibrary.simpleMessage("Add domain block"),
    "app_account_my_domainBlock_title" : MessageLookupByLibrary.simpleMessage("Domain blocks"),
    "app_account_my_edit_action_save" : MessageLookupByLibrary.simpleMessage("Save"),
    "app_account_my_edit_field_avatar_dialog_action_cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "app_account_my_edit_field_avatar_dialog_action_selectAndCrop" : MessageLookupByLibrary.simpleMessage("Select & crop"),
    "app_account_my_edit_field_avatar_dialog_title" : MessageLookupByLibrary.simpleMessage("Confirm selection?"),
    "app_account_my_edit_field_backgroundImage_action_add" : MessageLookupByLibrary.simpleMessage("Add"),
    "app_account_my_edit_field_backgroundImage_label" : MessageLookupByLibrary.simpleMessage("Background image"),
    "app_account_my_edit_field_customField_action_addNew" : MessageLookupByLibrary.simpleMessage("Add link field"),
    "app_account_my_edit_field_customField_label" : m4,
    "app_account_my_edit_field_customField_name_label" : MessageLookupByLibrary.simpleMessage("Name*"),
    "app_account_my_edit_field_customField_value_label" : MessageLookupByLibrary.simpleMessage("URL*"),
    "app_account_my_edit_field_displayName_label" : MessageLookupByLibrary.simpleMessage("Display name*"),
    "app_account_my_edit_field_header_dialog_action_cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "app_account_my_edit_field_header_dialog_action_crop" : MessageLookupByLibrary.simpleMessage("Crop"),
    "app_account_my_edit_field_header_dialog_action_select" : MessageLookupByLibrary.simpleMessage("Select"),
    "app_account_my_edit_field_header_dialog_title" : MessageLookupByLibrary.simpleMessage("Confirm selection?"),
    "app_account_my_edit_field_locked_label" : MessageLookupByLibrary.simpleMessage("Locked to followers only"),
    "app_account_my_edit_field_note_label" : MessageLookupByLibrary.simpleMessage("Note"),
    "app_account_my_edit_title" : MessageLookupByLibrary.simpleMessage("Edit account"),
    "app_account_my_edit_unsaved_dialog_action_discard" : MessageLookupByLibrary.simpleMessage("Discard"),
    "app_account_my_edit_unsaved_dialog_title" : MessageLookupByLibrary.simpleMessage("You have unsaved changes"),
    "app_account_my_followRequest_title" : MessageLookupByLibrary.simpleMessage("Follow requests"),
    "app_account_my_menu_account_subpage_title" : MessageLookupByLibrary.simpleMessage("Account"),
    "app_account_my_menu_action_account" : MessageLookupByLibrary.simpleMessage("Account"),
    "app_account_my_menu_action_bookmarks" : MessageLookupByLibrary.simpleMessage("Bookmarks"),
    "app_account_my_menu_action_lists" : MessageLookupByLibrary.simpleMessage("Lists"),
    "app_account_my_menu_action_settings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "app_account_my_settings_action_accountBlocks" : MessageLookupByLibrary.simpleMessage("Account blocks"),
    "app_account_my_settings_action_accountMutes" : MessageLookupByLibrary.simpleMessage("Account mutes"),
    "app_account_my_settings_action_bookmarked" : MessageLookupByLibrary.simpleMessage("Bookmarks"),
    "app_account_my_settings_action_domainBlocks" : MessageLookupByLibrary.simpleMessage("Domain blocks"),
    "app_account_my_settings_action_draftPosts" : MessageLookupByLibrary.simpleMessage("Draft posts"),
    "app_account_my_settings_action_favourited" : MessageLookupByLibrary.simpleMessage("Favourites"),
    "app_account_my_settings_action_followRequests" : MessageLookupByLibrary.simpleMessage("Follow requests"),
    "app_account_my_settings_action_lists" : MessageLookupByLibrary.simpleMessage("Lists"),
    "app_account_my_settings_action_scheduledPosts" : MessageLookupByLibrary.simpleMessage("Scheduled posts"),
    "app_account_my_settings_field_alwaysShowNsfw_label" : MessageLookupByLibrary.simpleMessage("Show NSFW by default"),
    "app_account_my_settings_field_alwaysShowSpoiler_label" : MessageLookupByLibrary.simpleMessage("Show spoilers by default"),
    "app_account_my_settings_field_defaultVisibility_label" : MessageLookupByLibrary.simpleMessage("Default visibility"),
    "app_account_my_settings_field_mediaAutoInit_label" : MessageLookupByLibrary.simpleMessage("Audio/Video auto-init"),
    "app_account_my_settings_field_mediaAutoPlay_label" : MessageLookupByLibrary.simpleMessage("Audio/Video auto-play"),
    "app_account_my_settings_field_mediaNsfwByDefault_label" : MessageLookupByLibrary.simpleMessage("Mark media as NSFW on uploading"),
    "app_account_my_settings_field_websocketsEnabled_description" : MessageLookupByLibrary.simpleMessage("Disable to reduce battery usage"),
    "app_account_my_settings_field_websocketsEnabled_label" : MessageLookupByLibrary.simpleMessage("WebSockets real-time updates"),
    "app_account_my_settings_title" : MessageLookupByLibrary.simpleMessage("Settings"),
    "app_account_my_statuses_bookmarked_title" : MessageLookupByLibrary.simpleMessage("Bookmarks"),
    "app_account_my_statuses_favourited_title" : MessageLookupByLibrary.simpleMessage("Favourites"),
    "app_account_statuses_tab_media" : MessageLookupByLibrary.simpleMessage("Media"),
    "app_account_statuses_tab_pinned" : MessageLookupByLibrary.simpleMessage("Pinned"),
    "app_account_statuses_tab_withReplies" : MessageLookupByLibrary.simpleMessage("Including replies"),
    "app_account_statuses_tab_withoutReplies" : MessageLookupByLibrary.simpleMessage("Posts"),
    "app_async_pleroma_error_common_dialog_content" : m5,
    "app_async_pleroma_error_common_dialog_title" : MessageLookupByLibrary.simpleMessage("Pleroma API error"),
    "app_async_pleroma_error_forbidden_dialog_content" : m6,
    "app_async_pleroma_error_forbidden_dialog_title" : MessageLookupByLibrary.simpleMessage("Forbidden. Invalid action or session expired"),
    "app_async_pleroma_error_throttled_dialog_content" : MessageLookupByLibrary.simpleMessage("Too much operations per minute. Please wait before do something again."),
    "app_async_pleroma_error_throttled_dialog_title" : MessageLookupByLibrary.simpleMessage("Throttled. Server blocked action."),
    "app_async_socket_error_dialog_content" : MessageLookupByLibrary.simpleMessage("No network or remote server unavailable"),
    "app_async_socket_error_dialog_title" : MessageLookupByLibrary.simpleMessage("Check your connection"),
    "app_async_timeout_error_dialog_content" : MessageLookupByLibrary.simpleMessage("No network or remote server unavailable"),
    "app_async_timeout_error_dialog_title" : MessageLookupByLibrary.simpleMessage("Timeout reached"),
    "app_auth_instance_chooser_action_addInstance" : MessageLookupByLibrary.simpleMessage("Add account"),
    "app_auth_instance_current_context_loading_cantLoad_action_chooseDifferentAccount" : MessageLookupByLibrary.simpleMessage("Choose different account"),
    "app_auth_instance_current_context_loading_cantLoad_action_logout" : MessageLookupByLibrary.simpleMessage("Logout"),
    "app_auth_instance_current_context_loading_cantLoad_action_refresh" : MessageLookupByLibrary.simpleMessage("Refresh"),
    "app_auth_instance_current_context_loading_cantLoad_content" : m7,
    "app_auth_instance_current_context_loading_loading_content" : m8,
    "app_auth_instance_current_context_loading_loading_title" : MessageLookupByLibrary.simpleMessage("Loading Instance"),
    "app_auth_instance_join_action_login" : MessageLookupByLibrary.simpleMessage("Login"),
    "app_auth_instance_join_action_signUp" : MessageLookupByLibrary.simpleMessage("Sign up"),
    "app_auth_instance_join_action_tos_postfix" : MessageLookupByLibrary.simpleMessage("."),
    "app_auth_instance_join_action_tos_prefix" : MessageLookupByLibrary.simpleMessage("By using Fedi, you agree to our"),
    "app_auth_instance_join_action_tos_terms" : MessageLookupByLibrary.simpleMessage("Terms"),
    "app_auth_instance_join_fail_dialog_content" : m9,
    "app_auth_instance_join_fail_dialog_title" : MessageLookupByLibrary.simpleMessage("Fail to connect to instance. You can try verified fedi.app or pleroma.com"),
    "app_auth_instance_join_field_host_helper" : MessageLookupByLibrary.simpleMessage("Pleroma or Mastodon Instance"),
    "app_auth_instance_join_field_host_hint" : MessageLookupByLibrary.simpleMessage("Fedi.app"),
    "app_auth_instance_join_invitesOnly_dialog_content" : MessageLookupByLibrary.simpleMessage("Try any other instance, or register by invite link in your browser"),
    "app_auth_instance_join_invitesOnly_dialog_title" : MessageLookupByLibrary.simpleMessage("Instance owner limit registration to invites-only"),
    "app_auth_instance_join_new_title" : MessageLookupByLibrary.simpleMessage("Join new instance"),
    "app_auth_instance_join_progress_dialog_content" : MessageLookupByLibrary.simpleMessage("Checking instance"),
    "app_auth_instance_join_registrationDisabled_dialog_content" : MessageLookupByLibrary.simpleMessage("Try any other instance, like fedi.app"),
    "app_auth_instance_join_registrationDisabled_dialog_title" : MessageLookupByLibrary.simpleMessage("Instance owner disabled registration"),
    "app_auth_instance_logout_dialog_content" : m10,
    "app_auth_instance_logout_dialog_title" : MessageLookupByLibrary.simpleMessage("Log Out"),
    "app_auth_instance_register_action_createAccount" : MessageLookupByLibrary.simpleMessage("Sign up"),
    "app_auth_instance_register_approvalRequired_notification_content" : MessageLookupByLibrary.simpleMessage("You can once moderators will approve your account"),
    "app_auth_instance_register_approvalRequired_notification_title" : MessageLookupByLibrary.simpleMessage("Success registration"),
    "app_auth_instance_register_field_captcha_hint" : MessageLookupByLibrary.simpleMessage("Characters from picture"),
    "app_auth_instance_register_field_captcha_label" : MessageLookupByLibrary.simpleMessage("Captcha*"),
    "app_auth_instance_register_field_confirmPassword_hint" : MessageLookupByLibrary.simpleMessage("Password"),
    "app_auth_instance_register_field_confirmPassword_label" : MessageLookupByLibrary.simpleMessage("Password confirmation*"),
    "app_auth_instance_register_field_email_hint" : MessageLookupByLibrary.simpleMessage("you@example.com"),
    "app_auth_instance_register_field_email_label" : MessageLookupByLibrary.simpleMessage("Email Address*"),
    "app_auth_instance_register_field_password_hint" : MessageLookupByLibrary.simpleMessage("Password"),
    "app_auth_instance_register_field_password_label" : MessageLookupByLibrary.simpleMessage("Password*"),
    "app_auth_instance_register_field_username_hint" : MessageLookupByLibrary.simpleMessage("e.g. lain"),
    "app_auth_instance_register_field_username_label" : MessageLookupByLibrary.simpleMessage("Username*"),
    "app_auth_instance_register_title" : MessageLookupByLibrary.simpleMessage("Create account"),
    "app_chat_conversation_accounts_title" : MessageLookupByLibrary.simpleMessage("Conversation accounts"),
    "app_chat_conversation_list_newItems_action_tapToLoadNew" : m11,
    "app_chat_conversation_share_title" : MessageLookupByLibrary.simpleMessage("Share to conversations"),
    "app_chat_conversation_start_title" : MessageLookupByLibrary.simpleMessage("Start conversation"),
    "app_chat_pleroma_accounts_title" : MessageLookupByLibrary.simpleMessage("Chat accounts"),
    "app_chat_pleroma_list_newItems_action_tapToLoadNew" : m12,
    "app_chat_pleroma_share_title" : MessageLookupByLibrary.simpleMessage("Share to chats"),
    "app_chat_post_error_empty_dialog_title" : MessageLookupByLibrary.simpleMessage("Can\'t send empty message"),
    "app_chat_post_field_content_hint" : MessageLookupByLibrary.simpleMessage("Start a message"),
    "app_chat_preview_you" : m13,
    "app_customList_create_title" : MessageLookupByLibrary.simpleMessage("Create list"),
    "app_customList_edit_title" : MessageLookupByLibrary.simpleMessage("Edit list"),
    "app_customList_form_field_title_hint" : MessageLookupByLibrary.simpleMessage("List name"),
    "app_customList_form_field_title_label" : MessageLookupByLibrary.simpleMessage("Title*"),
    "app_customList_list_title" : MessageLookupByLibrary.simpleMessage("Lists"),
    "app_customList_title" : m14,
    "app_customList_type_accounts_action_add" : MessageLookupByLibrary.simpleMessage("Add account from followings"),
    "app_customList_type_accounts_label" : MessageLookupByLibrary.simpleMessage("Accounts in list"),
    "app_datetime_picker_action_cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "app_datetime_picker_action_ok" : MessageLookupByLibrary.simpleMessage("Set time"),
    "app_datetime_title" : MessageLookupByLibrary.simpleMessage("Select date"),
    "app_emoji_category_empty" : MessageLookupByLibrary.simpleMessage("This category don\'t have suitable emojis"),
    "app_emoji_custom_empty" : MessageLookupByLibrary.simpleMessage("This instance don\'t have custom emojis"),
    "app_emoji_recent_empty" : MessageLookupByLibrary.simpleMessage("No recent emojis"),
    "app_file_image_crop_title" : MessageLookupByLibrary.simpleMessage("Crop as"),
    "app_home_tab_chat_conversation_action_switchToChats" : MessageLookupByLibrary.simpleMessage("To Chats"),
    "app_home_tab_chat_conversation_title" : MessageLookupByLibrary.simpleMessage("Conversations"),
    "app_home_tab_chat_pleroma_action_switch_to_dms" : MessageLookupByLibrary.simpleMessage("To Conversations"),
    "app_home_tab_chat_pleroma_notSupported_mastodon" : MessageLookupByLibrary.simpleMessage("Chats not supported on Mastodon instances"),
    "app_home_tab_chat_pleroma_notSupported_pleroma" : MessageLookupByLibrary.simpleMessage("This instance don\'t support chats yet"),
    "app_home_tab_chat_pleroma_title" : MessageLookupByLibrary.simpleMessage("Chats"),
    "app_home_tab_timelines_tab_home" : MessageLookupByLibrary.simpleMessage("Home"),
    "app_home_tab_timelines_tab_local" : MessageLookupByLibrary.simpleMessage("Local"),
    "app_home_tab_timelines_tab_public" : MessageLookupByLibrary.simpleMessage("All"),
    "app_init_fail" : MessageLookupByLibrary.simpleMessage("Failed to start app.\nTry restart or re-install app."),
    "app_list_cantUpdateFromNetwork" : MessageLookupByLibrary.simpleMessage("Can\'t update from network"),
    "app_list_empty" : MessageLookupByLibrary.simpleMessage("Items not found"),
    "app_list_loading_state_canLoadMore" : MessageLookupByLibrary.simpleMessage("Can load more"),
    "app_list_loading_state_failed" : MessageLookupByLibrary.simpleMessage("Failed to load more"),
    "app_list_loading_state_noMoreData" : MessageLookupByLibrary.simpleMessage("No more data"),
    "app_list_refresh_unableToFetch" : MessageLookupByLibrary.simpleMessage("Unable to refresh"),
    "app_localization_dialog_title" : MessageLookupByLibrary.simpleMessage("Localization"),
    "app_localization_form_field_label" : MessageLookupByLibrary.simpleMessage("Localization"),
    "app_media_attachment_addToGallery_error_dialog_content" : MessageLookupByLibrary.simpleMessage("Media type is not supported, network not available or permission not granted"),
    "app_media_attachment_addToGallery_error_dialog_title" : MessageLookupByLibrary.simpleMessage("Can\'t save media"),
    "app_media_attachment_addToGallery_progress_content" : MessageLookupByLibrary.simpleMessage("Saving..."),
    "app_media_attachment_details_notSupported_type" : m15,
    "app_media_attachment_details_title" : MessageLookupByLibrary.simpleMessage("Media attachment"),
    "app_media_attachment_type_audio" : MessageLookupByLibrary.simpleMessage("Audio"),
    "app_media_attachment_type_file" : MessageLookupByLibrary.simpleMessage("File"),
    "app_media_attachment_type_gallery" : MessageLookupByLibrary.simpleMessage("Gallery"),
    "app_media_attachment_type_photo" : MessageLookupByLibrary.simpleMessage("Photo"),
    "app_media_attachment_type_video" : MessageLookupByLibrary.simpleMessage("Video"),
    "app_media_attachment_upload_remove_dialog_action_cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "app_media_attachment_upload_remove_dialog_action_remove" : MessageLookupByLibrary.simpleMessage("Remove"),
    "app_media_attachment_upload_remove_dialog_content" : MessageLookupByLibrary.simpleMessage("Are you sure you want to remove the attachment?"),
    "app_media_player_error_action_moreDetails" : MessageLookupByLibrary.simpleMessage("More details"),
    "app_media_player_error_action_reload" : MessageLookupByLibrary.simpleMessage("Reload"),
    "app_media_player_error_desc" : MessageLookupByLibrary.simpleMessage("Something wrong"),
    "app_media_upload_failed_notification_exceedSize_content" : m16,
    "app_media_upload_failed_notification_title" : MessageLookupByLibrary.simpleMessage("Failed to upload"),
    "app_notification_action_dismiss" : MessageLookupByLibrary.simpleMessage("Dismiss"),
    "app_notification_action_markAsRead" : MessageLookupByLibrary.simpleMessage("Mark as read"),
    "app_notification_action_popup_title" : MessageLookupByLibrary.simpleMessage("Notification actions"),
    "app_notification_dismissed" : MessageLookupByLibrary.simpleMessage("Dismissed"),
    "app_notification_header_favourite" : m17,
    "app_notification_header_follow" : MessageLookupByLibrary.simpleMessage("Followed you"),
    "app_notification_header_followRequest" : MessageLookupByLibrary.simpleMessage("Follow request"),
    "app_notification_header_mention" : m18,
    "app_notification_header_move" : MessageLookupByLibrary.simpleMessage("Move"),
    "app_notification_header_pleromaChatMention" : m19,
    "app_notification_header_pleromaEmojiReaction" : m20,
    "app_notification_header_poll" : MessageLookupByLibrary.simpleMessage("Voted poll ended"),
    "app_notification_header_reblog" : m21,
    "app_notification_header_unknown" : m22,
    "app_notification_list_newItems_action_tapToLoadNew" : m23,
    "app_notification_push_permission_ask_dialog_content" : MessageLookupByLibrary.simpleMessage("Do you want to enable push notifications?\nThey will be forwarded through Fedi push proxy server"),
    "app_notification_push_permission_ask_dialog_title" : MessageLookupByLibrary.simpleMessage("Push notifications"),
    "app_notification_push_permission_declined_dialog_content" : MessageLookupByLibrary.simpleMessage("Please enable push notification in app settings to receive updates"),
    "app_notification_push_permission_declined_dialog_title" : MessageLookupByLibrary.simpleMessage("Permission required"),
    "app_notification_push_settings_desc" : MessageLookupByLibrary.simpleMessage("All messages will be forwarded through Fedi proxy server"),
    "app_notification_push_settings_field_chat_label" : MessageLookupByLibrary.simpleMessage("Chat"),
    "app_notification_push_settings_field_favourites_label" : MessageLookupByLibrary.simpleMessage("Favourites"),
    "app_notification_push_settings_field_follows_label" : MessageLookupByLibrary.simpleMessage("Follows"),
    "app_notification_push_settings_field_mentions_label" : MessageLookupByLibrary.simpleMessage("Mentions"),
    "app_notification_push_settings_field_polls_label" : MessageLookupByLibrary.simpleMessage("Voted Poll ended"),
    "app_notification_push_settings_field_reblogs_label" : MessageLookupByLibrary.simpleMessage("Reblogs"),
    "app_notification_push_settings_title" : MessageLookupByLibrary.simpleMessage("Push notifications settings"),
    "app_poll_metadata_expires_expired" : MessageLookupByLibrary.simpleMessage("Poll ended"),
    "app_poll_metadata_expires_notExpired" : m24,
    "app_poll_metadata_hideResults" : MessageLookupByLibrary.simpleMessage("Hide results"),
    "app_poll_metadata_showResults" : MessageLookupByLibrary.simpleMessage("View results"),
    "app_poll_metadata_totalVotes" : m25,
    "app_poll_vote" : MessageLookupByLibrary.simpleMessage("Vote"),
    "app_search_field_input_hint" : MessageLookupByLibrary.simpleMessage("Search"),
    "app_search_recent_empty" : MessageLookupByLibrary.simpleMessage("No recent searches"),
    "app_search_recent_title" : MessageLookupByLibrary.simpleMessage("Recent"),
    "app_search_tab_accounts" : MessageLookupByLibrary.simpleMessage("Users"),
    "app_search_tab_all" : MessageLookupByLibrary.simpleMessage("All"),
    "app_search_tab_hashtags" : MessageLookupByLibrary.simpleMessage("Hashtags"),
    "app_search_tab_statuses" : MessageLookupByLibrary.simpleMessage("Posts"),
    "app_search_title" : MessageLookupByLibrary.simpleMessage("Search"),
    "app_share_action_share" : MessageLookupByLibrary.simpleMessage("Share"),
    "app_share_action_shareToChats" : MessageLookupByLibrary.simpleMessage("Share to Chats"),
    "app_share_action_shareToConversations" : MessageLookupByLibrary.simpleMessage("Share to Conversations"),
    "app_share_action_shareToExternal" : MessageLookupByLibrary.simpleMessage("Share to external app"),
    "app_share_external_field_shareAsLink" : MessageLookupByLibrary.simpleMessage("Share as link"),
    "app_share_external_title" : MessageLookupByLibrary.simpleMessage("Share to external app"),
    "app_share_title" : MessageLookupByLibrary.simpleMessage("Share"),
    "app_share_toast_success" : MessageLookupByLibrary.simpleMessage("Shared successfully"),
    "app_share_with_message_field_message_hint" : MessageLookupByLibrary.simpleMessage("Describe content (optional)"),
    "app_share_with_message_field_message_label" : MessageLookupByLibrary.simpleMessage("Message"),
    "app_status_action_bookmark" : MessageLookupByLibrary.simpleMessage("Bookmark"),
    "app_status_action_copyLink" : MessageLookupByLibrary.simpleMessage("Copy link"),
    "app_status_action_delete" : MessageLookupByLibrary.simpleMessage("Delete"),
    "app_status_action_mute" : MessageLookupByLibrary.simpleMessage("Mute conversation"),
    "app_status_action_openInBrowser" : MessageLookupByLibrary.simpleMessage("Open in browser"),
    "app_status_action_pin" : MessageLookupByLibrary.simpleMessage("Pin"),
    "app_status_action_popup_title" : MessageLookupByLibrary.simpleMessage("Status Actions"),
    "app_status_action_showThisThread" : MessageLookupByLibrary.simpleMessage("Show this thread"),
    "app_status_action_unbookmark" : MessageLookupByLibrary.simpleMessage("Unbookmark"),
    "app_status_action_unmute" : MessageLookupByLibrary.simpleMessage("Unmute conversation"),
    "app_status_action_unpin" : MessageLookupByLibrary.simpleMessage("Unpin"),
    "app_status_collapsible_action_collapse" : MessageLookupByLibrary.simpleMessage("Collapse"),
    "app_status_collapsible_action_expand" : MessageLookupByLibrary.simpleMessage("Expand"),
    "app_status_copyLink_toast" : MessageLookupByLibrary.simpleMessage("Copied"),
    "app_status_deleted_desc" : MessageLookupByLibrary.simpleMessage("Status deleted"),
    "app_status_draft_edit_title" : MessageLookupByLibrary.simpleMessage("Edit Draft"),
    "app_status_draft_state_alreadyPosted" : MessageLookupByLibrary.simpleMessage("Already posted"),
    "app_status_draft_state_canceled" : MessageLookupByLibrary.simpleMessage("Canceled"),
    "app_status_draft_title" : MessageLookupByLibrary.simpleMessage("Drafts"),
    "app_status_emoji_error_cantAdd_dialog_content" : m26,
    "app_status_emoji_error_cantAdd_dialog_title" : MessageLookupByLibrary.simpleMessage("Can\'t add emoji"),
    "app_status_favouritedBy_title" : MessageLookupByLibrary.simpleMessage("Favourited by"),
    "app_status_list_newItems_action_tapToLoadNew" : m27,
    "app_status_nsfw_action_view" : MessageLookupByLibrary.simpleMessage("Tap to view"),
    "app_status_nsfw_chip" : MessageLookupByLibrary.simpleMessage("NSFW!"),
    "app_status_post_action_post" : MessageLookupByLibrary.simpleMessage("Post"),
    "app_status_post_dialog_async_content" : MessageLookupByLibrary.simpleMessage("Posting..."),
    "app_status_post_dialog_error_content" : m28,
    "app_status_post_dialog_error_title_post" : MessageLookupByLibrary.simpleMessage("Failed to post status"),
    "app_status_post_dialog_error_title_schedule" : MessageLookupByLibrary.simpleMessage("Failed to schedule status"),
    "app_status_post_error_empty_dialog_title" : MessageLookupByLibrary.simpleMessage("Can\'t send empty message"),
    "app_status_post_error_poll_dialog_title" : MessageLookupByLibrary.simpleMessage("Enter at least two poll options"),
    "app_status_post_field_message_hint" : MessageLookupByLibrary.simpleMessage("What’s going on today?"),
    "app_status_post_field_subject" : MessageLookupByLibrary.simpleMessage("Subject (optional)"),
    "app_status_post_new_title" : MessageLookupByLibrary.simpleMessage("New status"),
    "app_status_post_new_unsaved_dialog_action_discard" : MessageLookupByLibrary.simpleMessage("Discard"),
    "app_status_post_new_unsaved_dialog_action_saveAsDraft" : MessageLookupByLibrary.simpleMessage("Save as draft"),
    "app_status_post_new_unsaved_dialog_title" : MessageLookupByLibrary.simpleMessage("You have unsaved changes"),
    "app_status_post_poll_field_length_label" : MessageLookupByLibrary.simpleMessage("Poll length"),
    "app_status_post_poll_field_length_picker_title" : MessageLookupByLibrary.simpleMessage("Poll length"),
    "app_status_post_poll_field_multiply_label" : MessageLookupByLibrary.simpleMessage("Multiple selection"),
    "app_status_post_poll_field_option_hint" : m29,
    "app_status_post_schedule_error_notInFuture_dialog_content" : MessageLookupByLibrary.simpleMessage("Schedule time must be at least 5 minutes in the future"),
    "app_status_post_schedule_error_notInFuture_dialog_title" : MessageLookupByLibrary.simpleMessage("Invalid time"),
    "app_status_post_toast_success_post" : MessageLookupByLibrary.simpleMessage("Status posted"),
    "app_status_post_toast_success_schedule" : MessageLookupByLibrary.simpleMessage("Status scheduled"),
    "app_status_post_visibility_state_direct" : MessageLookupByLibrary.simpleMessage("Direct"),
    "app_status_post_visibility_state_list" : MessageLookupByLibrary.simpleMessage("List"),
    "app_status_post_visibility_state_private" : MessageLookupByLibrary.simpleMessage("Private"),
    "app_status_post_visibility_state_public" : MessageLookupByLibrary.simpleMessage("Public"),
    "app_status_post_visibility_state_unlisted" : MessageLookupByLibrary.simpleMessage("Unlisted"),
    "app_status_post_visibility_title" : MessageLookupByLibrary.simpleMessage("Visibility"),
    "app_status_reblog_header" : MessageLookupByLibrary.simpleMessage("reposted"),
    "app_status_rebloggedBy_title" : MessageLookupByLibrary.simpleMessage("Reblogged by"),
    "app_status_reply_header" : MessageLookupByLibrary.simpleMessage("reply to"),
    "app_status_reply_loading_failed" : MessageLookupByLibrary.simpleMessage("Failed to load original status"),
    "app_status_reply_loading_progress" : MessageLookupByLibrary.simpleMessage("Loading original status"),
    "app_status_reply_replyingTo" : m30,
    "app_status_scheduled_datetime_picker_title" : MessageLookupByLibrary.simpleMessage("Schedule"),
    "app_status_scheduled_edit_title" : MessageLookupByLibrary.simpleMessage("Scheduled post"),
    "app_status_scheduled_state_alreadyPosted" : MessageLookupByLibrary.simpleMessage("Already posted"),
    "app_status_scheduled_state_canceled" : MessageLookupByLibrary.simpleMessage("Canceled"),
    "app_status_scheduled_title" : MessageLookupByLibrary.simpleMessage("Queue"),
    "app_status_spoiler_action_view" : MessageLookupByLibrary.simpleMessage("Tap to view"),
    "app_status_spoiler_chip" : MessageLookupByLibrary.simpleMessage("Spoilers!"),
    "app_status_thread_post_hint" : m31,
    "app_status_thread_start_loading" : MessageLookupByLibrary.simpleMessage("Loading start status"),
    "app_theme_chooser_label" : MessageLookupByLibrary.simpleMessage("Color scheme"),
    "app_theme_type_dark" : MessageLookupByLibrary.simpleMessage("Dark"),
    "app_theme_type_light" : MessageLookupByLibrary.simpleMessage("Light"),
    "app_theme_type_system" : MessageLookupByLibrary.simpleMessage("Auto"),
    "app_timeline_create_field_id_label" : MessageLookupByLibrary.simpleMessage("Unique id"),
    "app_timeline_create_field_title_hint" : MessageLookupByLibrary.simpleMessage("Timeline name"),
    "app_timeline_create_field_title_label" : MessageLookupByLibrary.simpleMessage("Title"),
    "app_timeline_create_title" : MessageLookupByLibrary.simpleMessage("Create new timeline"),
    "app_timeline_loading" : MessageLookupByLibrary.simpleMessage("Loading timelines"),
    "app_timeline_settings_content" : m32,
    "app_timeline_settings_field_excludeNsfw_label" : MessageLookupByLibrary.simpleMessage("Exclude NSFW"),
    "app_timeline_settings_field_excludeReblogs_label" : MessageLookupByLibrary.simpleMessage("Exclude reblogs"),
    "app_timeline_settings_field_excludeReplies_label" : MessageLookupByLibrary.simpleMessage("Exclude replies"),
    "app_timeline_settings_field_notSupported_desc" : MessageLookupByLibrary.simpleMessage("Not supported on this instance"),
    "app_timeline_settings_field_onlyLocal_label" : MessageLookupByLibrary.simpleMessage("Only local"),
    "app_timeline_settings_field_onlyPinned_label" : MessageLookupByLibrary.simpleMessage("Only pinned"),
    "app_timeline_settings_field_onlyRemote_label" : MessageLookupByLibrary.simpleMessage("Only remote"),
    "app_timeline_settings_field_onlyWithMedia_label" : MessageLookupByLibrary.simpleMessage("Only with media"),
    "app_timeline_settings_field_withMuted_label" : MessageLookupByLibrary.simpleMessage("With muted"),
    "app_timeline_settings_onlyFromRemoteAccount_field_label" : MessageLookupByLibrary.simpleMessage("Only from account"),
    "app_timeline_settings_onlyFromRemoteAccount_field_null" : MessageLookupByLibrary.simpleMessage("Not selected"),
    "app_timeline_settings_onlyInRemoteList_field_chooser_dialog_title" : MessageLookupByLibrary.simpleMessage("Choose list"),
    "app_timeline_settings_onlyInRemoteList_field_label" : MessageLookupByLibrary.simpleMessage("Only in list"),
    "app_timeline_settings_onlyInRemoteList_field_null" : MessageLookupByLibrary.simpleMessage("Not selected"),
    "app_timeline_settings_replyVisibilityFilter_field_chooser_dialog_title" : MessageLookupByLibrary.simpleMessage("Choose reply visibility filter"),
    "app_timeline_settings_replyVisibilityFilter_field_label" : MessageLookupByLibrary.simpleMessage("Reply visibility filter"),
    "app_timeline_settings_replyVisibilityFilter_field_null" : MessageLookupByLibrary.simpleMessage("Not selected"),
    "app_timeline_settings_replyVisibilityFilter_following" : MessageLookupByLibrary.simpleMessage("Following"),
    "app_timeline_settings_replyVisibilityFilter_self" : MessageLookupByLibrary.simpleMessage("Self"),
    "app_timeline_settings_title" : MessageLookupByLibrary.simpleMessage("Settings:"),
    "app_timeline_settings_withRemoteHashtag_field_hint" : MessageLookupByLibrary.simpleMessage("pleroma"),
    "app_timeline_settings_withRemoteHashtag_field_label" : MessageLookupByLibrary.simpleMessage("With hashtag"),
    "app_timeline_storage_appBar_action_done" : MessageLookupByLibrary.simpleMessage("Done"),
    "app_timeline_storage_appBar_action_edit" : MessageLookupByLibrary.simpleMessage("Edit"),
    "app_timeline_storage_delete_dialog_action_delete" : MessageLookupByLibrary.simpleMessage("Delete"),
    "app_timeline_storage_delete_dialog_content" : m33,
    "app_timeline_storage_delete_dialog_title" : MessageLookupByLibrary.simpleMessage("Delete"),
    "app_timeline_storage_empty" : MessageLookupByLibrary.simpleMessage("Nothing found"),
    "app_timeline_storage_title" : MessageLookupByLibrary.simpleMessage("Timelines"),
    "app_timeline_type_account" : MessageLookupByLibrary.simpleMessage("Account"),
    "app_timeline_type_customList" : MessageLookupByLibrary.simpleMessage("List"),
    "app_timeline_type_field_chooser_dialog_title" : MessageLookupByLibrary.simpleMessage("Choose timeline type"),
    "app_timeline_type_field_label" : MessageLookupByLibrary.simpleMessage("Type"),
    "app_timeline_type_field_null" : MessageLookupByLibrary.simpleMessage("Not selected"),
    "app_timeline_type_hashtag" : MessageLookupByLibrary.simpleMessage("Hashtag"),
    "app_timeline_type_home" : MessageLookupByLibrary.simpleMessage("Home"),
    "app_timeline_type_public" : MessageLookupByLibrary.simpleMessage("Public"),
    "app_tos_title" : MessageLookupByLibrary.simpleMessage("Terms of service"),
    "async_init_state_failed" : m34,
    "async_init_state_notStarted" : MessageLookupByLibrary.simpleMessage("Async init not started"),
    "dialog_action_cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "dialog_action_no" : MessageLookupByLibrary.simpleMessage("No"),
    "dialog_action_ok" : MessageLookupByLibrary.simpleMessage("OK"),
    "dialog_action_yes" : MessageLookupByLibrary.simpleMessage("Yes"),
    "dialog_error_content" : m35,
    "dialog_error_title" : MessageLookupByLibrary.simpleMessage("Something wrong"),
    "dialog_progress_action_cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "dialog_progress_content" : MessageLookupByLibrary.simpleMessage("Loading..."),
    "duration_day" : m36,
    "duration_hour" : m37,
    "duration_minute" : m38,
    "file_picker_empty" : MessageLookupByLibrary.simpleMessage("You don\'t have any media"),
    "file_picker_single_title" : MessageLookupByLibrary.simpleMessage("Choose media"),
    "form_field_text_email_error_invalid_desc" : MessageLookupByLibrary.simpleMessage("Invalid email"),
    "form_field_text_error_empty_desc" : MessageLookupByLibrary.simpleMessage("Must be not empty"),
    "form_field_text_error_length_maxOnly_desc" : m39,
    "form_field_text_error_length_minAndMax_desc" : m40,
    "form_field_text_error_length_minOnly_desc" : m41,
    "form_field_text_password_error_notMatch_desc" : MessageLookupByLibrary.simpleMessage("Password and confirm password must match"),
    "form_field_text_url_error_invalid_desc" : MessageLookupByLibrary.simpleMessage("Invalid URL"),
    "form_field_value_error_null_desc" : MessageLookupByLibrary.simpleMessage("Required"),
    "link_error_dialog_content" : m42,
    "link_error_dialog_title" : MessageLookupByLibrary.simpleMessage("Can\'t launch URL"),
    "localization_locale_en" : MessageLookupByLibrary.simpleMessage("English"),
    "localization_locale_ru" : MessageLookupByLibrary.simpleMessage("Russian"),
    "localization_locale_system" : MessageLookupByLibrary.simpleMessage("System"),
    "pagination_list_empty" : MessageLookupByLibrary.simpleMessage("Nothing found"),
    "permission_grant_action_grant" : MessageLookupByLibrary.simpleMessage("Grant permission"),
    "timeago_aDay" : m43,
    "timeago_aboutAMinute" : m44,
    "timeago_aboutAMonth" : m45,
    "timeago_aboutAYear" : m46,
    "timeago_aboutAnHour" : m47,
    "timeago_days" : m48,
    "timeago_hours" : m49,
    "timeago_lessThanOneMinute" : m50,
    "timeago_minutes" : m51,
    "timeago_months" : m52,
    "timeago_prefixAgo" : MessageLookupByLibrary.simpleMessage(""),
    "timeago_prefixFromNow" : MessageLookupByLibrary.simpleMessage(""),
    "timeago_suffixAgo" : MessageLookupByLibrary.simpleMessage(""),
    "timeago_suffixFromNow" : MessageLookupByLibrary.simpleMessage(""),
    "timeago_wordSeparator" : MessageLookupByLibrary.simpleMessage(" "),
    "timeago_years" : m53
  };
}
