import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:collection/collection.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/access/list/local_preferences/access_list_local_preference_bloc_impl.dart';
import 'package:fedi/app/access/local_preferences/access_local_preference_bloc_impl.dart';
import 'package:fedi/app/access/local_preferences_access_bloc_impl.dart';
import 'package:fedi/app/app_model.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/config/config_service_impl.dart';
import 'package:fedi/app/hive/hive_service_impl.dart';
import 'package:fedi/app/html/html_text_helper.dart';
import 'package:fedi/app/localization/settings/local_preferences/global/global_localization_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/logging/logging_service_impl.dart';
import 'package:fedi/app/push/fedi_push_notification_model_impl.dart';
import 'package:fedi/app/push/notification/notification_model.dart';
import 'package:fedi/app/push/notification/rich/rich_notifications_service.dart';
import 'package:fedi/app/push/settings/local_preferences/instance/instance_push_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/ui/theme/light/light_fedi_ui_theme_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/connection/connection_service_impl.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/local_preferences/hive_local_preferences_service_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fedi/push/push_model.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'rich_notifications_service_background_message_impl.freezed.dart';

var _logger = Logger('rich_notifications_service_background_message_impl.dart');

const _pushDataAccountKey = 'account';
const _pushDataServerKey = 'server';

const _followChannelKey = 'push.follow';
const _favouriteChannelKey = 'push.favourite';
const _favouriteChannelGroupKey = 'push.favourite.group';
const _reblogChannelKey = 'push.reblog';
const _reblogChannelGroupKey = 'push.reblog.group';
const _mentionChannelKey = 'push.mention';
const _mentionGroupKey = 'push.mention.group';
const _pollChannelKey = 'push.poll';
const _moveChannelKey = 'push.move';
const _followRequestChannelKey = 'push.followRequest';
const _emojiReactionChannelKey = 'push.emojiReaction';
const _emojiReactionGroupKey = 'push.emojiReaction.group';
const _chatMentionChannelKey = 'push.chatMention';
const _chatMentionGroupKey = 'push.chatMention.group';
const _reportChannelKey = 'push.report';
const _unknownChannelKey = 'push.unknown';

