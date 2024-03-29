import 'package:fedi_app/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi_app/app/pagination/settings/local_preferences/pagination_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_model.dart';
import 'package:fedi_app/app/settings/global_or_instance/local_preferences/global_or_instance_settings_bloc_local_preference_impl.dart';

class PaginationSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferenceBloc<PaginationSettings>
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
  Future<void> changePageSize(PaginationPageSize value) => updateSettings(
        settingsData.copyWith(
          pageSizeString: value.toJsonValue(),
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
