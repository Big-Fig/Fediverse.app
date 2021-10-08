import 'package:fedi/app/settings/settings_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'push_settings_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'push_settings_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 47)
@freezed
class PushSettings with _$PushSettings implements ISettings<PushSettings> {
  const PushSettings._();
  const factory PushSettings({
    @HiveField(1) required bool? favourite,
    @HiveField(2) required bool? follow,
    @HiveField(3) required bool? mention,
    @HiveField(4) required bool? reblog,
    @HiveField(5) required bool? poll,
    @HiveField(6) required bool? chatMention,
    @HiveField(7) required bool? emojiReaction,
  }) = _PushSettings;

  static PushSettings defaultAllEnabled() => PushSettings(
        favourite: true,
        follow: true,
        mention: true,
        reblog: true,
        poll: true,
        chatMention: true,
        emojiReaction: true,
      );

  static PushSettings defaultAllDisabled() => PushSettings(
        favourite: false,
        follow: false,
        mention: false,
        reblog: false,
        poll: false,
        chatMention: false,
        emojiReaction: false,
      );

  factory PushSettings.fromJson(Map<String, dynamic> json) =>
      _$PushSettingsFromJson(json);
}
