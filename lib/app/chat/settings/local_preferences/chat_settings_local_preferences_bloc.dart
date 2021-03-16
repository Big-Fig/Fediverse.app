import 'package:fedi/app/chat/settings/chat_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatSettingsLocalPreferencesBloc
    implements ILocalPreferenceBloc<ChatSettings?> {
  static IChatSettingsLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatSettingsLocalPreferencesBloc>(context, listen: listen);
}