// todo: refactor all push notifications code
class RichNotificationsServiceBackgroundMessage extends AsyncInitLoadingBloc
    implements IRichNotificationsService {
  final S localizationContext;

  // ignore: close_sinks
  final BehaviorSubject<PushMessage> _messageSubject = BehaviorSubject();

  @override
  Stream<PushMessage> get messageStream => _messageSubject.stream;

  RichNotificationsServiceBackgroundMessage({
    required this.localizationContext,
  }) {
    _messageSubject.disposeWith(this);
  }

  @override
  Future<void> internalAsyncInit() async {
    var awesomeNotifications = AwesomeNotifications();
    var successInit = await awesomeNotifications.initialize(
      // android only
      'resource://drawable/ic_stat_name',
      [
        _createFollowChannel(),
        _createFavouriteChannel(),
        _createReblogChannel(),
        _createMentionChannel(),
        _createPollChannel(),
        _createMoveChannel(),
        _createFollowRequestChannel(),
        _createEmojiReactionChannel(),
        _createChatMentionChannel(),
        _createReportChannel(),
        _createUnknownChannel(),
      ],
    );

    if (!successInit) {
      _logger.severe(() => 'failed to awesomeNotifications.initialize');
    }

    awesomeNotifications.createdStream.listen(
      (ReceivedNotification receivedNotification) {
        _handlePushMessage(
          receivedNotification: receivedNotification,
          notificationAction: null,
          notificationActionInput: null,
          pushMessageType: PushMessageType.background,
        );
      },
    ).disposeWith(this);

    awesomeNotifications.actionStream.listen(
      (ReceivedAction receivedAction) {
        var buttonKeyPressed = receivedAction.buttonKeyPressed;

        if (buttonKeyPressed.isEmpty) {
          // user simple click on notification (not on action)
          _handlePushMessage(
            receivedNotification: receivedAction,
            notificationAction: null,
            notificationActionInput: null,
            pushMessageType: PushMessageType.launch,
          );
        } else {
          _handlePushMessage(
            receivedNotification: receivedAction,
            notificationAction: buttonKeyPressed,
            notificationActionInput: receivedAction.buttonKeyInput,
            pushMessageType: PushMessageType.action,
          );
        }
      },
    ).disposeWith(this);
  }

  void _handlePushMessage({
    required ReceivedNotification receivedNotification,
    required String? notificationAction,
    required String? notificationActionInput,
    required PushMessageType pushMessageType,
  }) {
    var payload = receivedNotification.payload!;

    var _notificationPayloadData = NotificationPayloadData.fromPayload(
      payload,
    );

    var notification = _notificationPayloadData.unifediApiNotification;
    var fediPushNotification = FediPushNotification(
      notificationId: notification.id,
      server: _notificationPayloadData.serverHost,
      account: _notificationPayloadData.acct,
      notificationType: notification.type,
      unifediApiNotification: notification.toUnifediApiNotification(),
      notificationAction: notificationAction,
      notificationActionInput: notificationActionInput,
    );

    _messageSubject.add(
      PushMessage(
        typeString: pushMessageType.toJsonValue(),
        notification: null,
        data: fediPushNotification.toJson(),
      ),
    );
  }

  NotificationChannel _createFollowChannel() => NotificationChannel(
        channelKey: _followChannelKey,
        channelName: localizationContext.app_push_channel_follow_name,
        channelDescription:
            localizationContext.app_push_channel_follow_description,
        channelShowBadge: true,
        importance: NotificationImportance.High,
        playSound: true,
        enableVibration: false,
        enableLights: true,
        ledColor: lightFediUiTheme.colorTheme.primary,
        groupKey: null,
        groupSort: null,
        groupAlertBehavior: null,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultColor: lightFediUiTheme.colorTheme.darkGrey,
        locked: false,
        onlyAlertOnce: false,
      );

  NotificationChannel _createFavouriteChannel() => NotificationChannel(
        channelKey: _favouriteChannelKey,
        channelName: localizationContext.app_push_channel_favourite_name,
        channelDescription:
            localizationContext.app_push_channel_favourite_description,
        channelShowBadge: false,
        importance: NotificationImportance.Default,
        playSound: false,
        enableVibration: false,
        enableLights: false,
        ledColor: lightFediUiTheme.colorTheme.primary,
        groupKey: _favouriteChannelGroupKey,
        groupSort: GroupSort.Desc,
        groupAlertBehavior: GroupAlertBehavior.All,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultColor: lightFediUiTheme.colorTheme.darkGrey,
        locked: false,
        onlyAlertOnce: false,
      );

  NotificationChannel _createReblogChannel() => NotificationChannel(
        channelKey: _reblogChannelKey,
        channelName: localizationContext.app_push_channel_reblog_name,
        channelDescription:
            localizationContext.app_push_channel_reblog_description,
        channelShowBadge: true,
        importance: NotificationImportance.Default,
        playSound: true,
        enableVibration: true,
        enableLights: false,
        ledColor: lightFediUiTheme.colorTheme.primary,
        groupKey: _reblogChannelGroupKey,
        groupSort: GroupSort.Desc,
        groupAlertBehavior: GroupAlertBehavior.All,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultColor: lightFediUiTheme.colorTheme.darkGrey,
        locked: false,
        onlyAlertOnce: false,
      );

  NotificationChannel _createMentionChannel() => NotificationChannel(
        channelKey: _mentionChannelKey,
        channelName: localizationContext.app_push_channel_mention_name,
        channelDescription:
            localizationContext.app_push_channel_mention_description,
        channelShowBadge: true,
        importance: NotificationImportance.Max,
        playSound: true,
        enableVibration: true,
        enableLights: true,
        ledColor: lightFediUiTheme.colorTheme.primary,
        groupKey: _mentionGroupKey,
        groupSort: GroupSort.Desc,
        groupAlertBehavior: GroupAlertBehavior.All,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultColor: lightFediUiTheme.colorTheme.darkGrey,
        locked: false,
        onlyAlertOnce: false,
      );

  NotificationChannel _createPollChannel() => NotificationChannel(
        channelKey: _pollChannelKey,
        channelName: localizationContext.app_push_channel_poll_name,
        channelDescription:
            localizationContext.app_push_channel_poll_description,
        channelShowBadge: false,
        importance: NotificationImportance.Default,
        playSound: false,
        enableVibration: false,
        enableLights: false,
        ledColor: lightFediUiTheme.colorTheme.primary,
        groupKey: null,
        groupSort: null,
        groupAlertBehavior: null,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultColor: lightFediUiTheme.colorTheme.darkGrey,
        locked: false,
        onlyAlertOnce: false,
      );

  NotificationChannel _createMoveChannel() => NotificationChannel(
        channelKey: _moveChannelKey,
        channelName: localizationContext.app_push_channel_move_name,
        channelDescription:
            localizationContext.app_push_channel_move_description,
        channelShowBadge: false,
        importance: NotificationImportance.Default,
        playSound: false,
        enableVibration: false,
        enableLights: false,
        ledColor: lightFediUiTheme.colorTheme.primary,
        groupKey: null,
        groupSort: null,
        groupAlertBehavior: null,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultColor: lightFediUiTheme.colorTheme.darkGrey,
        locked: false,
        onlyAlertOnce: false,
      );

  NotificationChannel _createFollowRequestChannel() => NotificationChannel(
        channelKey: _followRequestChannelKey,
        channelName: localizationContext.app_push_channel_followRequest_name,
        channelDescription:
            localizationContext.app_push_channel_followRequest_description,
        channelShowBadge: true,
        importance: NotificationImportance.Max,
        playSound: true,
        enableVibration: true,
        enableLights: true,
        ledColor: lightFediUiTheme.colorTheme.primary,
        groupKey: null,
        groupSort: null,
        groupAlertBehavior: null,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultColor: lightFediUiTheme.colorTheme.darkGrey,
        locked: false,
        onlyAlertOnce: false,
      );

  NotificationChannel _createEmojiReactionChannel() => NotificationChannel(
        channelKey: _emojiReactionChannelKey,
        channelName:
            localizationContext.app_push_channel_unifediEmojiReaction_name,
        channelDescription: localizationContext
            .app_push_channel_unifediEmojiReaction_description,
        channelShowBadge: false,
        importance: NotificationImportance.Default,
        playSound: false,
        enableVibration: false,
        enableLights: false,
        ledColor: lightFediUiTheme.colorTheme.primary,
        groupKey: _emojiReactionGroupKey,
        groupSort: GroupSort.Desc,
        groupAlertBehavior: GroupAlertBehavior.All,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultColor: lightFediUiTheme.colorTheme.darkGrey,
        locked: false,
        onlyAlertOnce: false,
      );

  NotificationChannel _createChatMentionChannel() => NotificationChannel(
        channelKey: _chatMentionChannelKey,
        channelName:
            localizationContext.app_push_channel_unifediChatMention_name,
        channelDescription:
            localizationContext.app_push_channel_unifediChatMention_description,
        channelShowBadge: true,
        importance: NotificationImportance.Max,
        playSound: true,
        enableVibration: true,
        enableLights: true,
        ledColor: lightFediUiTheme.colorTheme.primary,
        groupKey: _chatMentionGroupKey,
        groupSort: GroupSort.Desc,
        groupAlertBehavior: GroupAlertBehavior.Summary,
        defaultPrivacy: NotificationPrivacy.Private,
        defaultColor: lightFediUiTheme.colorTheme.darkGrey,
        locked: false,
        onlyAlertOnce: false,
      );

  NotificationChannel _createReportChannel() => NotificationChannel(
        channelKey: _reportChannelKey,
        channelName: localizationContext.app_push_channel_unifediReport_name,
        channelDescription:
            localizationContext.app_push_channel_unifediReport_description,
        channelShowBadge: true,
        importance: NotificationImportance.Default,
        playSound: true,
        enableVibration: true,
        enableLights: false,
        ledColor: lightFediUiTheme.colorTheme.primary,
        groupKey: null,
        groupSort: null,
        groupAlertBehavior: null,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultColor: lightFediUiTheme.colorTheme.darkGrey,
        locked: false,
        onlyAlertOnce: false,
      );

  NotificationChannel _createUnknownChannel() => NotificationChannel(
        channelKey: _unknownChannelKey,
        channelName: localizationContext.app_push_channel_unknown_name,
        channelDescription:
            localizationContext.app_push_channel_unknown_description,
        channelShowBadge: true,
        importance: NotificationImportance.Default,
        playSound: false,
        enableVibration: false,
        enableLights: false,
        ledColor: lightFediUiTheme.colorTheme.primary,
        groupKey: null,
        groupSort: null,
        groupAlertBehavior: null,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultColor: lightFediUiTheme.colorTheme.darkGrey,
        locked: false,
        onlyAlertOnce: false,
      );
}

