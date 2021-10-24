import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/access/list/access_list_bloc.dart';
import 'package:fedi/app/chat/conversation/current/conversation_chat_current_bloc.dart';
import 'package:fedi/app/chat/unifedi/current/unifedi_chat_current_bloc.dart';
import 'package:fedi/app/notification/go_to_notification_extension.dart';
import 'package:fedi/app/notification/push/notification_push_loader_bloc.dart';
import 'package:fedi/app/notification/push/notification_push_loader_model.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_bloc.dart';
import 'package:fedi/app/push/notification/handler/notifications_push_handler_model.dart';
import 'package:fedi/app/push/notification/rich/rich_notifications_service_background_message_impl.dart';
import 'package:fedi/app/toast/handler/toast_handler_bloc.dart';
import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fedi/app/toast/settings/local_preferences/global/global_toast_settings_local_preference_bloc.dart';
import 'package:fedi/app/toast/settings/local_preferences/instance/instance_toast_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc_impl.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('toast_handler_bloc_impl.dart');

class ToastHandlerBloc extends DisposableOwner implements IToastHandlerBloc {
  static ToastHandlerBloc createFromContext(
    BuildContext context,
    IToastService toastService,
  ) =>
      ToastHandlerBloc(
        context: context,
        toastService: toastService,
        authInstanceListBloc:
            IUnifediApiAccessListBloc.of(context, listen: false),
        currentUnifediApiAccessBloc:
            ICurrentUnifediApiAccessBloc.of(context, listen: false),
        notificationsPushHandlerBloc:
            INotificationsPushHandlerBloc.of(context, listen: false),
        localPreferencesService:
            ILocalPreferencesService.of(context, listen: false),
        currentInstanceToastSettingsBloc:
            IToastSettingsBloc.of(context, listen: false),
        currentInstanceConversationChatCurrentBloc:
            IConversationChatCurrentBloc.of(context, listen: false),
        currentInstanceUnifediChatCurrentBloc:
            IUnifediChatCurrentBloc.of(context, listen: false),
        currentInstanceNotificationPushLoaderBloc:
            INotificationPushLoaderBloc.of(context, listen: false),
        globalToastSettingsLocalPreferencesBloc:
            IGlobalToastSettingsLocalPreferenceBloc.of(context, listen: false),
        localizationContext: S.of(context),
      );

  UnifediApiAccess? get currentInstance =>
      currentUnifediApiAccessBloc.currentInstance;

  // TODO: remove context field?
  final BuildContext context;
  final IToastService toastService;
  final IUnifediApiAccessListBloc authInstanceListBloc;
  final ICurrentUnifediApiAccessBloc currentUnifediApiAccessBloc;
  final ILocalPreferencesService localPreferencesService;
  final IToastSettingsBloc currentInstanceToastSettingsBloc;
  final INotificationsPushHandlerBloc notificationsPushHandlerBloc;
  final IConversationChatCurrentBloc currentInstanceConversationChatCurrentBloc;
  final IUnifediChatCurrentBloc currentInstanceUnifediChatCurrentBloc;
  final INotificationPushLoaderBloc currentInstanceNotificationPushLoaderBloc;
  final IGlobalToastSettingsLocalPreferenceBloc
      globalToastSettingsLocalPreferencesBloc;
  final S localizationContext;

  ToastHandlerBloc({
    required this.context,
    required this.toastService,
    required this.currentUnifediApiAccessBloc,
    required this.authInstanceListBloc,
    required this.notificationsPushHandlerBloc,
    required this.localPreferencesService,
    required this.currentInstanceToastSettingsBloc,
    required this.currentInstanceConversationChatCurrentBloc,
    required this.currentInstanceUnifediChatCurrentBloc,
    required this.currentInstanceNotificationPushLoaderBloc,
    required this.globalToastSettingsLocalPreferencesBloc,
    required this.localizationContext,
  }) {
    notificationsPushHandlerBloc.addRealTimeHandler(handlePush);
    addDisposable(
      CustomDisposable(
        () async {
          notificationsPushHandlerBloc.removeRealTimeHandler(handlePush);
        },
      ),
    );

    currentInstanceNotificationPushLoaderBloc.handledNotificationsStream
        .listen(
          _handleCurrentInstanceNotification,
        )
        .disposeWith(this);
  }

  Future<bool> handlePush(
    NotificationsPushHandlerMessage notificationsPushHandlerMessage,
  ) async {
    var unifediPushMessage = notificationsPushHandlerMessage.body;
    var isForCurrentInstance = currentInstance!.isInstanceWithHostAndAcct(
      host: unifediPushMessage.server,
      acct: unifediPushMessage.account,
    );

    if (!isForCurrentInstance) {
      await _handleNonCurrentInstancePushMessage(
        notificationsPushHandlerMessage,
      );
    }
    // else {
    // current instance push messages handled
    // via currentInstanceNotificationPushLoaderBloc
    // and _handleCurrentInstanceNotification
    // }

    return false;
  }

