import 'package:fedi/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi/app/pagination/settings/local_preferences/pagination_settings_local_preference_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc_local_preferences_impl.dart';

class PaginationSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferencesBloc<PaginationSettings>
    implements IPaginationSettingsBloc {
  PaginationSettingsBloc({
    required IPaginationSettingsLocalPreferenceBloc<PaginationSettings>
        globalLocalPreferencesBloc,
    required IPaginationSettingsLocalPreferenceBloc<PaginationSettings?>
        instanceLocalPreferencesBloc,
  }) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
        );

  @override
  Future changePageSize(PaginationPageSize value) => updateSettings(
        settingsData.copyWith(
          pageSize: value,
        ),
      );

  @override
  PaginationPageSize get pageSize =>
      settingsData.pageSizeString.toPaginationPageSize();

  @override
  Stream<PaginationPageSize> get pageSizeStream => settingsDataStream.map(
        (settings) => settings.pageSizeString.toPaginationPageSize(),
      );
}
