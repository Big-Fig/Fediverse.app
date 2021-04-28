import 'package:fedi/app/settings/settings_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'media_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 88)
class MediaSettings implements IJsonObject, ISettings<MediaSettings> {
  @HiveField(0)
  @JsonKey(name: "auto_init")
  final bool autoInit;
  @HiveField(1)
  @JsonKey(name: "auto_play")
  final bool autoPlay;

  const MediaSettings({
    required this.autoInit,
    required this.autoPlay,
  });

  static MediaSettings fromJson(Map<String, dynamic> json) =>
      _$MediaSettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MediaSettingsToJson(this);

  @override
  MediaSettings clone() => copyWith();

  MediaSettings copyWith({
    bool? autoInit,
    bool? autoPlay,
  }) =>
      MediaSettings(
        autoInit: autoInit ?? this.autoInit,
        autoPlay: autoPlay ?? this.autoPlay,
      );

  @override
  String toString() {
    return 'MediaSettings{'
        'autoInit: $autoInit, '
        'autoPlay: $autoPlay'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaSettings &&
          runtimeType == other.runtimeType &&
          autoInit == other.autoInit &&
          autoPlay == other.autoPlay;

  @override
  int get hashCode => autoInit.hashCode ^ autoPlay.hashCode;
}
