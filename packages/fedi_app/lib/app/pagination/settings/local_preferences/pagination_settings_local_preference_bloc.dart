import 'package:fedi_app/app/pagination/settings/pagination_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPaginationSettingsLocalPreferenceBloc<
    T extends PaginationSettings?> implements ILocalPreferenceBloc<T> {
  static IPaginationSettingsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPaginationSettingsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
