import 'package:fedi_app/app/access/list/access_list_model.dart';
import 'package:fedi_app/app/access/list/local_preferences/access_list_local_preference_bloc.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

class AccessListLocalPreferenceBloc
    extends ObjectLocalPreferenceBloc<AccessList?>
    implements IAccessListLocalPreferenceBloc {
  static const AccessList? defaultValue = null;

  AccessListLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: 'access.list',
          schemaVersion: 1,
          jsonConverter: (json) => AccessList.fromJson(json),
        );

  @override
  AccessList? get defaultPreferenceValue => defaultValue;
}
