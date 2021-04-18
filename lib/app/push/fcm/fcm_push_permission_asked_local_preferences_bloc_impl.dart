import 'package:fedi/app/push/fcm/fcm_push_permission_asked_local_preferences_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class FcmPushPermissionAskedLocalPreferencesBloc extends BoolLocalPreferenceBloc
    implements IFcmPushPermissionAskedLocalPreferencesBloc {
  FcmPushPermissionAskedLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService: preferencesService,
          key: "$userAtHost.fcm.push.permission_asked",
        );

  @override
  bool get defaultValue => false;
}
