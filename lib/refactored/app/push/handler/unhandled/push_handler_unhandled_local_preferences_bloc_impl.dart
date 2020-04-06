import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/app/push/handler/unhandled/push_handler_unhandled_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/push/handler/unhandled/push_handler_unhandled_local_preferences_model.dart';
import 'package:fedi/refactored/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_service.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_model.dart';
import 'package:logging/logging.dart';

var _logger = Logger("push_handler_unhandled_local_preferences_bloc_impl.dart");

class PushHandlerUnhandledLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<PushHandlerUnhandledList>
    implements IPushHandlerUnhandledLocalPreferencesBloc {
  PushHandlerUnhandledLocalPreferencesBloc(
      ILocalPreferencesService preferencesService)
      : super(preferencesService, "push.unhandled", 1);

  @override
  PushHandlerUnhandledList get defaultValue =>
      PushHandlerUnhandledList(messages: []);

  @override
  Future addUnhandledMessage(PleromaPushMessage pleromaPushMessage) async {
    var pleromaUnhandledList = this.value;

    pleromaUnhandledList.messages.add(pleromaPushMessage);
    _logger.finest(() => "loadUnhandledMessagesForInstance \n"
        "\t pleromaPushMessage = $pleromaPushMessage"
        "\t pleromaUnhandledList.messages = ${pleromaUnhandledList.messages.length}");

    await this.setValue(pleromaUnhandledList);
  }

  @override
  List<PleromaPushMessage> loadUnhandledMessagesForInstance(AuthInstance instance) {
    var pleromaUnhandledList = this.value;

    var messagesForInstances = pleromaUnhandledList.messages
        .where((message) => instance.isInstanceWithHostAndAcct(
            host: message.server, acct: message.account))
        .toList();

    _logger.finest(() => "loadUnhandledMessagesForInstance \n"
        "\t instance = $instance"
        "\t messagesForInstances = ${messagesForInstances.length}");

    return messagesForInstances;
  }

  @override
  Future<bool> markAsHandled(List<PleromaPushMessage> messages) async {
    var pleromaUnhandledList = this.value;

    pleromaUnhandledList.messages
        .removeWhere((message) => messages.contains(message));

    _logger.finest(() => "markAsHandled \n"
        "\t messages = ${messages.length}");

    return this.setValue(pleromaUnhandledList);
  }
}
