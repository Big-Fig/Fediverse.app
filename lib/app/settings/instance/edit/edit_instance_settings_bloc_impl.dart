import 'package:fedi/app/settings/edit_settings_bloc_impl.dart';
import 'package:fedi/app/settings/instance/edit/edit_instance_settings_bloc.dart';
import 'package:fedi/app/settings/settings_bloc.dart';
import 'package:fedi/app/settings/settings_model.dart';

abstract class EditInstanceSettingsBloc<T extends ISettings?>
    extends EditSettingsBloc<T> implements IEditInstanceSettingsBloc<T> {
  EditInstanceSettingsBloc({
    required bool isEnabled,
    required ISettingsBloc<T> settingsBloc,
    required bool isAllItemsInitialized,
  }) : super(
          isEnabled: isEnabled,
          settingsBloc: settingsBloc,
          isAllItemsInitialized: isAllItemsInitialized,
        );
}
