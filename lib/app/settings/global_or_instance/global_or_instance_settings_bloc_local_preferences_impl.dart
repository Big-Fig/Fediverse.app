import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class GlobalOrInstanceSettingsLocalPreferencesBloc<T extends ISettings>
    extends DisposableOwner implements IGlobalOrInstanceSettingsBloc<T> {
  final ILocalPreferenceBloc<T> globalLocalPreferencesBloc;
  final ILocalPreferenceBloc<T> instanceLocalPreferencesBloc;
  final bool forceUseGlobal;

  GlobalOrInstanceSettingsLocalPreferencesBloc({
    @required this.globalLocalPreferencesBloc,
    @required this.instanceLocalPreferencesBloc,
    @required this.forceUseGlobal,
  });

  @override
  GlobalOrInstanceSettings<T> get globalOrInstanceSettings =>
      _calculateGlobalOrInstanceSettings(
        globalSettings: globalLocalPreferencesBloc.value,
        instanceSettings: instanceLocalPreferencesBloc.value,
      );

  @override
  Stream<GlobalOrInstanceSettings<T>> get globalOrInstanceSettingsStream =>
      Rx.combineLatest2(
        globalLocalPreferencesBloc.stream,
        instanceLocalPreferencesBloc.stream,
        (a, b) => _calculateGlobalOrInstanceSettings(
          globalSettings: a,
          instanceSettings: b,
        ),
      );

  @override
  bool get isGlobal => forceUseGlobal || globalOrInstanceSettings.isGlobal;

  @override
  Stream<bool> get isGlobalStream => globalOrInstanceSettingsStream.map(
        (globalOrInstanceSettings) =>
            forceUseGlobal || globalOrInstanceSettings.isGlobal,
      );

  @override
  bool get isInstance => !forceUseGlobal && globalOrInstanceSettings.isInstance;

  @override
  Stream<bool> get isInstanceStream => globalOrInstanceSettingsStream.map(
        (globalOrInstanceSettings) =>
            !forceUseGlobal && globalOrInstanceSettings.isInstance,
      );

  @override
  T get settingsData => globalOrInstanceSettings.settings;

  @override
  Stream<T> get settingsDataStream => globalOrInstanceSettingsStream.map(
        (globalOrInstanceSettings) => globalOrInstanceSettings.settings,
      ).distinct();

  @override
  T get globalSettingsData => globalLocalPreferencesBloc.value;

  @override
  Stream<T> get globalSettingsDataStream => globalLocalPreferencesBloc.stream;

  @override
  T get instanceSettingsData => instanceLocalPreferencesBloc.value;

  @override
  Stream<T> get instanceSettingsDataStream =>
      instanceLocalPreferencesBloc.stream;

  @override
  bool get isInstanceOrForceGlobal => isInstance || forceUseGlobal;

  @override
  Stream<bool> get isInstanceOrForceGlobalStream =>
      isInstanceStream.map((isInstance) => isInstance || forceUseGlobal);

  GlobalOrInstanceSettings<T> _calculateGlobalOrInstanceSettings({
    @required T globalSettings,
    @required T instanceSettings,
  }) {
    if (instanceSettings != null && !forceUseGlobal) {
      return GlobalOrInstanceSettings(
        settings: instanceSettings,
        isInstance: true,
        isGlobal: false,
      );
    } else {
      return GlobalOrInstanceSettings(
        settings: globalSettings,
        isInstance: false,
        isGlobal: true,
      );
    }
  }

  @override
  void clearInstanceSettings() {
    instanceLocalPreferencesBloc.clearValue();
  }

  @override
  void cloneGlobalToInstanceSettings() {
    instanceLocalPreferencesBloc.setValue(
      globalLocalPreferencesBloc.value.clone(),
    );
  }
}
