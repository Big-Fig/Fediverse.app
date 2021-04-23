import 'package:fedi/app/chat/settings/chat_settings_model.dart';
import 'package:fedi/app/chat/settings/local_preferences/chat_settings_local_preferences_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceChatSettingsLocalPreferencesBloc
    implements IChatSettingsLocalPreferencesBloc<ChatSettings?> {
  static IInstanceChatSettingsLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceChatSettingsLocalPreferencesBloc>(
        context,
        listen: listen,
      );
}
