import 'package:fedi/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi/app/pagination/settings/local_preferences/global/global_pagination_settings_local_preferences_bloc.dart';
import 'package:fedi/app/pagination/settings/local_preferences/pagination_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalPaginationSettingsLocalPreferencesBloc
    extends PaginationSettingsLocalPreferencesBloc
    implements IGlobalPaginationSettingsLocalPreferencesBloc {
  GlobalPaginationSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService,
  ) : super(preferencesService, "pagination.settings.global");

  @override
  PaginationSettings get defaultValue => PaginationSettings(
        pageSize: IPaginationSettingsBloc.defaultPageSizeValue.toJsonValue(),
      );
}
