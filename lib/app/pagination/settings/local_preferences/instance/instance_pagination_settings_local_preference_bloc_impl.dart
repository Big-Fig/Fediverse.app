import 'package:fedi/app/pagination/settings/local_preferences/instance/instance_pagination_settings_local_preference_bloc.dart';
import 'package:fedi/app/pagination/settings/local_preferences/pagination_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class InstancePaginationSettingsLocalPreferenceBloc
    extends PaginationSettingsLocalPreferenceBloc<PaginationSettings?>
    implements IInstancePaginationSettingsLocalPreferenceBloc {
  InstancePaginationSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService,
          "pagination.settings.instance.$userAtHost",
        );

  static final PaginationSettings? defaultValue = null;


  @override
  PaginationSettings? get defaultPreferenceValue => defaultValue;
}
