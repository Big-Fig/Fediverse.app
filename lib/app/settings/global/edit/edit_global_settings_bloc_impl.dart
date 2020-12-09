
import 'package:fedi/app/settings/edit_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global/edit/edit_global_settings_bloc.dart';
import 'package:fedi/app/settings/settings_bloc.dart';
import 'package:fedi/app/settings/settings_model.dart';
import 'package:flutter/widgets.dart';

abstract class EditGlobalSettingsBloc<T extends ISettings>
    extends EditSettingsBloc<T> implements IEditGlobalSettingsBloc<T> {
  EditGlobalSettingsBloc({
    @required bool isEnabled,
    @required ISettingsBloc<T> settingsBloc,
    @required bool isAllItemsInitialized,
  }) : super(
          isEnabled: isEnabled,
          settingsBloc: settingsBloc,
          isAllItemsInitialized: isAllItemsInitialized,
        );
}
