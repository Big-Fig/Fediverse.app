import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/app/push/handler/unhandled/push_handler_unhandled_local_preferences_model.dart';
import 'package:fedi/refactored/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPushHandlerUnhandledLocalPreferencesBloc
    implements LocalPreferenceBloc<PushHandlerUnhandledList> {
  static IPushHandlerUnhandledLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPushHandlerUnhandledLocalPreferencesBloc>(context,
          listen: listen);

  Future addUnhandledMessage(PleromaPushMessage pleromaPushMessage);

  Future<bool> markAsHandled(List<PleromaPushMessage> messages);

  List<PleromaPushMessage> loadUnhandledMessagesForInstance(
      AuthInstance instance);
}
