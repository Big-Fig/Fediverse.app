import 'package:fedi/app/settings/settings_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'push_relay_settings_model.g.dart';

@JsonSerializable()
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 103)
class PushRelaySettings extends ISettings<PushRelaySettings> {
  @HiveField(0)
  @JsonKey(name: 'push_relay_base_url')
  final String pushRelayBaseUrl;

  PushRelaySettings({
    required this.pushRelayBaseUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushRelaySettings &&
          runtimeType == other.runtimeType &&
          pushRelayBaseUrl == other.pushRelayBaseUrl;

  @override
  int get hashCode => pushRelayBaseUrl.hashCode;

  @override
  String toString() => 'PushRelaySettings{'
      'pushRelayBaseUrl: $pushRelayBaseUrl'
      '}';

  static PushRelaySettings fromJson(Map<String, dynamic> json) =>
      _$PushRelaySettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PushRelaySettingsToJson(this);

  PushRelaySettings copyWith({
    String? pushRelayBaseUrl,
  }) =>
      PushRelaySettings(
        pushRelayBaseUrl:
            pushRelayBaseUrl ?? this.pushRelayBaseUrl,
      );

  @override
  PushRelaySettings clone() => copyWith();
}
