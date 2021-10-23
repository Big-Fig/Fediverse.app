import 'package:fedi/app/pagination/settings/local_preferences/pagination_settings_local_preference_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IGlobalPaginationSettingsLocalPreferenceBloc
    implements IPaginationSettingsLocalPreferenceBloc<PaginationSettings> {
  static IGlobalPaginationSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IGlobalPaginationSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
