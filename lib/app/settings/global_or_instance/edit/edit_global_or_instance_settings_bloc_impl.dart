import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

abstract class EditGlobalOrInstanceSettingsBloc extends DisposableOwner
    implements IEditGlobalOrInstanceSettingsBloc {
  final IGlobalOrInstanceSettingsBloc globalOrInstanceSettingsBloc;

  EditGlobalOrInstanceSettingsBloc(
      {@required this.globalOrInstanceSettingsBloc});

  @override
  void enableGlobalSettings() {
    globalOrInstanceSettingsBloc.cloneGlobalToInstanceSettings();
  }

  @override
  void enableInstanceSettings() {
    globalOrInstanceSettingsBloc.clearInstanceSettings();
  }

  @override
  bool get isGlobal => globalOrInstanceSettingsBloc.isGlobal;

  @override
  Stream<bool> get isGlobalStream =>
      globalOrInstanceSettingsBloc.isGlobalStream;

  @override
  bool get isInstance => globalOrInstanceSettingsBloc.isInstance;

  @override
  Stream<bool> get isInstanceStream =>
      globalOrInstanceSettingsBloc.isInstanceStream;
}
