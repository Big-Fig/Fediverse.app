import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fedi/app/toast/settings/local_preferences/global/global_toast_settings_local_preferences_bloc.dart';
import 'package:fedi/app/toast/settings/local_preferences/toast_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalToastSettingsLocalPreferencesBloc
    extends ToastSettingsLocalPreferencesBloc
    implements IGlobalToastSettingsLocalPreferencesBloc {
  GlobalToastSettingsLocalPreferencesBloc(
      ILocalPreferencesService preferencesService)
      : super(preferencesService, "toast.settings.global");

  @override
  ToastSettings get defaultValue => ToastSettings(
        pushSettings: PushSettings.defaultAllEnabled(),
        handlingTypeString: ToastHandlingType.always.toJsonValue(),
      );
}
