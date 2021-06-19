import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/push/notification/simple/handler/simple_notifications_push_handler_model.dart';
import 'package:fedi/app/push/notification/simple/handler/unhandled/local_preferences/simple_notifications_push_handler_unhandled_local_preference_bloc.dart';
import 'package:fedi/app/push/notification/simple/handler/unhandled/simple_notifications_push_handler_unhandled_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:logging/logging.dart';

var _logger = Logger('push_handler_unhandled_local_preferences_bloc_impl.dart');

class SimpleNotificationsPushHandlerUnhandledLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<SimpleNotificationsPushHandlerUnhandledList>
    implements ISimpleNotificationsPushHandlerUnhandledLocalPreferenceBloc {
  SimpleNotificationsPushHandlerUnhandledLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: 'push.unhandled',
          // ignore: no-magic-number
          schemaVersion: 2,
          jsonConverter: (json) => SimpleNotificationsPushHandlerUnhandledList.fromJson(json),
        );

  static const defaultValue = SimpleNotificationsPushHandlerUnhandledList(messages: []);

  @override
  SimpleNotificationsPushHandlerUnhandledList get defaultPreferenceValue => defaultValue;

  @override
  Future addUnhandledMessage(SimpleNotificationsPushHandlerMessage simpleNotificationsPushHandlerMessage) async {
    var pleromaUnhandledList = value;

    pleromaUnhandledList.messages.add(simpleNotificationsPushHandlerMessage);
    _logger.finest(() => 'loadUnhandledMessagesForInstance \n'
        '\t simpleNotificationsPushHandlerMessage = $simpleNotificationsPushHandlerMessage'
        '\t pleromaUnhandledList.messages = ${pleromaUnhandledList.messages.length}');

    await setValue(pleromaUnhandledList);
  }

  @override
  List<SimpleNotificationsPushHandlerMessage> loadUnhandledMessagesForInstance(
    AuthInstance instance,
  ) {
    var pleromaUnhandledList = value;

    var messagesForInstances = pleromaUnhandledList.messages
        .where(
          (message) => instance.isInstanceWithHostAndAcct(
            host: message.body.server,
            acct: message.body.account,
          ),
        )
        .toList();

    _logger.finest(() => 'loadUnhandledMessagesForInstance \n'
        '\t instance = $instance'
        '\t messagesForInstances = ${messagesForInstances.length}');

    return messagesForInstances;
  }

  @override
  Future<bool> markAsHandled(List<SimpleNotificationsPushHandlerMessage> messages) async {
    var pleromaUnhandledList = value;

    var cleanedMessages = pleromaUnhandledList.messages
        .where(
          (message) => !messages.contains(
            message,
          ),
        )
        .toList();

    _logger.finest(() => 'markAsHandled \n'
        '\t messages = ${messages.length}');

    return setValue(
      SimpleNotificationsPushHandlerUnhandledList(
        messages: cleanedMessages,
      ),
    );
  }
}