Future<void> richNotificationsFirebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  var notification = message.notification;
  var data = message.data;
  _logger.finest(
    () => 'Background message notification $notification data: $data',
  );
  var isNotDisplayedViaFcmPlugin = notification == null;
  if (isNotDisplayedViaFcmPlugin) {
    // ignore: avoid-ignoring-return-values
    await loadNotificationForPushMessageData(
      data: data,
      createPushNotification: true,
    );
  }
}

Future<IUnifediApiNotification?> loadNotificationForPushMessageData({
  required Map<String, dynamic> data,
  required bool createPushNotification,
}) async {
  _logger.finest(() => 'Handling message data: $data');

  if (data.containsKey(_pushDataAccountKey) &&
      data.containsKey(_pushDataServerKey)) {
    var account = data[_pushDataAccountKey] as String;
    var server = data[_pushDataServerKey] as String;

    _logger.finest(() => 'Background message for $account@$server');

    return loadLastNotificationForAcctOnHost(
      acct: account,
      host: server,
      createPushNotification: createPushNotification,
    );
  } else {
    _logger.finest(
      () => 'failed to load notification data $data. '
          'It dont have account or server',
    );

    return null;
  }
}

Future<IUnifediApiNotification?> loadLastNotificationForAcctOnHost({
  required String acct,
  required String host,
  required bool createPushNotification,
}) async {
  var disposableOwner = DisposableOwner();

  IUnifediApiNotification? notification;

  try {
    var configService = ConfigService(appLaunchType: AppLaunchType.normal);
    await configService.performAsyncInit();
    disposableOwner.addDisposable(configService);
    var loggingService = LoggingService(enabled: configService.logEnabled);
    await loggingService.performAsyncInit();
    disposableOwner.addDisposable(loggingService);

    var hiveService = HiveService();
    await hiveService.performAsyncInit();
    disposableOwner.addDisposable(hiveService);

    var hiveLocalPreferencesService =
        HiveLocalPreferencesService.withLastVersionBoxName();
    await hiveLocalPreferencesService.performAsyncInit();
    disposableOwner.addDisposable(hiveLocalPreferencesService);

    var foundInstance = await _findInstanceByUserAtHost(
      localPreferencesService: hiveLocalPreferencesService,
      acct: acct,
      host: host,
    );

    if (foundInstance != null) {
      notification = await _loadNotificationForInstance(
        localPreferencesService: hiveLocalPreferencesService,
        authInstance: foundInstance,
        configService: configService,
        createPushNotification: createPushNotification,
      );
    } else {
      _logger.warning(() => 'instance for $acct@$host not found');
    }
    // ignore: avoid_catches_without_on_clauses
  } catch (e, stackTrace) {
    _logger.severe(() => 'loadLastNotificationForAcctOnHost', e, stackTrace);
  } finally {
    await disposableOwner.dispose();
  }

  return notification;
}

