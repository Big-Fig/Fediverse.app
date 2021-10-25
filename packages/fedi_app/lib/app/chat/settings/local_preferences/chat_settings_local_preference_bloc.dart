import 'package:fedi_app/app/chat/settings/chat_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatSettingsLocalPreferenceBloc<T extends ChatSettings?>
    implements ILocalPreferenceBloc<T> {
  static IChatSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IChatSettingsLocalPreferenceBloc>(context, listen: listen);
}
