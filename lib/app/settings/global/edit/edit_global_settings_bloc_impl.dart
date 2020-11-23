import 'package:fedi/app/settings/Global/edit/edit_Global_settings_bloc.dart';
import 'package:fedi/app/settings/edit_settings_bloc_impl.dart';
import 'package:fedi/app/settings/settings_bloc.dart';
import 'package:fedi/app/settings/settings_model.dart';

abstract class EditGlobalSettingsBloc<T extends ISettings>
    extends EditSettingsBloc<T> implements IEditGlobalSettingsBloc<T> {
  EditGlobalSettingsBloc(
      bool enabled, ISettingsBloc<T> settingsBloc, bool isAllItemsInitialized)
      : super(
          enabled,
          settingsBloc,
          isAllItemsInitialized,
        );
}
