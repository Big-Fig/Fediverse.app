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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
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

  /// `Polskie`
  String get localization_locale_pl {
    return Intl.message(
      'Polskie',
      name: 'localization_locale_pl',
      desc: '',
      args: [],
    );
  }

  /// `Default`
  String get localization_locale_default {
    return Intl.message(
      'Default',
      name: 'localization_locale_default',
      desc: '',
      args: [],
    );
  }

  /// `Not specified`
  String get localization_locale_notSpecified {
    return Intl.message(
      'Not specified',
      name: 'localization_locale_notSpecified',
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
  String get app_account_my_customList_list_title {
    return Intl.message(
      'Lists',
      name: 'app_account_my_customList_list_title',
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

  /// `This instance doesn't have custom emojis`
  String get app_emoji_custom_empty {
    return Intl.message(
      'This instance doesn\'t have custom emojis',
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

  /// `Start type to search`
  String get app_emoji_search_hint {
    return Intl.message(
      'Start type to search',
      name: 'app_emoji_search_hint',
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

  /// `Pin`
  String get app_account_action_pin {
    return Intl.message(
      'Pin',
      name: 'app_account_action_pin',
      desc: '',
      args: [],
    );
  }

  /// `Unpin`
  String get app_account_action_unpin {
    return Intl.message(
      'Unpin',
      name: 'app_account_action_unpin',
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
  String get app_account_report_toast_success {
    return Intl.message(
      'Successfully reported',
      name: 'app_account_report_toast_success',
      desc: '',
      args: [],
    );
  }

  /// `Failed to report`
  String get app_account_report_toast_fail {
    return Intl.message(
      'Failed to report',
      name: 'app_account_report_toast_fail',
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

  /// `Settings`
  String get app_account_home_tab_menu_action_settings {
    return Intl.message(
      'Settings',
      name: 'app_account_home_tab_menu_action_settings',
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

  /// `Announcements`
  String get app_account_home_tab_menu_action_instance_announcements {
    return Intl.message(
      'Announcements',
      name: 'app_account_home_tab_menu_action_instance_announcements',
      desc: '',
      args: [],
    );
  }

  /// `About Fedi`
  String get app_account_home_tab_menu_action_instance_aboutApp {
    return Intl.message(
      'About Fedi',
      name: 'app_account_home_tab_menu_action_instance_aboutApp',
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

  /// `Uploading media`
  String get app_media_upload_progress {
    return Intl.message(
      'Uploading media',
      name: 'app_media_upload_progress',
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
  String app_media_upload_failed_notification_exceedSize_content(
      Object formattedFileSize, Object formattedMaxFileSize) {
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

  /// `API error`
  String get app_async_unifedi_error_common_dialog_title {
    return Intl.message(
      'API error',
      name: 'app_async_unifedi_error_common_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Message: {message}`
  String app_async_unifedi_error_common_dialog_content(Object message) {
    return Intl.message(
      'Message: $message',
      name: 'app_async_unifedi_error_common_dialog_content',
      desc: '',
      args: [message],
    );
  }

  /// `Throttled. Server blocked action.`
  String get app_async_unifedi_error_throttled_dialog_title {
    return Intl.message(
      'Throttled. Server blocked action.',
      name: 'app_async_unifedi_error_throttled_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Too much operations per minute. Please wait before do something again.`
  String get app_async_unifedi_error_throttled_dialog_content {
    return Intl.message(
      'Too much operations per minute. Please wait before do something again.',
      name: 'app_async_unifedi_error_throttled_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Forbidden. Invalid action or session expired`
  String get app_async_unifedi_error_forbidden_dialog_title {
    return Intl.message(
      'Forbidden. Invalid action or session expired',
      name: 'app_async_unifedi_error_forbidden_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `{content}`
  String app_async_unifedi_error_forbidden_dialog_content(Object content) {
    return Intl.message(
      '$content',
      name: 'app_async_unifedi_error_forbidden_dialog_content',
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
  String app_auth_instance_current_context_loading_loading_content(
      Object userAtHost) {
    return Intl.message(
      '$userAtHost',
      name: 'app_auth_instance_current_context_loading_loading_content',
      desc: '',
      args: [userAtHost],
    );
  }

  /// `Can't load {userAtHost} instance.\nApp error or session expired`
  String app_auth_instance_current_context_loading_cantLoad_content(
      Object userAtHost) {
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
  String
      get app_auth_instance_current_context_loading_cantLoad_action_chooseDifferentAccount {
    return Intl.message(
      'Choose different account',
      name:
          'app_auth_instance_current_context_loading_cantLoad_action_chooseDifferentAccount',
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

  /// `Explore as guest`
  String get app_auth_instance_join_action_exploreAsGuest {
    return Intl.message(
      'Explore as guest',
      name: 'app_auth_instance_join_action_exploreAsGuest',
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

  /// `About`
  String get app_auth_instance_join_action_about {
    return Intl.message(
      'About',
      name: 'app_auth_instance_join_action_about',
      desc: '',
      args: [],
    );
  }

  /// `Help me choose instance`
  String get app_auth_instance_join_action_helpMeChooseInstance {
    return Intl.message(
      'Help me choose instance',
      name: 'app_auth_instance_join_action_helpMeChooseInstance',
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

  /// `Fail to connect to instance`
  String get app_auth_instance_join_fail_dialog_title {
    return Intl.message(
      'Fail to connect to instance',
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

  /// `Create account on {host}`
  String app_auth_instance_register_title(Object host) {
    return Intl.message(
      'Create account on $host',
      name: 'app_auth_instance_register_title',
      desc: '',
      args: [host],
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

  /// `Accounts manual approve`
  String get app_auth_instance_register_step_manualApprove_title {
    return Intl.message(
      'Accounts manual approve',
      name: 'app_auth_instance_register_step_manualApprove_title',
      desc: '',
      args: [],
    );
  }

  /// `Instance owners enabled manual approve by moderators to prevent spam.\nYou will need to wait moderation approve until you will can use your account`
  String get app_auth_instance_register_step_manualApprove_description {
    return Intl.message(
      'Instance owners enabled manual approve by moderators to prevent spam.\nYou will need to wait moderation approve until you will can use your account',
      name: 'app_auth_instance_register_step_manualApprove_description',
      desc: '',
      args: [],
    );
  }

  /// `Captcha`
  String get app_auth_instance_register_step_captcha_title {
    return Intl.message(
      'Captcha',
      name: 'app_auth_instance_register_step_captcha_title',
      desc: '',
      args: [],
    );
  }

  /// `Instance owners enabled captcha to prevent spam`
  String get app_auth_instance_register_step_captcha_description {
    return Intl.message(
      'Instance owners enabled captcha to prevent spam',
      name: 'app_auth_instance_register_step_captcha_description',
      desc: '',
      args: [],
    );
  }

  /// `Instance owners disabled captcha`
  String
      get app_auth_instance_register_step_captcha_description_disabledOnServer {
    return Intl.message(
      'Instance owners disabled captcha',
      name:
          'app_auth_instance_register_step_captcha_description_disabledOnServer',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get app_auth_instance_register_step_account_title {
    return Intl.message(
      'Account',
      name: 'app_auth_instance_register_step_account_title',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get app_auth_instance_register_step_submit_title {
    return Intl.message(
      'Submit',
      name: 'app_auth_instance_register_step_submit_title',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get app_auth_instance_register_action_nextStep {
    return Intl.message(
      'Next',
      name: 'app_auth_instance_register_action_nextStep',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get app_auth_instance_register_action_previousStep {
    return Intl.message(
      'Back',
      name: 'app_auth_instance_register_action_previousStep',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get app_auth_instance_register_action_submit {
    return Intl.message(
      'Submit',
      name: 'app_auth_instance_register_action_submit',
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

  /// `Tap to reload`
  String get app_auth_instance_register_field_captcha_description {
    return Intl.message(
      'Tap to reload',
      name: 'app_auth_instance_register_field_captcha_description',
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

  /// `You will need to confirm it`
  String get app_auth_instance_register_field_email_description {
    return Intl.message(
      'You will need to confirm it',
      name: 'app_auth_instance_register_field_email_description',
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
  String get app_chat_unifedi_share_title {
    return Intl.message(
      'Share to chats',
      name: 'app_chat_unifedi_share_title',
      desc: '',
      args: [],
    );
  }

  /// `{count,plural, =1{1 new chat. Tap to load.} other{{count} new chats. Tap to load.}}`
  String app_chat_list_newItems_action_tapToLoadNew(num count) {
    return Intl.plural(
      count,
      one: '1 new chat. Tap to load.',
      other: '$count new chats. Tap to load.',
      name: 'app_chat_list_newItems_action_tapToLoadNew',
      desc: '',
      args: [count],
    );
  }

  /// `Chat accounts`
  String get app_chat_unifedi_accounts_title {
    return Intl.message(
      'Chat accounts',
      name: 'app_chat_unifedi_accounts_title',
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
  String get app_home_tab_chat_unifedi_title {
    return Intl.message(
      'Chats',
      name: 'app_home_tab_chat_unifedi_title',
      desc: '',
      args: [],
    );
  }

  /// `Chats not supported on Mastodon instances`
  String get app_home_tab_chat_unifedi_notSupported_mastodon {
    return Intl.message(
      'Chats not supported on Mastodon instances',
      name: 'app_home_tab_chat_unifedi_notSupported_mastodon',
      desc: '',
      args: [],
    );
  }

  /// `This instance doesn't support chats`
  String get app_home_tab_chat_unifedi_notSupported_pleroma {
    return Intl.message(
      'This instance doesn\'t support chats',
      name: 'app_home_tab_chat_unifedi_notSupported_pleroma',
      desc: '',
      args: [],
    );
  }

  /// `To Conversations`
  String get app_home_tab_chat_unifedi_action_switch_to_dms {
    return Intl.message(
      'To Conversations',
      name: 'app_home_tab_chat_unifedi_action_switch_to_dms',
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

  /// `Do you want to enable push notifications?\nThey will be forwarded through Fedi Push Relay Server.\n You can change this option in settings later`
  String get app_push_permission_ask_dialog_content {
    return Intl.message(
      'Do you want to enable push notifications?\nThey will be forwarded through Fedi Push Relay Server.\n You can change this option in settings later',
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

  /// `Push filters`
  String get app_push_filter_settings_title {
    return Intl.message(
      'Push filters',
      name: 'app_push_filter_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `All messages will be forwarded through Fedi Relay Server`
  String get app_push_settings_desc {
    return Intl.message(
      'All messages will be forwarded through Fedi Relay Server',
      name: 'app_push_settings_desc',
      desc: '',
      args: [],
    );
  }

  /// `You can also specify additional filters`
  String get app_push_settings_desc_filters {
    return Intl.message(
      'You can also specify additional filters',
      name: 'app_push_settings_desc_filters',
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
  String get app_push_settings_field_chat_label {
    return Intl.message(
      'Chats',
      name: 'app_push_settings_field_chat_label',
      desc: '',
      args: [],
    );
  }

  /// `Hide notifications content`
  String get app_push_filter_settings_field_hideNotificationContents_label {
    return Intl.message(
      'Hide notifications content',
      name: 'app_push_filter_settings_field_hideNotificationContents_label',
      desc: '',
      args: [],
    );
  }

  /// `Block from strangers`
  String get app_push_filter_settings_field_blockFromStrangers_label {
    return Intl.message(
      'Block from strangers',
      name: 'app_push_filter_settings_field_blockFromStrangers_label',
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

  /// `Mentioned you: `
  String get app_notification_header_mention_prefix {
    return Intl.message(
      'Mentioned you: ',
      name: 'app_notification_header_mention_prefix',
      desc: '',
      args: [],
    );
  }

  /// `{status}.`
  String app_notification_header_mention_postfix(Object status) {
    return Intl.message(
      '$status.',
      name: 'app_notification_header_mention_postfix',
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
  String app_notification_header_emojiReaction(Object emoji) {
    return Intl.message(
      '$emoji for your post.',
      name: 'app_notification_header_emojiReaction',
      desc: '',
      args: [emoji],
    );
  }

  /// `Chat: `
  String get app_notification_header_chatMention_prefix {
    return Intl.message(
      'Chat: ',
      name: 'app_notification_header_chatMention_prefix',
      desc: '',
      args: [],
    );
  }

  /// `{status}.`
  String app_notification_header_chatMention_postfix(Object status) {
    return Intl.message(
      '$status.',
      name: 'app_notification_header_chatMention_postfix',
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

  /// `Add Timelines…`
  String get app_timeline_storage_action_add {
    return Intl.message(
      'Add Timelines…',
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

  /// `Self & Following`
  String get app_timeline_settings_replyVisibilityFilter_following {
    return Intl.message(
      'Self & Following',
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

  /// `Success`
  String get app_media_attachment_addToGallery_success {
    return Intl.message(
      'Success',
      name: 'app_media_attachment_addToGallery_success',
      desc: '',
      args: [],
    );
  }

  /// `Saving…`
  String get app_media_attachment_addToGallery_start_saving {
    return Intl.message(
      'Saving…',
      name: 'app_media_attachment_addToGallery_start_saving',
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

  /// `Can't save draft with not uploaded media`
  String get app_status_draft_error_cantSaveNotUploadedMedia {
    return Intl.message(
      'Can\'t save draft with not uploaded media',
      name: 'app_status_draft_error_cantSaveNotUploadedMedia',
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

  /// `Schedule at`
  String get app_status_scheduled_datetime_picker_title {
    return Intl.message(
      'Schedule at',
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

  /// `Copied in clipboard`
  String get app_status_copyLink_toast {
    return Intl.message(
      'Copied in clipboard',
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

  /// `Hide totals`
  String get app_status_post_poll_field_hideTotals_label {
    return Intl.message(
      'Hide totals',
      name: 'app_status_post_poll_field_hideTotals_label',
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

  /// `Invalid date or time`
  String get app_status_post_schedule_error_notInFuture_dialog_title {
    return Intl.message(
      'Invalid date or time',
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

  /// `Posting…`
  String get app_status_post_dialog_async_content {
    return Intl.message(
      'Posting…',
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

  /// `Loading…`
  String get dialog_progress_content {
    return Intl.message(
      'Loading…',
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

  /// `Learn more`
  String get dialog_action_learnMore {
    return Intl.message(
      'Learn more',
      name: 'dialog_action_learnMore',
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

  /// `Empty`
  String get form_field_text_error_empty_desc {
    return Intl.message(
      'Empty',
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
  String form_field_text_error_length_minAndMax_desc(
      Object minCharactersCount, Object maxCharactersCount) {
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

  /// `Settings: {userAtHost}`
  String app_settings_instance_title(Object userAtHost) {
    return Intl.message(
      'Settings: $userAtHost',
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

  /// `Override global settings`
  String get app_settings_global_or_instance_override_global_label {
    return Intl.message(
      'Override global settings',
      name: 'app_settings_global_or_instance_override_global_label',
      desc: '',
      args: [],
    );
  }

  /// `Language of your statuses`
  String
      get app_localization_settings_field_localizationLocale_yourStatuses_label {
    return Intl.message(
      'Language of your statuses',
      name:
          'app_localization_settings_field_localizationLocale_yourStatuses_label',
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

  /// `Don't upload media during editing`
  String get app_status_post_settings_field_dontUploadMediaDuringEditing_label {
    return Intl.message(
      'Don\'t upload media during editing',
      name: 'app_status_post_settings_field_dontUploadMediaDuringEditing_label',
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

  /// `Replace blur with fill`
  String
      get app_status_sensitive_settings_field_isNeedReplaceBlurWithFill_label {
    return Intl.message(
      'Replace blur with fill',
      name:
          'app_status_sensitive_settings_field_isNeedReplaceBlurWithFill_label',
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
  String
      get app_status_sensitive_settings_field_nsfwDisplayDelayDuration_label {
    return Intl.message(
      'Remember "Tap to view"',
      name:
          'app_status_sensitive_settings_field_nsfwDisplayDelayDuration_label',
      desc: '',
      args: [],
    );
  }

  /// `Count conversations in unread badges`
  String
      get app_chat_settings_field_countConversationsInChatsUnreadBadges_label {
    return Intl.message(
      'Count conversations in unread badges',
      name:
          'app_chat_settings_field_countConversationsInChatsUnreadBadges_label',
      desc: '',
      args: [],
    );
  }

  /// `Replace "Conversations" with "Chats"`
  String
      get app_chat_settings_field_replaceConversationsWithUnifediChats_label {
    return Intl.message(
      'Replace "Conversations" with "Chats"',
      name:
          'app_chat_settings_field_replaceConversationsWithUnifediChats_label',
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
  String get app_push_settings_field_emojiReaction_label {
    return Intl.message(
      'Emoji reactions',
      name: 'app_push_settings_field_emojiReaction_label',
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

  /// `When app with account in foreground`
  String get app_toast_handling_type_onlyWhenInstanceNotSelected {
    return Intl.message(
      'When app with account in foreground',
      name: 'app_toast_handling_type_onlyWhenInstanceNotSelected',
      desc: '',
      args: [],
    );
  }

  /// `When app or account in background`
  String get app_toast_handling_type_onlyWhenInstanceSelected {
    return Intl.message(
      'When app or account in background',
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

  /// `Not supported or disabled in settings`
  String
      get app_timeline_settings_field_enableWebSockets_description_instance_disabled {
    return Intl.message(
      'Not supported or disabled in settings',
      name:
          'app_timeline_settings_field_enableWebSockets_description_instance_disabled',
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
  String get app_account_block_description {
    return Intl.message(
      'Blocking hides a user from your view: notifications, home and public feeds, boosting or mentioning the user. \n User can\'t follow you, user won’t see your posts in public timelines and boosts. \n If you and the blocked user are on the same server, the blocked user will not be able to view your posts on your profile while logged in.',
      name: 'app_account_block_description',
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

  /// `Muting hides the user from your view: public and home feeds, boosting and mentioning the user.\n The user has no way of knowing they have been muted.`
  String get app_account_mute_description {
    return Intl.message(
      'Muting hides the user from your view: public and home feeds, boosting and mentioning the user.\n The user has no way of knowing they have been muted.',
      name: 'app_account_mute_description',
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
  String get app_account_domainBlock_description {
    return Intl.message(
      'You won’t see notifications, boosts, posts, from that server on the public and home feeds.\n You will lose any followers that you might have had on that server.\n Usually, it is better to setup few account blocks or mutes instead of global instance block.',
      name: 'app_account_domainBlock_description',
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
  String get app_account_my_customList_list_empty_title {
    return Intl.message(
      'You haven’t created any Lists yet.',
      name: 'app_account_my_customList_list_empty_title',
      desc: '',
      args: [],
    );
  }

  /// `Create one now.`
  String get app_account_my_customList_list_empty_subtitle {
    return Intl.message(
      'Create one now.',
      name: 'app_account_my_customList_list_empty_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Create a list`
  String get app_account_my_customList_list_action_add {
    return Intl.message(
      'Create a list',
      name: 'app_account_my_customList_list_action_add',
      desc: '',
      args: [],
    );
  }

  /// `Edit list`
  String get app_account_my_customList_list_action_edit {
    return Intl.message(
      'Edit list',
      name: 'app_account_my_customList_list_action_edit',
      desc: '',
      args: [],
    );
  }

  /// `Add to your List`
  String get app_account_my_customList_edit_search_header {
    return Intl.message(
      'Add to your List',
      name: 'app_account_my_customList_edit_search_header',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get app_account_my_customList_edit_account_action_add {
    return Intl.message(
      'Add',
      name: 'app_account_my_customList_edit_account_action_add',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get app_account_my_customList_edit_account_action_remove {
    return Intl.message(
      'Remove',
      name: 'app_account_my_customList_edit_account_action_remove',
      desc: '',
      args: [],
    );
  }

  /// `Search for people you follow`
  String get app_account_my_customList_edit_search_hint {
    return Intl.message(
      'Search for people you follow',
      name: 'app_account_my_customList_edit_search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Suggestion`
  String get app_account_select_suggestion_header {
    return Intl.message(
      'Suggestion',
      name: 'app_account_select_suggestion_header',
      desc: '',
      args: [],
    );
  }

  /// `Added accounts`
  String get app_account_my_customList_edit_added_header {
    return Intl.message(
      'Added accounts',
      name: 'app_account_my_customList_edit_added_header',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get app_account_my_customList_edit_action_save {
    return Intl.message(
      'Save',
      name: 'app_account_my_customList_edit_action_save',
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
  String get app_account_my_customList_edit_action_delete_list {
    return Intl.message(
      'Delete list',
      name: 'app_account_my_customList_edit_action_delete_list',
      desc: '',
      args: [],
    );
  }

  /// `Statuses in the list are cached on the server.\nAdding or Removing accounts will affect only new posts.\n All old posts will remain on the list forever. It is only possible to add account which you follow.`
  String get app_account_my_customList_edit_description {
    return Intl.message(
      'Statuses in the list are cached on the server.\nAdding or Removing accounts will affect only new posts.\n All old posts will remain on the list forever. It is only possible to add account which you follow.',
      name: 'app_account_my_customList_edit_description',
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

  /// `Snooze User`
  String get app_account_mute_dialog_title {
    return Intl.message(
      'Snooze User',
      name: 'app_account_mute_dialog_title',
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

  /// `Report will be send to server moderators`
  String get app_account_report_description {
    return Intl.message(
      'Report will be send to server moderators',
      name: 'app_account_report_description',
      desc: '',
      args: [],
    );
  }

  /// `Additional comments`
  String get app_account_report_message_hint {
    return Intl.message(
      'Additional comments',
      name: 'app_account_report_message_hint',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get app_account_report_message_label {
    return Intl.message(
      'Message',
      name: 'app_account_report_message_label',
      desc: '',
      args: [],
    );
  }

  /// `Forward to {host}`
  String app_account_report_forward_label(Object host) {
    return Intl.message(
      'Forward to $host',
      name: 'app_account_report_forward_label',
      desc: '',
      args: [host],
    );
  }

  /// `Send`
  String get app_account_report_action_send {
    return Intl.message(
      'Send',
      name: 'app_account_report_action_send',
      desc: '',
      args: [],
    );
  }

  /// `Report {userAtHost}`
  String app_account_report_title(Object userAtHost) {
    return Intl.message(
      'Report $userAtHost',
      name: 'app_account_report_title',
      desc: '',
      args: [userAtHost],
    );
  }

  /// `Rate app`
  String get app_account_home_tab_menu_action_rateApp {
    return Intl.message(
      'Rate app',
      name: 'app_account_home_tab_menu_action_rateApp',
      desc: '',
      args: [],
    );
  }

  /// `Edit filter`
  String get app_filter_edit_title {
    return Intl.message(
      'Edit filter',
      name: 'app_filter_edit_title',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get app_filter_list_title {
    return Intl.message(
      'Filters',
      name: 'app_filter_list_title',
      desc: '',
      args: [],
    );
  }

  /// `Create filter`
  String get app_filter_create_title {
    return Intl.message(
      'Create filter',
      name: 'app_filter_create_title',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get app_account_my_action_filters {
    return Intl.message(
      'Filters',
      name: 'app_account_my_action_filters',
      desc: '',
      args: [],
    );
  }

  /// `Phrase`
  String get app_filter_edit_field_phrase_label {
    return Intl.message(
      'Phrase',
      name: 'app_filter_edit_field_phrase_label',
      desc: '',
      args: [],
    );
  }

  /// `Not sensitive to case`
  String get app_filter_edit_field_phrase_hint {
    return Intl.message(
      'Not sensitive to case',
      name: 'app_filter_edit_field_phrase_hint',
      desc: '',
      args: [],
    );
  }

  /// `Whole word`
  String get app_filter_edit_field_wholeWord_label {
    return Intl.message(
      'Whole word',
      name: 'app_filter_edit_field_wholeWord_label',
      desc: '',
      args: [],
    );
  }

  /// `Apply only if phrase exactly matched`
  String get app_filter_edit_field_wholeWord_description {
    return Intl.message(
      'Apply only if phrase exactly matched',
      name: 'app_filter_edit_field_wholeWord_description',
      desc: '',
      args: [],
    );
  }

  /// `Expires in`
  String get app_filter_edit_field_expiresIn_label {
    return Intl.message(
      'Expires in',
      name: 'app_filter_edit_field_expiresIn_label',
      desc: '',
      args: [],
    );
  }

  /// `Drop instead of hide`
  String get app_filter_edit_field_irreversible_label {
    return Intl.message(
      'Drop instead of hide',
      name: 'app_filter_edit_field_irreversible_label',
      desc: '',
      args: [],
    );
  }

  /// `Contexts`
  String get app_filter_edit_field_context_label {
    return Intl.message(
      'Contexts',
      name: 'app_filter_edit_field_context_label',
      desc: '',
      args: [],
    );
  }

  /// `One or multiply contexts where the filter should apply`
  String get app_filter_edit_field_context_description {
    return Intl.message(
      'One or multiply contexts where the filter should apply',
      name: 'app_filter_edit_field_context_description',
      desc: '',
      args: [],
    );
  }

  /// `Home and Lists`
  String get app_filter_context_type_home_and_lists {
    return Intl.message(
      'Home and Lists',
      name: 'app_filter_context_type_home_and_lists',
      desc: '',
      args: [],
    );
  }

  /// `Public`
  String get app_filter_context_type_public {
    return Intl.message(
      'Public',
      name: 'app_filter_context_type_public',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get app_filter_context_type_notifications {
    return Intl.message(
      'Notifications',
      name: 'app_filter_context_type_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Conversations`
  String get app_filter_context_type_threads {
    return Intl.message(
      'Conversations',
      name: 'app_filter_context_type_threads',
      desc: '',
      args: [],
    );
  }

  /// `Filter statuses on server-side (irreversible)`
  String get app_filter_edit_field_irreversible_description {
    return Intl.message(
      'Filter statuses on server-side (irreversible)',
      name: 'app_filter_edit_field_irreversible_description',
      desc: '',
      args: [],
    );
  }

  /// `Remove statuses which contains phrase in text or content warning`
  String get app_filter_edit_description {
    return Intl.message(
      'Remove statuses which contains phrase in text or content warning',
      name: 'app_filter_edit_description',
      desc: '',
      args: [],
    );
  }

  /// `You haven’t created any Filters yet.`
  String get app_filter_list_empty {
    return Intl.message(
      'You haven’t created any Filters yet.',
      name: 'app_filter_list_empty',
      desc: '',
      args: [],
    );
  }

  /// `Add Filter`
  String get app_filter_list_action_add {
    return Intl.message(
      'Add Filter',
      name: 'app_filter_list_action_add',
      desc: '',
      args: [],
    );
  }

  /// `Phrase should be alphanumeric only`
  String get app_filter_edit_field_wholeWord_error_invalid_phrase {
    return Intl.message(
      'Phrase should be alphanumeric only',
      name: 'app_filter_edit_field_wholeWord_error_invalid_phrase',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get app_filter_edit_action_save {
    return Intl.message(
      'Save',
      name: 'app_filter_edit_action_save',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get app_filter_edit_action_delete {
    return Intl.message(
      'Delete',
      name: 'app_filter_edit_action_delete',
      desc: '',
      args: [],
    );
  }

  /// `Nothing selected`
  String get app_filter_context_empty {
    return Intl.message(
      'Nothing selected',
      name: 'app_filter_context_empty',
      desc: '',
      args: [],
    );
  }

  /// `Expired filters are not automatically deleted, but can be reactivated`
  String get app_filter_edit_field_expiresIn_description {
    return Intl.message(
      'Expired filters are not automatically deleted, but can be reactivated',
      name: 'app_filter_edit_field_expiresIn_description',
      desc: '',
      args: [],
    );
  }

  /// `Never`
  String get app_duration_value_null {
    return Intl.message(
      'Never',
      name: 'app_duration_value_null',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get app_filter_context_type_account {
    return Intl.message(
      'Account',
      name: 'app_filter_context_type_account',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get app_duration_picker_action_delete {
    return Intl.message(
      'Delete',
      name: 'app_duration_picker_action_delete',
      desc: '',
      args: [],
    );
  }

  /// `Expired`
  String get app_filter_expired {
    return Intl.message(
      'Expired',
      name: 'app_filter_expired',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get app_filter_context_type_unknown {
    return Intl.message(
      'Unknown',
      name: 'app_filter_context_type_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Smallest`
  String get app_ui_fontSize_type_smallest {
    return Intl.message(
      'Smallest',
      name: 'app_ui_fontSize_type_smallest',
      desc: '',
      args: [],
    );
  }

  /// `Small`
  String get app_ui_fontSize_type_small {
    return Intl.message(
      'Small',
      name: 'app_ui_fontSize_type_small',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get app_ui_fontSize_type_medium {
    return Intl.message(
      'Medium',
      name: 'app_ui_fontSize_type_medium',
      desc: '',
      args: [],
    );
  }

  /// `Large`
  String get app_ui_fontSize_type_large {
    return Intl.message(
      'Large',
      name: 'app_ui_fontSize_type_large',
      desc: '',
      args: [],
    );
  }

  /// `Largest`
  String get app_ui_fontSize_type_largest {
    return Intl.message(
      'Largest',
      name: 'app_ui_fontSize_type_largest',
      desc: '',
      args: [],
    );
  }

  /// `Status font size`
  String get app_ui_statusFontSize {
    return Intl.message(
      'Status font size',
      name: 'app_ui_statusFontSize',
      desc: '',
      args: [],
    );
  }

  /// `Pagination`
  String get app_pagination_settings_title {
    return Intl.message(
      'Pagination',
      name: 'app_pagination_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `Page size`
  String get app_pagination_settings_pageSize_label {
    return Intl.message(
      'Page size',
      name: 'app_pagination_settings_pageSize_label',
      desc: '',
      args: [],
    );
  }

  /// `Age limit`
  String get app_cache_database_settings_limitAge_label {
    return Intl.message(
      'Age limit',
      name: 'app_cache_database_settings_limitAge_label',
      desc: '',
      args: [],
    );
  }

  /// `Entries count per type limit`
  String get app_cache_database_settings_limitEntriesCountByType_label {
    return Intl.message(
      'Entries count per type limit',
      name: 'app_cache_database_settings_limitEntriesCountByType_label',
      desc: '',
      args: [],
    );
  }

  /// `Objects count limit`
  String get app_cache_files_settings_sizeLimit_label {
    return Intl.message(
      'Objects count limit',
      name: 'app_cache_files_settings_sizeLimit_label',
      desc: '',
      args: [],
    );
  }

  /// `Databаse cache`
  String get app_cache_database_settings_title {
    return Intl.message(
      'Databаse cache',
      name: 'app_cache_database_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `Files cache`
  String get app_cache_files_settings_title {
    return Intl.message(
      'Files cache',
      name: 'app_cache_files_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `Exceed limits data will be deleted on each app start.`
  String get app_cache_files_settings_description {
    return Intl.message(
      'Exceed limits data will be deleted on each app start.',
      name: 'app_cache_files_settings_description',
      desc: '',
      args: [],
    );
  }

  /// `Clear cache by limits ({userAtHost})`
  String app_cache_settings_action_clear_by_limits_now(Object userAtHost) {
    return Intl.message(
      'Clear cache by limits ($userAtHost)',
      name: 'app_cache_settings_action_clear_by_limits_now',
      desc: '',
      args: [userAtHost],
    );
  }

  /// `Clear whole cache ({userAtHost})`
  String app_cache_settings_action_clear_all_now(Object userAtHost) {
    return Intl.message(
      'Clear whole cache ($userAtHost)',
      name: 'app_cache_settings_action_clear_all_now',
      desc: '',
      args: [userAtHost],
    );
  }

  /// `Accounts, statuses, conversation, notifications and chats. Huge limits may cause bad performance due to complex calculations for big amount of data.\n Exceed limits data will be deleted on each app start.`
  String get app_cache_database_settings_description {
    return Intl.message(
      'Accounts, statuses, conversation, notifications and chats. Huge limits may cause bad performance due to complex calculations for big amount of data.\n Exceed limits data will be deleted on each app start.',
      name: 'app_cache_database_settings_description',
      desc: '',
      args: [],
    );
  }

  /// `Should be not more than {max}`
  String form_field_int_error_length_maxOnlyValue_desc(Object max) {
    return Intl.message(
      'Should be not more than $max',
      name: 'form_field_int_error_length_maxOnlyValue_desc',
      desc: '',
      args: [max],
    );
  }

  /// `Should be at least {min}`
  String form_field_int_error_length_minOnlyValue_desc(Object min) {
    return Intl.message(
      'Should be at least $min',
      name: 'form_field_int_error_length_minOnlyValue_desc',
      desc: '',
      args: [min],
    );
  }

  /// `Should be between {min} and {max}`
  String form_field_int_error_length_minAndMax_desc(Object min, Object max) {
    return Intl.message(
      'Should be between $min and $max',
      name: 'form_field_int_error_length_minAndMax_desc',
      desc: '',
      args: [min, max],
    );
  }

  /// `{count}`
  String app_cache_database_settings_currentEntriesCountByType_value(
      Object count) {
    return Intl.message(
      '$count',
      name: 'app_cache_database_settings_currentEntriesCountByType_value',
      desc: '',
      args: [count],
    );
  }

  /// `Current max age`
  String get app_cache_database_settings_currentMaxAge_label {
    return Intl.message(
      'Current max age',
      name: 'app_cache_database_settings_currentMaxAge_label',
      desc: '',
      args: [],
    );
  }

  /// `{dateTime}`
  String app_cache_database_settings_currentMaxAge_value(Object dateTime) {
    return Intl.message(
      '$dateTime',
      name: 'app_cache_database_settings_currentMaxAge_value',
      desc: '',
      args: [dateTime],
    );
  }

  /// `Current max entries count by type`
  String get app_cache_database_settings_currentEntriesCountByType_label {
    return Intl.message(
      'Current max entries count by type',
      name: 'app_cache_database_settings_currentEntriesCountByType_label',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get app_cache_database_settings_limitAge_value_notSet {
    return Intl.message(
      'No',
      name: 'app_cache_database_settings_limitAge_value_notSet',
      desc: '',
      args: [],
    );
  }

  /// `7 days`
  String get app_cache_database_settings_limitAge_value_days7 {
    return Intl.message(
      '7 days',
      name: 'app_cache_database_settings_limitAge_value_days7',
      desc: '',
      args: [],
    );
  }

  /// `30 days`
  String get app_cache_database_settings_limitAge_value_days30 {
    return Intl.message(
      '30 days',
      name: 'app_cache_database_settings_limitAge_value_days30',
      desc: '',
      args: [],
    );
  }

  /// `90 days`
  String get app_cache_database_settings_limitAge_value_days90 {
    return Intl.message(
      '90 days',
      name: 'app_cache_database_settings_limitAge_value_days90',
      desc: '',
      args: [],
    );
  }

  /// `180 days`
  String get app_cache_database_settings_limitAge_value_days180 {
    return Intl.message(
      '180 days',
      name: 'app_cache_database_settings_limitAge_value_days180',
      desc: '',
      args: [],
    );
  }

  /// `1 year`
  String get app_cache_database_settings_limitAge_value_days365 {
    return Intl.message(
      '1 year',
      name: 'app_cache_database_settings_limitAge_value_days365',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get app_cache_database_settings_limitEntriesCountByType_value_notSet {
    return Intl.message(
      'No',
      name: 'app_cache_database_settings_limitEntriesCountByType_value_notSet',
      desc: '',
      args: [],
    );
  }

  /// `1000 entries`
  String
      get app_cache_database_settings_limitEntriesCountByType_value_limit1000 {
    return Intl.message(
      '1000 entries',
      name:
          'app_cache_database_settings_limitEntriesCountByType_value_limit1000',
      desc: '',
      args: [],
    );
  }

  /// `5000 entries`
  String
      get app_cache_database_settings_limitEntriesCountByType_value_limit5000 {
    return Intl.message(
      '5000 entries',
      name:
          'app_cache_database_settings_limitEntriesCountByType_value_limit5000',
      desc: '',
      args: [],
    );
  }

  /// `10000 entries`
  String
      get app_cache_database_settings_limitEntriesCountByType_value_limit10000 {
    return Intl.message(
      '10000 entries',
      name:
          'app_cache_database_settings_limitEntriesCountByType_value_limit10000',
      desc: '',
      args: [],
    );
  }

  /// `100000 entries`
  String
      get app_cache_database_settings_limitEntriesCountByType_value_limit100000 {
    return Intl.message(
      '100000 entries',
      name:
          'app_cache_database_settings_limitEntriesCountByType_value_limit100000',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get app_cache_files_settings_sizeLimit_value_notSet {
    return Intl.message(
      'No',
      name: 'app_cache_files_settings_sizeLimit_value_notSet',
      desc: '',
      args: [],
    );
  }

  /// `50`
  String get app_cache_files_settings_sizeLimit_value_size50 {
    return Intl.message(
      '50',
      name: 'app_cache_files_settings_sizeLimit_value_size50',
      desc: '',
      args: [],
    );
  }

  /// `100`
  String get app_cache_files_settings_sizeLimit_value_size100 {
    return Intl.message(
      '100',
      name: 'app_cache_files_settings_sizeLimit_value_size100',
      desc: '',
      args: [],
    );
  }

  /// `200`
  String get app_cache_files_settings_sizeLimit_value_size200 {
    return Intl.message(
      '200',
      name: 'app_cache_files_settings_sizeLimit_value_size200',
      desc: '',
      args: [],
    );
  }

  /// `500`
  String get app_cache_files_settings_sizeLimit_value_size500 {
    return Intl.message(
      '500',
      name: 'app_cache_files_settings_sizeLimit_value_size500',
      desc: '',
      args: [],
    );
  }

  /// `1000`
  String get app_cache_files_settings_sizeLimit_value_size1000 {
    return Intl.message(
      '1000',
      name: 'app_cache_files_settings_sizeLimit_value_size1000',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get app_cache_files_settings_limitAge_value_notSet {
    return Intl.message(
      'No',
      name: 'app_cache_files_settings_limitAge_value_notSet',
      desc: '',
      args: [],
    );
  }

  /// `7 days`
  String get app_cache_files_settings_limitAge_value_days7 {
    return Intl.message(
      '7 days',
      name: 'app_cache_files_settings_limitAge_value_days7',
      desc: '',
      args: [],
    );
  }

  /// `30 days`
  String get app_cache_files_settings_limitAge_value_days30 {
    return Intl.message(
      '30 days',
      name: 'app_cache_files_settings_limitAge_value_days30',
      desc: '',
      args: [],
    );
  }

  /// `90 days`
  String get app_cache_files_settings_limitAge_value_days90 {
    return Intl.message(
      '90 days',
      name: 'app_cache_files_settings_limitAge_value_days90',
      desc: '',
      args: [],
    );
  }

  /// `180 days`
  String get app_cache_files_settings_limitAge_value_days180 {
    return Intl.message(
      '180 days',
      name: 'app_cache_files_settings_limitAge_value_days180',
      desc: '',
      args: [],
    );
  }

  /// `1 year`
  String get app_cache_files_settings_limitAge_value_days365 {
    return Intl.message(
      '1 year',
      name: 'app_cache_files_settings_limitAge_value_days365',
      desc: '',
      args: [],
    );
  }

  /// `Age limit`
  String get app_cache_files_settings_limitAge_label {
    return Intl.message(
      'Age limit',
      name: 'app_cache_files_settings_limitAge_label',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe`
  String get app_account_action_subscribe {
    return Intl.message(
      'Subscribe',
      name: 'app_account_action_subscribe',
      desc: '',
      args: [],
    );
  }

  /// `Unsubscribe`
  String get app_account_action_unsubscribe {
    return Intl.message(
      'Unsubscribe',
      name: 'app_account_action_unsubscribe',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get app_account_statuses_tab_favourites {
    return Intl.message(
      'Favourites',
      name: 'app_account_statuses_tab_favourites',
      desc: '',
      args: [],
    );
  }

  /// `User restricted access to it's favourites`
  String get app_account_statuses_tab_favourites_accessRestricted {
    return Intl.message(
      'User restricted access to it\'s favourites',
      name: 'app_account_statuses_tab_favourites_accessRestricted',
      desc: '',
      args: [],
    );
  }

  /// `Hidden`
  String get app_account_info_value_hidden {
    return Intl.message(
      'Hidden',
      name: 'app_account_info_value_hidden',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get app_account_my_edit_field_background_dialog_action_select {
    return Intl.message(
      'Select',
      name: 'app_account_my_edit_field_background_dialog_action_select',
      desc: '',
      args: [],
    );
  }

  /// `Crop`
  String get app_account_my_edit_field_background_dialog_action_crop {
    return Intl.message(
      'Crop',
      name: 'app_account_my_edit_field_background_dialog_action_crop',
      desc: '',
      args: [],
    );
  }

  /// `Background`
  String get app_account_my_edit_field_background_dialog_title {
    return Intl.message(
      'Background',
      name: 'app_account_my_edit_field_background_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `You should manually approve follow requests`
  String get app_account_my_edit_field_locked_description {
    return Intl.message(
      'You should manually approve follow requests',
      name: 'app_account_my_edit_field_locked_description',
      desc: '',
      args: [],
    );
  }

  /// `Your bio and links to your pages`
  String get app_account_my_edit_field_note_hint {
    return Intl.message(
      'Your bio and links to your pages',
      name: 'app_account_my_edit_field_note_hint',
      desc: '',
      args: [],
    );
  }

  /// `John Smith`
  String get app_account_my_edit_field_displayName_hint {
    return Intl.message(
      'John Smith',
      name: 'app_account_my_edit_field_displayName_hint',
      desc: '',
      args: [],
    );
  }

  /// `Bot`
  String get app_account_my_edit_field_bot_label {
    return Intl.message(
      'Bot',
      name: 'app_account_my_edit_field_bot_label',
      desc: '',
      args: [],
    );
  }

  /// `Mark if current account is bot`
  String get app_account_my_edit_field_bot_description {
    return Intl.message(
      'Mark if current account is bot',
      name: 'app_account_my_edit_field_bot_description',
      desc: '',
      args: [],
    );
  }

  /// `Discoverable`
  String get app_account_my_edit_field_discoverable_label {
    return Intl.message(
      'Discoverable',
      name: 'app_account_my_edit_field_discoverable_label',
      desc: '',
      args: [],
    );
  }

  /// `Search engines & Profile directory`
  String get app_account_my_edit_field_discoverable_description {
    return Intl.message(
      'Search engines & Profile directory',
      name: 'app_account_my_edit_field_discoverable_description',
      desc: '',
      args: [],
    );
  }

  /// `Accepts chat messages`
  String get app_account_my_edit_field_acceptsChatMessages_label {
    return Intl.message(
      'Accepts chat messages',
      name: 'app_account_my_edit_field_acceptsChatMessages_label',
      desc: '',
      args: [],
    );
  }

  /// `Disable to reject all messages`
  String get app_account_my_edit_field_acceptsChatMessages_description {
    return Intl.message(
      'Disable to reject all messages',
      name: 'app_account_my_edit_field_acceptsChatMessages_description',
      desc: '',
      args: [],
    );
  }

  /// `Allow following move`
  String get app_account_my_edit_field_allowFollowingMove_label {
    return Intl.message(
      'Allow following move',
      name: 'app_account_my_edit_field_allowFollowingMove_label',
      desc: '',
      args: [],
    );
  }

  /// `Automatically follow moved accounts`
  String get app_account_my_edit_field_allowFollowingMove_description {
    return Intl.message(
      'Automatically follow moved accounts',
      name: 'app_account_my_edit_field_allowFollowingMove_description',
      desc: '',
      args: [],
    );
  }

  /// `Hide favourites`
  String get app_account_my_edit_field_hideFavourites_label {
    return Intl.message(
      'Hide favourites',
      name: 'app_account_my_edit_field_hideFavourites_label',
      desc: '',
      args: [],
    );
  }

  /// `Only private access to favourites list`
  String get app_account_my_edit_field_hideFavourites_description {
    return Intl.message(
      'Only private access to favourites list',
      name: 'app_account_my_edit_field_hideFavourites_description',
      desc: '',
      args: [],
    );
  }

  /// `Hide followers`
  String get app_account_my_edit_field_hideFollowers_label {
    return Intl.message(
      'Hide followers',
      name: 'app_account_my_edit_field_hideFollowers_label',
      desc: '',
      args: [],
    );
  }

  /// `Only private access to followers list`
  String get app_account_my_edit_field_hideFollowers_description {
    return Intl.message(
      'Only private access to followers list',
      name: 'app_account_my_edit_field_hideFollowers_description',
      desc: '',
      args: [],
    );
  }

  /// `Hide followers count`
  String get app_account_my_edit_field_hideFollowersCount_label {
    return Intl.message(
      'Hide followers count',
      name: 'app_account_my_edit_field_hideFollowersCount_label',
      desc: '',
      args: [],
    );
  }

  /// `Display '0' as followers count`
  String get app_account_my_edit_field_hideFollowersCount_description {
    return Intl.message(
      'Display \'0\' as followers count',
      name: 'app_account_my_edit_field_hideFollowersCount_description',
      desc: '',
      args: [],
    );
  }

  /// `Hide follows`
  String get app_account_my_edit_field_hideFollows_label {
    return Intl.message(
      'Hide follows',
      name: 'app_account_my_edit_field_hideFollows_label',
      desc: '',
      args: [],
    );
  }

  /// `Only private access to follows list`
  String get app_account_my_edit_field_hideFollows_description {
    return Intl.message(
      'Only private access to follows list',
      name: 'app_account_my_edit_field_hideFollows_description',
      desc: '',
      args: [],
    );
  }

  /// `Hide follows count`
  String get app_account_my_edit_field_hideFollowsCount_label {
    return Intl.message(
      'Hide follows count',
      name: 'app_account_my_edit_field_hideFollowsCount_label',
      desc: '',
      args: [],
    );
  }

  /// `Display '0' as follows count`
  String get app_account_my_edit_field_hideFollowsCount_description {
    return Intl.message(
      'Display \'0\' as follows count',
      name: 'app_account_my_edit_field_hideFollowsCount_description',
      desc: '',
      args: [],
    );
  }

  /// `Ignore rich text`
  String get app_account_my_edit_field_noRichText_label {
    return Intl.message(
      'Ignore rich text',
      name: 'app_account_my_edit_field_noRichText_label',
      desc: '',
      args: [],
    );
  }

  /// `Strip html tags`
  String get app_account_my_edit_field_noRichText_description {
    return Intl.message(
      'Strip html tags',
      name: 'app_account_my_edit_field_noRichText_description',
      desc: '',
      args: [],
    );
  }

  /// `Show role`
  String get app_account_my_edit_field_showRole_label {
    return Intl.message(
      'Show role',
      name: 'app_account_my_edit_field_showRole_label',
      desc: '',
      args: [],
    );
  }

  /// `e.g. Admin, Moderator`
  String get app_account_my_edit_field_showRole_description {
    return Intl.message(
      'e.g. Admin, Moderator',
      name: 'app_account_my_edit_field_showRole_description',
      desc: '',
      args: [],
    );
  }

  /// `Skip thread containment`
  String get app_account_my_edit_field_skipThreadContainment_label {
    return Intl.message(
      'Skip thread containment',
      name: 'app_account_my_edit_field_skipThreadContainment_label',
      desc: '',
      args: [],
    );
  }

  /// `Ignore broken threads`
  String get app_account_my_edit_field_skipThreadContainment_description {
    return Intl.message(
      'Ignore broken threads',
      name: 'app_account_my_edit_field_skipThreadContainment_description',
      desc: '',
      args: [],
    );
  }

  /// `Accept Terms of Service`
  String get app_auth_instance_register_field_acceptTermsOfService_label {
    return Intl.message(
      'Accept Terms of Service',
      name: 'app_auth_instance_register_field_acceptTermsOfService_label',
      desc: '',
      args: [],
    );
  }

  /// `Locale`
  String get app_auth_instance_register_field_locale_label {
    return Intl.message(
      'Locale',
      name: 'app_auth_instance_register_field_locale_label',
      desc: '',
      args: [],
    );
  }

  /// `{domain}`
  String app_auth_instance_register_field_acceptTermsOfService_description(
      Object domain) {
    return Intl.message(
      '$domain',
      name: 'app_auth_instance_register_field_acceptTermsOfService_description',
      desc: '',
      args: [domain],
    );
  }

  /// `Default language for your statuses and confirmation email`
  String get app_auth_instance_register_field_locale_description {
    return Intl.message(
      'Default language for your statuses and confirmation email',
      name: 'app_auth_instance_register_field_locale_description',
      desc: '',
      args: [],
    );
  }

  /// `Should be enabled`
  String get form_field_bool_onlyTrue_error_desc {
    return Intl.message(
      'Should be enabled',
      name: 'form_field_bool_onlyTrue_error_desc',
      desc: '',
      args: [],
    );
  }

  /// `Success registration`
  String
      get app_auth_instance_register_emailConfirmationRequired_notification_title {
    return Intl.message(
      'Success registration',
      name:
          'app_auth_instance_register_emailConfirmationRequired_notification_title',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm email before login`
  String
      get app_auth_instance_register_emailConfirmationRequired_notification_content {
    return Intl.message(
      'Please confirm email before login',
      name:
          'app_auth_instance_register_emailConfirmationRequired_notification_content',
      desc: '',
      args: [],
    );
  }

  /// `Success registration`
  String get app_auth_instance_register_cantLogin_notification_title {
    return Intl.message(
      'Success registration',
      name: 'app_auth_instance_register_cantLogin_notification_title',
      desc: '',
      args: [],
    );
  }

  /// `Error during login: {errorDescription}`
  String app_auth_instance_register_cantLogin_notification_content(
      Object errorDescription) {
    return Intl.message(
      'Error during login: $errorDescription',
      name: 'app_auth_instance_register_cantLogin_notification_content',
      desc: '',
      args: [errorDescription],
    );
  }

  /// `Reason (optional)`
  String get app_auth_instance_register_field_reason_label {
    return Intl.message(
      'Reason (optional)',
      name: 'app_auth_instance_register_field_reason_label',
      desc: '',
      args: [],
    );
  }

  /// `Will be reviewed by moderators`
  String get app_auth_instance_register_field_reason_hint {
    return Intl.message(
      'Will be reviewed by moderators',
      name: 'app_auth_instance_register_field_reason_hint',
      desc: '',
      args: [],
    );
  }

  /// `Selection`
  String get file_picker_selectionFolder_title {
    return Intl.message(
      'Selection',
      name: 'file_picker_selectionFolder_title',
      desc: '',
      args: [],
    );
  }

  /// `Selection count limit reached`
  String get file_picker_multi_selectionCountLimitReached_notification_title {
    return Intl.message(
      'Selection count limit reached',
      name: 'file_picker_multi_selectionCountLimitReached_notification_title',
      desc: '',
      args: [],
    );
  }

  /// `Maximum {selectionCountLimit}`
  String file_picker_multi_selectionCountLimitReached_notification_content(
      Object selectionCountLimit) {
    return Intl.message(
      'Maximum $selectionCountLimit',
      name: 'file_picker_multi_selectionCountLimitReached_notification_content',
      desc: '',
      args: [selectionCountLimit],
    );
  }

  /// `Instance: {instanceDomain}`
  String app_instance_details_title(Object instanceDomain) {
    return Intl.message(
      'Instance: $instanceDomain',
      name: 'app_instance_details_title',
      desc: '',
      args: [instanceDomain],
    );
  }

  /// `Instance: {instanceDomain}`
  String app_account_action_instanceDetails(Object instanceDomain) {
    return Intl.message(
      'Instance: $instanceDomain',
      name: 'app_account_action_instanceDetails',
      desc: '',
      args: [instanceDomain],
    );
  }

  /// `Directory`
  String get app_instance_details_field_directory_label {
    return Intl.message(
      'Directory',
      name: 'app_instance_details_field_directory_label',
      desc: '',
      args: [],
    );
  }

  /// `Accounts`
  String get app_instance_details_field_directory_value {
    return Intl.message(
      'Accounts',
      name: 'app_instance_details_field_directory_value',
      desc: '',
      args: [],
    );
  }

  /// `Trends`
  String get app_instance_details_field_trends_label {
    return Intl.message(
      'Trends',
      name: 'app_instance_details_field_trends_label',
      desc: '',
      args: [],
    );
  }

  /// `Hashtags`
  String get app_instance_details_field_trends_value {
    return Intl.message(
      'Hashtags',
      name: 'app_instance_details_field_trends_value',
      desc: '',
      args: [],
    );
  }

  /// `Public timeline`
  String get app_instance_details_field_publicTimeline_label {
    return Intl.message(
      'Public timeline',
      name: 'app_instance_details_field_publicTimeline_label',
      desc: '',
      args: [],
    );
  }

  /// `Statuses`
  String get app_instance_details_field_publicTimeline_value {
    return Intl.message(
      'Statuses',
      name: 'app_instance_details_field_publicTimeline_value',
      desc: '',
      args: [],
    );
  }

  /// `Activity`
  String get app_instance_details_field_activity_label {
    return Intl.message(
      'Activity',
      name: 'app_instance_details_field_activity_label',
      desc: '',
      args: [],
    );
  }

  /// `Statistic`
  String get app_instance_details_field_activity_value {
    return Intl.message(
      'Statistic',
      name: 'app_instance_details_field_activity_value',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get app_instance_details_field_email_label {
    return Intl.message(
      'Email',
      name: 'app_instance_details_field_email_label',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get app_instance_details_field_version_label {
    return Intl.message(
      'Version',
      name: 'app_instance_details_field_version_label',
      desc: '',
      args: [],
    );
  }

  /// `Statistic`
  String get app_instance_details_field_stats_title {
    return Intl.message(
      'Statistic',
      name: 'app_instance_details_field_stats_title',
      desc: '',
      args: [],
    );
  }

  /// `Federation domains`
  String get app_instance_details_field_stats_domainCount_label {
    return Intl.message(
      'Federation domains',
      name: 'app_instance_details_field_stats_domainCount_label',
      desc: '',
      args: [],
    );
  }

  /// `Statuses`
  String get app_instance_details_field_stats_statusCount_label {
    return Intl.message(
      'Statuses',
      name: 'app_instance_details_field_stats_statusCount_label',
      desc: '',
      args: [],
    );
  }

  /// `Users`
  String get app_instance_details_field_stats_userCount_label {
    return Intl.message(
      'Users',
      name: 'app_instance_details_field_stats_userCount_label',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get app_instance_details_field_languages_label {
    return Intl.message(
      'Languages',
      name: 'app_instance_details_field_languages_label',
      desc: '',
      args: [],
    );
  }

  /// `Registrations enabled`
  String get app_instance_details_field_registrations_label {
    return Intl.message(
      'Registrations enabled',
      name: 'app_instance_details_field_registrations_label',
      desc: '',
      args: [],
    );
  }

  /// `Approval required`
  String get app_instance_details_field_approvalRequired_label {
    return Intl.message(
      'Approval required',
      name: 'app_instance_details_field_approvalRequired_label',
      desc: '',
      args: [],
    );
  }

  /// `Invites Enabled`
  String get app_instance_details_field_invitesEnabled_label {
    return Intl.message(
      'Invites Enabled',
      name: 'app_instance_details_field_invitesEnabled_label',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get app_instance_details_field_contactAccount_label {
    return Intl.message(
      'Contact',
      name: 'app_instance_details_field_contactAccount_label',
      desc: '',
      args: [],
    );
  }

  /// `Max status length`
  String get app_instance_details_field_maxTootChars_label {
    return Intl.message(
      'Max status length',
      name: 'app_instance_details_field_maxTootChars_label',
      desc: '',
      args: [],
    );
  }

  /// `Max chat message length`
  String get app_instance_details_field_chatLimit_label {
    return Intl.message(
      'Max chat message length',
      name: 'app_instance_details_field_chatLimit_label',
      desc: '',
      args: [],
    );
  }

  /// `Max media description length`
  String get app_instance_details_field_imageDescriptionLimit_label {
    return Intl.message(
      'Max media description length',
      name: 'app_instance_details_field_imageDescriptionLimit_label',
      desc: '',
      args: [],
    );
  }

  /// `Poll limits`
  String get app_instance_details_field_pollLimit_title {
    return Intl.message(
      'Poll limits',
      name: 'app_instance_details_field_pollLimit_title',
      desc: '',
      args: [],
    );
  }

  /// `Min expiration`
  String get app_instance_details_field_pollLimit_minExpiration_label {
    return Intl.message(
      'Min expiration',
      name: 'app_instance_details_field_pollLimit_minExpiration_label',
      desc: '',
      args: [],
    );
  }

  /// `Max expiration`
  String get app_instance_details_field_pollLimit_maxExpiration_label {
    return Intl.message(
      'Max expiration',
      name: 'app_instance_details_field_pollLimit_maxExpiration_label',
      desc: '',
      args: [],
    );
  }

  /// `Max options length`
  String get app_instance_details_field_pollLimit_maxOptionsChars_label {
    return Intl.message(
      'Max options length',
      name: 'app_instance_details_field_pollLimit_maxOptionsChars_label',
      desc: '',
      args: [],
    );
  }

  /// `Max options count`
  String get app_instance_details_field_pollLimit_maxOptions_label {
    return Intl.message(
      'Max options count',
      name: 'app_instance_details_field_pollLimit_maxOptions_label',
      desc: '',
      args: [],
    );
  }

  /// `Upload media limit`
  String get app_instance_details_field_uploadMedia_label {
    return Intl.message(
      'Upload media limit',
      name: 'app_instance_details_field_uploadMedia_label',
      desc: '',
      args: [],
    );
  }

  /// `Upload avatar limit`
  String get app_instance_details_field_uploadAvatar_label {
    return Intl.message(
      'Upload avatar limit',
      name: 'app_instance_details_field_uploadAvatar_label',
      desc: '',
      args: [],
    );
  }

  /// `Upload banner limit`
  String get app_instance_details_field_uploadBanner_label {
    return Intl.message(
      'Upload banner limit',
      name: 'app_instance_details_field_uploadBanner_label',
      desc: '',
      args: [],
    );
  }

  /// `Upload background limit`
  String get app_instance_details_field_uploadBackground_label {
    return Intl.message(
      'Upload background limit',
      name: 'app_instance_details_field_uploadBackground_label',
      desc: '',
      args: [],
    );
  }

  /// `Vapid public key`
  String get app_instance_details_field_vapidPublicKey_label {
    return Intl.message(
      'Vapid public key',
      name: 'app_instance_details_field_vapidPublicKey_label',
      desc: '',
      args: [],
    );
  }

  /// `Features`
  String get app_instance_details_field_metadata_features_label {
    return Intl.message(
      'Features',
      name: 'app_instance_details_field_metadata_features_label',
      desc: '',
      args: [],
    );
  }

  /// `Fields limit`
  String get app_instance_details_field_metadata_fields_title {
    return Intl.message(
      'Fields limit',
      name: 'app_instance_details_field_metadata_fields_title',
      desc: '',
      args: [],
    );
  }

  /// `Max fields count`
  String get app_instance_details_field_metadata_fields_maxFields_label {
    return Intl.message(
      'Max fields count',
      name: 'app_instance_details_field_metadata_fields_maxFields_label',
      desc: '',
      args: [],
    );
  }

  /// `Max remote fields count`
  String get app_instance_details_field_metadata_fields_maxRemoteFields_label {
    return Intl.message(
      'Max remote fields count',
      name: 'app_instance_details_field_metadata_fields_maxRemoteFields_label',
      desc: '',
      args: [],
    );
  }

  /// `Max name length`
  String get app_instance_details_field_metadata_fields_nameLength_label {
    return Intl.message(
      'Max name length',
      name: 'app_instance_details_field_metadata_fields_nameLength_label',
      desc: '',
      args: [],
    );
  }

  /// `Max value length`
  String get app_instance_details_field_metadata_fields_valueLength_label {
    return Intl.message(
      'Max value length',
      name: 'app_instance_details_field_metadata_fields_valueLength_label',
      desc: '',
      args: [],
    );
  }

  /// `True`
  String get app_instance_details_value_bool_true {
    return Intl.message(
      'True',
      name: 'app_instance_details_value_bool_true',
      desc: '',
      args: [],
    );
  }

  /// `False`
  String get app_instance_details_value_bool_false {
    return Intl.message(
      'False',
      name: 'app_instance_details_value_bool_false',
      desc: '',
      args: [],
    );
  }

  /// `Mastodon`
  String
      get app_instance_details_field_metadata_fields_versionType_value_mastodon {
    return Intl.message(
      'Mastodon',
      name:
          'app_instance_details_field_metadata_fields_versionType_value_mastodon',
      desc: '',
      args: [],
    );
  }

  /// `Pleroma`
  String
      get app_instance_details_field_metadata_fields_versionType_value_pleroma {
    return Intl.message(
      'Pleroma',
      name:
          'app_instance_details_field_metadata_fields_versionType_value_pleroma',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String
      get app_instance_details_field_metadata_fields_versionType_value_unknown {
    return Intl.message(
      'Unknown',
      name:
          'app_instance_details_field_metadata_fields_versionType_value_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Post formats`
  String get app_instance_details_field_metadata_fields_postFormats_label {
    return Intl.message(
      'Post formats',
      name: 'app_instance_details_field_metadata_fields_postFormats_label',
      desc: '',
      args: [],
    );
  }

  /// `Registration limits`
  String get app_instance_details_field_registrationsLimits_title {
    return Intl.message(
      'Registration limits',
      name: 'app_instance_details_field_registrationsLimits_title',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get app_instance_details_field_details_title {
    return Intl.message(
      'Details',
      name: 'app_instance_details_field_details_title',
      desc: '',
      args: [],
    );
  }

  /// `Upload limits`
  String get app_instance_details_field_uploadLimits_title {
    return Intl.message(
      'Upload limits',
      name: 'app_instance_details_field_uploadLimits_title',
      desc: '',
      args: [],
    );
  }

  /// `Messages limits`
  String get app_instance_details_field_messagesLimits_title {
    return Intl.message(
      'Messages limits',
      name: 'app_instance_details_field_messagesLimits_title',
      desc: '',
      args: [],
    );
  }

  /// `Metadata`
  String get app_instance_details_field_metadata_title {
    return Intl.message(
      'Metadata',
      name: 'app_instance_details_field_metadata_title',
      desc: '',
      args: [],
    );
  }

  /// `Federation`
  String get app_instance_details_field_federation_title {
    return Intl.message(
      'Federation',
      name: 'app_instance_details_field_federation_title',
      desc: '',
      args: [],
    );
  }

  /// `Enabled`
  String get app_instance_details_field_federation_enabled_label {
    return Intl.message(
      'Enabled',
      name: 'app_instance_details_field_federation_enabled_label',
      desc: '',
      args: [],
    );
  }

  /// `Exclusions`
  String get app_instance_details_field_federation_exclusions_label {
    return Intl.message(
      'Exclusions',
      name: 'app_instance_details_field_federation_exclusions_label',
      desc: '',
      args: [],
    );
  }

  /// `MFR Policies`
  String get app_instance_details_field_federation_mrfPolicies_label {
    return Intl.message(
      'MFR Policies',
      name: 'app_instance_details_field_federation_mrfPolicies_label',
      desc: '',
      args: [],
    );
  }

  /// `Quarantined Instances`
  String get app_instance_details_field_federation_quarantinedInstances_label {
    return Intl.message(
      'Quarantined Instances',
      name: 'app_instance_details_field_federation_quarantinedInstances_label',
      desc: '',
      args: [],
    );
  }

  /// `MFR Object Age Threshold`
  String
      get app_instance_details_field_federation_mrfObjectAge_threshold_label {
    return Intl.message(
      'MFR Object Age Threshold',
      name:
          'app_instance_details_field_federation_mrfObjectAge_threshold_label',
      desc: '',
      args: [],
    );
  }

  /// `MFR Object Age Actions`
  String get app_instance_details_field_federation_mrfObjectAge_actions_label {
    return Intl.message(
      'MFR Object Age Actions',
      name: 'app_instance_details_field_federation_mrfObjectAge_actions_label',
      desc: '',
      args: [],
    );
  }

  /// `{sizeInMb} MB`
  String app_instance_details_value_sizeInMb(Object sizeInMb) {
    return Intl.message(
      '$sizeInMb MB',
      name: 'app_instance_details_value_sizeInMb',
      desc: '',
      args: [sizeInMb],
    );
  }

  /// `Open on {remoteInstanceDomain}`
  String app_account_action_openOnRemoteInstance(Object remoteInstanceDomain) {
    return Intl.message(
      'Open on $remoteInstanceDomain',
      name: 'app_account_action_openOnRemoteInstance',
      desc: '',
      args: [remoteInstanceDomain],
    );
  }

  /// `Open on {remoteInstanceDomain}`
  String app_status_action_openOnRemoteInstance(Object remoteInstanceDomain) {
    return Intl.message(
      'Open on $remoteInstanceDomain',
      name: 'app_status_action_openOnRemoteInstance',
      desc: '',
      args: [remoteInstanceDomain],
    );
  }

  /// `Failed to load data from remote host`
  String get app_instance_remote_error_failed_dialog_title {
    return Intl.message(
      'Failed to load data from remote host',
      name: 'app_instance_remote_error_failed_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Remote host don't support this feature or network error`
  String get app_instance_remote_error_failed_dialog_content {
    return Intl.message(
      'Remote host don\'t support this feature or network error',
      name: 'app_instance_remote_error_failed_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Poll body shouldn't be empty`
  String get app_status_post_error_pollBodyIsEmpty_desc {
    return Intl.message(
      'Poll body shouldn\'t be empty',
      name: 'app_status_post_error_pollBodyIsEmpty_desc',
      desc: '',
      args: [],
    );
  }

  /// `Copied in clipboard`
  String get app_chat_selection_action_copyAsRawText_toast_success {
    return Intl.message(
      'Copied in clipboard',
      name: 'app_chat_selection_action_copyAsRawText_toast_success',
      desc: '',
      args: [],
    );
  }

  /// `Delete messages`
  String get app_chat_selection_action_delete_confirm_dialog_title {
    return Intl.message(
      'Delete messages',
      name: 'app_chat_selection_action_delete_confirm_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get app_chat_selection_action_delete_confirm_dialog_content {
    return Intl.message(
      'Are you sure?',
      name: 'app_chat_selection_action_delete_confirm_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get app_chat_selection_action_delete_confirm_dialog_action_delete {
    return Intl.message(
      'Delete',
      name: 'app_chat_selection_action_delete_confirm_dialog_action_delete',
      desc: '',
      args: [],
    );
  }

  /// `Share as new status`
  String get app_share_action_shareToNewStatus {
    return Intl.message(
      'Share as new status',
      name: 'app_share_action_shareToNewStatus',
      desc: '',
      args: [],
    );
  }

  /// `Selected ({count})`
  String app_chat_selection_count(Object count) {
    return Intl.message(
      'Selected ($count)',
      name: 'app_chat_selection_count',
      desc: '',
      args: [count],
    );
  }

  /// `Local`
  String get app_status_post_visibility_state_local {
    return Intl.message(
      'Local',
      name: 'app_status_post_visibility_state_local',
      desc: '',
      args: [],
    );
  }

  /// `Expire at`
  String get app_status_expire_datetime_picker_title {
    return Intl.message(
      'Expire at',
      name: 'app_status_expire_datetime_picker_title',
      desc: '',
      args: [],
    );
  }

  /// `unifedi.com`
  String get app_timeline_settings_onlyFromInstance_field_hint {
    return Intl.message(
      'unifedi.com',
      name: 'app_timeline_settings_onlyFromInstance_field_hint',
      desc: '',
      args: [],
    );
  }

  /// `Only from instance`
  String get app_timeline_settings_onlyFromInstance_field_label {
    return Intl.message(
      'Only from instance',
      name: 'app_timeline_settings_onlyFromInstance_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Exclude visibilities`
  String get app_timeline_settings_field_excludeVisibilities_label {
    return Intl.message(
      'Exclude visibilities',
      name: 'app_timeline_settings_field_excludeVisibilities_label',
      desc: '',
      args: [],
    );
  }

  /// `Mute`
  String get app_account_mute_dialog_action_mute {
    return Intl.message(
      'Mute',
      name: 'app_account_mute_dialog_action_mute',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get app_account_mute_dialog_field_notifications_label {
    return Intl.message(
      'Notifications',
      name: 'app_account_mute_dialog_field_notifications_label',
      desc: '',
      args: [],
    );
  }

  /// `Expire`
  String get app_account_mute_dialog_field_expire_label {
    return Intl.message(
      'Expire',
      name: 'app_account_mute_dialog_field_expire_label',
      desc: '',
      args: [],
    );
  }

  /// `Additionally mute notifications`
  String get app_account_mute_dialog_field_notifications_description {
    return Intl.message(
      'Additionally mute notifications',
      name: 'app_account_mute_dialog_field_notifications_description',
      desc: '',
      args: [],
    );
  }

  /// `Muting conversation`
  String get app_status_mute_dialog_title {
    return Intl.message(
      'Muting conversation',
      name: 'app_status_mute_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Mute`
  String get app_status_mute_dialog_action_mute {
    return Intl.message(
      'Mute',
      name: 'app_status_mute_dialog_action_mute',
      desc: '',
      args: [],
    );
  }

  /// `Expire`
  String get app_status_mute_dialog_field_expire_label {
    return Intl.message(
      'Expire',
      name: 'app_status_mute_dialog_field_expire_label',
      desc: '',
      args: [],
    );
  }

  /// `Delete actions`
  String get app_status_delete_dialog_title {
    return Intl.message(
      'Delete actions',
      name: 'app_status_delete_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get app_status_delete_dialog_action_delete {
    return Intl.message(
      'Delete',
      name: 'app_status_delete_dialog_action_delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete and save to drafts`
  String get app_status_delete_dialog_action_deleteAndSaveToDrafts {
    return Intl.message(
      'Delete and save to drafts',
      name: 'app_status_delete_dialog_action_deleteAndSaveToDrafts',
      desc: '',
      args: [],
    );
  }

  /// `Delete and start new status`
  String get app_status_delete_dialog_action_deleteAndStartNew {
    return Intl.message(
      'Delete and start new status',
      name: 'app_status_delete_dialog_action_deleteAndStartNew',
      desc: '',
      args: [],
    );
  }

  /// `Choose media files`
  String get file_picker_multi_title {
    return Intl.message(
      'Choose media files',
      name: 'file_picker_multi_title',
      desc: '',
      args: [],
    );
  }

  /// `{selectionCount} media selected`
  String file_picker_multi_selectionCount_selected(Object selectionCount) {
    return Intl.message(
      '$selectionCount media selected',
      name: 'file_picker_multi_selectionCount_selected',
      desc: '',
      args: [selectionCount],
    );
  }

  /// `User disabled chat feature`
  String get app_chat_unifedi_account_notAcceptsChatMessages_toast {
    return Intl.message(
      'User disabled chat feature',
      name: 'app_chat_unifedi_account_notAcceptsChatMessages_toast',
      desc: '',
      args: [],
    );
  }

  /// `Pending message`
  String get app_chat_message_pending_actions_dialog_title {
    return Intl.message(
      'Pending message',
      name: 'app_chat_message_pending_actions_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Delete message`
  String get app_chat_message_pending_actions_dialog_action_delete {
    return Intl.message(
      'Delete message',
      name: 'app_chat_message_pending_actions_dialog_action_delete',
      desc: '',
      args: [],
    );
  }

  /// `Send again`
  String get app_chat_message_pending_actions_dialog_action_resend {
    return Intl.message(
      'Send again',
      name: 'app_chat_message_pending_actions_dialog_action_resend',
      desc: '',
      args: [],
    );
  }

  /// `Message deleted`
  String get app_chat_message_deleted_desc {
    return Intl.message(
      'Message deleted',
      name: 'app_chat_message_deleted_desc',
      desc: '',
      args: [],
    );
  }

  /// `Delete conversation`
  String get app_chat_action_delete_dialog_title {
    return Intl.message(
      'Delete conversation',
      name: 'app_chat_action_delete_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get app_chat_action_delete_dialog_content {
    return Intl.message(
      'Are you sure?',
      name: 'app_chat_action_delete_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `#{hashtag}`
  String app_hashtag_remoteInstance_dialog_title(Object hashtag) {
    return Intl.message(
      '#$hashtag',
      name: 'app_hashtag_remoteInstance_dialog_title',
      desc: '',
      args: [hashtag],
    );
  }

  /// `Open on {localDomain}`
  String app_hashtag_remoteInstance_dialog_action_openOnLocal(
      Object localDomain) {
    return Intl.message(
      'Open on $localDomain',
      name: 'app_hashtag_remoteInstance_dialog_action_openOnLocal',
      desc: '',
      args: [localDomain],
    );
  }

  /// `Open on {remoteDomain}`
  String app_hashtag_remoteInstance_dialog_action_openOnRemote(
      Object remoteDomain) {
    return Intl.message(
      'Open on $remoteDomain',
      name: 'app_hashtag_remoteInstance_dialog_action_openOnRemote',
      desc: '',
      args: [remoteDomain],
    );
  }

  /// `Report from {acct}`
  String app_notification_header_report(Object acct) {
    return Intl.message(
      'Report from $acct',
      name: 'app_notification_header_report',
      desc: '',
      args: [acct],
    );
  }

  /// `Notifications`
  String get app_notification_all_dialog_title {
    return Intl.message(
      'Notifications',
      name: 'app_notification_all_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Push notifications settings`
  String get app_notification_all_dialog_action_pushNotifications {
    return Intl.message(
      'Push notifications settings',
      name: 'app_notification_all_dialog_action_pushNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Mark ALL as read`
  String get app_notification_all_dialog_action_markAllAsRead {
    return Intl.message(
      'Mark ALL as read',
      name: 'app_notification_all_dialog_action_markAllAsRead',
      desc: '',
      args: [],
    );
  }

  /// `Dismiss ALL`
  String get app_notification_all_dialog_action_dismissAll {
    return Intl.message(
      'Dismiss ALL',
      name: 'app_notification_all_dialog_action_dismissAll',
      desc: '',
      args: [],
    );
  }

  /// `10000`
  String get app_cache_files_settings_sizeLimit_value_size10000 {
    return Intl.message(
      '10000',
      name: 'app_cache_files_settings_sizeLimit_value_size10000',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get app_datetime_picker_action_delete {
    return Intl.message(
      'Delete',
      name: 'app_datetime_picker_action_delete',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get app_duration_picker_action_done {
    return Intl.message(
      'Done',
      name: 'app_duration_picker_action_done',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get app_duration_picker_action_cancel {
    return Intl.message(
      'Cancel',
      name: 'app_duration_picker_action_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get app_datetime_picker_action_done {
    return Intl.message(
      'Done',
      name: 'app_datetime_picker_action_done',
      desc: '',
      args: [],
    );
  }

  /// `Clear date`
  String get app_account_mute_dialog_action_clearDate {
    return Intl.message(
      'Clear date',
      name: 'app_account_mute_dialog_action_clearDate',
      desc: '',
      args: [],
    );
  }

  /// `Clear date`
  String get app_status_mute_dialog_action_clearDate {
    return Intl.message(
      'Clear date',
      name: 'app_status_mute_dialog_action_clearDate',
      desc: '',
      args: [],
    );
  }

  /// `Message pending.`
  String get app_chat_message_pending_desc {
    return Intl.message(
      'Message pending.',
      name: 'app_chat_message_pending_desc',
      desc: '',
      args: [],
    );
  }

  /// `Message failed to send.`
  String get app_chat_message_pending_failed_desc {
    return Intl.message(
      'Message failed to send.',
      name: 'app_chat_message_pending_failed_desc',
      desc: '',
      args: [],
    );
  }

  /// `Tap to view options.`
  String get app_chat_message_pending_tapToViewOptions {
    return Intl.message(
      'Tap to view options.',
      name: 'app_chat_message_pending_tapToViewOptions',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get app_chat_action_delete {
    return Intl.message(
      'Delete',
      name: 'app_chat_action_delete',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get app_chat_selection_action_cancel {
    return Intl.message(
      'Cancel',
      name: 'app_chat_selection_action_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Never`
  String get app_toast_handling_type_never {
    return Intl.message(
      'Never',
      name: 'app_toast_handling_type_never',
      desc: '',
      args: [],
    );
  }

  /// `Instance announcements`
  String get app_instance_announcement_list_title {
    return Intl.message(
      'Instance announcements',
      name: 'app_instance_announcement_list_title',
      desc: '',
      args: [],
    );
  }

  /// `Instance doesn't have active announcements.`
  String get app_instance_announcement_list_empty {
    return Intl.message(
      'Instance doesn\'t have active announcements.',
      name: 'app_instance_announcement_list_empty',
      desc: '',
      args: [],
    );
  }

  /// `Announcements settings`
  String get app_instance_announcement_settings_title {
    return Intl.message(
      'Announcements settings',
      name: 'app_instance_announcement_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `Show already read`
  String get app_instance_announcement_settings_field_withDismissed_label {
    return Intl.message(
      'Show already read',
      name: 'app_instance_announcement_settings_field_withDismissed_label',
      desc: '',
      args: [],
    );
  }

  /// `Accounts`
  String get app_hashtag_history_accounts {
    return Intl.message(
      'Accounts',
      name: 'app_hashtag_history_accounts',
      desc: '',
      args: [],
    );
  }

  /// `Statuses`
  String get app_hashtag_history_statuses {
    return Intl.message(
      'Statuses',
      name: 'app_hashtag_history_statuses',
      desc: '',
      args: [],
    );
  }

  /// `Featured tags`
  String get app_account_my_action_featuredTags {
    return Intl.message(
      'Featured tags',
      name: 'app_account_my_action_featuredTags',
      desc: '',
      args: [],
    );
  }

  /// `Featured tags`
  String get app_account_my_featuredTags_title {
    return Intl.message(
      'Featured tags',
      name: 'app_account_my_featuredTags_title',
      desc: '',
      args: [],
    );
  }

  /// `Suggestions`
  String get app_account_my_featuredTags_action_suggestions {
    return Intl.message(
      'Suggestions',
      name: 'app_account_my_featuredTags_action_suggestions',
      desc: '',
      args: [],
    );
  }

  /// `Suggestions`
  String get app_account_my_featuredTags_suggestions_title {
    return Intl.message(
      'Suggestions',
      name: 'app_account_my_featuredTags_suggestions_title',
      desc: '',
      args: [],
    );
  }

  /// `Statuses`
  String get app_account_my_featuredTags_metadata_statusesCount {
    return Intl.message(
      'Statuses',
      name: 'app_account_my_featuredTags_metadata_statusesCount',
      desc: '',
      args: [],
    );
  }

  /// `Last`
  String get app_account_my_featuredTags_metadata_lastStatusAt {
    return Intl.message(
      'Last',
      name: 'app_account_my_featuredTags_metadata_lastStatusAt',
      desc: '',
      args: [],
    );
  }

  /// `Unfeature`
  String get app_account_my_featuredTags_action_unfeature {
    return Intl.message(
      'Unfeature',
      name: 'app_account_my_featuredTags_action_unfeature',
      desc: '',
      args: [],
    );
  }

  /// `Feature`
  String get app_account_my_featuredTags_action_feature {
    return Intl.message(
      'Feature',
      name: 'app_account_my_featuredTags_action_feature',
      desc: '',
      args: [],
    );
  }

  /// `Endorsements`
  String get app_account_my_action_endorsement {
    return Intl.message(
      'Endorsements',
      name: 'app_account_my_action_endorsement',
      desc: '',
      args: [],
    );
  }

  /// `Endorsements`
  String get app_account_my_endorsement_title {
    return Intl.message(
      'Endorsements',
      name: 'app_account_my_endorsement_title',
      desc: '',
      args: [],
    );
  }

  /// `Suggestions`
  String get app_account_my_action_suggestion {
    return Intl.message(
      'Suggestions',
      name: 'app_account_my_action_suggestion',
      desc: '',
      args: [],
    );
  }

  /// `Suggestions`
  String get app_account_my_suggestion_title {
    return Intl.message(
      'Suggestions',
      name: 'app_account_my_suggestion_title',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get app_account_my_suggestion_action_remove {
    return Intl.message(
      'Remove',
      name: 'app_account_my_suggestion_action_remove',
      desc: '',
      args: [],
    );
  }

  /// `Statuses`
  String get app_instance_activity_statuses {
    return Intl.message(
      'Statuses',
      name: 'app_instance_activity_statuses',
      desc: '',
      args: [],
    );
  }

  /// `Logins`
  String get app_instance_activity_logins {
    return Intl.message(
      'Logins',
      name: 'app_instance_activity_logins',
      desc: '',
      args: [],
    );
  }

  /// `Registrations`
  String get app_instance_activity_registrations {
    return Intl.message(
      'Registrations',
      name: 'app_instance_activity_registrations',
      desc: '',
      args: [],
    );
  }

  /// `Choose share action`
  String get app_share_income_action_choose_title {
    return Intl.message(
      'Choose share action',
      name: 'app_share_income_action_choose_title',
      desc: '',
      args: [],
    );
  }

  /// `As new status`
  String get app_share_income_action_type_status {
    return Intl.message(
      'As new status',
      name: 'app_share_income_action_type_status',
      desc: '',
      args: [],
    );
  }

  /// `To conversation`
  String get app_share_income_action_type_conversation {
    return Intl.message(
      'To conversation',
      name: 'app_share_income_action_type_conversation',
      desc: '',
      args: [],
    );
  }

  /// `To chat`
  String get app_share_income_action_type_chat {
    return Intl.message(
      'To chat',
      name: 'app_share_income_action_type_chat',
      desc: '',
      args: [],
    );
  }

  /// `Choose instance to share`
  String get app_share_income_instance_choose_title {
    return Intl.message(
      'Choose instance to share',
      name: 'app_share_income_instance_choose_title',
      desc: '',
      args: [],
    );
  }

  /// `You don't have logged instances to share`
  String get app_share_income_error_authInstanceListIsEmpty {
    return Intl.message(
      'You don\'t have logged instances to share',
      name: 'app_share_income_error_authInstanceListIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Push notifications support disabled`
  String get app_push_disabled_notification_title {
    return Intl.message(
      'Push notifications support disabled',
      name: 'app_push_disabled_notification_title',
      desc: '',
      args: [],
    );
  }

  /// `Install app version from store or enable support in config if app was built from source`
  String get app_push_disabled_notification_content {
    return Intl.message(
      'Install app version from store or enable support in config if app was built from source',
      name: 'app_push_disabled_notification_content',
      desc: '',
      args: [],
    );
  }

  /// `Crash reporting`
  String get app_crashReporting_settings_title {
    return Intl.message(
      'Crash reporting',
      name: 'app_crashReporting_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `Send reports`
  String get app_crashReporting_settings_field_reportingEnabled_name {
    return Intl.message(
      'Send reports',
      name: 'app_crashReporting_settings_field_reportingEnabled_name',
      desc: '',
      args: [],
    );
  }

  /// `Crash reporting`
  String get app_crashReporting_ask_dialog_title {
    return Intl.message(
      'Crash reporting',
      name: 'app_crashReporting_ask_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to enable crash reporting?\n It will help us make app more stable\n You can change this option in settings later`
  String get app_crashReporting_ask_dialog_content {
    return Intl.message(
      'Do you want to enable crash reporting?\n It will help us make app more stable\n You can change this option in settings later',
      name: 'app_crashReporting_ask_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Append from account`
  String get app_share_entity_settings_field_appendFromAccount_label {
    return Intl.message(
      'Append from account',
      name: 'app_share_entity_settings_field_appendFromAccount_label',
      desc: '',
      args: [],
    );
  }

  /// `With created date`
  String get app_share_entity_settings_field_withCreatedAt_label {
    return Intl.message(
      'With created date',
      name: 'app_share_entity_settings_field_withCreatedAt_label',
      desc: '',
      args: [],
    );
  }

  /// `With media`
  String get app_share_entity_settings_field_withMedia_label {
    return Intl.message(
      'With media',
      name: 'app_share_entity_settings_field_withMedia_label',
      desc: '',
      args: [],
    );
  }

  /// `With text`
  String get app_share_entity_settings_field_withText_label {
    return Intl.message(
      'With text',
      name: 'app_share_entity_settings_field_withText_label',
      desc: '',
      args: [],
    );
  }

  /// `With link to original`
  String get app_share_entity_settings_field_withLink_label {
    return Intl.message(
      'With link to original',
      name: 'app_share_entity_settings_field_withLink_label',
      desc: '',
      args: [],
    );
  }

  /// `Whole as link`
  String get app_share_entity_settings_field_wholeAsLink_label {
    return Intl.message(
      'Whole as link',
      name: 'app_share_entity_settings_field_wholeAsLink_label',
      desc: '',
      args: [],
    );
  }

  /// `Media as link`
  String get app_share_entity_settings_field_mediaAsLink_label {
    return Intl.message(
      'Media as link',
      name: 'app_share_entity_settings_field_mediaAsLink_label',
      desc: '',
      args: [],
    );
  }

  /// `With message`
  String get app_share_entity_settings_field_withMessage_hint {
    return Intl.message(
      'With message',
      name: 'app_share_entity_settings_field_withMessage_hint',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get app_push_channel_follow_name {
    return Intl.message(
      'Follow',
      name: 'app_push_channel_follow_name',
      desc: '',
      args: [],
    );
  }

  /// `When people follow you`
  String get app_push_channel_follow_description {
    return Intl.message(
      'When people follow you',
      name: 'app_push_channel_follow_description',
      desc: '',
      args: [],
    );
  }

  /// `{acct} followed you`
  String app_push_richNotification_follow_title(Object acct) {
    return Intl.message(
      '$acct followed you',
      name: 'app_push_richNotification_follow_title',
      desc: '',
      args: [acct],
    );
  }

  /// `Someone followed you`
  String get app_push_richNotification_follow_summary {
    return Intl.message(
      'Someone followed you',
      name: 'app_push_richNotification_follow_summary',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get app_push_channel_favourite_name {
    return Intl.message(
      'Favourite',
      name: 'app_push_channel_favourite_name',
      desc: '',
      args: [],
    );
  }

  /// `When people favourite your statuses`
  String get app_push_channel_favourite_description {
    return Intl.message(
      'When people favourite your statuses',
      name: 'app_push_channel_favourite_description',
      desc: '',
      args: [],
    );
  }

  /// `{acct} favourited your status`
  String app_push_richNotification_favourite_title(Object acct) {
    return Intl.message(
      '$acct favourited your status',
      name: 'app_push_richNotification_favourite_title',
      desc: '',
      args: [acct],
    );
  }

  /// `Someone favourited your status`
  String get app_push_richNotification_favourite_summary {
    return Intl.message(
      'Someone favourited your status',
      name: 'app_push_richNotification_favourite_summary',
      desc: '',
      args: [],
    );
  }

  /// `Share(reblog)`
  String get app_push_channel_reblog_name {
    return Intl.message(
      'Share(reblog)',
      name: 'app_push_channel_reblog_name',
      desc: '',
      args: [],
    );
  }

  /// `When people share your statuses`
  String get app_push_channel_reblog_description {
    return Intl.message(
      'When people share your statuses',
      name: 'app_push_channel_reblog_description',
      desc: '',
      args: [],
    );
  }

  /// `{acct} shared your status`
  String app_push_richNotification_reblog_title(Object acct) {
    return Intl.message(
      '$acct shared your status',
      name: 'app_push_richNotification_reblog_title',
      desc: '',
      args: [acct],
    );
  }

  /// `Someone shared your status`
  String get app_push_richNotification_reblog_summary {
    return Intl.message(
      'Someone shared your status',
      name: 'app_push_richNotification_reblog_summary',
      desc: '',
      args: [],
    );
  }

  /// `Mention`
  String get app_push_channel_mention_name {
    return Intl.message(
      'Mention',
      name: 'app_push_channel_mention_name',
      desc: '',
      args: [],
    );
  }

  /// `When people mention you in status or conversation`
  String get app_push_channel_mention_description {
    return Intl.message(
      'When people mention you in status or conversation',
      name: 'app_push_channel_mention_description',
      desc: '',
      args: [],
    );
  }

  /// `{acct} mentioned you`
  String app_push_richNotification_mention_title(Object acct) {
    return Intl.message(
      '$acct mentioned you',
      name: 'app_push_richNotification_mention_title',
      desc: '',
      args: [acct],
    );
  }

  /// `Someone mentioned you`
  String get app_push_richNotification_mention_summary {
    return Intl.message(
      'Someone mentioned you',
      name: 'app_push_richNotification_mention_summary',
      desc: '',
      args: [],
    );
  }

  /// `Poll`
  String get app_push_channel_poll_name {
    return Intl.message(
      'Poll',
      name: 'app_push_channel_poll_name',
      desc: '',
      args: [],
    );
  }

  /// `Poll-related notifications`
  String get app_push_channel_poll_description {
    return Intl.message(
      'Poll-related notifications',
      name: 'app_push_channel_poll_description',
      desc: '',
      args: [],
    );
  }

  /// `Poll changed`
  String get app_push_richNotification_poll_title {
    return Intl.message(
      'Poll changed',
      name: 'app_push_richNotification_poll_title',
      desc: '',
      args: [],
    );
  }

  /// `Poll changed`
  String get app_push_richNotification_poll_summary {
    return Intl.message(
      'Poll changed',
      name: 'app_push_richNotification_poll_summary',
      desc: '',
      args: [],
    );
  }

  /// `Move`
  String get app_push_channel_move_name {
    return Intl.message(
      'Move',
      name: 'app_push_channel_move_name',
      desc: '',
      args: [],
    );
  }

  /// `When someone moved`
  String get app_push_channel_move_description {
    return Intl.message(
      'When someone moved',
      name: 'app_push_channel_move_description',
      desc: '',
      args: [],
    );
  }

  /// `{acct} moved`
  String app_push_richNotification_move_title(Object acct) {
    return Intl.message(
      '$acct moved',
      name: 'app_push_richNotification_move_title',
      desc: '',
      args: [acct],
    );
  }

  /// `Someone moved`
  String get app_push_richNotification_move_summary {
    return Intl.message(
      'Someone moved',
      name: 'app_push_richNotification_move_summary',
      desc: '',
      args: [],
    );
  }

  /// `Follow request`
  String get app_push_channel_followRequest_name {
    return Intl.message(
      'Follow request',
      name: 'app_push_channel_followRequest_name',
      desc: '',
      args: [],
    );
  }

  /// `When people want to follow you`
  String get app_push_channel_followRequest_description {
    return Intl.message(
      'When people want to follow you',
      name: 'app_push_channel_followRequest_description',
      desc: '',
      args: [],
    );
  }

  /// `{acct} want to follow you`
  String app_push_richNotification_followRequest_title(Object acct) {
    return Intl.message(
      '$acct want to follow you',
      name: 'app_push_richNotification_followRequest_title',
      desc: '',
      args: [acct],
    );
  }

  /// `Someone want to follow you`
  String get app_push_richNotification_followRequest_summary {
    return Intl.message(
      'Someone want to follow you',
      name: 'app_push_richNotification_followRequest_summary',
      desc: '',
      args: [],
    );
  }

  /// `Emoji reactions`
  String get app_push_channel_emojiReaction_name {
    return Intl.message(
      'Emoji reactions',
      name: 'app_push_channel_emojiReaction_name',
      desc: '',
      args: [],
    );
  }

  /// `Unifedi-only emoji reactions for statuses`
  String get app_push_channel_emojiReaction_description {
    return Intl.message(
      'Unifedi-only emoji reactions for statuses',
      name: 'app_push_channel_emojiReaction_description',
      desc: '',
      args: [],
    );
  }

  /// `{acct} reacted {emoji}`
  String app_push_richNotification_emojiReaction_title(
      Object acct, Object emoji) {
    return Intl.message(
      '$acct reacted $emoji',
      name: 'app_push_richNotification_emojiReaction_title',
      desc: '',
      args: [acct, emoji],
    );
  }

  /// `Someone reacted`
  String get app_push_richNotification_emojiReaction_summary {
    return Intl.message(
      'Someone reacted',
      name: 'app_push_richNotification_emojiReaction_summary',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get app_push_channel_chatMention_name {
    return Intl.message(
      'Chat',
      name: 'app_push_channel_chatMention_name',
      desc: '',
      args: [],
    );
  }

  /// `Unifedi-only chat messages`
  String get app_push_channel_chatMention_description {
    return Intl.message(
      'Unifedi-only chat messages',
      name: 'app_push_channel_chatMention_description',
      desc: '',
      args: [],
    );
  }

  /// `Chat with {acct}`
  String app_push_richNotification_chatMention_title(Object acct) {
    return Intl.message(
      'Chat with $acct',
      name: 'app_push_richNotification_chatMention_title',
      desc: '',
      args: [acct],
    );
  }

  /// `You have new message in chat`
  String get app_push_richNotification_chatMention_summary {
    return Intl.message(
      'You have new message in chat',
      name: 'app_push_richNotification_chatMention_summary',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get app_push_channel_unifediReport_name {
    return Intl.message(
      'Reports',
      name: 'app_push_channel_unifediReport_name',
      desc: '',
      args: [],
    );
  }

  /// `When people report your statues`
  String get app_push_channel_unifediReport_description {
    return Intl.message(
      'When people report your statues',
      name: 'app_push_channel_unifediReport_description',
      desc: '',
      args: [],
    );
  }

  /// `{acct} reported your status`
  String app_push_richNotification_unifediReport_title(Object acct) {
    return Intl.message(
      '$acct reported your status',
      name: 'app_push_richNotification_unifediReport_title',
      desc: '',
      args: [acct],
    );
  }

  /// `Someone reported your status`
  String get app_push_richNotification_unifediReport_summary {
    return Intl.message(
      'Someone reported your status',
      name: 'app_push_richNotification_unifediReport_summary',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get app_push_channel_unknown_name {
    return Intl.message(
      'Unknown',
      name: 'app_push_channel_unknown_name',
      desc: '',
      args: [],
    );
  }

  /// `Unknown notification type, not handled by Fedi yet`
  String get app_push_channel_unknown_description {
    return Intl.message(
      'Unknown notification type, not handled by Fedi yet',
      name: 'app_push_channel_unknown_description',
      desc: '',
      args: [],
    );
  }

  /// `Something happened`
  String get app_push_richNotification_unknown_title {
    return Intl.message(
      'Something happened',
      name: 'app_push_richNotification_unknown_title',
      desc: '',
      args: [],
    );
  }

  /// `Something happened`
  String get app_push_richNotification_unknown_summary {
    return Intl.message(
      'Something happened',
      name: 'app_push_richNotification_unknown_summary',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get app_push_richNotification_action_acceptFollowRequest {
    return Intl.message(
      'Accept',
      name: 'app_push_richNotification_action_acceptFollowRequest',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get app_push_richNotification_action_rejectFollowRequest {
    return Intl.message(
      'Reject',
      name: 'app_push_richNotification_action_rejectFollowRequest',
      desc: '',
      args: [],
    );
  }

  /// `Reply`
  String get app_push_richNotification_action_reply {
    return Intl.message(
      'Reply',
      name: 'app_push_richNotification_action_reply',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get app_about_title {
    return Intl.message(
      'About',
      name: 'app_about_title',
      desc: '',
      args: [],
    );
  }

  /// `Learn more`
  String get app_about_learnMore {
    return Intl.message(
      'Learn more',
      name: 'app_about_learnMore',
      desc: '',
      args: [],
    );
  }

  /// `Website`
  String get app_about_field_website_label {
    return Intl.message(
      'Website',
      name: 'app_about_field_website_label',
      desc: '',
      args: [],
    );
  }

  /// `Follow on Fediverse`
  String get app_about_field_followOnFediverse_label {
    return Intl.message(
      'Follow on Fediverse',
      name: 'app_about_field_followOnFediverse_label',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get app_about_field_version_label {
    return Intl.message(
      'Version',
      name: 'app_about_field_version_label',
      desc: '',
      args: [],
    );
  }

  /// `Changelog`
  String get app_about_field_changelog_label {
    return Intl.message(
      'Changelog',
      name: 'app_about_field_changelog_label',
      desc: '',
      args: [],
    );
  }

  /// `Help translate`
  String get app_about_field_helpTranslate_label {
    return Intl.message(
      'Help translate',
      name: 'app_about_field_helpTranslate_label',
      desc: '',
      args: [],
    );
  }

  /// `Weblate`
  String get app_about_field_helpTranslate_value {
    return Intl.message(
      'Weblate',
      name: 'app_about_field_helpTranslate_value',
      desc: '',
      args: [],
    );
  }

  /// `Source code`
  String get app_about_field_sourceCode_label {
    return Intl.message(
      'Source code',
      name: 'app_about_field_sourceCode_label',
      desc: '',
      args: [],
    );
  }

  /// `License`
  String get app_about_field_license_label {
    return Intl.message(
      'License',
      name: 'app_about_field_license_label',
      desc: '',
      args: [],
    );
  }

  /// `Data gathering`
  String get app_about_field_dataGathering_label {
    return Intl.message(
      'Data gathering',
      name: 'app_about_field_dataGathering_label',
      desc: '',
      args: [],
    );
  }

  /// `Push notifications`
  String get app_about_field_pushNotifications_label {
    return Intl.message(
      'Push notifications',
      name: 'app_about_field_pushNotifications_label',
      desc: '',
      args: [],
    );
  }

  /// `Report bug & Suggest idea`
  String get app_about_field_reportBugSuggestIdea_label {
    return Intl.message(
      'Report bug & Suggest idea',
      name: 'app_about_field_reportBugSuggestIdea_label',
      desc: '',
      args: [],
    );
  }

  /// `Create issue`
  String get app_about_field_reportBugSuggestIdea_value {
    return Intl.message(
      'Create issue',
      name: 'app_about_field_reportBugSuggestIdea_value',
      desc: '',
      args: [],
    );
  }

  /// `Become Beta tester`
  String get app_about_field_joinBeta_label {
    return Intl.message(
      'Become Beta tester',
      name: 'app_about_field_joinBeta_label',
      desc: '',
      args: [],
    );
  }

  /// `Edit metadata`
  String get app_media_upload_metadata_dialog_title {
    return Intl.message(
      'Edit metadata',
      name: 'app_media_upload_metadata_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get app_media_upload_metadata_dialog_action_save {
    return Intl.message(
      'Save',
      name: 'app_media_upload_metadata_dialog_action_save',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get app_media_upload_metadata_dialog_action_delete {
    return Intl.message(
      'Delete',
      name: 'app_media_upload_metadata_dialog_action_delete',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get app_media_upload_metadata_dialog_field_description_hint {
    return Intl.message(
      'Description',
      name: 'app_media_upload_metadata_dialog_field_description_hint',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get app_media_description_title {
    return Intl.message(
      'Description',
      name: 'app_media_description_title',
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
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'pl'),
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
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
