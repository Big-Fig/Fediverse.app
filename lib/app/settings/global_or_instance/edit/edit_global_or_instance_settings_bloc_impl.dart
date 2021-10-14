import 'package:fedi/app/settings/edit_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/settings/settings_model.dart';
import 'package:rxdart/rxdart.dart';

abstract class EditGlobalOrInstanceSettingsBloc<T extends ISettings<dynamic>>
    extends EditSettingsBloc<T>
    implements IEditGlobalOrInstanceSettingsBloc<T> {
  @override
  final IGlobalOrInstanceSettingsBloc<T> globalOrInstanceSettingsBloc;
  @override
  final GlobalOrInstanceSettingsType globalOrInstanceSettingsType;

  @override
  final bool isGlobalForced;

  @override
  bool get isGlobal => globalOrInstanceSettingsBloc.isGlobal;

  @override
  bool get isInstance => globalOrInstanceSettingsBloc.isInstance;

  EditGlobalOrInstanceSettingsBloc({
    required this.globalOrInstanceSettingsBloc,
    required this.globalOrInstanceSettingsType,
    required this.isGlobalForced,
    required bool isEnabled,
    required bool isAllItemsInitialized,
  }) : super(
          isEnabled: isEnabled,
          settingsBloc: globalOrInstanceSettingsBloc,
          isAllItemsInitialized: isAllItemsInitialized,
        );

  @override
  T get currentSettings => _calculateCurrentSettings(
        instanceSettingsData: globalOrInstanceSettingsBloc.instanceSettingsData,
        globalSettingsData: globalOrInstanceSettingsBloc.globalSettingsData,
      );

  @override
  Stream<T?> get currentSettingsStream => Rx.combineLatest2(
        globalOrInstanceSettingsBloc.instanceSettingsDataStream,
        globalOrInstanceSettingsBloc.globalSettingsDataStream,
        (T? instanceSettingsData, T globalSettingsData) =>
            _calculateCurrentSettings(
          instanceSettingsData: instanceSettingsData,
          globalSettingsData: globalSettingsData,
        ),
      );

  @override
  Future updateSettings(T settings) async {
    switch (globalOrInstanceSettingsType) {
      case GlobalOrInstanceSettingsType.instance:
        await globalOrInstanceSettingsBloc.updateInstanceSettings(settings);
        break;
      case GlobalOrInstanceSettingsType.global:
        await globalOrInstanceSettingsBloc.updateGlobalSettings(settings);
        break;
    }
  }

  T _calculateCurrentSettings({
    required T? instanceSettingsData,
    required T globalSettingsData,
  }) {
    switch (globalOrInstanceSettingsType) {
      case GlobalOrInstanceSettingsType.instance:
        return instanceSettingsData ?? globalSettingsData;
      case GlobalOrInstanceSettingsType.global:
        return globalSettingsData;
    }
  }
}