Future<IUnifediApiNotification?> _loadNotificationForInstance({
  required ILocalPreferencesService localPreferencesService,
  required UnifediApiAccess authInstance,
  required IConfigService configService,
  required bool createPushNotification,
}) async {
  var unifediApiNotification = await _loadLastNotificationForInstance(
    localPreferencesService: localPreferencesService,
    authInstance: authInstance,
  );

  if (createPushNotification) {
    if (unifediApiNotification != null) {
      await _createPushNotification(
        localPreferencesService: localPreferencesService,
        authInstance: authInstance,
        unifediApiNotification: unifediApiNotification,
      );
    } else {
      _logger.warning(
        () => 'failed to load not notification for push. It is empty',
      );
    }
  }

  return unifediApiNotification;
}

Future<IUnifediApiNotification?> _loadLastNotificationForInstance({
  required ILocalPreferencesService localPreferencesService,
  required UnifediApiAccess authInstance,
}) async {
  var disposableOwner = DisposableOwner();

  var userAtHost = authInstance.userAtHost;

  var instancePushSettingsLocalPreferenceBloc =
      InstancePushSettingsLocalPreferenceBloc(
    localPreferencesService,
    userAtHost: userAtHost,
  );
  await instancePushSettingsLocalPreferenceBloc.performAsyncInit();
  disposableOwner.addDisposable(
    instancePushSettingsLocalPreferenceBloc,
  );

  var pushSettings = instancePushSettingsLocalPreferenceBloc.value;

  var connectionService = ConnectionService();
  await connectionService.internalAsyncInit();
  disposableOwner.addDisposable(connectionService);

  var unifediApiAccessLocalPreferenceBloc = UnifediApiAccessLocalPreferenceBloc(
    preferencesService: localPreferencesService,
    userAtHost: authInstance.userAtHost,
  );
  await unifediApiAccessLocalPreferenceBloc.performAsyncInit();
  disposableOwner.addDisposable(unifediApiAccessLocalPreferenceBloc);

  var localPreferencesUnifediApiAccessBloc =
      LocalPreferencesUnifediApiAccessBloc(
    accessLocalPreferenceBloc: unifediApiAccessLocalPreferenceBloc,
  );

  disposableOwner.addDisposable(localPreferencesUnifediApiAccessBloc);

  var webSocketsModeSettingsBloc = WebSocketsModeSettingsBloc(
    mode: WebSocketsMode.disabledValue,
  );
  // ignore: cascade_invocations
  webSocketsModeSettingsBloc.disposeWith(disposableOwner);

  var apiManager = authInstance.info!.typeAsUnifediApi.createApiManager(
    apiAccessBloc: localPreferencesUnifediApiAccessBloc,
    computeImpl: null,
    webSocketsModeSettingsBloc: webSocketsModeSettingsBloc,
  );

  disposableOwner.addDisposable(apiManager);

  var unifediApiNotificationService = apiManager.createNotificationService();
  disposableOwner.addDisposable(unifediApiNotificationService);

  try {
    var unifediApiNotifications =
        await unifediApiNotificationService.getNotifications(
      excludeVisibilities: null,
      onlyFromAccountId: null,
      pagination: const UnifediApiPagination(
        limit: 1,
        minId: null,
        maxId: null,
      ),
      excludeTypes: _calculateExcludePushNotificationTypesBaseOnPushSettings(
        pushSettings: pushSettings,
        isPleroma: authInstance.isPleroma,
      ),
      includeTypes: _calculateIncludePushNotificationTypesBaseOnPushSettings(
        pushSettings: pushSettings,
        isPleroma: authInstance.isPleroma,
      ),
    );

    return unifediApiNotifications.firstOrNull;
    // ignore: avoid_catches_without_on_clauses
  } catch (e, stackTrace) {
    _logger.warning(() => 'failed to load notification', e, stackTrace);

    return null;
  } finally {
    await disposableOwner.dispose();
  }
}

