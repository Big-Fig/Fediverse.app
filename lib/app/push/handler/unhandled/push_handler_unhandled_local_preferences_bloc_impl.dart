import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/push/handler/push_handler_model.dart';
import 'package:fedi/app/push/handler/unhandled/push_handler_unhandled_local_preferences_bloc.dart';
import 'package:fedi/app/push/handler/unhandled/push_handler_unhandled_local_preferences_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:logging/logging.dart';

var _logger = Logger("push_handler_unhandled_local_preferences_bloc_impl.dart");

class PushHandlerUnhandledLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<PushHandlerUnhandledList?>
    implements IPushHandlerUnhandledLocalPreferencesBloc {
  PushHandlerUnhandledLocalPreferencesBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: "push.unhandled",
          // ignore: no-magic-number
          schemaVersion: 2,
          jsonConverter: (json) => PushHandlerUnhandledList.fromJson(json),
        );

  @override
  PushHandlerUnhandledList get defaultPreferenceValue =>
      PushHandlerUnhandledList(messages: []);

  @override
  Future addUnhandledMessage(PushHandlerMessage pushHandlerMessage) async {
    var pleromaUnhandledList = value!;

    pleromaUnhandledList.messages.add(pushHandlerMessage);
    _logger.finest(() => "loadUnhandledMessagesForInstance \n"
        "\t pushHandlerMessage = $pushHandlerMessage"
        "\t pleromaUnhandledList.messages = ${pleromaUnhandledList.messages.length}");

    await setValue(pleromaUnhandledList);
  }

  @override
  List<PushHandlerMessage> loadUnhandledMessagesForInstance(
    AuthInstance instance,
  ) {
    var pleromaUnhandledList = value!;

    var messagesForInstances = pleromaUnhandledList.messages
        .where(
          (message) => instance.isInstanceWithHostAndAcct(
            host: message.body.server,
            acct: message.body.account,
          ),
        )
        .toList();

    _logger.finest(() => "loadUnhandledMessagesForInstance \n"
        "\t instance = $instance"
        "\t messagesForInstances = ${messagesForInstances.length}");

    return messagesForInstances;
  }

  @override
  Future<bool> markAsHandled(List<PushHandlerMessage> messages) async {
    var pleromaUnhandledList = value!;

    var cleanedMessages = pleromaUnhandledList.messages
        .where(
          (message) => !messages.contains(
            message,
          ),
        )
        .toList();

    _logger.finest(() => "markAsHandled \n"
        "\t messages = ${messages.length}");

    return setValue(
      PushHandlerUnhandledList(
        messages: cleanedMessages,
      ),
    );
  }
}
