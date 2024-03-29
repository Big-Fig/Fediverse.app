import 'package:fedi_app/app/pagination/settings/local_preferences/global/global_pagination_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/pagination/settings/local_preferences/pagination_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

class GlobalPaginationSettingsLocalPreferenceBloc
    extends PaginationSettingsLocalPreferenceBloc<PaginationSettings>
    implements IGlobalPaginationSettingsLocalPreferenceBloc {
  GlobalPaginationSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(preferencesService, 'pagination.settings.global');

  static final PaginationSettings defaultValue = PaginationSettings.fromEnum(
    pageSize: IPaginationSettingsBloc.defaultPageSizeValue,
  );

  @override
  PaginationSettings get defaultPreferenceValue => defaultValue;
}
