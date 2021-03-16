import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/push/handler/push_handler_model.dart';
import 'package:fedi/app/push/handler/unhandled/push_handler_unhandled_local_preferences_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPushHandlerUnhandledLocalPreferencesBloc
    implements LocalPreferenceBloc<PushHandlerUnhandledList?> {
  static IPushHandlerUnhandledLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPushHandlerUnhandledLocalPreferencesBloc>(
        context,
        listen: listen,
      );

  Future addUnhandledMessage(PushHandlerMessage pushHandlerMessage);

  Future<bool> markAsHandled(List<PushHandlerMessage> messages);

  List<PushHandlerMessage> loadUnhandledMessagesForInstance(
    AuthInstance instance,
  );
}
