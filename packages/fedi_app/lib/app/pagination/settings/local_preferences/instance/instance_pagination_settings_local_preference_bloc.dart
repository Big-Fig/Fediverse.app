import 'package:fedi_app/app/pagination/settings/local_preferences/pagination_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstancePaginationSettingsLocalPreferenceBloc
    implements IPaginationSettingsLocalPreferenceBloc<PaginationSettings?> {
  static IInstancePaginationSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstancePaginationSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
