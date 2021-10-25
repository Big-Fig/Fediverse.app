import 'package:fedi_app/app/push/permission/ask/local_preferences/ask_push_permission_local_preference_bloc.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

class AskPushPermissionLocalPreferenceBloc extends BoolLocalPreferenceBloc
    implements IAskPushPermissionLocalPreferenceBloc {
  AskPushPermissionLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService: preferencesService,
          key: '$userAtHost.fcm.push.permission_asked',
        );

  static const defaultValue = false;

  @override
  bool get defaultPreferenceValue => defaultValue;
}
