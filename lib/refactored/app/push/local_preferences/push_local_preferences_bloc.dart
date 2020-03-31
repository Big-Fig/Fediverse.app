import 'package:fedi/refactored/app/push/local_preferences/push_local_preferences_model.dart';
import 'package:fedi/refactored/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPushLocalPreferencesBloc
    implements LocalPreferenceBloc<PushLocalPreferences> {
  static IPushLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPushLocalPreferencesBloc>(context, listen: listen);
}