List<UnifediApiNotificationType>
    _calculateExcludePushNotificationTypesBaseOnPushSettings({
  required PushSettings pushSettings,
  required bool isPleroma,
}) =>
        [
          if (pushSettings.favourite != true)
            UnifediApiNotificationType.favouriteValue,
          if (pushSettings.follow != true)
            UnifediApiNotificationType.followValue,
          if (pushSettings.mention != true)
            UnifediApiNotificationType.mentionValue,
          if (pushSettings.reblog != true)
            UnifediApiNotificationType.reblogValue,
          if (pushSettings.poll != true) UnifediApiNotificationType.pollValue,
          if (pushSettings.chatMention != true && isPleroma)
            UnifediApiNotificationType.chatMentionValue,
          if (pushSettings.emojiReaction != true && isPleroma)
            UnifediApiNotificationType.emojiReactionValue,
        ];

List<UnifediApiNotificationType>
    _calculateIncludePushNotificationTypesBaseOnPushSettings({
  required PushSettings pushSettings,
  required bool isPleroma,
}) =>
        [
          if (pushSettings.favourite == true)
            UnifediApiNotificationType.favouriteValue,
          if (pushSettings.follow == true)
            UnifediApiNotificationType.followValue,
          if (pushSettings.mention == true)
            UnifediApiNotificationType.mentionValue,
          if (pushSettings.reblog == true)
            UnifediApiNotificationType.reblogValue,
          if (pushSettings.poll == true) UnifediApiNotificationType.pollValue,
          if (pushSettings.chatMention == true && isPleroma)
            UnifediApiNotificationType.chatMentionValue,
          if (pushSettings.emojiReaction == true && isPleroma)
            UnifediApiNotificationType.emojiReactionValue,
          if (isPleroma) UnifediApiNotificationType.reportValue,
          UnifediApiNotificationType.followRequestValue,
        ];

