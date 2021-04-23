import 'package:fedi/app/pagination/settings/pagination_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPaginationSettingsLocalPreferencesBloc<
    T extends PaginationSettings?> implements ILocalPreferenceBloc<T> {
  static IPaginationSettingsLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPaginationSettingsLocalPreferencesBloc>(
        context,
        listen: listen,
      );
}
