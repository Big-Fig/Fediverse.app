import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_or_instance_settings_model.freezed.dart';

enum GlobalOrInstanceSettingsType { instance, global }

@freezed
class GlobalOrInstanceSettings<T> with _$GlobalOrInstanceSettings<T> {
  bool get isInstance => type == GlobalOrInstanceSettingsType.instance;

  bool get isGlobal => type == GlobalOrInstanceSettingsType.global;

  const GlobalOrInstanceSettings._();

  const factory GlobalOrInstanceSettings({
    required T settings,
    required GlobalOrInstanceSettingsType type,
  }) = _GlobalOrInstanceSettings<T>;
}
