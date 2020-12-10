// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `English`
  String get localization_locale_en {
    return Intl.message(
      'English',
      name: 'localization_locale_en',
      desc: '',
      args: [],
    );
  }

  /// `Русский`
  String get localization_locale_ru {
    return Intl.message(
      'Русский',
      name: 'localization_locale_ru',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get localization_locale_system {
    return Intl.message(
      'System',
      name: 'localization_locale_system',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get app_localization_dialog_title {
    return Intl.message(
      'Language',
      name: 'app_localization_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get app_localization_form_field_label {
    return Intl.message(
      'Language',
      name: 'app_localization_form_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Failed to start app.\nTry restart or re-install app.`
  String get app_init_fail {
    return Intl.message(
      'Failed to start app.\nTry restart or re-install app.',
      name: 'app_init_fail',
      desc: '',
      args: [],
    );
  }

  /// `Color scheme`
  String get app_theme_chooser_label {
    return Intl.message(
      'Color scheme',
      name: 'app_theme_chooser_label',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get app_theme_type_dark {
    return Intl.message(
      'Dark',
      name: 'app_theme_type_dark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get app_theme_type_light {
    return Intl.message(
      'Light',
      name: 'app_theme_type_light',
      desc: '',
      args: [],
    );
  }

  /// `Auto`
  String get app_theme_type_system {
    return Intl.message(
      'Auto',
      name: 'app_theme_type_system',
      desc: '',
      args: [],
    );
  }

  /// `Create a list`
  String get app_customList_create_title {
    return Intl.message(
      'Create a list',
      name: 'app_customList_create_title',
      desc: '',
      args: [],
    );
  }

  /// `Edit list`
  String get app_customList_edit_title {
    return Intl.message(
      'Edit list',
      name: 'app_customList_edit_title',
      desc: '',
      args: [],
    );
  }

  /// `Lists`
  String get app_acccount_my_customList_list_title {
    return Intl.message(
      'Lists',
      name: 'app_acccount_my_customList_list_title',
      desc: '',
      args: [],
    );
  }

  /// `Title*`
  String get app_customList_form_field_title_label {
    return Intl.message(
      'Title*',
      name: 'app_customList_form_field_title_label',
      desc: '',
      args: [],
    );
  }

  /// `Give your list a title`
  String get app_customList_form_field_title_hint {
    return Intl.message(
      'Give your list a title',
      name: 'app_customList_form_field_title_hint',
      desc: '',
      args: [],
    );
  }

  /// `This instance don't have custom emojis`
  String get app_emoji_custom_empty {
    return Intl.message(
      'This instance don\'t have custom emojis',
      name: 'app_emoji_custom_empty',
      desc: '',
      args: [],
    );
  }

  /// `No recent emojis`
  String get app_emoji_recent_empty {
    return Intl.message(
      'No recent emojis',
      name: 'app_emoji_recent_empty',
      desc: '',
      args: [],
    );
  }

  /// `This category don't have suitable emojis`
  String get app_emoji_category_empty {
    return Intl.message(
      'This category don\'t have suitable emojis',
      name: 'app_emoji_category_empty',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get app_share_title {
    return Intl.message(
      'Share',
      name: 'app_share_title',
      desc: '',
      args: [],
    );
  }

  /// `Share to external app`
  String get app_share_external_title {
    return Intl.message(
      'Share to external app',
      name: 'app_share_external_title',
      desc: '',
      args: [],
    );
  }

  /// `Share as link`
  String get app_share_external_field_shareAsLink {
    return Intl.message(
      'Share as link',
      name: 'app_share_external_field_shareAsLink',
      desc: '',
      args: [],
    );
  }

  /// `Shared successfully`
  String get app_share_toast_success {
    return Intl.message(
      'Shared successfully',
      name: 'app_share_toast_success',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get app_share_with_message_field_message_label {
    return Intl.message(
      'Message',
      name: 'app_share_with_message_field_message_label',
      desc: '',
      args: [],
    );
  }

  /// `Describe content (optional)`
  String get app_share_with_message_field_message_hint {
    return Intl.message(
      'Describe content (optional)',
      name: 'app_share_with_message_field_message_hint',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get app_share_action_share {
    return Intl.message(
      'Share',
      name: 'app_share_action_share',
      desc: '',
      args: [],
    );
  }

  /// `Share to external app`
  String get app_share_action_shareToExternal {
    return Intl.message(
      'Share to external app',
      name: 'app_share_action_shareToExternal',
      desc: '',
      args: [],
    );
  }

  /// `Share to Chats`
  String get app_share_action_shareToChats {
    return Intl.message(
      'Share to Chats',
      name: 'app_share_action_shareToChats',
      desc: '',
      args: [],
    );
  }

  /// `Share to Conversations`
  String get app_share_action_shareToConversations {
    return Intl.message(
      'Share to Conversations',
      name: 'app_share_action_shareToConversations',
      desc: '',
      args: [],
    );
  }

  /// `Hide results`
  String get app_poll_metadata_hideResults {
    return Intl.message(
      'Hide results',
      name: 'app_poll_metadata_hideResults',
      desc: '',
      args: [],
    );
  }

  /// `View results`
  String get app_poll_metadata_showResults {
    return Intl.message(
      'View results',
      name: 'app_poll_metadata_showResults',
      desc: '',
      args: [],
    );
  }

  /// `Poll ended`
  String get app_poll_metadata_expires_expired {
    return Intl.message(
      'Poll ended',
      name: 'app_poll_metadata_expires_expired',
      desc: '',
      args: [],
    );
  }

  /// ` {dayCount} left`
  String app_poll_metadata_expires_notExpired(Object dayCount) {
    return Intl.message(
      ' $dayCount left',
      name: 'app_poll_metadata_expires_notExpired',
      desc: '',
      args: [dayCount],
    );
  }

  /// `{count,plural, =0{No votes} =1{1 vote} other{{count} votes}}`
  String app_poll_metadata_totalVotes(num count) {
    return Intl.plural(
      count,
      zero: 'No votes',
      one: '1 vote',
      other: '$count votes',
      name: 'app_poll_metadata_totalVotes',
      desc: '',
      args: [count],
    );
  }

  /// `Vote`
  String get app_poll_vote {
    return Intl.message(
      'Vote',
      name: 'app_poll_vote',
      desc: '',
      args: [],
    );
  }

  /// `Select date`
  String get app_datetime_title {
    return Intl.message(
      'Select date',
      name: 'app_datetime_title',
      desc: '',
      args: [],
    );
  }

  /// `Set time`
  String get app_datetime_picker_action_ok {
    return Intl.message(
      'Set time',
      name: 'app_datetime_picker_action_ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get app_datetime_picker_action_cancel {
    return Intl.message(
      'Cancel',
      name: 'app_datetime_picker_action_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Including replies`
  String get app_account_statuses_tab_withReplies {
    return Intl.message(
      'Including replies',
      name: 'app_account_statuses_tab_withReplies',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get app_account_statuses_tab_withoutReplies {
    return Intl.message(
      'Posts',
      name: 'app_account_statuses_tab_withoutReplies',
      desc: '',
      args: [],
    );
  }

  /// `Pinned`
  String get app_account_statuses_tab_pinned {
    return Intl.message(
      'Pinned',
      name: 'app_account_statuses_tab_pinned',
      desc: '',
      args: [],
    );
  }

  /// `Media`
  String get app_account_statuses_tab_media {
    return Intl.message(
      'Media',
      name: 'app_account_statuses_tab_media',
      desc: '',
      args: [],
    );
  }

  /// `Some information may be missed due to privacy settings`
  String get app_account_list_privacy {
    return Intl.message(
      'Some information may be missed due to privacy settings',
      name: 'app_account_list_privacy',
      desc: '',
      args: [],
    );
  }

  /// `{accountAcct} followers`
  String app_account_follower_title(Object accountAcct) {
    return Intl.message(
      '$accountAcct followers',
      name: 'app_account_follower_title',
      desc: '',
      args: [accountAcct],
    );
  }

  /// `{accountAcct} followings`
  String app_account_following_title(Object accountAcct) {
    return Intl.message(
      '$accountAcct followings',
      name: 'app_account_following_title',
      desc: '',
      args: [accountAcct],
    );
  }

  /// `Follow`
  String get app_account_action_follow {
    return Intl.message(
      'Follow',
      name: 'app_account_action_follow',
      desc: '',
      args: [],
    );
  }

  /// `Unfollow`
  String get app_account_action_unfollow {
    return Intl.message(
      'Unfollow',
      name: 'app_account_action_unfollow',
      desc: '',
      args: [],
    );
  }

  /// `Requested`
  String get app_account_action_followRequested {
    return Intl.message(
      'Requested',
      name: 'app_account_action_followRequested',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get app_account_action_message {
    return Intl.message(
      'Message',
      name: 'app_account_action_message',
      desc: '',
      args: [],
    );
  }

  /// `Block`
  String get app_account_action_block {
    return Intl.message(
      'Block',
      name: 'app_account_action_block',
      desc: '',
      args: [],
    );
  }

  /// `Unblock`
  String get app_account_action_unblock {
    return Intl.message(
      'Unblock',
      name: 'app_account_action_unblock',
      desc: '',
      args: [],
    );
  }

  /// `Block domain {domain}`
  String app_account_action_blockDomain(Object domain) {
    return Intl.message(
      'Block domain $domain',
      name: 'app_account_action_blockDomain',
      desc: '',
      args: [domain],
    );
  }

  /// `Unblock domain {domain}`
  String app_account_action_unblockDomain(Object domain) {
    return Intl.message(
      'Unblock domain $domain',
      name: 'app_account_action_unblockDomain',
      desc: '',
      args: [domain],
    );
  }

  /// `Mute`
  String get app_account_action_mute {
    return Intl.message(
      'Mute',
      name: 'app_account_action_mute',
      desc: '',
      args: [],
    );
  }

  /// `Unmute`
  String get app_account_action_unmute {
    return Intl.message(
      'Unmute',
      name: 'app_account_action_unmute',
      desc: '',
      args: [],
    );
  }

  /// `Open in browser`
  String get app_account_action_openInBrowser {
    return Intl.message(
      'Open in browser',
      name: 'app_account_action_openInBrowser',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get app_account_action_report_label {
    return Intl.message(
      'Report',
      name: 'app_account_action_report_label',
      desc: '',
      args: [],
    );
  }

  /// `Successfully reported`
  String get app_account_action_report_success_toast {
    return Intl.message(
      'Successfully reported',
      name: 'app_account_action_report_success_toast',
      desc: '',
      args: [],
    );
  }

  /// `Failed to report`
  String get app_account_action_report_fail_dialog_title {
    return Intl.message(
      'Failed to report',
      name: 'app_account_action_report_fail_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Something wrong`
  String get app_account_action_report_fail_dialog_content {
    return Intl.message(
      'Something wrong',
      name: 'app_account_action_report_fail_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `More actions for:`
  String get app_account_action_popup_title {
    return Intl.message(
      'More actions for:',
      name: 'app_account_action_popup_title',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get app_account_info_followers {
    return Intl.message(
      'Followers',
      name: 'app_account_info_followers',
      desc: '',
      args: [],
    );
  }

  /// `Following`
  String get app_account_info_following {
    return Intl.message(
      'Following',
      name: 'app_account_info_following',
      desc: '',
      args: [],
    );
  }

  /// `Statuses`
  String get app_account_info_statuses {
    return Intl.message(
      'Statuses',
      name: 'app_account_info_statuses',
      desc: '',
      args: [],
    );
  }

  /// `Follow requests`
  String get app_account_my_followRequest_title {
    return Intl.message(
      'Follow requests',
      name: 'app_account_my_followRequest_title',
      desc: '',
      args: [],
    );
  }

  /// `Account blocks`
  String get app_account_my_accountBlock_title {
    return Intl.message(
      'Account blocks',
      name: 'app_account_my_accountBlock_title',
      desc: '',
      args: [],
    );
  }

  /// `Account mutes`
  String get app_account_my_accountMute_title {
    return Intl.message(
      'Account mutes',
      name: 'app_account_my_accountMute_title',
      desc: '',
      args: [],
    );
  }

  /// `Domain blocks`
  String get app_account_my_domainBlock_title {
    return Intl.message(
      'Domain blocks',
      name: 'app_account_my_domainBlock_title',
      desc: '',
      args: [],
    );
  }

  /// `Add domain block`
  String get app_account_my_domainBlock_add_dialog_title {
    return Intl.message(
      'Add domain block',
      name: 'app_account_my_domainBlock_add_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `mastodon.social`
  String get app_account_my_domainBlock_add_dialog_field_domain_hint {
    return Intl.message(
      'mastodon.social',
      name: 'app_account_my_domainBlock_add_dialog_field_domain_hint',
      desc: '',
      args: [],
    );
  }

  /// `Bookmarks`
  String get app_account_my_statuses_bookmarked_title {
    return Intl.message(
      'Bookmarks',
      name: 'app_account_my_statuses_bookmarked_title',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get app_account_my_statuses_favourited_title {
    return Intl.message(
      'Favourites',
      name: 'app_account_my_statuses_favourited_title',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get app_account_home_tab_menu_action_account {
    return Intl.message(
      'Account',
      name: 'app_account_home_tab_menu_action_account',
      desc: '',
      args: [],
    );
  }

  /// `Settings: global`
  String get app_account_home_tab_menu_action_global_settings {
    return Intl.message(
      'Settings: global',
      name: 'app_account_home_tab_menu_action_global_settings',
      desc: '',
      args: [],
    );
  }

  /// `Bookmarks`
  String get app_account_home_tab_menu_action_bookmarks {
    return Intl.message(
      'Bookmarks',
      name: 'app_account_home_tab_menu_action_bookmarks',
      desc: '',
      args: [],
    );
  }

  /// `Lists`
  String get app_account_home_tab_menu_action_lists {
    return Intl.message(
      'Lists',
      name: 'app_account_home_tab_menu_action_lists',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get app_account_my_menu_account_subpage_title {
    return Intl.message(
      'Account',
      name: 'app_account_my_menu_account_subpage_title',
      desc: '',
      args: [],
    );
  }

  /// `Settings: global`
  String get app_settings_global_title {
    return Intl.message(
      'Settings: global',
      name: 'app_settings_global_title',
      desc: '',
      args: [],
    );
  }

  /// `Scheduled posts`
  String get app_account_my_action_scheduledPosts {
    return Intl.message(
      'Scheduled posts',
      name: 'app_account_my_action_scheduledPosts',
      desc: '',
      args: [],
    );
  }

  /// `Draft posts`
  String get app_account_my_action_draftPosts {
    return Intl.message(
      'Draft posts',
      name: 'app_account_my_action_draftPosts',
      desc: '',
      args: [],
    );
  }

  /// `Lists`
  String get app_account_my_action_lists {
    return Intl.message(
      'Lists',
      name: 'app_account_my_action_lists',
      desc: '',
      args: [],
    );
  }

  /// `Bookmarks`
  String get app_account_my_action_bookmarked {
    return Intl.message(
      'Bookmarks',
      name: 'app_account_my_action_bookmarked',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get app_account_my_action_favourited {
    return Intl.message(
      'Favourites',
      name: 'app_account_my_action_favourited',
      desc: '',
      args: [],
    );
  }

  /// `Follow requests`
  String get app_account_my_action_followRequests {
    return Intl.message(
      'Follow requests',
      name: 'app_account_my_action_followRequests',
      desc: '',
      args: [],
    );
  }

  /// `Account blocks`
  String get app_account_my_action_accountBlocks {
    return Intl.message(
      'Account blocks',
      name: 'app_account_my_action_accountBlocks',
      desc: '',
      args: [],
    );
  }

  /// `Account mutes`
  String get app_account_my_action_accountMutes {
    return Intl.message(
      'Account mutes',
      name: 'app_account_my_action_accountMutes',
      desc: '',
      args: [],
    );
  }

  /// `Domain blocks`
  String get app_account_my_action_domainBlocks {
    return Intl.message(
      'Domain blocks',
      name: 'app_account_my_action_domainBlocks',
      desc: '',
      args: [],
    );
  }

  /// `Edit account`
  String get app_account_my_edit_title {
    return Intl.message(
      'Edit account',
      name: 'app_account_my_edit_title',
      desc: '',
      args: [],
    );
  }

  /// `Failed to upload`
  String get app_media_upload_failed_notification_title {
    return Intl.message(
      'Failed to upload',
      name: 'app_media_upload_failed_notification_title',
      desc: '',
      args: [],
    );
  }

  /// `File size is {formattedFileSize} MB, but max is {formattedMaxFileSize} MB`
  String app_media_upload_failed_notification_exceedSize_content(Object formattedFileSize, Object formattedMaxFileSize) {
    return Intl.message(
      'File size is $formattedFileSize MB, but max is $formattedMaxFileSize MB',
      name: 'app_media_upload_failed_notification_exceedSize_content',
      desc: '',
      args: [formattedFileSize, formattedMaxFileSize],
    );
  }

  /// `Save`
  String get app_account_my_edit_action_save {
    return Intl.message(
      'Save',
      name: 'app_account_my_edit_action_save',
      desc: '',
      args: [],
    );
  }

  /// `You have unsaved changes`
  String get app_account_my_edit_unsaved_dialog_title {
    return Intl.message(
      'You have unsaved changes',
      name: 'app_account_my_edit_unsaved_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Discard`
  String get app_account_my_edit_unsaved_dialog_action_discard {
    return Intl.message(
      'Discard',
      name: 'app_account_my_edit_unsaved_dialog_action_discard',
      desc: '',
      args: [],
    );
  }

  /// `Confirm selection?`
  String get app_account_my_edit_field_avatar_dialog_title {
    return Intl.message(
      'Confirm selection?',
      name: 'app_account_my_edit_field_avatar_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Select & crop`
  String get app_account_my_edit_field_avatar_dialog_action_selectAndCrop {
    return Intl.message(
      'Select & crop',
      name: 'app_account_my_edit_field_avatar_dialog_action_selectAndCrop',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get app_account_my_edit_field_avatar_dialog_action_cancel {
    return Intl.message(
      'Cancel',
      name: 'app_account_my_edit_field_avatar_dialog_action_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm selection?`
  String get app_account_my_edit_field_header_dialog_title {
    return Intl.message(
      'Confirm selection?',
      name: 'app_account_my_edit_field_header_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get app_account_my_edit_field_header_dialog_action_select {
    return Intl.message(
      'Select',
      name: 'app_account_my_edit_field_header_dialog_action_select',
      desc: '',
      args: [],
    );
  }

  /// `Crop`
  String get app_account_my_edit_field_header_dialog_action_crop {
    return Intl.message(
      'Crop',
      name: 'app_account_my_edit_field_header_dialog_action_crop',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get app_account_my_edit_field_header_dialog_action_cancel {
    return Intl.message(
      'Cancel',
      name: 'app_account_my_edit_field_header_dialog_action_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Background image`
  String get app_account_my_edit_field_backgroundImage_label {
    return Intl.message(
      'Background image',
      name: 'app_account_my_edit_field_backgroundImage_label',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get app_account_my_edit_field_backgroundImage_action_add {
    return Intl.message(
      'Add',
      name: 'app_account_my_edit_field_backgroundImage_action_add',
      desc: '',
      args: [],
    );
  }

  /// `Display name*`
  String get app_account_my_edit_field_displayName_label {
    return Intl.message(
      'Display name*',
      name: 'app_account_my_edit_field_displayName_label',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get app_account_my_edit_field_note_label {
    return Intl.message(
      'Note',
      name: 'app_account_my_edit_field_note_label',
      desc: '',
      args: [],
    );
  }

  /// `Locked to followers only`
  String get app_account_my_edit_field_locked_label {
    return Intl.message(
      'Locked to followers only',
      name: 'app_account_my_edit_field_locked_label',
      desc: '',
      args: [],
    );
  }

  /// `Link field #{number}`
  String app_account_my_edit_field_customField_label(Object number) {
    return Intl.message(
      'Link field #$number',
      name: 'app_account_my_edit_field_customField_label',
      desc: '',
      args: [number],
    );
  }

  /// `Name*`
  String get app_account_my_edit_field_customField_name_label {
    return Intl.message(
      'Name*',
      name: 'app_account_my_edit_field_customField_name_label',
      desc: '',
      args: [],
    );
  }

  /// `URL*`
  String get app_account_my_edit_field_customField_value_label {
    return Intl.message(
      'URL*',
      name: 'app_account_my_edit_field_customField_value_label',
      desc: '',
      args: [],
    );
  }

  /// `Add link field`
  String get app_account_my_edit_field_customField_action_addNew {
    return Intl.message(
      'Add link field',
      name: 'app_account_my_edit_field_customField_action_addNew',
      desc: '',
      args: [],
    );
  }

  /// `Pleroma API error`
  String get app_async_pleroma_error_common_dialog_title {
    return Intl.message(
      'Pleroma API error',
      name: 'app_async_pleroma_error_common_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Message: {message}`
  String app_async_pleroma_error_common_dialog_content(Object message) {
    return Intl.message(
      'Message: $message',
      name: 'app_async_pleroma_error_common_dialog_content',
      desc: '',
      args: [message],
    );
  }

  /// `Throttled. Server blocked action.`
  String get app_async_pleroma_error_throttled_dialog_title {
    return Intl.message(
      'Throttled. Server blocked action.',
      name: 'app_async_pleroma_error_throttled_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Too much operations per minute. Please wait before do something again.`
  String get app_async_pleroma_error_throttled_dialog_content {
    return Intl.message(
      'Too much operations per minute. Please wait before do something again.',
      name: 'app_async_pleroma_error_throttled_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Forbidden. Invalid action or session expired`
  String get app_async_pleroma_error_forbidden_dialog_title {
    return Intl.message(
      'Forbidden. Invalid action or session expired',
      name: 'app_async_pleroma_error_forbidden_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `{content}`
  String app_async_pleroma_error_forbidden_dialog_content(Object content) {
    return Intl.message(
      '$content',
      name: 'app_async_pleroma_error_forbidden_dialog_content',
      desc: '',
      args: [content],
    );
  }

  /// `Check your connection`
  String get app_async_socket_error_dialog_title {
    return Intl.message(
      'Check your connection',
      name: 'app_async_socket_error_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `No network or remote server unavailable`
  String get app_async_socket_error_dialog_content {
    return Intl.message(
      'No network or remote server unavailable',
      name: 'app_async_socket_error_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Timeout reached`
  String get app_async_timeout_error_dialog_title {
    return Intl.message(
      'Timeout reached',
      name: 'app_async_timeout_error_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `No network or remote server unavailable`
  String get app_async_timeout_error_dialog_content {
    return Intl.message(
      'No network or remote server unavailable',
      name: 'app_async_timeout_error_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get app_auth_instance_logout_dialog_title {
    return Intl.message(
      'Log Out',
      name: 'app_auth_instance_logout_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Log out of {userAtHost}`
  String app_auth_instance_logout_dialog_content(Object userAtHost) {
    return Intl.message(
      'Log out of $userAtHost',
      name: 'app_auth_instance_logout_dialog_content',
      desc: '',
      args: [userAtHost],
    );
  }

  /// `Add account`
  String get app_auth_instance_chooser_action_addInstance {
    return Intl.message(
      'Add account',
      name: 'app_auth_instance_chooser_action_addInstance',
      desc: '',
      args: [],
    );
  }

  /// `Loading Instance`
  String get app_auth_instance_current_context_loading_loading_title {
    return Intl.message(
      'Loading Instance',
      name: 'app_auth_instance_current_context_loading_loading_title',
      desc: '',
      args: [],
    );
  }

  /// `{userAtHost}`
  String app_auth_instance_current_context_loading_loading_content(Object userAtHost) {
    return Intl.message(
      '$userAtHost',
      name: 'app_auth_instance_current_context_loading_loading_content',
      desc: '',
      args: [userAtHost],
    );
  }

  /// `Can't load {userAtHost} instance.\nApp error or session expired`
  String app_auth_instance_current_context_loading_cantLoad_content(Object userAtHost) {
    return Intl.message(
      'Can\'t load $userAtHost instance.\nApp error or session expired',
      name: 'app_auth_instance_current_context_loading_cantLoad_content',
      desc: '',
      args: [userAtHost],
    );
  }

  /// `Refresh`
  String get app_auth_instance_current_context_loading_cantLoad_action_refresh {
    return Intl.message(
      'Refresh',
      name: 'app_auth_instance_current_context_loading_cantLoad_action_refresh',
      desc: '',
      args: [],
    );
  }

  /// `Choose different account`
  String get app_auth_instance_current_context_loading_cantLoad_action_chooseDifferentAccount {
    return Intl.message(
      'Choose different account',
      name: 'app_auth_instance_current_context_loading_cantLoad_action_chooseDifferentAccount',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get app_auth_instance_current_context_loading_cantLoad_action_logout {
    return Intl.message(
      'Logout',
      name: 'app_auth_instance_current_context_loading_cantLoad_action_logout',
      desc: '',
      args: [],
    );
  }

  /// `Join new instance`
  String get app_auth_instance_join_new_title {
    return Intl.message(
      'Join new instance',
      name: 'app_auth_instance_join_new_title',
      desc: '',
      args: [],
    );
  }

  /// `By using Fedi, you agree to our`
  String get app_auth_instance_join_action_tos_prefix {
    return Intl.message(
      'By using Fedi, you agree to our',
      name: 'app_auth_instance_join_action_tos_prefix',
      desc: '',
      args: [],
    );
  }

  /// `Terms`
  String get app_auth_instance_join_action_tos_terms {
    return Intl.message(
      'Terms',
      name: 'app_auth_instance_join_action_tos_terms',
      desc: '',
      args: [],
    );
  }

  /// `.`
  String get app_auth_instance_join_action_tos_postfix {
    return Intl.message(
      '.',
      name: 'app_auth_instance_join_action_tos_postfix',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get app_auth_instance_join_action_login {
    return Intl.message(
      'Login',
      name: 'app_auth_instance_join_action_login',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get app_auth_instance_join_action_signUp {
    return Intl.message(
      'Sign up',
      name: 'app_auth_instance_join_action_signUp',
      desc: '',
      args: [],
    );
  }

  /// `Fedi.app`
  String get app_auth_instance_join_field_host_hint {
    return Intl.message(
      'Fedi.app',
      name: 'app_auth_instance_join_field_host_hint',
      desc: '',
      args: [],
    );
  }

  /// `Pleroma or Mastodon Instance`
  String get app_auth_instance_join_field_host_helper {
    return Intl.message(
      'Pleroma or Mastodon Instance',
      name: 'app_auth_instance_join_field_host_helper',
      desc: '',
      args: [],
    );
  }

  /// `Checking instance`
  String get app_auth_instance_join_progress_dialog_content {
    return Intl.message(
      'Checking instance',
      name: 'app_auth_instance_join_progress_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Fail to connect to instance. You can try verified fedi.app or pleroma.com`
  String get app_auth_instance_join_fail_dialog_title {
    return Intl.message(
      'Fail to connect to instance. You can try verified fedi.app or pleroma.com',
      name: 'app_auth_instance_join_fail_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Details: {error}`
  String app_auth_instance_join_fail_dialog_content(Object error) {
    return Intl.message(
      'Details: $error',
      name: 'app_auth_instance_join_fail_dialog_content',
      desc: '',
      args: [error],
    );
  }

  /// `Instance owner disabled registration`
  String get app_auth_instance_join_registrationDisabled_dialog_title {
    return Intl.message(
      'Instance owner disabled registration',
      name: 'app_auth_instance_join_registrationDisabled_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Try any other instance, like fedi.app`
  String get app_auth_instance_join_registrationDisabled_dialog_content {
    return Intl.message(
      'Try any other instance, like fedi.app',
      name: 'app_auth_instance_join_registrationDisabled_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Instance owner limit registration to invites-only`
  String get app_auth_instance_join_invitesOnly_dialog_title {
    return Intl.message(
      'Instance owner limit registration to invites-only',
      name: 'app_auth_instance_join_invitesOnly_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Try any other instance, or register by invite link in your browser`
  String get app_auth_instance_join_invitesOnly_dialog_content {
    return Intl.message(
      'Try any other instance, or register by invite link in your browser',
      name: 'app_auth_instance_join_invitesOnly_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get app_auth_instance_register_title {
    return Intl.message(
      'Create account',
      name: 'app_auth_instance_register_title',
      desc: '',
      args: [],
    );
  }

  /// `Success registration`
  String get app_auth_instance_register_approvalRequired_notification_title {
    return Intl.message(
      'Success registration',
      name: 'app_auth_instance_register_approvalRequired_notification_title',
      desc: '',
      args: [],
    );
  }

  /// `You can login once moderators will approve your account`
  String get app_auth_instance_register_approvalRequired_notification_content {
    return Intl.message(
      'You can login once moderators will approve your account',
      name: 'app_auth_instance_register_approvalRequired_notification_content',
      desc: '',
      args: [],
    );
  }

  /// `Username*`
  String get app_auth_instance_register_field_username_label {
    return Intl.message(
      'Username*',
      name: 'app_auth_instance_register_field_username_label',
      desc: '',
      args: [],
    );
  }

  /// `lain`
  String get app_auth_instance_register_field_username_hint {
    return Intl.message(
      'lain',
      name: 'app_auth_instance_register_field_username_hint',
      desc: '',
      args: [],
    );
  }

  /// `Captcha*`
  String get app_auth_instance_register_field_captcha_label {
    return Intl.message(
      'Captcha*',
      name: 'app_auth_instance_register_field_captcha_label',
      desc: '',
      args: [],
    );
  }

  /// `Characters from picture`
  String get app_auth_instance_register_field_captcha_hint {
    return Intl.message(
      'Characters from picture',
      name: 'app_auth_instance_register_field_captcha_hint',
      desc: '',
      args: [],
    );
  }

  /// `Email Address*`
  String get app_auth_instance_register_field_email_label {
    return Intl.message(
      'Email Address*',
      name: 'app_auth_instance_register_field_email_label',
      desc: '',
      args: [],
    );
  }

  /// `you@example.com`
  String get app_auth_instance_register_field_email_hint {
    return Intl.message(
      'you@example.com',
      name: 'app_auth_instance_register_field_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password*`
  String get app_auth_instance_register_field_password_label {
    return Intl.message(
      'Password*',
      name: 'app_auth_instance_register_field_password_label',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get app_auth_instance_register_field_password_hint {
    return Intl.message(
      'Password',
      name: 'app_auth_instance_register_field_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password confirmation*`
  String get app_auth_instance_register_field_confirmPassword_label {
    return Intl.message(
      'Password confirmation*',
      name: 'app_auth_instance_register_field_confirmPassword_label',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get app_auth_instance_register_field_confirmPassword_hint {
    return Intl.message(
      'Password',
      name: 'app_auth_instance_register_field_confirmPassword_hint',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get app_auth_instance_register_action_createAccount {
    return Intl.message(
      'Sign up',
      name: 'app_auth_instance_register_action_createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Share to chats`
  String get app_chat_pleroma_share_title {
    return Intl.message(
      'Share to chats',
      name: 'app_chat_pleroma_share_title',
      desc: '',
      args: [],
    );
  }

  /// `{count,plural, =1{1 new chat. Tap to load.} other{{count} new chats. Tap to load.}}`
  String app_chat_pleroma_list_newItems_action_tapToLoadNew(num count) {
    return Intl.plural(
      count,
      one: '1 new chat. Tap to load.',
      other: '$count new chats. Tap to load.',
      name: 'app_chat_pleroma_list_newItems_action_tapToLoadNew',
      desc: '',
      args: [count],
    );
  }

  /// `Chat accounts`
  String get app_chat_pleroma_accounts_title {
    return Intl.message(
      'Chat accounts',
      name: 'app_chat_pleroma_accounts_title',
      desc: '',
      args: [],
    );
  }

  /// `You: {message}`
  String app_chat_preview_you(Object message) {
    return Intl.message(
      'You: $message',
      name: 'app_chat_preview_you',
      desc: '',
      args: [message],
    );
  }

  /// `Start a message`
  String get app_chat_post_field_content_hint {
    return Intl.message(
      'Start a message',
      name: 'app_chat_post_field_content_hint',
      desc: '',
      args: [],
    );
  }

  /// `Can't send empty message`
  String get app_chat_post_error_empty_dialog_title {
    return Intl.message(
      'Can\'t send empty message',
      name: 'app_chat_post_error_empty_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Share to conversations`
  String get app_chat_conversation_share_title {
    return Intl.message(
      'Share to conversations',
      name: 'app_chat_conversation_share_title',
      desc: '',
      args: [],
    );
  }

  /// `{count,plural, =1{1 new conversation. Tap to load.} other{{count} new conversations. Tap to load.}}`
  String app_chat_conversation_list_newItems_action_tapToLoadNew(num count) {
    return Intl.plural(
      count,
      one: '1 new conversation. Tap to load.',
      other: '$count new conversations. Tap to load.',
      name: 'app_chat_conversation_list_newItems_action_tapToLoadNew',
      desc: '',
      args: [count],
    );
  }

  /// `Conversation accounts`
  String get app_chat_conversation_accounts_title {
    return Intl.message(
      'Conversation accounts',
      name: 'app_chat_conversation_accounts_title',
      desc: '',
      args: [],
    );
  }

  /// `Start conversation`
  String get app_chat_conversation_start_title {
    return Intl.message(
      'Start conversation',
      name: 'app_chat_conversation_start_title',
      desc: '',
      args: [],
    );
  }

  /// `Crop as`
  String get app_file_image_crop_title {
    return Intl.message(
      'Crop as',
      name: 'app_file_image_crop_title',
      desc: '',
      args: [],
    );
  }

  /// `Conversations`
  String get app_home_tab_chat_conversation_title {
    return Intl.message(
      'Conversations',
      name: 'app_home_tab_chat_conversation_title',
      desc: '',
      args: [],
    );
  }

  /// `To Chats`
  String get app_home_tab_chat_conversation_action_switchToChats {
    return Intl.message(
      'To Chats',
      name: 'app_home_tab_chat_conversation_action_switchToChats',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get app_home_tab_chat_pleroma_title {
    return Intl.message(
      'Chats',
      name: 'app_home_tab_chat_pleroma_title',
      desc: '',
      args: [],
    );
  }

  /// `Chats not supported on Mastodon instances`
  String get app_home_tab_chat_pleroma_notSupported_mastodon {
    return Intl.message(
      'Chats not supported on Mastodon instances',
      name: 'app_home_tab_chat_pleroma_notSupported_mastodon',
      desc: '',
      args: [],
    );
  }

  /// `This instance don't support chats`
  String get app_home_tab_chat_pleroma_notSupported_pleroma {
    return Intl.message(
      'This instance don\'t support chats',
      name: 'app_home_tab_chat_pleroma_notSupported_pleroma',
      desc: '',
      args: [],
    );
  }

  /// `To Conversations`
  String get app_home_tab_chat_pleroma_action_switch_to_dms {
    return Intl.message(
      'To Conversations',
      name: 'app_home_tab_chat_pleroma_action_switch_to_dms',
      desc: '',
      args: [],
    );
  }

  /// `Notification actions`
  String get app_notification_action_popup_title {
    return Intl.message(
      'Notification actions',
      name: 'app_notification_action_popup_title',
      desc: '',
      args: [],
    );
  }

  /// `Mark as read`
  String get app_notification_action_markAsRead {
    return Intl.message(
      'Mark as read',
      name: 'app_notification_action_markAsRead',
      desc: '',
      args: [],
    );
  }

  /// `Dismiss`
  String get app_notification_action_dismiss {
    return Intl.message(
      'Dismiss',
      name: 'app_notification_action_dismiss',
      desc: '',
      args: [],
    );
  }

  /// `{count,plural, =1{1 new notification. Tap to load.} other{{count} new notifications. Tap to load.}}`
  String app_notification_list_newItems_action_tapToLoadNew(num count) {
    return Intl.plural(
      count,
      one: '1 new notification. Tap to load.',
      other: '$count new notifications. Tap to load.',
      name: 'app_notification_list_newItems_action_tapToLoadNew',
      desc: '',
      args: [count],
    );
  }

  /// `Push notifications`
  String get app_push_permission_ask_dialog_title {
    return Intl.message(
      'Push notifications',
      name: 'app_push_permission_ask_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to enable push notifications?\nThey will be forwarded through Fedi push proxy server`
  String get app_push_permission_ask_dialog_content {
    return Intl.message(
      'Do you want to enable push notifications?\nThey will be forwarded through Fedi push proxy server',
      name: 'app_push_permission_ask_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Permission required`
  String get app_push_permission_declined_dialog_title {
    return Intl.message(
      'Permission required',
      name: 'app_push_permission_declined_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Please enable push notification in app settings to receive updates`
  String get app_push_permission_declined_dialog_content {
    return Intl.message(
      'Please enable push notification in app settings to receive updates',
      name: 'app_push_permission_declined_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Push notifications`
  String get app_push_settings_title {
    return Intl.message(
      'Push notifications',
      name: 'app_push_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `All messages will be forwarded through Fedi proxy server`
  String get app_push_settings_desc {
    return Intl.message(
      'All messages will be forwarded through Fedi proxy server',
      name: 'app_push_settings_desc',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get app_push_settings_field_favourites_label {
    return Intl.message(
      'Favourites',
      name: 'app_push_settings_field_favourites_label',
      desc: '',
      args: [],
    );
  }

  /// `Follows`
  String get app_push_settings_field_follows_label {
    return Intl.message(
      'Follows',
      name: 'app_push_settings_field_follows_label',
      desc: '',
      args: [],
    );
  }

  /// `Mentions`
  String get app_push_settings_field_mentions_label {
    return Intl.message(
      'Mentions',
      name: 'app_push_settings_field_mentions_label',
      desc: '',
      args: [],
    );
  }

  /// `Reblogs`
  String get app_push_settings_field_reblogs_label {
    return Intl.message(
      'Reblogs',
      name: 'app_push_settings_field_reblogs_label',
      desc: '',
      args: [],
    );
  }

  /// `Polls`
  String get app_push_settings_field_polls_label {
    return Intl.message(
      'Polls',
      name: 'app_push_settings_field_polls_label',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get app_push_settings_field_pleroma_chat_label {
    return Intl.message(
      'Chats',
      name: 'app_push_settings_field_pleroma_chat_label',
      desc: '',
      args: [],
    );
  }

  /// `Followed you.`
  String get app_notification_header_follow {
    return Intl.message(
      'Followed you.',
      name: 'app_notification_header_follow',
      desc: '',
      args: [],
    );
  }

  /// `Liked your post.`
  String get app_notification_header_favourite {
    return Intl.message(
      'Liked your post.',
      name: 'app_notification_header_favourite',
      desc: '',
      args: [],
    );
  }

  /// `<b>Mentioned you:</b> {status}.`
  String app_notification_header_mention(Object status) {
    return Intl.message(
      '<b>Mentioned you:</b> $status.',
      name: 'app_notification_header_mention',
      desc: '',
      args: [status],
    );
  }

  /// `Shared your post.`
  String get app_notification_header_reblog {
    return Intl.message(
      'Shared your post.',
      name: 'app_notification_header_reblog',
      desc: '',
      args: [],
    );
  }

  /// `Voted poll ended.`
  String get app_notification_header_poll {
    return Intl.message(
      'Voted poll ended.',
      name: 'app_notification_header_poll',
      desc: '',
      args: [],
    );
  }

  /// `Moved.`
  String get app_notification_header_move {
    return Intl.message(
      'Moved.',
      name: 'app_notification_header_move',
      desc: '',
      args: [],
    );
  }

  /// `Follow request.`
  String get app_notification_header_followRequest {
    return Intl.message(
      'Follow request.',
      name: 'app_notification_header_followRequest',
      desc: '',
      args: [],
    );
  }

  /// `{emoji} for your post.`
  String app_notification_header_pleromaEmojiReaction(Object emoji) {
    return Intl.message(
      '$emoji for your post.',
      name: 'app_notification_header_pleromaEmojiReaction',
      desc: '',
      args: [emoji],
    );
  }

  /// `<b>Chat:</b> {status}.`
  String app_notification_header_pleromaChatMention(Object status) {
    return Intl.message(
      '<b>Chat:</b> $status.',
      name: 'app_notification_header_pleromaChatMention',
      desc: '',
      args: [status],
    );
  }

  /// `Unknown: {status}`
  String app_notification_header_unknown(Object status) {
    return Intl.message(
      'Unknown: $status',
      name: 'app_notification_header_unknown',
      desc: '',
      args: [status],
    );
  }

  /// `Dismissed`
  String get app_notification_dismissed {
    return Intl.message(
      'Dismissed',
      name: 'app_notification_dismissed',
      desc: '',
      args: [],
    );
  }

  /// `Loading timelines`
  String get app_timeline_loading {
    return Intl.message(
      'Loading timelines',
      name: 'app_timeline_loading',
      desc: '',
      args: [],
    );
  }

  /// `Create new timeline`
  String get app_timeline_create_title {
    return Intl.message(
      'Create new timeline',
      name: 'app_timeline_create_title',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get app_timeline_create_field_title_label {
    return Intl.message(
      'Title',
      name: 'app_timeline_create_field_title_label',
      desc: '',
      args: [],
    );
  }

  /// `Timeline name`
  String get app_timeline_create_field_title_hint {
    return Intl.message(
      'Timeline name',
      name: 'app_timeline_create_field_title_hint',
      desc: '',
      args: [],
    );
  }

  /// `Unique id`
  String get app_timeline_create_field_id_label {
    return Intl.message(
      'Unique id',
      name: 'app_timeline_create_field_id_label',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get app_timeline_type_home {
    return Intl.message(
      'Home',
      name: 'app_timeline_type_home',
      desc: '',
      args: [],
    );
  }

  /// `Public`
  String get app_timeline_type_public {
    return Intl.message(
      'Public',
      name: 'app_timeline_type_public',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get app_timeline_type_public_all {
    return Intl.message(
      'All',
      name: 'app_timeline_type_public_all',
      desc: '',
      args: [],
    );
  }

  /// `Local`
  String get app_timeline_type_public_local {
    return Intl.message(
      'Local',
      name: 'app_timeline_type_public_local',
      desc: '',
      args: [],
    );
  }

  /// `List`
  String get app_timeline_type_customList {
    return Intl.message(
      'List',
      name: 'app_timeline_type_customList',
      desc: '',
      args: [],
    );
  }

  /// `Hashtag`
  String get app_timeline_type_hashtag {
    return Intl.message(
      'Hashtag',
      name: 'app_timeline_type_hashtag',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get app_timeline_type_account {
    return Intl.message(
      'Account',
      name: 'app_timeline_type_account',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get app_timeline_type_field_label {
    return Intl.message(
      'Type',
      name: 'app_timeline_type_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Not selected`
  String get app_timeline_type_field_null {
    return Intl.message(
      'Not selected',
      name: 'app_timeline_type_field_null',
      desc: '',
      args: [],
    );
  }

  /// `Choose timeline type`
  String get app_timeline_type_field_chooser_dialog_title {
    return Intl.message(
      'Choose timeline type',
      name: 'app_timeline_type_field_chooser_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Timelines`
  String get app_timeline_storage_title {
    return Intl.message(
      'Timelines',
      name: 'app_timeline_storage_title',
      desc: '',
      args: [],
    );
  }

  /// `Nothing found`
  String get app_timeline_storage_empty {
    return Intl.message(
      'Nothing found',
      name: 'app_timeline_storage_empty',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get app_timeline_storage_appBar_action_edit {
    return Intl.message(
      'Edit',
      name: 'app_timeline_storage_appBar_action_edit',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get app_timeline_storage_appBar_action_done {
    return Intl.message(
      'Done',
      name: 'app_timeline_storage_appBar_action_done',
      desc: '',
      args: [],
    );
  }

  /// `Add Timelines..`
  String get app_timeline_storage_action_add {
    return Intl.message(
      'Add Timelines..',
      name: 'app_timeline_storage_action_add',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get app_timeline_storage_delete_dialog_title {
    return Intl.message(
      'Delete',
      name: 'app_timeline_storage_delete_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete {timeline} Timeline?`
  String app_timeline_storage_delete_dialog_content(Object timeline) {
    return Intl.message(
      'Are you sure you want to delete $timeline Timeline?',
      name: 'app_timeline_storage_delete_dialog_content',
      desc: '',
      args: [timeline],
    );
  }

  /// `Delete`
  String get app_timeline_storage_delete_dialog_action_delete {
    return Intl.message(
      'Delete',
      name: 'app_timeline_storage_delete_dialog_action_delete',
      desc: '',
      args: [],
    );
  }

  /// `Settings:`
  String get app_timeline_settings_title {
    return Intl.message(
      'Settings:',
      name: 'app_timeline_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `{timeline} Timeline`
  String app_timeline_settings_content(Object timeline) {
    return Intl.message(
      '$timeline Timeline',
      name: 'app_timeline_settings_content',
      desc: '',
      args: [timeline],
    );
  }

  /// `Self`
  String get app_timeline_settings_replyVisibilityFilter_self {
    return Intl.message(
      'Self',
      name: 'app_timeline_settings_replyVisibilityFilter_self',
      desc: '',
      args: [],
    );
  }

  /// `Following`
  String get app_timeline_settings_replyVisibilityFilter_following {
    return Intl.message(
      'Following',
      name: 'app_timeline_settings_replyVisibilityFilter_following',
      desc: '',
      args: [],
    );
  }

  /// `Reply visibility filter`
  String get app_timeline_settings_replyVisibilityFilter_field_label {
    return Intl.message(
      'Reply visibility filter',
      name: 'app_timeline_settings_replyVisibilityFilter_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Not selected`
  String get app_timeline_settings_replyVisibilityFilter_field_null {
    return Intl.message(
      'Not selected',
      name: 'app_timeline_settings_replyVisibilityFilter_field_null',
      desc: '',
      args: [],
    );
  }

  /// `Choose reply visibility filter`
  String get app_timeline_settings_replyVisibilityFilter_field_chooser_dialog_title {
    return Intl.message(
      'Choose reply visibility filter',
      name: 'app_timeline_settings_replyVisibilityFilter_field_chooser_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Only from account`
  String get app_timeline_settings_onlyFromRemoteAccount_field_label {
    return Intl.message(
      'Only from account',
      name: 'app_timeline_settings_onlyFromRemoteAccount_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Not selected`
  String get app_timeline_settings_onlyFromRemoteAccount_field_null {
    return Intl.message(
      'Not selected',
      name: 'app_timeline_settings_onlyFromRemoteAccount_field_null',
      desc: '',
      args: [],
    );
  }

  /// `With hashtag`
  String get app_timeline_settings_withRemoteHashtag_field_label {
    return Intl.message(
      'With hashtag',
      name: 'app_timeline_settings_withRemoteHashtag_field_label',
      desc: '',
      args: [],
    );
  }

  /// `pleroma`
  String get app_timeline_settings_withRemoteHashtag_field_hint {
    return Intl.message(
      'pleroma',
      name: 'app_timeline_settings_withRemoteHashtag_field_hint',
      desc: '',
      args: [],
    );
  }

  /// `Only in list`
  String get app_timeline_settings_onlyInRemoteList_field_label {
    return Intl.message(
      'Only in list',
      name: 'app_timeline_settings_onlyInRemoteList_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Not selected`
  String get app_timeline_settings_onlyInRemoteList_field_null {
    return Intl.message(
      'Not selected',
      name: 'app_timeline_settings_onlyInRemoteList_field_null',
      desc: '',
      args: [],
    );
  }

  /// `Choose list`
  String get app_timeline_settings_onlyInRemoteList_field_chooser_dialog_title {
    return Intl.message(
      'Choose list',
      name: 'app_timeline_settings_onlyInRemoteList_field_chooser_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Not supported on this instance`
  String get app_settings_warning_notSupportedOnThisInstance_desc {
    return Intl.message(
      'Not supported on this instance',
      name: 'app_settings_warning_notSupportedOnThisInstance_desc',
      desc: '',
      args: [],
    );
  }

  /// `Only with media`
  String get app_timeline_settings_field_onlyWithMedia_label {
    return Intl.message(
      'Only with media',
      name: 'app_timeline_settings_field_onlyWithMedia_label',
      desc: '',
      args: [],
    );
  }

  /// `Only remote`
  String get app_timeline_settings_field_onlyRemote_label {
    return Intl.message(
      'Only remote',
      name: 'app_timeline_settings_field_onlyRemote_label',
      desc: '',
      args: [],
    );
  }

  /// `Only local`
  String get app_timeline_settings_field_onlyLocal_label {
    return Intl.message(
      'Only local',
      name: 'app_timeline_settings_field_onlyLocal_label',
      desc: '',
      args: [],
    );
  }

  /// `Only pinned`
  String get app_timeline_settings_field_onlyPinned_label {
    return Intl.message(
      'Only pinned',
      name: 'app_timeline_settings_field_onlyPinned_label',
      desc: '',
      args: [],
    );
  }

  /// `With muted`
  String get app_timeline_settings_field_withMuted_label {
    return Intl.message(
      'With muted',
      name: 'app_timeline_settings_field_withMuted_label',
      desc: '',
      args: [],
    );
  }

  /// `Exclude reblogs`
  String get app_timeline_settings_field_excludeReblogs_label {
    return Intl.message(
      'Exclude reblogs',
      name: 'app_timeline_settings_field_excludeReblogs_label',
      desc: '',
      args: [],
    );
  }

  /// `Exclude replies`
  String get app_timeline_settings_field_excludeReplies_label {
    return Intl.message(
      'Exclude replies',
      name: 'app_timeline_settings_field_excludeReplies_label',
      desc: '',
      args: [],
    );
  }

  /// `Exclude NSFW`
  String get app_timeline_settings_field_excludeNsfw_label {
    return Intl.message(
      'Exclude NSFW',
      name: 'app_timeline_settings_field_excludeNsfw_label',
      desc: '',
      args: [],
    );
  }

  /// `Items not found`
  String get app_list_empty {
    return Intl.message(
      'Items not found',
      name: 'app_list_empty',
      desc: '',
      args: [],
    );
  }

  /// `Can't update from network`
  String get app_list_cantUpdateFromNetwork {
    return Intl.message(
      'Can\'t update from network',
      name: 'app_list_cantUpdateFromNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Can load more`
  String get app_list_loading_state_canLoadMore {
    return Intl.message(
      'Can load more',
      name: 'app_list_loading_state_canLoadMore',
      desc: '',
      args: [],
    );
  }

  /// `No more data`
  String get app_list_loading_state_noMoreData {
    return Intl.message(
      'No more data',
      name: 'app_list_loading_state_noMoreData',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load more`
  String get app_list_loading_state_failed {
    return Intl.message(
      'Failed to load more',
      name: 'app_list_loading_state_failed',
      desc: '',
      args: [],
    );
  }

  /// `Unable to refresh`
  String get app_list_refresh_unableToFetch {
    return Intl.message(
      'Unable to refresh',
      name: 'app_list_refresh_unableToFetch',
      desc: '',
      args: [],
    );
  }

  /// `Something wrong`
  String get app_media_player_error_desc {
    return Intl.message(
      'Something wrong',
      name: 'app_media_player_error_desc',
      desc: '',
      args: [],
    );
  }

  /// `Reload`
  String get app_media_player_error_action_reload {
    return Intl.message(
      'Reload',
      name: 'app_media_player_error_action_reload',
      desc: '',
      args: [],
    );
  }

  /// `More details`
  String get app_media_player_error_action_moreDetails {
    return Intl.message(
      'More details',
      name: 'app_media_player_error_action_moreDetails',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get app_media_attachment_type_gallery {
    return Intl.message(
      'Gallery',
      name: 'app_media_attachment_type_gallery',
      desc: '',
      args: [],
    );
  }

  /// `Photo`
  String get app_media_attachment_type_photo {
    return Intl.message(
      'Photo',
      name: 'app_media_attachment_type_photo',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get app_media_attachment_type_video {
    return Intl.message(
      'Video',
      name: 'app_media_attachment_type_video',
      desc: '',
      args: [],
    );
  }

  /// `File`
  String get app_media_attachment_type_file {
    return Intl.message(
      'File',
      name: 'app_media_attachment_type_file',
      desc: '',
      args: [],
    );
  }

  /// `Audio`
  String get app_media_attachment_type_audio {
    return Intl.message(
      'Audio',
      name: 'app_media_attachment_type_audio',
      desc: '',
      args: [],
    );
  }

  /// `Saving...`
  String get app_media_attachment_addToGallery_progress_content {
    return Intl.message(
      'Saving...',
      name: 'app_media_attachment_addToGallery_progress_content',
      desc: '',
      args: [],
    );
  }

  /// `Can't save media`
  String get app_media_attachment_addToGallery_error_dialog_title {
    return Intl.message(
      'Can\'t save media',
      name: 'app_media_attachment_addToGallery_error_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Media type is not supported, network not available or permission not granted`
  String get app_media_attachment_addToGallery_error_dialog_content {
    return Intl.message(
      'Media type is not supported, network not available or permission not granted',
      name: 'app_media_attachment_addToGallery_error_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Media attachment`
  String get app_media_attachment_details_title {
    return Intl.message(
      'Media attachment',
      name: 'app_media_attachment_details_title',
      desc: '',
      args: [],
    );
  }

  /// `Not supported type {mediaType}`
  String app_media_attachment_details_notSupported_type(Object mediaType) {
    return Intl.message(
      'Not supported type $mediaType',
      name: 'app_media_attachment_details_notSupported_type',
      desc: '',
      args: [mediaType],
    );
  }

  /// `Are you sure you want to remove the attachment?`
  String get app_media_attachment_upload_remove_dialog_content {
    return Intl.message(
      'Are you sure you want to remove the attachment?',
      name: 'app_media_attachment_upload_remove_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get app_media_attachment_upload_remove_dialog_action_remove {
    return Intl.message(
      'Remove',
      name: 'app_media_attachment_upload_remove_dialog_action_remove',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get app_media_attachment_upload_remove_dialog_action_cancel {
    return Intl.message(
      'Cancel',
      name: 'app_media_attachment_upload_remove_dialog_action_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get app_search_title {
    return Intl.message(
      'Search',
      name: 'app_search_title',
      desc: '',
      args: [],
    );
  }

  /// `Recent`
  String get app_search_recent_title {
    return Intl.message(
      'Recent',
      name: 'app_search_recent_title',
      desc: '',
      args: [],
    );
  }

  /// `No recent searches`
  String get app_search_recent_empty {
    return Intl.message(
      'No recent searches',
      name: 'app_search_recent_empty',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get app_search_tab_all {
    return Intl.message(
      'All',
      name: 'app_search_tab_all',
      desc: '',
      args: [],
    );
  }

  /// `Users`
  String get app_search_tab_accounts {
    return Intl.message(
      'Users',
      name: 'app_search_tab_accounts',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get app_search_tab_statuses {
    return Intl.message(
      'Posts',
      name: 'app_search_tab_statuses',
      desc: '',
      args: [],
    );
  }

  /// `Hashtags`
  String get app_search_tab_hashtags {
    return Intl.message(
      'Hashtags',
      name: 'app_search_tab_hashtags',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get app_search_field_input_hint {
    return Intl.message(
      'Search',
      name: 'app_search_field_input_hint',
      desc: '',
      args: [],
    );
  }

  /// `Drafts`
  String get app_account_my_statuses_draft_title {
    return Intl.message(
      'Drafts',
      name: 'app_account_my_statuses_draft_title',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get app_status_draft_state_canceled {
    return Intl.message(
      'Canceled',
      name: 'app_status_draft_state_canceled',
      desc: '',
      args: [],
    );
  }

  /// `Already posted`
  String get app_status_draft_state_alreadyPosted {
    return Intl.message(
      'Already posted',
      name: 'app_status_draft_state_alreadyPosted',
      desc: '',
      args: [],
    );
  }

  /// `Edit Draft`
  String get app_status_draft_edit_title {
    return Intl.message(
      'Edit Draft',
      name: 'app_status_draft_edit_title',
      desc: '',
      args: [],
    );
  }

  /// `Can't add emoji`
  String get app_status_emoji_error_cantAdd_dialog_title {
    return Intl.message(
      'Can\'t add emoji',
      name: 'app_status_emoji_error_cantAdd_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Error: {errorMessage}`
  String app_status_emoji_error_cantAdd_dialog_content(Object errorMessage) {
    return Intl.message(
      'Error: $errorMessage',
      name: 'app_status_emoji_error_cantAdd_dialog_content',
      desc: '',
      args: [errorMessage],
    );
  }

  /// `Loading start status`
  String get app_status_thread_start_loading {
    return Intl.message(
      'Loading start status',
      name: 'app_status_thread_start_loading',
      desc: '',
      args: [],
    );
  }

  /// `Reply to @{accountAcct}`
  String app_status_thread_post_hint(Object accountAcct) {
    return Intl.message(
      'Reply to @$accountAcct',
      name: 'app_status_thread_post_hint',
      desc: '',
      args: [accountAcct],
    );
  }

  /// `{count,plural, =1{1 new post. Tap to load.} other{{count} new posts. Tap to load.}}`
  String app_status_list_newItems_action_tapToLoadNew(num count) {
    return Intl.plural(
      count,
      one: '1 new post. Tap to load.',
      other: '$count new posts. Tap to load.',
      name: 'app_status_list_newItems_action_tapToLoadNew',
      desc: '',
      args: [count],
    );
  }

  /// `Queue`
  String get app_account_my_statuses_scheduled_title {
    return Intl.message(
      'Queue',
      name: 'app_account_my_statuses_scheduled_title',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get app_status_scheduled_state_canceled {
    return Intl.message(
      'Canceled',
      name: 'app_status_scheduled_state_canceled',
      desc: '',
      args: [],
    );
  }

  /// `Already posted`
  String get app_status_scheduled_state_alreadyPosted {
    return Intl.message(
      'Already posted',
      name: 'app_status_scheduled_state_alreadyPosted',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get app_status_scheduled_datetime_picker_title {
    return Intl.message(
      'Schedule',
      name: 'app_status_scheduled_datetime_picker_title',
      desc: '',
      args: [],
    );
  }

  /// `Scheduled post`
  String get app_status_scheduled_edit_title {
    return Intl.message(
      'Scheduled post',
      name: 'app_status_scheduled_edit_title',
      desc: '',
      args: [],
    );
  }

  /// `Collapse`
  String get app_status_collapsible_action_collapse {
    return Intl.message(
      'Collapse',
      name: 'app_status_collapsible_action_collapse',
      desc: '',
      args: [],
    );
  }

  /// `Expand`
  String get app_status_collapsible_action_expand {
    return Intl.message(
      'Expand',
      name: 'app_status_collapsible_action_expand',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get app_status_action_delete {
    return Intl.message(
      'Delete',
      name: 'app_status_action_delete',
      desc: '',
      args: [],
    );
  }

  /// `Mute conversation`
  String get app_status_action_mute {
    return Intl.message(
      'Mute conversation',
      name: 'app_status_action_mute',
      desc: '',
      args: [],
    );
  }

  /// `Unmute conversation`
  String get app_status_action_unmute {
    return Intl.message(
      'Unmute conversation',
      name: 'app_status_action_unmute',
      desc: '',
      args: [],
    );
  }

  /// `Open in browser`
  String get app_status_action_openInBrowser {
    return Intl.message(
      'Open in browser',
      name: 'app_status_action_openInBrowser',
      desc: '',
      args: [],
    );
  }

  /// `Pin`
  String get app_status_action_pin {
    return Intl.message(
      'Pin',
      name: 'app_status_action_pin',
      desc: '',
      args: [],
    );
  }

  /// `Unpin`
  String get app_status_action_unpin {
    return Intl.message(
      'Unpin',
      name: 'app_status_action_unpin',
      desc: '',
      args: [],
    );
  }

  /// `Bookmark`
  String get app_status_action_bookmark {
    return Intl.message(
      'Bookmark',
      name: 'app_status_action_bookmark',
      desc: '',
      args: [],
    );
  }

  /// `Unbookmark`
  String get app_status_action_unbookmark {
    return Intl.message(
      'Unbookmark',
      name: 'app_status_action_unbookmark',
      desc: '',
      args: [],
    );
  }

  /// `Copy link`
  String get app_status_action_copyLink {
    return Intl.message(
      'Copy link',
      name: 'app_status_action_copyLink',
      desc: '',
      args: [],
    );
  }

  /// `Show this thread`
  String get app_status_action_showThisThread {
    return Intl.message(
      'Show this thread',
      name: 'app_status_action_showThisThread',
      desc: '',
      args: [],
    );
  }

  /// `Status Actions`
  String get app_status_action_popup_title {
    return Intl.message(
      'Status Actions',
      name: 'app_status_action_popup_title',
      desc: '',
      args: [],
    );
  }

  /// `NSFW!`
  String get app_status_nsfw_chip {
    return Intl.message(
      'NSFW!',
      name: 'app_status_nsfw_chip',
      desc: '',
      args: [],
    );
  }

  /// `Tap to view`
  String get app_status_nsfw_action_view {
    return Intl.message(
      'Tap to view',
      name: 'app_status_nsfw_action_view',
      desc: '',
      args: [],
    );
  }

  /// `Status deleted`
  String get app_status_deleted_desc {
    return Intl.message(
      'Status deleted',
      name: 'app_status_deleted_desc',
      desc: '',
      args: [],
    );
  }

  /// `Spoilers!`
  String get app_status_spoiler_chip {
    return Intl.message(
      'Spoilers!',
      name: 'app_status_spoiler_chip',
      desc: '',
      args: [],
    );
  }

  /// `Tap to view`
  String get app_status_spoiler_action_view {
    return Intl.message(
      'Tap to view',
      name: 'app_status_spoiler_action_view',
      desc: '',
      args: [],
    );
  }

  /// `Copied`
  String get app_status_copyLink_toast {
    return Intl.message(
      'Copied',
      name: 'app_status_copyLink_toast',
      desc: '',
      args: [],
    );
  }

  /// `Favourited by`
  String get app_status_favouritedBy_title {
    return Intl.message(
      'Favourited by',
      name: 'app_status_favouritedBy_title',
      desc: '',
      args: [],
    );
  }

  /// `Reblogged by`
  String get app_status_rebloggedBy_title {
    return Intl.message(
      'Reblogged by',
      name: 'app_status_rebloggedBy_title',
      desc: '',
      args: [],
    );
  }

  /// `Option {optionNumber}`
  String app_status_post_poll_field_option_hint(Object optionNumber) {
    return Intl.message(
      'Option $optionNumber',
      name: 'app_status_post_poll_field_option_hint',
      desc: '',
      args: [optionNumber],
    );
  }

  /// `Multiple selection`
  String get app_status_post_poll_field_multiply_label {
    return Intl.message(
      'Multiple selection',
      name: 'app_status_post_poll_field_multiply_label',
      desc: '',
      args: [],
    );
  }

  /// `Poll length`
  String get app_status_post_poll_field_length_label {
    return Intl.message(
      'Poll length',
      name: 'app_status_post_poll_field_length_label',
      desc: '',
      args: [],
    );
  }

  /// `Invalid time`
  String get app_status_post_schedule_error_notInFuture_dialog_title {
    return Intl.message(
      'Invalid time',
      name: 'app_status_post_schedule_error_notInFuture_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Schedule time must be at least 5 minutes in the future`
  String get app_status_post_schedule_error_notInFuture_dialog_content {
    return Intl.message(
      'Schedule time must be at least 5 minutes in the future',
      name: 'app_status_post_schedule_error_notInFuture_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Posting...`
  String get app_status_post_dialog_async_content {
    return Intl.message(
      'Posting...',
      name: 'app_status_post_dialog_async_content',
      desc: '',
      args: [],
    );
  }

  /// `Failed to post status`
  String get app_status_post_dialog_error_title_post {
    return Intl.message(
      'Failed to post status',
      name: 'app_status_post_dialog_error_title_post',
      desc: '',
      args: [],
    );
  }

  /// `Failed to schedule status`
  String get app_status_post_dialog_error_title_schedule {
    return Intl.message(
      'Failed to schedule status',
      name: 'app_status_post_dialog_error_title_schedule',
      desc: '',
      args: [],
    );
  }

  /// `Error: {errorMessage}`
  String app_status_post_dialog_error_content(Object errorMessage) {
    return Intl.message(
      'Error: $errorMessage',
      name: 'app_status_post_dialog_error_content',
      desc: '',
      args: [errorMessage],
    );
  }

  /// `Status posted`
  String get app_status_post_toast_success_post {
    return Intl.message(
      'Status posted',
      name: 'app_status_post_toast_success_post',
      desc: '',
      args: [],
    );
  }

  /// `Status scheduled`
  String get app_status_post_toast_success_schedule {
    return Intl.message(
      'Status scheduled',
      name: 'app_status_post_toast_success_schedule',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get app_status_post_action_post {
    return Intl.message(
      'Post',
      name: 'app_status_post_action_post',
      desc: '',
      args: [],
    );
  }

  /// `Visibility`
  String get app_status_post_visibility_title {
    return Intl.message(
      'Visibility',
      name: 'app_status_post_visibility_title',
      desc: '',
      args: [],
    );
  }

  /// `Public`
  String get app_status_post_visibility_state_public {
    return Intl.message(
      'Public',
      name: 'app_status_post_visibility_state_public',
      desc: '',
      args: [],
    );
  }

  /// `Unlisted`
  String get app_status_post_visibility_state_unlisted {
    return Intl.message(
      'Unlisted',
      name: 'app_status_post_visibility_state_unlisted',
      desc: '',
      args: [],
    );
  }

  /// `Direct`
  String get app_status_post_visibility_state_direct {
    return Intl.message(
      'Direct',
      name: 'app_status_post_visibility_state_direct',
      desc: '',
      args: [],
    );
  }

  /// `List`
  String get app_status_post_visibility_state_list {
    return Intl.message(
      'List',
      name: 'app_status_post_visibility_state_list',
      desc: '',
      args: [],
    );
  }

  /// `Private`
  String get app_status_post_visibility_state_private {
    return Intl.message(
      'Private',
      name: 'app_status_post_visibility_state_private',
      desc: '',
      args: [],
    );
  }

  /// `Can't send empty message`
  String get app_status_post_error_empty_dialog_title {
    return Intl.message(
      'Can\'t send empty message',
      name: 'app_status_post_error_empty_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter at least two poll options`
  String get app_status_post_error_poll_dialog_title {
    return Intl.message(
      'Enter at least two poll options',
      name: 'app_status_post_error_poll_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Subject (optional)`
  String get app_status_post_field_subject {
    return Intl.message(
      'Subject (optional)',
      name: 'app_status_post_field_subject',
      desc: '',
      args: [],
    );
  }

  /// `What’s going on today?`
  String get app_status_post_field_message_hint {
    return Intl.message(
      'What’s going on today?',
      name: 'app_status_post_field_message_hint',
      desc: '',
      args: [],
    );
  }

  /// `New status`
  String get app_status_post_new_title {
    return Intl.message(
      'New status',
      name: 'app_status_post_new_title',
      desc: '',
      args: [],
    );
  }

  /// `Save this post as draft?`
  String get app_status_post_new_unsaved_dialog_title {
    return Intl.message(
      'Save this post as draft?',
      name: 'app_status_post_new_unsaved_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Save Draft`
  String get app_status_post_new_unsaved_dialog_action_saveAsDraft {
    return Intl.message(
      'Save Draft',
      name: 'app_status_post_new_unsaved_dialog_action_saveAsDraft',
      desc: '',
      args: [],
    );
  }

  /// `Discard Post`
  String get app_status_post_new_unsaved_dialog_action_discard {
    return Intl.message(
      'Discard Post',
      name: 'app_status_post_new_unsaved_dialog_action_discard',
      desc: '',
      args: [],
    );
  }

  /// `reposted`
  String get app_status_reblog_header {
    return Intl.message(
      'reposted',
      name: 'app_status_reblog_header',
      desc: '',
      args: [],
    );
  }

  /// `reply to`
  String get app_status_reply_header {
    return Intl.message(
      'reply to',
      name: 'app_status_reply_header',
      desc: '',
      args: [],
    );
  }

  /// `Loading first status`
  String get app_status_reply_loading_progress {
    return Intl.message(
      'Loading first status',
      name: 'app_status_reply_loading_progress',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load first status`
  String get app_status_reply_loading_failed {
    return Intl.message(
      'Failed to load first status',
      name: 'app_status_reply_loading_failed',
      desc: '',
      args: [],
    );
  }

  /// `Replying to {accountAcct}`
  String app_status_reply_replyingTo(Object accountAcct) {
    return Intl.message(
      'Replying to $accountAcct',
      name: 'app_status_reply_replyingTo',
      desc: '',
      args: [accountAcct],
    );
  }

  /// `Terms of service`
  String get app_tos_title {
    return Intl.message(
      'Terms of service',
      name: 'app_tos_title',
      desc: '',
      args: [],
    );
  }

  /// `Async init not started`
  String get async_init_state_notStarted {
    return Intl.message(
      'Async init not started',
      name: 'async_init_state_notStarted',
      desc: '',
      args: [],
    );
  }

  /// `Failed to init {errorMessage}`
  String async_init_state_failed(Object errorMessage) {
    return Intl.message(
      'Failed to init $errorMessage',
      name: 'async_init_state_failed',
      desc: '',
      args: [errorMessage],
    );
  }

  /// `You don't have any media`
  String get file_picker_empty {
    return Intl.message(
      'You don\'t have any media',
      name: 'file_picker_empty',
      desc: '',
      args: [],
    );
  }

  /// `Choose media`
  String get file_picker_single_title {
    return Intl.message(
      'Choose media',
      name: 'file_picker_single_title',
      desc: '',
      args: [],
    );
  }

  /// `Nothing found`
  String get pagination_list_empty {
    return Intl.message(
      'Nothing found',
      name: 'pagination_list_empty',
      desc: '',
      args: [],
    );
  }

  /// `Grant permission`
  String get permission_grant_action_grant {
    return Intl.message(
      'Grant permission',
      name: 'permission_grant_action_grant',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get dialog_progress_content {
    return Intl.message(
      'Loading...',
      name: 'dialog_progress_content',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get dialog_progress_action_cancel {
    return Intl.message(
      'Cancel',
      name: 'dialog_progress_action_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Something wrong`
  String get dialog_error_title {
    return Intl.message(
      'Something wrong',
      name: 'dialog_error_title',
      desc: '',
      args: [],
    );
  }

  /// `An error has occurred. \n{errorMessage}`
  String dialog_error_content(Object errorMessage) {
    return Intl.message(
      'An error has occurred. \n$errorMessage',
      name: 'dialog_error_content',
      desc: '',
      args: [errorMessage],
    );
  }

  /// `Yes`
  String get dialog_action_yes {
    return Intl.message(
      'Yes',
      name: 'dialog_action_yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get dialog_action_no {
    return Intl.message(
      'No',
      name: 'dialog_action_no',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get dialog_action_ok {
    return Intl.message(
      'OK',
      name: 'dialog_action_ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get dialog_action_cancel {
    return Intl.message(
      'Cancel',
      name: 'dialog_action_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get form_field_value_error_null_desc {
    return Intl.message(
      'Required',
      name: 'form_field_value_error_null_desc',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get form_field_text_email_error_invalid_desc {
    return Intl.message(
      'Invalid email',
      name: 'form_field_text_email_error_invalid_desc',
      desc: '',
      args: [],
    );
  }

  /// `Invalid URL`
  String get form_field_text_url_error_invalid_desc {
    return Intl.message(
      'Invalid URL',
      name: 'form_field_text_url_error_invalid_desc',
      desc: '',
      args: [],
    );
  }

  /// `Password and confirm password must match`
  String get form_field_text_password_error_notMatch_desc {
    return Intl.message(
      'Password and confirm password must match',
      name: 'form_field_text_password_error_notMatch_desc',
      desc: '',
      args: [],
    );
  }

  /// `Must be not empty`
  String get form_field_text_error_empty_desc {
    return Intl.message(
      'Must be not empty',
      name: 'form_field_text_error_empty_desc',
      desc: '',
      args: [],
    );
  }

  /// `Must be at least {minCharactersCount} characters`
  String form_field_text_error_length_minOnly_desc(Object minCharactersCount) {
    return Intl.message(
      'Must be at least $minCharactersCount characters',
      name: 'form_field_text_error_length_minOnly_desc',
      desc: '',
      args: [minCharactersCount],
    );
  }

  /// `Must be less than {maxCharactersCount} characters`
  String form_field_text_error_length_maxOnly_desc(Object maxCharactersCount) {
    return Intl.message(
      'Must be less than $maxCharactersCount characters',
      name: 'form_field_text_error_length_maxOnly_desc',
      desc: '',
      args: [maxCharactersCount],
    );
  }

  /// `Must be between {minCharactersCount} and {maxCharactersCount} characters`
  String form_field_text_error_length_minAndMax_desc(Object minCharactersCount, Object maxCharactersCount) {
    return Intl.message(
      'Must be between $minCharactersCount and $maxCharactersCount characters',
      name: 'form_field_text_error_length_minAndMax_desc',
      desc: '',
      args: [minCharactersCount, maxCharactersCount],
    );
  }

  /// `Can't launch URL`
  String get link_error_dialog_title {
    return Intl.message(
      'Can\'t launch URL',
      name: 'link_error_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `URL {url} have invalid format`
  String link_error_dialog_content(Object url) {
    return Intl.message(
      'URL $url have invalid format',
      name: 'link_error_dialog_content',
      desc: '',
      args: [url],
    );
  }

  /// `{count,plural, =1{1 day} other{{count} days}}`
  String duration_day(num count) {
    return Intl.plural(
      count,
      one: '1 day',
      other: '$count days',
      name: 'duration_day',
      desc: '',
      args: [count],
    );
  }

  /// `{count,plural, =1{1 hour} other{{count} hours}}`
  String duration_hour(num count) {
    return Intl.plural(
      count,
      one: '1 hour',
      other: '$count hours',
      name: 'duration_hour',
      desc: '',
      args: [count],
    );
  }

  /// `{count,plural, =1{1 minute} other{{count} minutes}}`
  String duration_minute(num count) {
    return Intl.plural(
      count,
      one: '1 minute',
      other: '$count minutes',
      name: 'duration_minute',
      desc: '',
      args: [count],
    );
  }

  /// ``
  String get timeago_prefixAgo {
    return Intl.message(
      '',
      name: 'timeago_prefixAgo',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get timeago_prefixFromNow {
    return Intl.message(
      '',
      name: 'timeago_prefixFromNow',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get timeago_suffixAgo {
    return Intl.message(
      '',
      name: 'timeago_suffixAgo',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get timeago_suffixFromNow {
    return Intl.message(
      '',
      name: 'timeago_suffixFromNow',
      desc: '',
      args: [],
    );
  }

  /// `now`
  String get timeago_lessThanOneMinute {
    return Intl.message(
      'now',
      name: 'timeago_lessThanOneMinute',
      desc: '',
      args: [],
    );
  }

  /// `1 min`
  String get timeago_aboutAMinute {
    return Intl.message(
      '1 min',
      name: 'timeago_aboutAMinute',
      desc: '',
      args: [],
    );
  }

  /// `{minutes,plural, =1{1 min} other{{minutes} min}}`
  String timeago_minutes(num minutes) {
    return Intl.plural(
      minutes,
      one: '1 min',
      other: '$minutes min',
      name: 'timeago_minutes',
      desc: '',
      args: [minutes],
    );
  }

  /// `~1 h`
  String get timeago_aboutAnHour {
    return Intl.message(
      '~1 h',
      name: 'timeago_aboutAnHour',
      desc: '',
      args: [],
    );
  }

  /// `{hours,plural, =1{1 h} other{{hours} h}}`
  String timeago_hours(num hours) {
    return Intl.plural(
      hours,
      one: '1 h',
      other: '$hours h',
      name: 'timeago_hours',
      desc: '',
      args: [hours],
    );
  }

  /// `~1 d`
  String get timeago_aDay {
    return Intl.message(
      '~1 d',
      name: 'timeago_aDay',
      desc: '',
      args: [],
    );
  }

  /// `{days,plural, =1{1 d} other{{days} d}}`
  String timeago_days(num days) {
    return Intl.plural(
      days,
      one: '1 d',
      other: '$days d',
      name: 'timeago_days',
      desc: '',
      args: [days],
    );
  }

  /// `~1 mo`
  String get timeago_aboutAMonth {
    return Intl.message(
      '~1 mo',
      name: 'timeago_aboutAMonth',
      desc: '',
      args: [],
    );
  }

  /// `{months,plural, =1{1 mo} other{{months} mo}}`
  String timeago_months(num months) {
    return Intl.plural(
      months,
      one: '1 mo',
      other: '$months mo',
      name: 'timeago_months',
      desc: '',
      args: [months],
    );
  }

  /// `~1 y`
  String get timeago_aboutAYear {
    return Intl.message(
      '~1 y',
      name: 'timeago_aboutAYear',
      desc: '',
      args: [],
    );
  }

  /// `{years,plural, =1{1 y} other{{years} y}}`
  String timeago_years(num years) {
    return Intl.plural(
      years,
      one: '1 y',
      other: '$years y',
      name: 'timeago_years',
      desc: '',
      args: [years],
    );
  }

  /// ` `
  String get timeago_wordSeparator {
    return Intl.message(
      ' ',
      name: 'timeago_wordSeparator',
      desc: '',
      args: [],
    );
  }

  /// `Fedi for Pleroma and Mastodon`
  String get app_googlePlay_appName {
    return Intl.message(
      'Fedi for Pleroma and Mastodon',
      name: 'app_googlePlay_appName',
      desc: 'GooglePlay title',
      args: [],
    );
  }

  /// `A client for Pleroma and Mastodon social network instances`
  String get app_googlePlay_shortDescription {
    return Intl.message(
      'A client for Pleroma and Mastodon social network instances',
      name: 'app_googlePlay_shortDescription',
      desc: 'GooglePlay short description',
      args: [],
    );
  }

  /// `A client for Pleroma and Mastodon social network instances`
  String get app_googlePlay_fullDescription {
    return Intl.message(
      'A client for Pleroma and Mastodon social network instances',
      name: 'app_googlePlay_fullDescription',
      desc: 'GooglePlay full description',
      args: [],
    );
  }

  /// `A client for Pleroma and Mastodon social network instances`
  String get app_appStore_promotionalText {
    return Intl.message(
      'A client for Pleroma and Mastodon social network instances',
      name: 'app_appStore_promotionalText',
      desc: 'AppStore short description',
      args: [],
    );
  }

  /// `A beautiful and lightweight Pleroma and Mastodon client: - push notifications support; - emoji reactions on Pleroma instances; - Direct Messages support on Mastodon and Chats on Pleroma instances; - uploading any media files; - offline access to cached data and images; - multi-accounts and multi instances support.  You can connect any Pleroma or Mastodon instance or create account on fedi.app.`
  String get app_appStore_description {
    return Intl.message(
      'A beautiful and lightweight Pleroma and Mastodon client: - push notifications support; - emoji reactions on Pleroma instances; - Direct Messages support on Mastodon and Chats on Pleroma instances; - uploading any media files; - offline access to cached data and images; - multi-accounts and multi instances support.  You can connect any Pleroma or Mastodon instance or create account on fedi.app.',
      name: 'app_appStore_description',
      desc: 'AppStore full description',
      args: [],
    );
  }

  /// `Fedi for Pleroma and Mastodon`
  String get app_appStore_title {
    return Intl.message(
      'Fedi for Pleroma and Mastodon',
      name: 'app_appStore_title',
      desc: 'AppStore title',
      args: [],
    );
  }

  /// `A client for Pleroma and Mastodon social network instances`
  String get app_appStore_subtitle {
    return Intl.message(
      'A client for Pleroma and Mastodon social network instances',
      name: 'app_appStore_subtitle',
      desc: 'AppStore subtitle',
      args: [],
    );
  }

  /// `Settings: {userAtHost}`
  String app_account_home_tab_menu_action_instance_settings(Object userAtHost) {
    return Intl.message(
      'Settings: $userAtHost',
      name: 'app_account_home_tab_menu_action_instance_settings',
      desc: '',
      args: [userAtHost],
    );
  }

  /// `Настройки: {userAtHost}`
  String app_settings_instance_title(Object userAtHost) {
    return Intl.message(
      'Настройки: $userAtHost',
      name: 'app_settings_instance_title',
      desc: '',
      args: [userAtHost],
    );
  }

  /// `Localization`
  String get app_localization_settings_title {
    return Intl.message(
      'Localization',
      name: 'app_localization_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `UI`
  String get app_ui_settings_title {
    return Intl.message(
      'UI',
      name: 'app_ui_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `Posting`
  String get app_status_post_settings_title {
    return Intl.message(
      'Posting',
      name: 'app_status_post_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `NSFW & Spoilers`
  String get app_status_sensitive_settings_title {
    return Intl.message(
      'NSFW & Spoilers',
      name: 'app_status_sensitive_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `In-app notifications`
  String get app_toast_settings_title {
    return Intl.message(
      'In-app notifications',
      name: 'app_toast_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get app_chat_settings_title {
    return Intl.message(
      'Chat',
      name: 'app_chat_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `Data update (WebSockets)`
  String get app_web_sockets_settings_title {
    return Intl.message(
      'Data update (WebSockets)',
      name: 'app_web_sockets_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `Global settings`
  String get app_settings_global_or_instance_use_global_label {
    return Intl.message(
      'Global settings',
      name: 'app_settings_global_or_instance_use_global_label',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get app_localization_settings_field_localizationLocale_label {
    return Intl.message(
      'Language',
      name: 'app_localization_settings_field_localizationLocale_label',
      desc: '',
      args: [],
    );
  }

  /// `Mark media as NSFW`
  String get app_status_post_settings_field_markMediaAsNsfwOnAttach_label {
    return Intl.message(
      'Mark media as NSFW',
      name: 'app_status_post_settings_field_markMediaAsNsfwOnAttach_label',
      desc: '',
      args: [],
    );
  }

  /// `Default visibility`
  String get app_status_post_settings_field_defaultVisibility_label {
    return Intl.message(
      'Default visibility',
      name: 'app_status_post_settings_field_defaultVisibility_label',
      desc: '',
      args: [],
    );
  }

  /// `Always show spoilers`
  String get app_status_sensitive_settings_field_isAlwaysShowSpoiler_label {
    return Intl.message(
      'Always show spoilers',
      name: 'app_status_sensitive_settings_field_isAlwaysShowSpoiler_label',
      desc: '',
      args: [],
    );
  }

  /// `Always show NSFW`
  String get app_status_sensitive_settings_field_isAlwaysShowNsfw_label {
    return Intl.message(
      'Always show NSFW',
      name: 'app_status_sensitive_settings_field_isAlwaysShowNsfw_label',
      desc: '',
      args: [],
    );
  }

  /// `Remember "Tap to view"`
  String get app_status_sensitive_settings_field_nsfwDisplayDelayDuration_label {
    return Intl.message(
      'Remember "Tap to view"',
      name: 'app_status_sensitive_settings_field_nsfwDisplayDelayDuration_label',
      desc: '',
      args: [],
    );
  }

  /// `Count conversations in unread badges`
  String get app_chat_settings_field_countConversationsInChatsUnreadBadges_label {
    return Intl.message(
      'Count conversations in unread badges',
      name: 'app_chat_settings_field_countConversationsInChatsUnreadBadges_label',
      desc: '',
      args: [],
    );
  }

  /// `Replace "Conversations" with "Chats"`
  String get app_chat_settings_field_replaceConversationsWithPleromaChats_label {
    return Intl.message(
      'Replace "Conversations" with "Chats"',
      name: 'app_chat_settings_field_replaceConversationsWithPleromaChats_label',
      desc: '',
      args: [],
    );
  }

  /// `Real-time updates`
  String get app_web_sockets_settings_field_type_label {
    return Intl.message(
      'Real-time updates',
      name: 'app_web_sockets_settings_field_type_label',
      desc: '',
      args: [],
    );
  }

  /// `Disable to reduce battery usage`
  String get app_web_sockets_settings_field_type_description {
    return Intl.message(
      'Disable to reduce battery usage',
      name: 'app_web_sockets_settings_field_type_description',
      desc: '',
      args: [],
    );
  }

  /// `WebSockets updates`
  String get app_timeline_settings_field_enableWebSockets_label {
    return Intl.message(
      'WebSockets updates',
      name: 'app_timeline_settings_field_enableWebSockets_label',
      desc: '',
      args: [],
    );
  }

  /// `Disable to reduce battery usage`
  String get app_timeline_settings_field_enableWebSockets_description {
    return Intl.message(
      'Disable to reduce battery usage',
      name: 'app_timeline_settings_field_enableWebSockets_description',
      desc: '',
      args: [],
    );
  }

  /// `Media`
  String get app_media_settings_title {
    return Intl.message(
      'Media',
      name: 'app_media_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `Auto-load`
  String get app_media_settings_field_autoInit_label {
    return Intl.message(
      'Auto-load',
      name: 'app_media_settings_field_autoInit_label',
      desc: '',
      args: [],
    );
  }

  /// `Auto-play`
  String get app_media_settings_field_autoPlay_label {
    return Intl.message(
      'Auto-play',
      name: 'app_media_settings_field_autoPlay_label',
      desc: '',
      args: [],
    );
  }

  /// `Disabled`
  String get app_web_sockets_settings_type_disabled {
    return Intl.message(
      'Disabled',
      name: 'app_web_sockets_settings_type_disabled',
      desc: '',
      args: [],
    );
  }

  /// `Only for current screen`
  String get app_web_sockets_settings_type_onlyForeground {
    return Intl.message(
      'Only for current screen',
      name: 'app_web_sockets_settings_type_onlyForeground',
      desc: '',
      args: [],
    );
  }

  /// `Current screen & in background`
  String get app_web_sockets_settings_type_foregroundAndBackground {
    return Intl.message(
      'Current screen & in background',
      name: 'app_web_sockets_settings_type_foregroundAndBackground',
      desc: '',
      args: [],
    );
  }

  /// `Emoji reactions`
  String get app_push_settings_field_pleroma_emojiReaction_label {
    return Intl.message(
      'Emoji reactions',
      name: 'app_push_settings_field_pleroma_emojiReaction_label',
      desc: '',
      args: [],
    );
  }

  /// `Failed to change subscription settings`
  String get app_push_settings_update_fail_dialog_title {
    return Intl.message(
      'Failed to change subscription settings',
      name: 'app_push_settings_update_fail_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get app_account_my_action_edit {
    return Intl.message(
      'Edit profile',
      name: 'app_account_my_action_edit',
      desc: '',
      args: [],
    );
  }

  /// `Always`
  String get app_toast_handling_type_always {
    return Intl.message(
      'Always',
      name: 'app_toast_handling_type_always',
      desc: '',
      args: [],
    );
  }

  /// `When instance not selected`
  String get app_toast_handling_type_onlyWhenInstanceNotSelected {
    return Intl.message(
      'When instance not selected',
      name: 'app_toast_handling_type_onlyWhenInstanceNotSelected',
      desc: '',
      args: [],
    );
  }

  /// `When instance selected`
  String get app_toast_handling_type_onlyWhenInstanceSelected {
    return Intl.message(
      'When instance selected',
      name: 'app_toast_handling_type_onlyWhenInstanceSelected',
      desc: '',
      args: [],
    );
  }

  /// `When`
  String get app_toast_settings_field_handling_type_label {
    return Intl.message(
      'When',
      name: 'app_toast_settings_field_handling_type_label',
      desc: '',
      args: [],
    );
  }

  /// `Disabled in account settings`
  String get app_timeline_settings_field_enableWebSockets_description_instance_disabled {
    return Intl.message(
      'Disabled in account settings',
      name: 'app_timeline_settings_field_enableWebSockets_description_instance_disabled',
      desc: '',
      args: [],
    );
  }

  /// `If you discard now, you’ll lose this post.`
  String get app_status_post_new_unsaved_dialog_content {
    return Intl.message(
      'If you discard now, you’ll lose this post.',
      name: 'app_status_post_new_unsaved_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Keep editing`
  String get app_status_post_new_unsaved_dialog_action_keep_editing {
    return Intl.message(
      'Keep editing',
      name: 'app_status_post_new_unsaved_dialog_action_keep_editing',
      desc: '',
      args: [],
    );
  }

  /// `You haven’t bookmarked any posts yet.`
  String get app_account_my_statuses_bookmarked_empty_title {
    return Intl.message(
      'You haven’t bookmarked any posts yet.',
      name: 'app_account_my_statuses_bookmarked_empty_title',
      desc: '',
      args: [],
    );
  }

  /// `When you do, they will show up here.`
  String get app_account_my_statuses_bookmarked_empty_subtitle {
    return Intl.message(
      'When you do, they will show up here.',
      name: 'app_account_my_statuses_bookmarked_empty_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `You don’t have any pending requests.`
  String get app_account_my_followRequest_empty_title {
    return Intl.message(
      'You don’t have any pending requests.',
      name: 'app_account_my_followRequest_empty_title',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get app_account_my_followRequest_action_add {
    return Intl.message(
      'Add',
      name: 'app_account_my_followRequest_action_add',
      desc: '',
      args: [],
    );
  }

  /// `Ignore`
  String get app_account_my_followRequest_action_ignore {
    return Intl.message(
      'Ignore',
      name: 'app_account_my_followRequest_action_ignore',
      desc: '',
      args: [],
    );
  }

  /// `Blocking hides a user from your view: notifications, home and public feeds, boosting or mentioning the user. \n User can't follow you, user won’t see your posts in public timelines and boosts. \n If you and the blocked user are on the same server, the blocked user will not be able to view your posts on your profile while logged in.`
  String get app_account_my_accountBlock_description {
    return Intl.message(
      'Blocking hides a user from your view: notifications, home and public feeds, boosting or mentioning the user. \n User can\'t follow you, user won’t see your posts in public timelines and boosts. \n If you and the blocked user are on the same server, the blocked user will not be able to view your posts on your profile while logged in.',
      name: 'app_account_my_accountBlock_description',
      desc: '',
      args: [],
    );
  }

  /// `Add to blocked list`
  String get app_account_my_accountBlock_action_add {
    return Intl.message(
      'Add to blocked list',
      name: 'app_account_my_accountBlock_action_add',
      desc: '',
      args: [],
    );
  }

  /// `Block`
  String get app_account_my_accountBlock_action_block {
    return Intl.message(
      'Block',
      name: 'app_account_my_accountBlock_action_block',
      desc: '',
      args: [],
    );
  }

  /// `Unblock`
  String get app_account_my_accountBlock_action_unblock {
    return Intl.message(
      'Unblock',
      name: 'app_account_my_accountBlock_action_unblock',
      desc: '',
      args: [],
    );
  }

  /// `Add to muted list`
  String get app_account_my_accountMute_action_add {
    return Intl.message(
      'Add to muted list',
      name: 'app_account_my_accountMute_action_add',
      desc: '',
      args: [],
    );
  }

  /// `Muting hides the user from your view: public and home feeds, boosting and mentioning the user.\n If you choose to also mute notifications from them, you will additionally not see notifications from that user.\n The user has no way of knowing they have been muted.`
  String get app_account_my_accountMute_description {
    return Intl.message(
      'Muting hides the user from your view: public and home feeds, boosting and mentioning the user.\n If you choose to also mute notifications from them, you will additionally not see notifications from that user.\n The user has no way of knowing they have been muted.',
      name: 'app_account_my_accountMute_description',
      desc: '',
      args: [],
    );
  }

  /// `Mute`
  String get app_account_my_accountMute_action_mute {
    return Intl.message(
      'Mute',
      name: 'app_account_my_accountMute_action_mute',
      desc: '',
      args: [],
    );
  }

  /// `Unmute`
  String get app_account_my_accountMute_action_unmute {
    return Intl.message(
      'Unmute',
      name: 'app_account_my_accountMute_action_unmute',
      desc: '',
      args: [],
    );
  }

  /// `You haven’t liked any posts yet.`
  String get app_account_my_statuses_favourited_empty_title {
    return Intl.message(
      'You haven’t liked any posts yet.',
      name: 'app_account_my_statuses_favourited_empty_title',
      desc: '',
      args: [],
    );
  }

  /// `When you do, they will show up here.`
  String get app_account_my_statuses_favourited_empty_subtitle {
    return Intl.message(
      'When you do, they will show up here.',
      name: 'app_account_my_statuses_favourited_empty_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `You haven’t scheduled any posts yet.`
  String get app_account_my_statuses_scheduled_empty_title {
    return Intl.message(
      'You haven’t scheduled any posts yet.',
      name: 'app_account_my_statuses_scheduled_empty_title',
      desc: '',
      args: [],
    );
  }

  /// `When you do, they will show up here.`
  String get app_account_my_statuses_scheduled_subtitle {
    return Intl.message(
      'When you do, they will show up here.',
      name: 'app_account_my_statuses_scheduled_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `You haven’t drafted any posts yet.`
  String get app_account_my_statuses_draft_empty_title {
    return Intl.message(
      'You haven’t drafted any posts yet.',
      name: 'app_account_my_statuses_draft_empty_title',
      desc: '',
      args: [],
    );
  }

  /// `When you do, they will show up here.`
  String get app_account_my_statuses_draft_subtitle {
    return Intl.message(
      'When you do, they will show up here.',
      name: 'app_account_my_statuses_draft_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Block`
  String get app_account_my_domainBlock_action_block {
    return Intl.message(
      'Block',
      name: 'app_account_my_domainBlock_action_block',
      desc: '',
      args: [],
    );
  }

  /// `Unblock`
  String get app_account_my_domainBlock_action_unblock {
    return Intl.message(
      'Unblock',
      name: 'app_account_my_domainBlock_action_unblock',
      desc: '',
      args: [],
    );
  }

  /// `You won’t see notifications, boosts, posts, from that server on the public and home feeds.\n You will lose any followers that you might have had on that server.\n Usually, it is better to setup few account blocks or mutes instead of global instance block.`
  String get app_account_my_domainBlock_description {
    return Intl.message(
      'You won’t see notifications, boosts, posts, from that server on the public and home feeds.\n You will lose any followers that you might have had on that server.\n Usually, it is better to setup few account blocks or mutes instead of global instance block.',
      name: 'app_account_my_domainBlock_description',
      desc: '',
      args: [],
    );
  }

  /// `Add to blocked list`
  String get app_account_my_domainBlock_action_add {
    return Intl.message(
      'Add to blocked list',
      name: 'app_account_my_domainBlock_action_add',
      desc: '',
      args: [],
    );
  }

  /// `You haven’t created any Lists yet.`
  String get app_acccount_my_customList_list_empty_title {
    return Intl.message(
      'You haven’t created any Lists yet.',
      name: 'app_acccount_my_customList_list_empty_title',
      desc: '',
      args: [],
    );
  }

  /// `Create one now.`
  String get app_acccount_my_customList_list_empty_subtitle {
    return Intl.message(
      'Create one now.',
      name: 'app_acccount_my_customList_list_empty_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Create a list`
  String get app_acccount_my_customList_list_action_add {
    return Intl.message(
      'Create a list',
      name: 'app_acccount_my_customList_list_action_add',
      desc: '',
      args: [],
    );
  }

  /// `Edit list`
  String get app_acccount_my_customList_list_action_edit {
    return Intl.message(
      'Edit list',
      name: 'app_acccount_my_customList_list_action_edit',
      desc: '',
      args: [],
    );
  }

  /// `Add to your List`
  String get app_acccount_my_customList_edit_search_header {
    return Intl.message(
      'Add to your List',
      name: 'app_acccount_my_customList_edit_search_header',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get app_acccount_my_customList_edit_account_action_add {
    return Intl.message(
      'Add',
      name: 'app_acccount_my_customList_edit_account_action_add',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get app_acccount_my_customList_edit_account_action_remove {
    return Intl.message(
      'Remove',
      name: 'app_acccount_my_customList_edit_account_action_remove',
      desc: '',
      args: [],
    );
  }

  /// `Search for people you follow`
  String get app_acccount_my_customList_edit_search_hint {
    return Intl.message(
      'Search for people you follow',
      name: 'app_acccount_my_customList_edit_search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Suggestion`
  String get app_acccount_select_suggestion_header {
    return Intl.message(
      'Suggestion',
      name: 'app_acccount_select_suggestion_header',
      desc: '',
      args: [],
    );
  }

  /// `Added accounts`
  String get app_acccount_my_customList_edit_added_header {
    return Intl.message(
      'Added accounts',
      name: 'app_acccount_my_customList_edit_added_header',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get app_acccount_my_customList_edit_action_save {
    return Intl.message(
      'Save',
      name: 'app_acccount_my_customList_edit_action_save',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get app_account_my_statuses_scheduled_status_action_edit {
    return Intl.message(
      'Edit',
      name: 'app_account_my_statuses_scheduled_status_action_edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get app_account_my_statuses_scheduled_status_action_delete {
    return Intl.message(
      'Delete',
      name: 'app_account_my_statuses_scheduled_status_action_delete',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get app_account_my_statuses_draft_status_action_edit {
    return Intl.message(
      'Edit',
      name: 'app_account_my_statuses_draft_status_action_edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get app_account_my_statuses_draft_status_action_delete {
    return Intl.message(
      'Delete',
      name: 'app_account_my_statuses_draft_status_action_delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete list`
  String get app_acccount_my_customList_edit_action_delete_list {
    return Intl.message(
      'Delete list',
      name: 'app_acccount_my_customList_edit_action_delete_list',
      desc: '',
      args: [],
    );
  }

  /// `Posts in the list are cached on the server. Adding or Removing accounts will affect only new posts. All old posts will remain on the list forever.`
  String get app_acccount_my_customList_edit_description {
    return Intl.message(
      'Posts in the list are cached on the server. Adding or Removing accounts will affect only new posts. All old posts will remain on the list forever.',
      name: 'app_acccount_my_customList_edit_description',
      desc: '',
      args: [],
    );
  }

  /// `Recent`
  String get app_account_select_recent_header {
    return Intl.message(
      'Recent',
      name: 'app_account_select_recent_header',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get app_share_action_send {
    return Intl.message(
      'Send',
      name: 'app_share_action_send',
      desc: '',
      args: [],
    );
  }

  /// `You don’t have recent accounts selection`
  String get app_account_select_recent_empty {
    return Intl.message(
      'You don’t have recent accounts selection',
      name: 'app_account_select_recent_empty',
      desc: '',
      args: [],
    );
  }

  /// `Sent`
  String get app_share_action_sent {
    return Intl.message(
      'Sent',
      name: 'app_share_action_sent',
      desc: '',
      args: [],
    );
  }

  /// `Muting`
  String get app_account_mute_dialog_title {
    return Intl.message(
      'Muting',
      name: 'app_account_mute_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Muting hides the user from your view: public and home feeds, boosting and mentioning the user.\n If you choose to also mute notifications from them, you will additionally not see notifications from that user.\n The user has no way of knowing they have been muted.`
  String get app_account_mute_dialog_content {
    return Intl.message(
      'Muting hides the user from your view: public and home feeds, boosting and mentioning the user.\n If you choose to also mute notifications from them, you will additionally not see notifications from that user.\n The user has no way of knowing they have been muted.',
      name: 'app_account_mute_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Mute without notifications`
  String get app_account_mute_dialog_action_mute_without_notifications {
    return Intl.message(
      'Mute without notifications',
      name: 'app_account_mute_dialog_action_mute_without_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Mute with notifications`
  String get app_account_mute_dialog_action_mute_with_notifications {
    return Intl.message(
      'Mute with notifications',
      name: 'app_account_mute_dialog_action_mute_with_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Notifications muted`
  String get app_account_mute_toast_mute_with_notifications {
    return Intl.message(
      'Notifications muted',
      name: 'app_account_mute_toast_mute_with_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Notifications unmuted`
  String get app_account_mute_toast_mute_without_notifications {
    return Intl.message(
      'Notifications unmuted',
      name: 'app_account_mute_toast_mute_without_notifications',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}