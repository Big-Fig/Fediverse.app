import 'package:fedi_app/app/chat/settings/chat_settings_model.dart';
import 'package:fedi_app/app/chat/settings/local_preferences/chat_settings_local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalChatSettingsLocalPreferenceBloc
    implements IChatSettingsLocalPreferenceBloc<ChatSettings> {
  static IGlobalChatSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IGlobalChatSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