// ignore: long-method
Future<void> _createPushNotification({
  required ILocalPreferencesService localPreferencesService,
  required UnifediApiAccess authInstance,
  required IUnifediApiNotification unifediApiNotification,
}) async {
  _logger.finest(() => 'create push for $unifediApiNotification');

  var disposableOwner = DisposableOwner();

  var globalLocalizationSettingsLocalPreferenceBloc =
      GlobalLocalizationSettingsLocalPreferenceBloc(
    localPreferencesService,
  );
  await globalLocalizationSettingsLocalPreferenceBloc.performAsyncInit();
  disposableOwner.addDisposable(
    globalLocalizationSettingsLocalPreferenceBloc,
  );

  var localizationSettings =
      globalLocalizationSettingsLocalPreferenceBloc.value;

  var localizationLocale = localizationSettings.localizationLocale;
  var locale = LocalizationLocale
      .calculateLocaleBaseOnLocalizationLocaleOrPlatformLocale(
    localizationLocale: localizationLocale,
  );
  var localizationContext = await S.load(
    locale.toLocale(),
  );

  var mediaAttachment = calculateUnifediApiNotificationPushMediaAttachment(
    localizationContext: localizationContext,
    unifediApiNotification: unifediApiNotification,
  );
  var body = calculateUnifediApiNotificationPushBody(
    localizationContext: localizationContext,
    unifediApiNotification: unifediApiNotification,
  );

  var unifediApiNotificationType = unifediApiNotification.typeAsUnifediApi;

  var isMentionType =
      unifediApiNotificationType == UnifediApiNotificationType.mentionValue;
  var isChatMentionType =
      unifediApiNotificationType == UnifediApiNotificationType.chatMentionValue;
  var isFollowRequestType = unifediApiNotificationType ==
      UnifediApiNotificationType.followRequestValue;

  NotificationLayout layout;
  if (body?.isNotEmpty == true) {
    layout = NotificationLayout.BigText;
  } else if (mediaAttachment != null) {
    layout = NotificationLayout.BigPicture;
  } else {
    layout = NotificationLayout.Default;
  }

  var notificationPayloadData = NotificationPayloadData(
    acct: authInstance.acct,
    serverHost: authInstance.urlHost,
    unifediApiNotification: unifediApiNotification,
  );
  var notificationContent = NotificationContent(
    id: _extractNotificationId(unifediApiNotification),
    channelKey: _calculateChannelKey(unifediApiNotification),
    title: calculateUnifediApiNotificationPushTitle(
      localizationContext: localizationContext,
      unifediApiNotification: unifediApiNotification,
    ),
    body: body,
    summary: calculateSummary(
      localizationContext: localizationContext,
      unifediApiNotification: unifediApiNotification,
    ),
    showWhen: false,
    icon: null,
    largeIcon: unifediApiNotification.account?.avatar,
    bigPicture: mediaAttachment?.url,
    customSound: null,
    autoCancel: true,
    color: lightFediUiTheme.colorTheme.darkGrey,
    backgroundColor: lightFediUiTheme.colorTheme.white,
    payload: notificationPayloadData.toPayload(),
    notificationLayout: layout,
    hideLargeIconOnExpand: false,
    ticker: null,
    createdDate: unifediApiNotification.createdAt.toIso8601String(),
  );
  var success = await AwesomeNotifications().createNotification(
    content: notificationContent,
    actionButtons: [
      if (isFollowRequestType)
        NotificationActionButton(
          key: NotificationActionType.acceptFollowRequest.toJsonValue(),
          label: localizationContext
              .app_push_richNotification_action_acceptFollowRequest,
          enabled: true,
          autoCancel: true,
          buttonType: ActionButtonType.Default,
        ),
      if (isFollowRequestType)
        NotificationActionButton(
          key: NotificationActionType.rejectFollowRequest.toJsonValue(),
          label: localizationContext
              .app_push_richNotification_action_rejectFollowRequest,
          enabled: true,
          autoCancel: true,
          buttonType: ActionButtonType.Default,
        ),
      if (isChatMentionType || isMentionType)
        NotificationActionButton(
          key: NotificationActionType.reply.toJsonValue(),
          label: localizationContext.app_push_richNotification_action_reply,
          enabled: true,
          autoCancel: true,
          buttonType: ActionButtonType.InputField,
        ),
    ],
  );

  if (!success) {
    _logger.severe(() => 'failed to create notification $notificationContent');
  }

  await disposableOwner.dispose();
}

