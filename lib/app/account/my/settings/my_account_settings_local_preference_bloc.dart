import 'package:fedi/app/account/my/settings/my_account_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountSettingsLocalPreferenceBloc
    implements LocalPreferenceBloc<MyAccountSettings> {
  static IMyAccountSettingsLocalPreferenceBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IMyAccountSettingsLocalPreferenceBloc>(context,
          listen: listen);
}
