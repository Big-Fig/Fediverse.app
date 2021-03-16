import 'package:fedi/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi/app/pagination/settings/local_preferences/pagination_settings_local_preferences_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc_local_preferences_impl.dart';

class PaginationSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferencesBloc<PaginationSettings?>
    implements IPaginationSettingsBloc {
  PaginationSettingsBloc({
    required
        IPaginationSettingsLocalPreferencesBloc globalLocalPreferencesBloc,
    required
        IPaginationSettingsLocalPreferencesBloc instanceLocalPreferencesBloc,
  }) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
        );

  @override
  Future changePageSize(PaginationPageSize value) => updateSettings(
        settingsData?.copyWith(
          pageSize: value.toJsonValue(),
        ),
      );

  @override
  PaginationPageSize? get pageSize =>
      settingsData?.pageSize?.toPaginationPageSize();

  @override
  Stream<PaginationPageSize?> get pageSizeStream => settingsDataStream.map(
        (settings) => settings?.pageSize?.toPaginationPageSize(),
      );
}
