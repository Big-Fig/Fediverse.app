import 'package:fedi_app/app/media/settings/edit/edit_media_settings_bloc.dart';
import 'package:fedi_app/app/media/settings/media_settings_bloc.dart';
import 'package:fedi_app/app/media/settings/media_settings_model.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/form_item_bloc.dart';

class EditMediaSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<MediaSettings>
    implements IEditMediaSettingsBloc {
  final IMediaSettingsBloc mediaSettingsBloc;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc autoPlayFieldBloc;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc autoInitFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        autoInitFieldBloc,
        autoPlayFieldBloc,
      ];

  EditMediaSettingsBloc({
    required this.mediaSettingsBloc,
    required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    required bool isEnabled,
    required bool isGlobalForced,
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

    addDisposable(autoPlayFieldBloc);
    addDisposable(autoInitFieldBloc);
  }

  @override
  MediaSettings calculateCurrentFormFieldsSettings() {
    MediaSettings? oldPreferences = settingsBloc.settingsData;
    var oldMediaAutoInit = oldPreferences.autoInit;
    var oldMediaAutoPlay = oldPreferences.autoPlay;

    var newMediaAutoInit = autoInitFieldBloc.currentValue == true;
    var newMediaAutoPlay = autoPlayFieldBloc.currentValue == true;

    if (newMediaAutoPlay && !oldMediaAutoPlay) {
      newMediaAutoInit = true;
      autoInitFieldBloc.changeCurrentValue(newMediaAutoInit);
    }
    if (!newMediaAutoInit && oldMediaAutoInit) {
      newMediaAutoPlay = false;
      autoPlayFieldBloc.changeCurrentValue(newMediaAutoPlay);
    }

    return MediaSettings(
      autoInit: newMediaAutoInit,
      autoPlay: newMediaAutoPlay,
    );
  }

  @override
  Future<void> fillSettingsToFormFields(MediaSettings? settings) async {
    autoInitFieldBloc.changeCurrentValue(
      settings?.autoInit,
    );
    autoPlayFieldBloc.changeCurrentValue(
      settings?.autoPlay,
    );
  }
}
