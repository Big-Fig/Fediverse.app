import 'package:fedi/app/media/settings/edit/edit_media_settings_bloc.dart';
import 'package:fedi/app/media/settings/media_settings_bloc.dart';
import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';

class EditMediaSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<MediaSettings>
    implements IEditMediaSettingsBloc {
  final IMediaSettingsBloc mediaSettingsBloc;

  @override
  IBoolValueFormFieldBloc autoPlayFieldBloc;

  @override
  IBoolValueFormFieldBloc autoInitFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        autoInitFieldBloc,
        autoPlayFieldBloc,
      ];

  EditMediaSettingsBloc({
    @required this.mediaSettingsBloc,
    @required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    @required bool isEnabled,
    @required bool isGlobalForced,
  }) : super(
          globalOrInstanceSettingsBloc: mediaSettingsBloc,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          isEnabled: isEnabled,
          isAllItemsInitialized: false,
    isGlobalForced: isGlobalForced,
        ) {
    autoPlayFieldBloc = BoolValueFormFieldBloc(
      originValue: currentSettings.autoPlay,
      isEnabled: isEnabled,
    );

    autoInitFieldBloc = BoolValueFormFieldBloc(
      originValue: currentSettings.autoInit,
      isEnabled: isEnabled,
    );

    onFormItemsChanged();

    addDisposable(disposable: autoPlayFieldBloc);
    addDisposable(disposable: autoInitFieldBloc);
  }

  @override
  MediaSettings calculateCurrentFormFieldsSettings() {
    var oldPreferences = settingsBloc.settingsData;
    var oldMediaAutoInit = oldPreferences?.autoInit ?? false;
    var oldMediaAutoPlay = oldPreferences?.autoPlay ?? false;

    var newMediaAutoInit = autoInitFieldBloc.currentValue;
    var newMediaAutoPlay = autoPlayFieldBloc.currentValue;

    if (newMediaAutoPlay == true && oldMediaAutoPlay == false) {
      newMediaAutoInit = true;
      autoInitFieldBloc.changeCurrentValue(newMediaAutoInit);
    }
    if (newMediaAutoInit == false && oldMediaAutoInit == true) {
      newMediaAutoPlay = false;
      autoPlayFieldBloc.changeCurrentValue(newMediaAutoPlay);
    }

    return MediaSettings(
      autoInit: newMediaAutoInit,
      autoPlay: newMediaAutoPlay,
    );
  }

  @override
  Future fillSettingsToFormFields(MediaSettings settings) async {
    autoInitFieldBloc.changeCurrentValue(
      settings.autoInit,
    );
    autoPlayFieldBloc.changeCurrentValue(
      settings.autoPlay,
    );
  }
}
