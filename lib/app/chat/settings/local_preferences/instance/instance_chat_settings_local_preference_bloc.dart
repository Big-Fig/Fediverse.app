import 'package:fedi/app/chat/settings/chat_settings_model.dart';
import 'package:fedi/app/chat/settings/local_preferences/chat_settings_local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceChatSettingsLocalPreferenceBloc
    implements IChatSettingsLocalPreferenceBloc<ChatSettings?> {
  static IInstanceChatSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceChatSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