String? calculateSummary({
  required S localizationContext,
  required IUnifediApiNotification unifediApiNotification,
}) =>
    unifediApiNotification.typeAsUnifediApi.map(
      follow: (_) =>
          localizationContext.app_push_richNotification_follow_summary,
      favourite: (_) =>
          localizationContext.app_push_richNotification_favourite_summary,
      reblog: (_) =>
          localizationContext.app_push_richNotification_reblog_summary,
      mention: (_) =>
          localizationContext.app_push_richNotification_mention_summary,
      poll: (_) => localizationContext.app_push_richNotification_poll_summary,
      move: (_) => localizationContext.app_push_richNotification_move_summary,
      followRequest: (_) =>
          localizationContext.app_push_richNotification_followRequest_summary,
      emojiReaction: (_) => localizationContext
          .app_push_richNotification_unifediEmojiReaction_summary,
      chatMention: (_) => localizationContext
          .app_push_richNotification_unifediChatMention_summary,
      report: (_) =>
          localizationContext.app_push_richNotification_unifediReport_summary,
      unknown: (_) =>
          localizationContext.app_push_richNotification_unknown_summary,
    );

String? calculateUnifediApiNotificationPushBody({
  required S localizationContext,
  required IUnifediApiNotification unifediApiNotification,
}) {
  var status = unifediApiNotification.status;
  var chatMessage = unifediApiNotification.chatMessage;

  String? body;

  var unifediApiNotificationType = unifediApiNotification.typeAsUnifediApi;

  var isMentionType =
      unifediApiNotificationType == UnifediApiNotificationType.mentionValue;

  var isChatMentionType =
      unifediApiNotificationType == UnifediApiNotificationType.chatMentionValue;
  if (isMentionType && status != null) {
    var spoilerText = status.spoilerText;
    if (spoilerText?.isNotEmpty == true) {
      body = spoilerText;
    } else {
      body = status.content;
    }
  } else if (isChatMentionType && chatMessage != null) {
    body = chatMessage.content;
  }

  return body?.extractRawStringFromHtmlString();
}

IUnifediApiMediaAttachment? calculateUnifediApiNotificationPushMediaAttachment({
  required S localizationContext,
  required IUnifediApiNotification unifediApiNotification,
}) {
  var status = unifediApiNotification.status;
  var chatMessage = unifediApiNotification.chatMessage;

  IUnifediApiMediaAttachment? mediaAttachment;

  var unifediApiNotificationType = unifediApiNotification.typeAsUnifediApi;

  var isMentionType =
      unifediApiNotificationType == UnifediApiNotificationType.mentionValue;
  var isChatMentionType =
      unifediApiNotificationType == UnifediApiNotificationType.chatMentionValue;
  if (isMentionType && status != null) {
    if (!status.sensitive) {
      mediaAttachment = status.mediaAttachments?.firstOrNull;
    }
  } else if (isChatMentionType && chatMessage != null) {
    mediaAttachment = chatMessage.mediaAttachment;
  }

  return mediaAttachment;
}

String calculateUnifediApiNotificationPushTitle({
  required S localizationContext,
  required IUnifediApiNotification unifediApiNotification,
}) {
  var acct = unifediApiNotification.account?.acct ?? '';

  return unifediApiNotification.typeAsUnifediApi.map(
    follow: (_) =>
        localizationContext.app_push_richNotification_follow_title(acct),
    favourite: (_) =>
        localizationContext.app_push_richNotification_favourite_title(acct),
    reblog: (_) =>
        localizationContext.app_push_richNotification_reblog_title(acct),
    mention: (_) =>
        localizationContext.app_push_richNotification_mention_title(acct),
    poll: (_) => localizationContext.app_push_richNotification_poll_title,
    move: (_) => localizationContext.app_push_richNotification_move_title(acct),
    followRequest: (_) =>
        localizationContext.app_push_richNotification_followRequest_title(acct),
    emojiReaction: (_) => localizationContext
        .app_push_richNotification_unifediEmojiReaction_title(
      acct,
      unifediApiNotification.emoji!,
    ),
    chatMention: (_) => localizationContext
        .app_push_richNotification_unifediChatMention_title(acct),
    report: (_) =>
        localizationContext.app_push_richNotification_unifediReport_title(acct),
    unknown: (_) => localizationContext.app_push_richNotification_unknown_title,
  );
}

