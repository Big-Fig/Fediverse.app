// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static m0(domain) => "Блокировать сервер ${domain}";

  static m1(domain) => "Разблокировать сервер ${domain}";

  static m2(accountAcct) => "${accountAcct} подписчики";

  static m3(accountAcct) => "${accountAcct} подписки";

  static m4(userAtHost) => "Настройки: ${userAtHost}";

  static m5(number) => "Ссылка #${number}";

  static m6(message) => "Сообщение: ${message}";

  static m7(content) => "${content}";

  static m8(userAtHost) => "Не получается загрузить ${userAtHost}.\nОшибка приложения или сессия истекла";

  static m9(userAtHost) => "${userAtHost}";

  static m10(error) => "Детали: ${error}";

  static m11(userAtHost) => "Выйти из ${userAtHost}";

  static m12(count) => "${Intl.plural(count, one: '1 новая беседа. Нажмите для загрузки.', other: '${count} новых бесед. Нажмите для загрузки.')}";

  static m13(count) => "${Intl.plural(count, one: '1 новый чат. Нажмите для загрузки.', other: '${count} новых чатов. Нажмите для загрузки.')}";

  static m14(message) => "Вы: ${message}";

  static m15(listTitle) => "Список ${listTitle}";

  static m16(mediaType) => "Не поддерживается ${mediaType}";

  static m17(formattedFileSize, formattedMaxFileSize) => "Размер файла ${formattedFileSize} MB, но максимум ${formattedMaxFileSize} MB";

  static m18(status) => "<b>Упоминул вас:</b> ${status}.";

  static m19(status) => "<b>Чат:</b> ${status}.";

  static m20(emoji) => "Оценил вашу запись: ${emoji}.";

  static m21(status) => "Неизвестно: ${status}";

  static m22(count) => "${Intl.plural(count, one: '1 новое оповещение. Нажмите для загрузки.', other: '${count} новых оповещений. Нажмите для загрузки.')}";

  static m23(dayCount) => " ${dayCount} осталось";

  static m24(count) => "${Intl.plural(count, zero: 'Нет голосов', one: '1 голос', other: '${count} голосов')}";

  static m25(userAtHost) => "Настройки: ${userAtHost}";

  static m26(errorMessage) => "Ошибка: ${errorMessage}";

  static m27(count) => "${Intl.plural(count, one: '1 новая запись. Нажмите для загрузки.', other: '${count} новых записей. Нажмите для загрузки.')}";

  static m28(errorMessage) => "Ошибка: ${errorMessage}";

  static m29(optionNumber) => "Ответ ${optionNumber}";

  static m30(accountAcct) => "Ответ: ${accountAcct}";

  static m31(accountAcct) => "Ответ: @${accountAcct}";

  static m32(timeline) => "Лента ${timeline}";

  static m33(timeline) => "Вы действительно хотите удалить ленту: ${timeline}?";

  static m34(errorMessage) => "Ошибка инициализации: ${errorMessage}";

  static m35(errorMessage) => "Ошибка: \n${errorMessage}";

  static m36(count) => "${Intl.plural(count, one: '1 день', other: '${count} дни')}";

  static m37(count) => "${Intl.plural(count, one: '1 час', other: '${count} часы')}";

  static m38(count) => "${Intl.plural(count, one: '1 минута', other: '${count} минуты')}";

  static m39(maxCharactersCount) => "Максимальная длина: ${maxCharactersCount}";

  static m40(minCharactersCount, maxCharactersCount) => "Длина должна быть между ${minCharactersCount} и ${maxCharactersCount}";

  static m41(minCharactersCount) => "Минимальная длина: ${minCharactersCount}";

  static m42(url) => "URL ${url} имеет неправильный формат";

  static m43(days) => "${Intl.plural(days, one: '1 д', other: '${days} д')}";

  static m44(hours) => "${Intl.plural(hours, one: '1 ч', other: '${hours} ч')}";

  static m45(minutes) => "${Intl.plural(minutes, one: '1 мин', other: '${minutes} мин')}";

  static m46(months) => "${Intl.plural(months, one: '1 мес', other: '${months} мес')}";

  static m47(years) => "${Intl.plural(years, one: '1 г', other: '${years} г')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "app_account_action_block" : MessageLookupByLibrary.simpleMessage("Блокировать"),
    "app_account_action_blockDomain" : m0,
    "app_account_action_follow" : MessageLookupByLibrary.simpleMessage("Подписаться"),
    "app_account_action_followRequested" : MessageLookupByLibrary.simpleMessage("Подверждение..."),
    "app_account_action_message" : MessageLookupByLibrary.simpleMessage("Сообщение"),
    "app_account_action_mute" : MessageLookupByLibrary.simpleMessage("Скрыть обновления"),
    "app_account_action_openInBrowser" : MessageLookupByLibrary.simpleMessage("Открыть в браузере"),
    "app_account_action_popup_title" : MessageLookupByLibrary.simpleMessage("Больше действий:"),
    "app_account_action_report_fail_dialog_content" : MessageLookupByLibrary.simpleMessage("Что-то пошло не так"),
    "app_account_action_report_fail_dialog_title" : MessageLookupByLibrary.simpleMessage("Ошибка"),
    "app_account_action_report_label" : MessageLookupByLibrary.simpleMessage("Пожалоавться"),
    "app_account_action_report_success_toast" : MessageLookupByLibrary.simpleMessage("Успех"),
    "app_account_action_unblock" : MessageLookupByLibrary.simpleMessage("Разблокировать"),
    "app_account_action_unblockDomain" : m1,
    "app_account_action_unfollow" : MessageLookupByLibrary.simpleMessage("Отписаться"),
    "app_account_action_unmute" : MessageLookupByLibrary.simpleMessage("Показывать обновления"),
    "app_account_follower_title" : m2,
    "app_account_following_title" : m3,
    "app_account_home_tab_menu_action_account" : MessageLookupByLibrary.simpleMessage("Аккаунт"),
    "app_account_home_tab_menu_action_bookmarks" : MessageLookupByLibrary.simpleMessage("Закладки"),
    "app_account_home_tab_menu_action_global_settings" : MessageLookupByLibrary.simpleMessage("Настройки: глобальные"),
    "app_account_home_tab_menu_action_instance_settings" : m4,
    "app_account_home_tab_menu_action_lists" : MessageLookupByLibrary.simpleMessage("Списки"),
    "app_account_info_followers" : MessageLookupByLibrary.simpleMessage("Подписчики"),
    "app_account_info_following" : MessageLookupByLibrary.simpleMessage("Подписики"),
    "app_account_info_statuses" : MessageLookupByLibrary.simpleMessage("Записи"),
    "app_account_list_privacy" : MessageLookupByLibrary.simpleMessage("Часть данных может быть скрыта из-за настройких приватности"),
    "app_account_my_accountBlock_title" : MessageLookupByLibrary.simpleMessage("Заблокированные аккаунты"),
    "app_account_my_accountMute_title" : MessageLookupByLibrary.simpleMessage("Скрытые аккаунты"),
    "app_account_my_action_accountBlocks" : MessageLookupByLibrary.simpleMessage("Заблокированные аккаунты"),
    "app_account_my_action_accountMutes" : MessageLookupByLibrary.simpleMessage("Скрытые аккаунты"),
    "app_account_my_action_bookmarked" : MessageLookupByLibrary.simpleMessage("Закладки"),
    "app_account_my_action_domainBlocks" : MessageLookupByLibrary.simpleMessage("Заблокированные серверы"),
    "app_account_my_action_draftPosts" : MessageLookupByLibrary.simpleMessage("Черновики"),
    "app_account_my_action_edit" : MessageLookupByLibrary.simpleMessage("Редактировать профиль"),
    "app_account_my_action_favourited" : MessageLookupByLibrary.simpleMessage("Избранное"),
    "app_account_my_action_followRequests" : MessageLookupByLibrary.simpleMessage("Запросы подписчиков"),
    "app_account_my_action_lists" : MessageLookupByLibrary.simpleMessage("Списки"),
    "app_account_my_action_scheduledPosts" : MessageLookupByLibrary.simpleMessage("Запланированны записи"),
    "app_account_my_domainBlock_add_dialog_field_domain_hint" : MessageLookupByLibrary.simpleMessage("mastodon.social"),
    "app_account_my_domainBlock_add_dialog_title" : MessageLookupByLibrary.simpleMessage("Блокировка сервера"),
    "app_account_my_domainBlock_title" : MessageLookupByLibrary.simpleMessage("Заблокированные серверы"),
    "app_account_my_edit_action_save" : MessageLookupByLibrary.simpleMessage("Сохранить"),
    "app_account_my_edit_field_avatar_dialog_action_cancel" : MessageLookupByLibrary.simpleMessage("Отменитьт"),
    "app_account_my_edit_field_avatar_dialog_action_selectAndCrop" : MessageLookupByLibrary.simpleMessage("Выбрать и обрезать"),
    "app_account_my_edit_field_avatar_dialog_title" : MessageLookupByLibrary.simpleMessage("Подтвердить?"),
    "app_account_my_edit_field_backgroundImage_action_add" : MessageLookupByLibrary.simpleMessage("Добавить"),
    "app_account_my_edit_field_backgroundImage_label" : MessageLookupByLibrary.simpleMessage("Фон"),
    "app_account_my_edit_field_customField_action_addNew" : MessageLookupByLibrary.simpleMessage("Добавить ссылку"),
    "app_account_my_edit_field_customField_label" : m5,
    "app_account_my_edit_field_customField_name_label" : MessageLookupByLibrary.simpleMessage("Название*"),
    "app_account_my_edit_field_customField_value_label" : MessageLookupByLibrary.simpleMessage("Ссылка*"),
    "app_account_my_edit_field_displayName_label" : MessageLookupByLibrary.simpleMessage("Заметка*"),
    "app_account_my_edit_field_header_dialog_action_cancel" : MessageLookupByLibrary.simpleMessage("Отменить"),
    "app_account_my_edit_field_header_dialog_action_crop" : MessageLookupByLibrary.simpleMessage("Обрезать"),
    "app_account_my_edit_field_header_dialog_action_select" : MessageLookupByLibrary.simpleMessage("Выбрать"),
    "app_account_my_edit_field_header_dialog_title" : MessageLookupByLibrary.simpleMessage("Подтвердить?"),
    "app_account_my_edit_field_locked_label" : MessageLookupByLibrary.simpleMessage("Доступен только для подписчиков"),
    "app_account_my_edit_field_note_label" : MessageLookupByLibrary.simpleMessage("Описание"),
    "app_account_my_edit_title" : MessageLookupByLibrary.simpleMessage("Редактировать"),
    "app_account_my_edit_unsaved_dialog_action_discard" : MessageLookupByLibrary.simpleMessage("Отменить"),
    "app_account_my_edit_unsaved_dialog_title" : MessageLookupByLibrary.simpleMessage("Не сохраненные данные"),
    "app_account_my_followRequest_title" : MessageLookupByLibrary.simpleMessage("Запросы подписки"),
    "app_account_my_menu_account_subpage_title" : MessageLookupByLibrary.simpleMessage("Аккаунт"),
    "app_account_my_statuses_bookmarked_title" : MessageLookupByLibrary.simpleMessage("Закладки"),
    "app_account_my_statuses_favourited_title" : MessageLookupByLibrary.simpleMessage("Избранное"),
    "app_account_statuses_tab_media" : MessageLookupByLibrary.simpleMessage("Медиа"),
    "app_account_statuses_tab_pinned" : MessageLookupByLibrary.simpleMessage("Прикрепленные"),
    "app_account_statuses_tab_withReplies" : MessageLookupByLibrary.simpleMessage("Включая ответы"),
    "app_account_statuses_tab_withoutReplies" : MessageLookupByLibrary.simpleMessage("Без ответов"),
    "app_appStore_description" : MessageLookupByLibrary.simpleMessage("Красивый и легкий клиент Pleroma и Mastodon: - поддержка push-уведомлений; - эмоджи реакции к записям; - Поддержка личных сообщений Mastodon и чатов Pleroma; - загрузка медиафайлов; - оффлайн кешированние данных; - поддержка нескольких учетных записей."),
    "app_appStore_promotionalText" : MessageLookupByLibrary.simpleMessage("Клиент для серверов социальных сетей Pleroma и Mastodon."),
    "app_appStore_subtitle" : MessageLookupByLibrary.simpleMessage("Клиент для серверов социальных сетей Pleroma и Mastodon."),
    "app_appStore_title" : MessageLookupByLibrary.simpleMessage("Fedi для Pleroma и Mastodon"),
    "app_async_pleroma_error_common_dialog_content" : m6,
    "app_async_pleroma_error_common_dialog_title" : MessageLookupByLibrary.simpleMessage("Ошибка Pleroma API"),
    "app_async_pleroma_error_forbidden_dialog_content" : m7,
    "app_async_pleroma_error_forbidden_dialog_title" : MessageLookupByLibrary.simpleMessage("Запрещено. Неправильная операция или ваша сессия устарелаа"),
    "app_async_pleroma_error_throttled_dialog_content" : MessageLookupByLibrary.simpleMessage("Слишком много операций за минуту. Пожалуйста подождите"),
    "app_async_pleroma_error_throttled_dialog_title" : MessageLookupByLibrary.simpleMessage("Сервер заблокировал операцию"),
    "app_async_socket_error_dialog_content" : MessageLookupByLibrary.simpleMessage("Нет соединения или сервер недоступен"),
    "app_async_socket_error_dialog_title" : MessageLookupByLibrary.simpleMessage("Проверьте ваше соединение"),
    "app_async_timeout_error_dialog_content" : MessageLookupByLibrary.simpleMessage("Нет соединения или сервер недоступен"),
    "app_async_timeout_error_dialog_title" : MessageLookupByLibrary.simpleMessage("Тайм-аут"),
    "app_auth_instance_chooser_action_addInstance" : MessageLookupByLibrary.simpleMessage("Добавить аккаунт"),
    "app_auth_instance_current_context_loading_cantLoad_action_chooseDifferentAccount" : MessageLookupByLibrary.simpleMessage("Выберите другой аккаунт"),
    "app_auth_instance_current_context_loading_cantLoad_action_logout" : MessageLookupByLibrary.simpleMessage("Выйти"),
    "app_auth_instance_current_context_loading_cantLoad_action_refresh" : MessageLookupByLibrary.simpleMessage("Перезагрузить"),
    "app_auth_instance_current_context_loading_cantLoad_content" : m8,
    "app_auth_instance_current_context_loading_loading_content" : m9,
    "app_auth_instance_current_context_loading_loading_title" : MessageLookupByLibrary.simpleMessage("Загрузка аккаунта..."),
    "app_auth_instance_join_action_login" : MessageLookupByLibrary.simpleMessage("Вход"),
    "app_auth_instance_join_action_signUp" : MessageLookupByLibrary.simpleMessage("Регистрация"),
    "app_auth_instance_join_action_tos_postfix" : MessageLookupByLibrary.simpleMessage("."),
    "app_auth_instance_join_action_tos_prefix" : MessageLookupByLibrary.simpleMessage("Используя Fedi вы соглашаетесь с "),
    "app_auth_instance_join_action_tos_terms" : MessageLookupByLibrary.simpleMessage("нашими условиями"),
    "app_auth_instance_join_fail_dialog_content" : m10,
    "app_auth_instance_join_fail_dialog_title" : MessageLookupByLibrary.simpleMessage("Невозможно поддключится к серверу. Попробуйте fedi.app или pleroma.com"),
    "app_auth_instance_join_field_host_helper" : MessageLookupByLibrary.simpleMessage("Pleroma или Mastodon сервер"),
    "app_auth_instance_join_field_host_hint" : MessageLookupByLibrary.simpleMessage("Fedi.app"),
    "app_auth_instance_join_invitesOnly_dialog_content" : MessageLookupByLibrary.simpleMessage("Используйте другой сервер, или заргестрируйтесь по ссылке-приглашению в браузере"),
    "app_auth_instance_join_invitesOnly_dialog_title" : MessageLookupByLibrary.simpleMessage("Владелец сервера включил регистрацию только по приглашениям"),
    "app_auth_instance_join_new_title" : MessageLookupByLibrary.simpleMessage("Добавить аккаунт"),
    "app_auth_instance_join_progress_dialog_content" : MessageLookupByLibrary.simpleMessage("Проверка сервера"),
    "app_auth_instance_join_registrationDisabled_dialog_content" : MessageLookupByLibrary.simpleMessage("Попробуйте другой сервр, например fedi.app"),
    "app_auth_instance_join_registrationDisabled_dialog_title" : MessageLookupByLibrary.simpleMessage("Владелец сервера отключил регистрацию"),
    "app_auth_instance_logout_dialog_content" : m11,
    "app_auth_instance_logout_dialog_title" : MessageLookupByLibrary.simpleMessage("Выйти"),
    "app_auth_instance_register_action_createAccount" : MessageLookupByLibrary.simpleMessage("Регистрация"),
    "app_auth_instance_register_approvalRequired_notification_content" : MessageLookupByLibrary.simpleMessage("Вы сможете войти как толькоо модераторы подтвердят ваш аккаунт"),
    "app_auth_instance_register_approvalRequired_notification_title" : MessageLookupByLibrary.simpleMessage("Успешная регистрация"),
    "app_auth_instance_register_field_captcha_hint" : MessageLookupByLibrary.simpleMessage("Символы с картинк"),
    "app_auth_instance_register_field_captcha_label" : MessageLookupByLibrary.simpleMessage("Капча*"),
    "app_auth_instance_register_field_confirmPassword_hint" : MessageLookupByLibrary.simpleMessage("Пароль"),
    "app_auth_instance_register_field_confirmPassword_label" : MessageLookupByLibrary.simpleMessage("Подтвердите пароль*"),
    "app_auth_instance_register_field_email_hint" : MessageLookupByLibrary.simpleMessage("you@example.com"),
    "app_auth_instance_register_field_email_label" : MessageLookupByLibrary.simpleMessage("Email*"),
    "app_auth_instance_register_field_password_hint" : MessageLookupByLibrary.simpleMessage("Пароль"),
    "app_auth_instance_register_field_password_label" : MessageLookupByLibrary.simpleMessage("Пароль*"),
    "app_auth_instance_register_field_username_hint" : MessageLookupByLibrary.simpleMessage("lain"),
    "app_auth_instance_register_field_username_label" : MessageLookupByLibrary.simpleMessage("Никнейм*"),
    "app_auth_instance_register_title" : MessageLookupByLibrary.simpleMessage("Создать аккаунт"),
    "app_chat_conversation_accounts_title" : MessageLookupByLibrary.simpleMessage("Аккаунты в беседе"),
    "app_chat_conversation_list_newItems_action_tapToLoadNew" : m12,
    "app_chat_conversation_share_title" : MessageLookupByLibrary.simpleMessage("Поделиться в беседы"),
    "app_chat_conversation_start_title" : MessageLookupByLibrary.simpleMessage("Начать беседу"),
    "app_chat_pleroma_accounts_title" : MessageLookupByLibrary.simpleMessage("Аккаунты чата"),
    "app_chat_pleroma_list_newItems_action_tapToLoadNew" : m13,
    "app_chat_pleroma_share_title" : MessageLookupByLibrary.simpleMessage("Поделится в чаты"),
    "app_chat_post_error_empty_dialog_title" : MessageLookupByLibrary.simpleMessage("Невозможно отправить пустое сообщение"),
    "app_chat_post_field_content_hint" : MessageLookupByLibrary.simpleMessage("Начните сообщение"),
    "app_chat_preview_you" : m14,
    "app_chat_settings_field_countConversationsInChatsUnreadBadges_label" : MessageLookupByLibrary.simpleMessage("Учитывать Беседы в непрочитанных"),
    "app_chat_settings_field_replaceConversationsWithPleromaChats_label" : MessageLookupByLibrary.simpleMessage("Заменить \"Беседы\" на \"Чаты\""),
    "app_chat_settings_title" : MessageLookupByLibrary.simpleMessage("Чат"),
    "app_customList_create_title" : MessageLookupByLibrary.simpleMessage("Создать список"),
    "app_customList_edit_title" : MessageLookupByLibrary.simpleMessage("Редактировать"),
    "app_customList_form_field_title_hint" : MessageLookupByLibrary.simpleMessage("Название списка"),
    "app_customList_form_field_title_label" : MessageLookupByLibrary.simpleMessage("Название*"),
    "app_customList_list_title" : MessageLookupByLibrary.simpleMessage("Списки"),
    "app_customList_title" : m15,
    "app_customList_type_accounts_action_add" : MessageLookupByLibrary.simpleMessage("Добавить аккаунт(из вашых подписок)"),
    "app_customList_type_accounts_label" : MessageLookupByLibrary.simpleMessage("Аккаунты в списке"),
    "app_datetime_picker_action_cancel" : MessageLookupByLibrary.simpleMessage("Отменить"),
    "app_datetime_picker_action_ok" : MessageLookupByLibrary.simpleMessage("Выбрать время"),
    "app_datetime_title" : MessageLookupByLibrary.simpleMessage("Выбрать дату"),
    "app_emoji_category_empty" : MessageLookupByLibrary.simpleMessage("Эта категория не содержит подходящих эмоджи"),
    "app_emoji_custom_empty" : MessageLookupByLibrary.simpleMessage("Данный сервер не имеет своих эмоджи"),
    "app_emoji_recent_empty" : MessageLookupByLibrary.simpleMessage("У вас нет последних эмоджи"),
    "app_file_image_crop_title" : MessageLookupByLibrary.simpleMessage("Обрезать как"),
    "app_googlePlay_appName" : MessageLookupByLibrary.simpleMessage("Fedi для Pleroma и Mastodon"),
    "app_googlePlay_fullDescription" : MessageLookupByLibrary.simpleMessage("Красивый и легкий клиент Pleroma и Mastodon: - поддержка push-уведомлений; - эмоджи реакции к записям; - Поддержка личных сообщений Mastodon и чатов Pleroma; - загрузка медиафайлов; - оффлайн кешированние данных; - поддержка нескольких учетных записей."),
    "app_googlePlay_shortDescription" : MessageLookupByLibrary.simpleMessage("Клиент для серверов социальных сетей Pleroma и Mastodon."),
    "app_home_tab_chat_conversation_action_switchToChats" : MessageLookupByLibrary.simpleMessage("В чаты"),
    "app_home_tab_chat_conversation_title" : MessageLookupByLibrary.simpleMessage("Беседы"),
    "app_home_tab_chat_pleroma_action_switch_to_dms" : MessageLookupByLibrary.simpleMessage("В беседы"),
    "app_home_tab_chat_pleroma_notSupported_mastodon" : MessageLookupByLibrary.simpleMessage("Чаты не поддерживаются на Mastodon серверах"),
    "app_home_tab_chat_pleroma_notSupported_pleroma" : MessageLookupByLibrary.simpleMessage("Этот сервер не поддерживает функционал чатов"),
    "app_home_tab_chat_pleroma_title" : MessageLookupByLibrary.simpleMessage("Чаты"),
    "app_init_fail" : MessageLookupByLibrary.simpleMessage("Ошибка при инициализации.\nПерезапустите или переустановите приложение"),
    "app_list_cantUpdateFromNetwork" : MessageLookupByLibrary.simpleMessage("Не получилось обновить по сети"),
    "app_list_empty" : MessageLookupByLibrary.simpleMessage("Ничего не найдено"),
    "app_list_loading_state_canLoadMore" : MessageLookupByLibrary.simpleMessage("Можно загрузить больше"),
    "app_list_loading_state_failed" : MessageLookupByLibrary.simpleMessage("Не получилось загрузить больше"),
    "app_list_loading_state_noMoreData" : MessageLookupByLibrary.simpleMessage("Больше данных нет"),
    "app_list_refresh_unableToFetch" : MessageLookupByLibrary.simpleMessage("Не получилось обновить"),
    "app_localization_dialog_title" : MessageLookupByLibrary.simpleMessage("Язык"),
    "app_localization_form_field_label" : MessageLookupByLibrary.simpleMessage("Язык"),
    "app_localization_settings_field_localizationLocale_label" : MessageLookupByLibrary.simpleMessage("Язык"),
    "app_localization_settings_title" : MessageLookupByLibrary.simpleMessage("Язык"),
    "app_media_attachment_addToGallery_error_dialog_content" : MessageLookupByLibrary.simpleMessage("Тип файла не поддерживается, ошибка сети или недостаточно привелегий"),
    "app_media_attachment_addToGallery_error_dialog_title" : MessageLookupByLibrary.simpleMessage("Не получилось сохранить"),
    "app_media_attachment_addToGallery_progress_content" : MessageLookupByLibrary.simpleMessage("Сохранение..."),
    "app_media_attachment_details_notSupported_type" : m16,
    "app_media_attachment_details_title" : MessageLookupByLibrary.simpleMessage("Прикрепленные файлы"),
    "app_media_attachment_type_audio" : MessageLookupByLibrary.simpleMessage("Аудио"),
    "app_media_attachment_type_file" : MessageLookupByLibrary.simpleMessage("Файл"),
    "app_media_attachment_type_gallery" : MessageLookupByLibrary.simpleMessage("Галерея"),
    "app_media_attachment_type_photo" : MessageLookupByLibrary.simpleMessage("Фото"),
    "app_media_attachment_type_video" : MessageLookupByLibrary.simpleMessage("Видео"),
    "app_media_attachment_upload_remove_dialog_action_cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "app_media_attachment_upload_remove_dialog_action_remove" : MessageLookupByLibrary.simpleMessage("Убрать"),
    "app_media_attachment_upload_remove_dialog_content" : MessageLookupByLibrary.simpleMessage("Вы действительно хотите убрать прикрепленный файл"),
    "app_media_player_error_action_moreDetails" : MessageLookupByLibrary.simpleMessage("Больше информации"),
    "app_media_player_error_action_reload" : MessageLookupByLibrary.simpleMessage("Перезагрузить"),
    "app_media_player_error_desc" : MessageLookupByLibrary.simpleMessage("Что-то пошло не так"),
    "app_media_settings_field_autoInit_label" : MessageLookupByLibrary.simpleMessage("Авто-загрузка"),
    "app_media_settings_field_autoPlay_label" : MessageLookupByLibrary.simpleMessage("Авто-старт"),
    "app_media_settings_title" : MessageLookupByLibrary.simpleMessage("Медиа-файлы"),
    "app_media_upload_failed_notification_exceedSize_content" : m17,
    "app_media_upload_failed_notification_title" : MessageLookupByLibrary.simpleMessage("Ошибка загрузки"),
    "app_notification_action_dismiss" : MessageLookupByLibrary.simpleMessage("Скрыть"),
    "app_notification_action_markAsRead" : MessageLookupByLibrary.simpleMessage("Пометить как прочитанное"),
    "app_notification_action_popup_title" : MessageLookupByLibrary.simpleMessage("Операции с оповещением"),
    "app_notification_dismissed" : MessageLookupByLibrary.simpleMessage("Скрыто"),
    "app_notification_header_favourite" : MessageLookupByLibrary.simpleMessage("Понравилась ваша запись."),
    "app_notification_header_follow" : MessageLookupByLibrary.simpleMessage("Подписался на вас."),
    "app_notification_header_followRequest" : MessageLookupByLibrary.simpleMessage("Хочет подписаться на вас."),
    "app_notification_header_mention" : m18,
    "app_notification_header_move" : MessageLookupByLibrary.simpleMessage("Перемещен."),
    "app_notification_header_pleromaChatMention" : m19,
    "app_notification_header_pleromaEmojiReaction" : m20,
    "app_notification_header_poll" : MessageLookupByLibrary.simpleMessage("Опрос окончен."),
    "app_notification_header_reblog" : MessageLookupByLibrary.simpleMessage("Поделился вашей записью."),
    "app_notification_header_unknown" : m21,
    "app_notification_list_newItems_action_tapToLoadNew" : m22,
    "app_poll_metadata_expires_expired" : MessageLookupByLibrary.simpleMessage("Опрос окончен"),
    "app_poll_metadata_expires_notExpired" : m23,
    "app_poll_metadata_hideResults" : MessageLookupByLibrary.simpleMessage("Скрыть результаты"),
    "app_poll_metadata_showResults" : MessageLookupByLibrary.simpleMessage("Показать результаты"),
    "app_poll_metadata_totalVotes" : m24,
    "app_poll_vote" : MessageLookupByLibrary.simpleMessage("Выбрать"),
    "app_push_permission_ask_dialog_content" : MessageLookupByLibrary.simpleMessage("Хотите ли вы включить push оповещения?\nОни буду пересланы через Fedi push прокси сервер"),
    "app_push_permission_ask_dialog_title" : MessageLookupByLibrary.simpleMessage("Push оповещения"),
    "app_push_permission_declined_dialog_content" : MessageLookupByLibrary.simpleMessage("Включите push оповещения в настройках для получения обновлений"),
    "app_push_permission_declined_dialog_title" : MessageLookupByLibrary.simpleMessage("Необходимо разрешение"),
    "app_push_settings_desc" : MessageLookupByLibrary.simpleMessage("Все сообщения буду пересланы через Fedi push прокси сервер"),
    "app_push_settings_field_favourites_label" : MessageLookupByLibrary.simpleMessage("Лайки"),
    "app_push_settings_field_follows_label" : MessageLookupByLibrary.simpleMessage("Подписки"),
    "app_push_settings_field_mentions_label" : MessageLookupByLibrary.simpleMessage("Упоминания"),
    "app_push_settings_field_pleroma_chat_label" : MessageLookupByLibrary.simpleMessage("Pleroma Чаты"),
    "app_push_settings_field_pleroma_emojiReaction_label" : MessageLookupByLibrary.simpleMessage("Pleroma эмоджи реакции"),
    "app_push_settings_field_polls_label" : MessageLookupByLibrary.simpleMessage("Опросы"),
    "app_push_settings_field_reblogs_label" : MessageLookupByLibrary.simpleMessage("Реблоги"),
    "app_push_settings_title" : MessageLookupByLibrary.simpleMessage("Push-оповещения"),
    "app_push_settings_update_fail_dialog_title" : MessageLookupByLibrary.simpleMessage("Не удалось изменить настройки"),
    "app_search_field_input_hint" : MessageLookupByLibrary.simpleMessage("Поиск"),
    "app_search_recent_empty" : MessageLookupByLibrary.simpleMessage("Нет истории поиска"),
    "app_search_recent_title" : MessageLookupByLibrary.simpleMessage("Последнии"),
    "app_search_tab_accounts" : MessageLookupByLibrary.simpleMessage("Пользователи"),
    "app_search_tab_all" : MessageLookupByLibrary.simpleMessage("Все"),
    "app_search_tab_hashtags" : MessageLookupByLibrary.simpleMessage("Хэш-теги"),
    "app_search_tab_statuses" : MessageLookupByLibrary.simpleMessage("Записи"),
    "app_search_title" : MessageLookupByLibrary.simpleMessage("Поиск"),
    "app_settings_global_or_instance_use_global_label" : MessageLookupByLibrary.simpleMessage("Глобальные настройки"),
    "app_settings_global_title" : MessageLookupByLibrary.simpleMessage("Настройки: глобальные"),
    "app_settings_instance_title" : m25,
    "app_settings_warning_notSupportedOnThisInstance_desc" : MessageLookupByLibrary.simpleMessage("Не поддерживается на этом сервере"),
    "app_share_action_share" : MessageLookupByLibrary.simpleMessage("Поделиться"),
    "app_share_action_shareToChats" : MessageLookupByLibrary.simpleMessage("Поделиться в чат"),
    "app_share_action_shareToConversations" : MessageLookupByLibrary.simpleMessage("Поделиться в беседу"),
    "app_share_action_shareToExternal" : MessageLookupByLibrary.simpleMessage("Поделиться в другое приложение"),
    "app_share_external_field_shareAsLink" : MessageLookupByLibrary.simpleMessage("Поделиться ссылкой"),
    "app_share_external_title" : MessageLookupByLibrary.simpleMessage("Поделиться в другое приложение"),
    "app_share_title" : MessageLookupByLibrary.simpleMessage("Поделиться"),
    "app_share_toast_success" : MessageLookupByLibrary.simpleMessage("Успех"),
    "app_share_with_message_field_message_hint" : MessageLookupByLibrary.simpleMessage("Комментарий (не обязательно)"),
    "app_share_with_message_field_message_label" : MessageLookupByLibrary.simpleMessage("Сообщение"),
    "app_status_action_bookmark" : MessageLookupByLibrary.simpleMessage("В закладки"),
    "app_status_action_copyLink" : MessageLookupByLibrary.simpleMessage("Скопировать ссылку"),
    "app_status_action_delete" : MessageLookupByLibrary.simpleMessage("Удалить"),
    "app_status_action_mute" : MessageLookupByLibrary.simpleMessage("Скрыть записи из беседы"),
    "app_status_action_openInBrowser" : MessageLookupByLibrary.simpleMessage("Открыть в браузере"),
    "app_status_action_pin" : MessageLookupByLibrary.simpleMessage("Прикрепить"),
    "app_status_action_popup_title" : MessageLookupByLibrary.simpleMessage("Операции с записью"),
    "app_status_action_showThisThread" : MessageLookupByLibrary.simpleMessage("Показать эту беседу"),
    "app_status_action_unbookmark" : MessageLookupByLibrary.simpleMessage("Убрать из закладок"),
    "app_status_action_unmute" : MessageLookupByLibrary.simpleMessage("Не скрывать записизаписи из беседы"),
    "app_status_action_unpin" : MessageLookupByLibrary.simpleMessage("Открепить"),
    "app_status_collapsible_action_collapse" : MessageLookupByLibrary.simpleMessage("Свернуть"),
    "app_status_collapsible_action_expand" : MessageLookupByLibrary.simpleMessage("Развернуть"),
    "app_status_copyLink_toast" : MessageLookupByLibrary.simpleMessage("Скопировано"),
    "app_status_deleted_desc" : MessageLookupByLibrary.simpleMessage("Запись удалена"),
    "app_status_draft_edit_title" : MessageLookupByLibrary.simpleMessage("Рекдактировать"),
    "app_status_draft_state_alreadyPosted" : MessageLookupByLibrary.simpleMessage("Уже опубликовано"),
    "app_status_draft_state_canceled" : MessageLookupByLibrary.simpleMessage("Отменен"),
    "app_status_draft_title" : MessageLookupByLibrary.simpleMessage("Черновики"),
    "app_status_emoji_error_cantAdd_dialog_content" : m26,
    "app_status_emoji_error_cantAdd_dialog_title" : MessageLookupByLibrary.simpleMessage("Не получилось добавить эмоджи"),
    "app_status_favouritedBy_title" : MessageLookupByLibrary.simpleMessage("Понравилось:"),
    "app_status_list_newItems_action_tapToLoadNew" : m27,
    "app_status_nsfw_action_view" : MessageLookupByLibrary.simpleMessage("Нажмите для загрузки"),
    "app_status_nsfw_chip" : MessageLookupByLibrary.simpleMessage("NSFW!"),
    "app_status_post_action_post" : MessageLookupByLibrary.simpleMessage("Запись"),
    "app_status_post_dialog_async_content" : MessageLookupByLibrary.simpleMessage("Публикация..."),
    "app_status_post_dialog_error_content" : m28,
    "app_status_post_dialog_error_title_post" : MessageLookupByLibrary.simpleMessage("Невозможно опубликовать запись"),
    "app_status_post_dialog_error_title_schedule" : MessageLookupByLibrary.simpleMessage("Невозможно запланировать запись"),
    "app_status_post_error_empty_dialog_title" : MessageLookupByLibrary.simpleMessage("Не возможно отправить пустое сообщение"),
    "app_status_post_error_poll_dialog_title" : MessageLookupByLibrary.simpleMessage("Введите минимум два ответа"),
    "app_status_post_field_message_hint" : MessageLookupByLibrary.simpleMessage("Что произошло сегодня?"),
    "app_status_post_field_subject" : MessageLookupByLibrary.simpleMessage("Тема (опционально)"),
    "app_status_post_new_title" : MessageLookupByLibrary.simpleMessage("Новая запись"),
    "app_status_post_new_unsaved_dialog_action_discard" : MessageLookupByLibrary.simpleMessage("Удалить"),
    "app_status_post_new_unsaved_dialog_action_saveAsDraft" : MessageLookupByLibrary.simpleMessage("Сохранить как черновик"),
    "app_status_post_new_unsaved_dialog_title" : MessageLookupByLibrary.simpleMessage("У вас есть не сохраненны данные"),
    "app_status_post_poll_field_length_label" : MessageLookupByLibrary.simpleMessage("Истекает"),
    "app_status_post_poll_field_multiply_label" : MessageLookupByLibrary.simpleMessage("Мульти-выбор"),
    "app_status_post_poll_field_option_hint" : m29,
    "app_status_post_schedule_error_notInFuture_dialog_content" : MessageLookupByLibrary.simpleMessage("Запланированная запись должна быть хотя бы через 5 минут в будущем"),
    "app_status_post_schedule_error_notInFuture_dialog_title" : MessageLookupByLibrary.simpleMessage("Неправильное время"),
    "app_status_post_settings_field_defaultVisibility_label" : MessageLookupByLibrary.simpleMessage("Видимость записей по умолчанию"),
    "app_status_post_settings_field_markMediaAsNsfwOnAttach_label" : MessageLookupByLibrary.simpleMessage("Помечать файлы как NSFW по умолчанию"),
    "app_status_post_settings_title" : MessageLookupByLibrary.simpleMessage("Написание записей"),
    "app_status_post_toast_success_post" : MessageLookupByLibrary.simpleMessage("Статус опубликован"),
    "app_status_post_toast_success_schedule" : MessageLookupByLibrary.simpleMessage("Статус запланирован"),
    "app_status_post_visibility_state_direct" : MessageLookupByLibrary.simpleMessage("Только беседа"),
    "app_status_post_visibility_state_list" : MessageLookupByLibrary.simpleMessage("Только в списках"),
    "app_status_post_visibility_state_private" : MessageLookupByLibrary.simpleMessage("Приватная"),
    "app_status_post_visibility_state_public" : MessageLookupByLibrary.simpleMessage("Публичная"),
    "app_status_post_visibility_state_unlisted" : MessageLookupByLibrary.simpleMessage("Не публичная"),
    "app_status_post_visibility_title" : MessageLookupByLibrary.simpleMessage("Видимость"),
    "app_status_reblog_header" : MessageLookupByLibrary.simpleMessage("поделился"),
    "app_status_rebloggedBy_title" : MessageLookupByLibrary.simpleMessage("Поделились:"),
    "app_status_reply_header" : MessageLookupByLibrary.simpleMessage("в ответ к"),
    "app_status_reply_loading_failed" : MessageLookupByLibrary.simpleMessage("Ошибка при загрузке стартовой записи"),
    "app_status_reply_loading_progress" : MessageLookupByLibrary.simpleMessage("Загрузка стартовой записи"),
    "app_status_reply_replyingTo" : m30,
    "app_status_scheduled_datetime_picker_title" : MessageLookupByLibrary.simpleMessage("Запланировать"),
    "app_status_scheduled_edit_title" : MessageLookupByLibrary.simpleMessage("Запланированная запись"),
    "app_status_scheduled_state_alreadyPosted" : MessageLookupByLibrary.simpleMessage("Уже опубликован"),
    "app_status_scheduled_state_canceled" : MessageLookupByLibrary.simpleMessage("Отменен"),
    "app_status_scheduled_title" : MessageLookupByLibrary.simpleMessage("Очередь"),
    "app_status_sensitive_settings_field_isAlwaysShowNsfw_label" : MessageLookupByLibrary.simpleMessage("Всегда показывать NSFW"),
    "app_status_sensitive_settings_field_isAlwaysShowSpoiler_label" : MessageLookupByLibrary.simpleMessage("Всегда показывать спойлеры"),
    "app_status_sensitive_settings_field_nsfwDisplayDelayDuration_label" : MessageLookupByLibrary.simpleMessage("Интервал показа NSFW записей"),
    "app_status_sensitive_settings_title" : MessageLookupByLibrary.simpleMessage("NSFW и спойлеры"),
    "app_status_spoiler_action_view" : MessageLookupByLibrary.simpleMessage("Нажмите для загрузки"),
    "app_status_spoiler_chip" : MessageLookupByLibrary.simpleMessage("Спойлеры!"),
    "app_status_thread_post_hint" : m31,
    "app_status_thread_start_loading" : MessageLookupByLibrary.simpleMessage("Загрузка начального статуса"),
    "app_theme_chooser_label" : MessageLookupByLibrary.simpleMessage("Тема"),
    "app_theme_type_dark" : MessageLookupByLibrary.simpleMessage("Темная"),
    "app_theme_type_light" : MessageLookupByLibrary.simpleMessage("Светлая"),
    "app_theme_type_system" : MessageLookupByLibrary.simpleMessage("Авто"),
    "app_timeline_create_field_id_label" : MessageLookupByLibrary.simpleMessage("Уникальный идентификатор"),
    "app_timeline_create_field_title_hint" : MessageLookupByLibrary.simpleMessage("Название ленты новостей"),
    "app_timeline_create_field_title_label" : MessageLookupByLibrary.simpleMessage("Название"),
    "app_timeline_create_title" : MessageLookupByLibrary.simpleMessage("Создать новую ленту новостей"),
    "app_timeline_loading" : MessageLookupByLibrary.simpleMessage("Загрузка лент новостей"),
    "app_timeline_settings_content" : m32,
    "app_timeline_settings_field_enableWebSockets_description" : MessageLookupByLibrary.simpleMessage("Disable to reduce battery usage"),
    "app_timeline_settings_field_enableWebSockets_description_instance_disabled" : MessageLookupByLibrary.simpleMessage("Отключено в настройках аккаунта"),
    "app_timeline_settings_field_enableWebSockets_label" : MessageLookupByLibrary.simpleMessage("WebSockets обновления"),
    "app_timeline_settings_field_excludeNsfw_label" : MessageLookupByLibrary.simpleMessage("Убрать NSFW"),
    "app_timeline_settings_field_excludeReblogs_label" : MessageLookupByLibrary.simpleMessage("Убрать реблоги"),
    "app_timeline_settings_field_excludeReplies_label" : MessageLookupByLibrary.simpleMessage("Убрать ответы"),
    "app_timeline_settings_field_onlyLocal_label" : MessageLookupByLibrary.simpleMessage("Только на этом сервере"),
    "app_timeline_settings_field_onlyPinned_label" : MessageLookupByLibrary.simpleMessage("Только прикреленные"),
    "app_timeline_settings_field_onlyRemote_label" : MessageLookupByLibrary.simpleMessage("Только НЕ на этом сервере"),
    "app_timeline_settings_field_onlyWithMedia_label" : MessageLookupByLibrary.simpleMessage("Только с медиа"),
    "app_timeline_settings_field_withMuted_label" : MessageLookupByLibrary.simpleMessage("Вместе с скрытыми"),
    "app_timeline_settings_onlyFromRemoteAccount_field_label" : MessageLookupByLibrary.simpleMessage("Только от аккаунта"),
    "app_timeline_settings_onlyFromRemoteAccount_field_null" : MessageLookupByLibrary.simpleMessage("Не выбрано"),
    "app_timeline_settings_onlyInRemoteList_field_chooser_dialog_title" : MessageLookupByLibrary.simpleMessage("Выберите список"),
    "app_timeline_settings_onlyInRemoteList_field_label" : MessageLookupByLibrary.simpleMessage("Только в списке"),
    "app_timeline_settings_onlyInRemoteList_field_null" : MessageLookupByLibrary.simpleMessage("Не выбрано"),
    "app_timeline_settings_replyVisibilityFilter_field_chooser_dialog_title" : MessageLookupByLibrary.simpleMessage("Выберите фильтер"),
    "app_timeline_settings_replyVisibilityFilter_field_label" : MessageLookupByLibrary.simpleMessage("Фильтр видимости ответов"),
    "app_timeline_settings_replyVisibilityFilter_field_null" : MessageLookupByLibrary.simpleMessage("Не выбрано"),
    "app_timeline_settings_replyVisibilityFilter_following" : MessageLookupByLibrary.simpleMessage("Подписки"),
    "app_timeline_settings_replyVisibilityFilter_self" : MessageLookupByLibrary.simpleMessage("Свои"),
    "app_timeline_settings_title" : MessageLookupByLibrary.simpleMessage("Настройки:"),
    "app_timeline_settings_withRemoteHashtag_field_hint" : MessageLookupByLibrary.simpleMessage("pleroma"),
    "app_timeline_settings_withRemoteHashtag_field_label" : MessageLookupByLibrary.simpleMessage("С хэш-тэгом"),
    "app_timeline_storage_action_add" : MessageLookupByLibrary.simpleMessage("Добавить ленту.."),
    "app_timeline_storage_appBar_action_done" : MessageLookupByLibrary.simpleMessage("Сохранить"),
    "app_timeline_storage_appBar_action_edit" : MessageLookupByLibrary.simpleMessage("Редактировать"),
    "app_timeline_storage_delete_dialog_action_delete" : MessageLookupByLibrary.simpleMessage("Удалить"),
    "app_timeline_storage_delete_dialog_content" : m33,
    "app_timeline_storage_delete_dialog_title" : MessageLookupByLibrary.simpleMessage("Удалить"),
    "app_timeline_storage_empty" : MessageLookupByLibrary.simpleMessage("Ничего не найдено"),
    "app_timeline_storage_title" : MessageLookupByLibrary.simpleMessage("Ленты новостей"),
    "app_timeline_type_account" : MessageLookupByLibrary.simpleMessage("Аккаунт"),
    "app_timeline_type_customList" : MessageLookupByLibrary.simpleMessage("Список"),
    "app_timeline_type_field_chooser_dialog_title" : MessageLookupByLibrary.simpleMessage("Выберите тип"),
    "app_timeline_type_field_label" : MessageLookupByLibrary.simpleMessage("Тип"),
    "app_timeline_type_field_null" : MessageLookupByLibrary.simpleMessage("Не выбранно"),
    "app_timeline_type_hashtag" : MessageLookupByLibrary.simpleMessage("Хэш-тэг"),
    "app_timeline_type_home" : MessageLookupByLibrary.simpleMessage("Подписки"),
    "app_timeline_type_public" : MessageLookupByLibrary.simpleMessage("Публичные"),
    "app_timeline_type_public_all" : MessageLookupByLibrary.simpleMessage("Все"),
    "app_timeline_type_public_local" : MessageLookupByLibrary.simpleMessage("Локальные"),
    "app_toast_handling_type_always" : MessageLookupByLibrary.simpleMessage("Всегда"),
    "app_toast_handling_type_onlyWhenInstanceNotSelected" : MessageLookupByLibrary.simpleMessage("Когда аккаунт не активен"),
    "app_toast_handling_type_onlyWhenInstanceSelected" : MessageLookupByLibrary.simpleMessage("Когда аккаунт активен"),
    "app_toast_settings_field_handling_type_label" : MessageLookupByLibrary.simpleMessage("Когда"),
    "app_toast_settings_title" : MessageLookupByLibrary.simpleMessage("Внутренние оповещения"),
    "app_tos_title" : MessageLookupByLibrary.simpleMessage("Условия использования"),
    "app_ui_settings_title" : MessageLookupByLibrary.simpleMessage("Интерфейс"),
    "app_web_sockets_settings_field_type_description" : MessageLookupByLibrary.simpleMessage("Отключите для меньшего расхода батареи"),
    "app_web_sockets_settings_field_type_label" : MessageLookupByLibrary.simpleMessage("WebSockets"),
    "app_web_sockets_settings_title" : MessageLookupByLibrary.simpleMessage("Обновление данных: (WebSockets)"),
    "app_web_sockets_settings_type_disabled" : MessageLookupByLibrary.simpleMessage("Отключено"),
    "app_web_sockets_settings_type_foregroundAndBackground" : MessageLookupByLibrary.simpleMessage("Для текущего окна и в фоне"),
    "app_web_sockets_settings_type_onlyForeground" : MessageLookupByLibrary.simpleMessage("Только для текущего окна"),
    "async_init_state_failed" : m34,
    "async_init_state_notStarted" : MessageLookupByLibrary.simpleMessage("Асинхронная инициализация не началась"),
    "dialog_action_cancel" : MessageLookupByLibrary.simpleMessage("Отмена"),
    "dialog_action_no" : MessageLookupByLibrary.simpleMessage("Нет"),
    "dialog_action_ok" : MessageLookupByLibrary.simpleMessage("Хорошо"),
    "dialog_action_yes" : MessageLookupByLibrary.simpleMessage("Да"),
    "dialog_error_content" : m35,
    "dialog_error_title" : MessageLookupByLibrary.simpleMessage("Что-то пошло не так"),
    "dialog_progress_action_cancel" : MessageLookupByLibrary.simpleMessage("Отмена"),
    "dialog_progress_content" : MessageLookupByLibrary.simpleMessage("Загрузка..."),
    "duration_day" : m36,
    "duration_hour" : m37,
    "duration_minute" : m38,
    "file_picker_empty" : MessageLookupByLibrary.simpleMessage("Ничего не найдено"),
    "file_picker_single_title" : MessageLookupByLibrary.simpleMessage("Выберите файл"),
    "form_field_text_email_error_invalid_desc" : MessageLookupByLibrary.simpleMessage("Неправильный email"),
    "form_field_text_error_empty_desc" : MessageLookupByLibrary.simpleMessage("Не может быть пустым"),
    "form_field_text_error_length_maxOnly_desc" : m39,
    "form_field_text_error_length_minAndMax_desc" : m40,
    "form_field_text_error_length_minOnly_desc" : m41,
    "form_field_text_password_error_notMatch_desc" : MessageLookupByLibrary.simpleMessage("Пароли должны совпадать"),
    "form_field_text_url_error_invalid_desc" : MessageLookupByLibrary.simpleMessage("Неправильный URL"),
    "form_field_value_error_null_desc" : MessageLookupByLibrary.simpleMessage("Необходимо"),
    "link_error_dialog_content" : m42,
    "link_error_dialog_title" : MessageLookupByLibrary.simpleMessage("Не возможно открыть URL"),
    "localization_locale_en" : MessageLookupByLibrary.simpleMessage("English"),
    "localization_locale_ru" : MessageLookupByLibrary.simpleMessage("Русский"),
    "localization_locale_system" : MessageLookupByLibrary.simpleMessage("Системный"),
    "pagination_list_empty" : MessageLookupByLibrary.simpleMessage("Ничего не найдено"),
    "permission_grant_action_grant" : MessageLookupByLibrary.simpleMessage("Разрешить"),
    "timeago_aDay" : MessageLookupByLibrary.simpleMessage("~1 д"),
    "timeago_aboutAMinute" : MessageLookupByLibrary.simpleMessage("1 мин"),
    "timeago_aboutAMonth" : MessageLookupByLibrary.simpleMessage("~1 мес"),
    "timeago_aboutAYear" : MessageLookupByLibrary.simpleMessage("~1 г"),
    "timeago_aboutAnHour" : MessageLookupByLibrary.simpleMessage("~1 ч"),
    "timeago_days" : m43,
    "timeago_hours" : m44,
    "timeago_lessThanOneMinute" : MessageLookupByLibrary.simpleMessage("сейчас"),
    "timeago_minutes" : m45,
    "timeago_months" : m46,
    "timeago_prefixAgo" : MessageLookupByLibrary.simpleMessage(""),
    "timeago_prefixFromNow" : MessageLookupByLibrary.simpleMessage(""),
    "timeago_suffixAgo" : MessageLookupByLibrary.simpleMessage(""),
    "timeago_suffixFromNow" : MessageLookupByLibrary.simpleMessage(""),
    "timeago_wordSeparator" : MessageLookupByLibrary.simpleMessage(" "),
    "timeago_years" : m47
  };
}
