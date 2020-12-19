import 'package:fedi/app/pagination/settings/local_preferences/pagination_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/local_preferences/instance/instance_pagination_settings_local_preferences_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';

class InstancePaginationSettingsLocalPreferencesBloc
    extends PaginationSettingsLocalPreferencesBloc
    implements IInstancePaginationSettingsLocalPreferencesBloc {
  InstancePaginationSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    @required String userAtHost,
  }) : super(preferencesService, "pagination.settings.instance.$userAtHost");
}
