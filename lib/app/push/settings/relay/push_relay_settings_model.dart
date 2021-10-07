import 'package:fedi/app/settings/settings_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'push_relay_settings_model.g.dart';
part 'push_relay_settings_model.freezed.dart';

@freezed
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 103)
class PushRelaySettings
    with _$PushRelaySettings
    implements ISettings<PushRelaySettings> {
  const PushRelaySettings._();
  const factory PushRelaySettings({
    @HiveField(0)
    @JsonKey(name: 'push_relay_base_url')
        required String pushRelayBaseUrl,
  }) = _PushRelaySettings;

  factory PushRelaySettings.fromJson(Map<String, dynamic> json) =>
      _$PushRelaySettingsFromJson(json);

  @override
  PushRelaySettings clone() => copyWith();
}