  void _handleCurrentInstanceNotification(
    NotificationPushLoaderNotification handledNotification,
  ) {
    var pushHandlerMessage =
        handledNotification.notificationsPushHandlerMessage;
    var unifediPushMessage = pushHandlerMessage.body;

    var notificationType = unifediPushMessage.notificationType;

    var unifediApiNotificationType =
        notificationType.toUnifediApiNotificationType();
    var enabled = currentInstanceToastSettingsBloc
        .isNotificationTypeEnabled(unifediApiNotificationType);

    var isEnabledWhenInstanceSelected = currentInstanceToastSettingsBloc
        .handlingType.isEnabledWhenInstanceSelected;
    _logger.finest(
      () => 'handleCurrentInstancePush '
          'unifediApiNotificationType $unifediApiNotificationType \n'
          'isEnabledWhenInstanceSelected $isEnabledWhenInstanceSelected \n'
          'enabled $enabled',
    );

    if (enabled && isEnabledWhenInstanceSelected) {
      bool isNeedShowToast;

      var notification = handledNotification.notification;

      if (notification.isContainsChat) {
        isNeedShowToast =
            currentInstanceUnifediChatCurrentBloc.currentChat?.remoteId !=
                notification.chatRemoteId;
      } else if (notification.isContainsStatus) {
        var directConversationId = notification.status!.directConversationId;
        if (directConversationId != null) {
          isNeedShowToast = currentInstanceConversationChatCurrentBloc
                  .currentChat?.remoteId !=
              directConversationId.toString();
        } else {
          isNeedShowToast = true;
        }
      } else {
        isNeedShowToast = true;
      }

      _logger.finest(
        () => 'handleCurrentInstancePush '
            'isNeedShowToast $isNeedShowToast',
      );

      if (isNeedShowToast) {
        _showToast(
          pushHandlerMessage: pushHandlerMessage,
          onClick: () {
            notification.goToRelatedPage(context);
          },
        );
      }
    }
  }

  void _showToast({
    required NotificationsPushHandlerMessage pushHandlerMessage,
    required VoidCallback onClick,
  }) {
    if (pushHandlerMessage.pushMessage.isLaunch) {
      return;
    }

    var unifediPushMessage = pushHandlerMessage.body;

    var acctAtHost =
        '${unifediPushMessage.account}@${unifediPushMessage.server}';
    var notification = pushHandlerMessage.pushMessage.notification;
    if (notification != null) {
      var title = '$acctAtHost ${notification.title}';
      var body = notification.body;
      toastService.showInfoToast(
        context: context,
        title: title,
        content: body,
        onClick: onClick,
      );
    } else {
      var unifediApiNotification =
          pushHandlerMessage.body.unifediApiNotification!;
      var calculatedTitle = calculateUnifediApiNotificationPushTitle(
        localizationContext: localizationContext,
        unifediApiNotification: unifediApiNotification,
      );
      var calculatedBody = calculateUnifediApiNotificationPushBody(
        localizationContext: localizationContext,
        unifediApiNotification: unifediApiNotification,
      );
      var title = '$acctAtHost $calculatedTitle';
      toastService.showInfoToast(
        context: context,
        title: title,
        content: calculatedBody,
        onClick: onClick,
      );
    }
  }

  Future<void> _handleNonCurrentInstancePushMessage(
    NotificationsPushHandlerMessage notificationsPushHandlerMessage,
  ) async {
    var unifediPushMessage = notificationsPushHandlerMessage.body;

    var notificationType = unifediPushMessage.notificationType;
    var unifediApiNotificationType =
        UnifediApiNotificationType.fromStringValue(notificationType);

    var instanceLocalPreferencesBloc = InstanceToastSettingsLocalPreferenceBloc(
      localPreferencesService,
      userAtHost: '${unifediPushMessage.account}@${unifediPushMessage.server}',
    );

    await instanceLocalPreferencesBloc.performAsyncInit();

    var toastSettingsBloc = ToastSettingsBloc(
      globalLocalPreferencesBloc: globalToastSettingsLocalPreferencesBloc,
      instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
    );

    var isEnabled =
        toastSettingsBloc.isNotificationTypeEnabled(unifediApiNotificationType);

    var isEnabledWhenInstanceNotSelected = currentInstanceToastSettingsBloc
        .handlingType.isEnabledWhenInstanceNotSelected;

    _logger.finest(
      () => '_handleNonCurrentInstancePushMessage '
          'unifediApiNotificationType $unifediApiNotificationType \n'
          'isEnabledWhenInstanceNotSelected $isEnabledWhenInstanceNotSelected \n'
          'isEnabled $isEnabled',
    );

    if (isEnabled && isEnabledWhenInstanceNotSelected) {
      _showToast(
        pushHandlerMessage: notificationsPushHandlerMessage,
        onClick: () async {
          var instanceByCredentials =
              authInstanceListBloc.findInstanceByCredentials(
            host: unifediPushMessage.server,
            acct: unifediPushMessage.account,
          );

          _logger.finest(
            () => '_handleNonCurrentInstancePushMessage '
                'instanceByCredentials $instanceByCredentials',
          );

          if (instanceByCredentials != null) {
            await notificationsPushHandlerBloc
                .markAsLaunchMessage(notificationsPushHandlerMessage);
            await currentUnifediApiAccessBloc
                .changeCurrentInstance(instanceByCredentials);
          }
        },
      );
    }
  }
}
