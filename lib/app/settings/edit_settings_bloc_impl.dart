import 'package:fedi/app/settings/edit_settings_bloc.dart';
import 'package:fedi/app/settings/settings_bloc.dart';
import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

abstract class EditSettingsBloc<T extends ISettings> extends FormBloc
    implements IEditSettingsBloc<T> {
  @override
  bool get enabled => enabledSubject.value;

  @override
  Stream<bool> get enabledStream => enabledSubject.stream;

  final BehaviorSubject<bool> enabledSubject;

  @override
  final ISettingsBloc<T> settingsBloc;

  EditSettingsBloc({
    @required bool isEnabled,
    @required this.settingsBloc,
    @required bool isAllItemsInitialized,
  })  : enabledSubject = BehaviorSubject.seeded(isEnabled),
        super(
          isAllItemsInitialized: isAllItemsInitialized,
        ) {
    addDisposable(subject: enabledSubject);

    addDisposable(
      streamSubscription: isSomethingChangedStream.listen(
        (_) {
          if(isEnabled) {
            saveSettingsFromFormToSettingsBloc();
          }
        },
      ),
    );

    addDisposable(
      streamSubscription: settingsBloc.settingsDataStream.listen(
        (newSettings) {
          saveSettingsFromSettingsBlocToForm(newSettings);
        },
      ),
    );
  }

  @override
  T get currentSettings => settingsBloc.settingsData;

  @override
  Stream<T> get currentSettingsStream => settingsBloc.settingsDataStream;

  @override
  Future updateSettings(T settings) async =>
      settingsBloc.updateSettings(settings);

  @override
  Future changeEnabled(bool enabled) async {
    enabledSubject.add(enabled);
  }

  T calculateCurrentFormFieldsSettings();

  Future fillSettingsToFormFields(T settings);

  bool updateInProgress = false;

  Future saveSettingsFromFormToSettingsBloc() async {
    if (updateInProgress) {
      return;
    }
    updateInProgress = true;
    var formSettings = calculateCurrentFormFieldsSettings();

    await updateSettings(formSettings);
    updateInProgress = false;
  }

  void saveSettingsFromSettingsBlocToForm(T newSettings) async {
    if (updateInProgress) {
      return;
    }
    updateInProgress = true;
    await fillSettingsToFormFields(newSettings);
    updateInProgress = false;
  }
}
