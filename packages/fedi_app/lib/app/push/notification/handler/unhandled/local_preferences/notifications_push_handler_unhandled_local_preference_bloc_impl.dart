import 'package:fedi_app/app/push/notification/handler/notifications_push_handler_model.dart';
import 'package:fedi_app/app/push/notification/handler/unhandled/local_preferences/notifications_push_handler_unhandled_local_preference_bloc.dart';
import 'package:fedi_app/app/push/notification/handler/unhandled/notifications_push_handler_unhandled_model.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('push_handler_unhandled_local_preferences_bloc_impl.dart');

class NotificationsPushHandlerUnhandledLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<NotificationsPushHandlerUnhandledList>
    implements INotificationsPushHandlerUnhandledLocalPreferenceBloc {
  NotificationsPushHandlerUnhandledLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: 'push.unhandled',
          // ignore: no-magic-number
          schemaVersion: 2,
          jsonConverter: (json) =>
              NotificationsPushHandlerUnhandledList.fromJson(json),
        );

  static const defaultValue =
      NotificationsPushHandlerUnhandledList(messages: []);

  @override
  NotificationsPushHandlerUnhandledList get defaultPreferenceValue =>
      defaultValue;

  @override
  Future<void> addUnhandledMessage(
    NotificationsPushHandlerMessage notificationsPushHandlerMessage,
  ) async {
    var unifediUnhandledList = value;

    unifediUnhandledList.messages.add(notificationsPushHandlerMessage);
    _logger.finest(
      () => 'loadUnhandledMessagesForInstance \n'
          '\t notificationsPushHandlerMessage = $notificationsPushHandlerMessage'
          '\t unifediUnhandledList.messages = ${unifediUnhandledList.messages.length}',
    );

    await setValue(unifediUnhandledList);
  }

  @override
  List<NotificationsPushHandlerMessage> loadUnhandledMessagesForInstance(
    UnifediApiAccess instance,
  ) {
    var unifediUnhandledList = value;

    var messagesForInstances = unifediUnhandledList.messages
        .where(
          (message) => instance.isInstanceWithHostAndAcct(
            host: message.body.server,
            acct: message.body.account,
          ),
        )
        .toList();

    _logger.finest(
      () => 'loadUnhandledMessagesForInstance \n'
          '\t instance = $instance'
          '\t messagesForInstances = ${messagesForInstances.length}',
    );

    return messagesForInstances;
  }

  @override
  Future<void> markAsHandled(
    List<NotificationsPushHandlerMessage> messages,
  ) async {
    var unifediUnhandledList = value;

    var cleanedMessages = unifediUnhandledList.messages
        .where(
          (message) => !messages.contains(
            message,
          ),
        )
        .toList();

    _logger.finest(
      () => 'markAsHandled \n'
          '\t messages = ${messages.length}',
    );

    await setValue(
      NotificationsPushHandlerUnhandledList(
        messages: cleanedMessages,
      ),
    );
  }
}
