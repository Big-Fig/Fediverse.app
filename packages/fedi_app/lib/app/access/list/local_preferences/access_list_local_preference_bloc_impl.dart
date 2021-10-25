import 'package:fedi_app/app/access/list/access_list_model.dart';
import 'package:fedi_app/app/access/list/local_preferences/access_list_local_preference_bloc.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

class UnifediApiAccessListLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<UnifediApiAccessList?>
    implements IUnifediApiAccessListLocalPreferenceBloc {
  static const UnifediApiAccessList? defaultValue = null;

  UnifediApiAccessListLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: 'access.list',
          schemaVersion: 1,
          jsonConverter: (json) => UnifediApiAccessList.fromJson(json),
        );

  @override
  UnifediApiAccessList? get defaultPreferenceValue => defaultValue;
}
