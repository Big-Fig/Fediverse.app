import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi_app/app/settings/edit_settings_bloc.dart';
import 'package:fedi_app/app/settings/settings_bloc.dart';
import 'package:fedi_app/app/settings/settings_model.dart';
import 'package:fedi_app/form/form_bloc_impl.dart';
import 'package:rxdart/rxdart.dart';

abstract class EditSettingsBloc<T extends ISettings<dynamic>?> extends FormBloc
    implements IEditSettingsBloc<T> {
  @override
  bool get isEnabled => isEnabledSubject.value;

  @override
  Stream<bool> get isEnabledStream => isEnabledSubject.stream;

  final BehaviorSubject<bool> isEnabledSubject;

  @override
  final ISettingsBloc<T> settingsBloc;

  EditSettingsBloc({
    required bool isEnabled,
    required this.settingsBloc,
    required bool isAllItemsInitialized,
  })  : isEnabledSubject = BehaviorSubject.seeded(isEnabled),
        super(
          isAllItemsInitialized: isAllItemsInitialized,
        ) {
    isEnabledSubject.disposeWith(this);

    isSomethingChangedStream.listen(
      (_) {
        if (isEnabled) {
          saveSettingsFromFormToSettingsBloc();
        }
      },
    ).disposeWith(this);

    currentSettingsStream.listen(
      (newSettings) {
        if (newSettings == null) {
          return;
        }
        saveSettingsFromSettingsBlocToForm(newSettings);
      },
    ).disposeWith(this);
  }

  @override
  T? get currentSettings => settingsBloc.settingsData;

  @override
  Stream<T?> get currentSettingsStream => settingsBloc.settingsDataStream;

  bool get isPossibleToSaveSettingsToBloc => true;

  @override
  Future<void> updateSettings(T settings) async =>
      settingsBloc.updateSettings(settings);

  @override
  Future<void> changeEnabled(bool enabled) async {
    isEnabledSubject.add(enabled);
  }

  T calculateCurrentFormFieldsSettings();

  Future<void> fillSettingsToFormFields(T settings);

  bool updateInProgress = false;

  Future<void> saveSettingsFromFormToSettingsBloc() async {
    if (updateInProgress) {
      return;
    }
    if (!isEnabled) {
      return;
    }

    if (!isPossibleToSaveSettingsToBloc) {
      return;
    }
    updateInProgress = true;
    var formSettings = calculateCurrentFormFieldsSettings();

    await updateSettings(formSettings);
    updateInProgress = false;
  }

  Future<void> saveSettingsFromSettingsBlocToForm(T newSettings) async {
    if (updateInProgress) {
      return;
    }
    updateInProgress = true;
    await fillSettingsToFormFields(newSettings);
    updateInProgress = false;
  }
}
