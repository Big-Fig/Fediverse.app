import 'package:fedi/app/auth/instance/list/auth_instance_list_model.dart';
import 'package:fedi/app/auth/instance/list/local_preferences/auth_instance_list_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class UnifediApiAccessListLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<UnifediApiAccessList?>
    implements IUnifediApiAccessListLocalPreferenceBloc {
  static const UnifediApiAccessList? defaultValue = null;

  UnifediApiAccessListLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: 'instance.list',
          schemaVersion: 1,
          jsonConverter: (json) => UnifediApiAccessList.fromJson(json),
        );

  @override
  UnifediApiAccessList? get defaultPreferenceValue => defaultValue;
}