String _calculateChannelKey(IUnifediApiNotification unifediApiNotification) {
  var typeAsUnifediApi = unifediApiNotification.typeAsUnifediApi;

  return typeAsUnifediApi.map(
    follow: (_) => _followChannelKey,
    favourite: (_) => _favouriteChannelKey,
    reblog: (_) => _reblogChannelKey,
    mention: (_) => _mentionChannelKey,
    poll: (_) => _pollChannelKey,
    move: (_) => _moveChannelKey,
    followRequest: (_) => _followRequestChannelKey,
    emojiReaction: (_) => _emojiReactionChannelKey,
    chatMention: (_) => _chatMentionChannelKey,
    report: (_) => _reportChannelKey,
    unknown: (_) => _unknownChannelKey,
  );
}

int _extractNotificationId(IUnifediApiNotification unifediApiNotification) {
  try {
    // usually id is int type
    return int.parse(unifediApiNotification.id);
    // ignore: avoid_catches_without_on_clauses
  } catch (_) {
    // if id is not it just use ms from epoch to make it unique
    return DateTime.now().millisecondsSinceEpoch;
  }
}

Future<UnifediApiAccess?> _findInstanceByUserAtHost({
  required String acct,
  required String host,
  required ILocalPreferencesService localPreferencesService,
}) async {
  var disposableOwner = DisposableOwner();

  var authInstanceListLocalPreferenceBloc =
      UnifediApiAccessListLocalPreferenceBloc(localPreferencesService);
  await authInstanceListLocalPreferenceBloc.performAsyncInit();
  disposableOwner.addDisposable(
    authInstanceListLocalPreferenceBloc,
  );

  var authInstanceList = authInstanceListLocalPreferenceBloc.value!;

  UnifediApiAccess? foundInstance;

  for (final authInstance in authInstanceList.instances) {
    var found = authInstance.isInstanceWithHostAndAcct(
      host: host,
      acct: acct,
    );
    if (found) {
      foundInstance = authInstance;
      break;
    }
  }

  await disposableOwner.dispose();

  return foundInstance;
}

@freezed
class NotificationPayloadData with _$NotificationPayloadData {
  static const _notificationContentPayloadAcctKey = 'acct';
  static const _notificationContentPayloadServerHostKey = 'host';
  static const _notificationContentPayloadNotificationJsonKey =
      'notificationJson';

  const NotificationPayloadData._();

  const factory NotificationPayloadData({
    required String acct,
    required String serverHost,
    required IUnifediApiNotification unifediApiNotification,
  }) = _NotificationPayloadData;

  // Payload is Map<String, String> not Map<String, dynamic>
  // so here custom serialization instead of json_annotations
  Map<String, String> toPayload() => {
        _notificationContentPayloadAcctKey: acct,
        _notificationContentPayloadServerHostKey: serverHost,
        _notificationContentPayloadNotificationJsonKey: jsonEncode(
          unifediApiNotification.toJson(),
        ),
      };

  static NotificationPayloadData fromPayload(Map<String, String> payload) {
    var acct = payload[_notificationContentPayloadAcctKey]!;
    var serverHost = payload[_notificationContentPayloadServerHostKey]!;
    var notificationJsonString =
        payload[_notificationContentPayloadNotificationJsonKey]!;
    // TODO: check. value? wtf
    var notificationJsonParsed =
        jsonDecode(notificationJsonString) as Map<String, dynamic>;
    dynamic notificationJson = notificationJsonParsed['value'];

    var unifediApiNotification = UnifediApiNotification.fromJson(
      notificationJson as Map<String, dynamic>,
    );

    return NotificationPayloadData(
      acct: acct,
      serverHost: serverHost,
      unifediApiNotification: unifediApiNotification,
    );
  }
}
