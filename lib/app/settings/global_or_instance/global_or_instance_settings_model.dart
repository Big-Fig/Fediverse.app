

enum GlobalOrInstanceSettingsType { instance, global }

class GlobalOrInstanceSettings<T> {
  final T settings;
  final GlobalOrInstanceSettingsType type;

  bool get isInstance => type == GlobalOrInstanceSettingsType.instance;

  bool get isGlobal => type == GlobalOrInstanceSettingsType.global;

  GlobalOrInstanceSettings({
    required this.settings,
    required this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlobalOrInstanceSettings &&
          runtimeType == other.runtimeType &&
          settings == other.settings &&
          type == other.type;

  @override
  int get hashCode => settings.hashCode ^ type.hashCode;

  @override
  String toString() {
    return 'GlobalOrInstanceSettings{settings: $settings, type: $type}';
  }
}
