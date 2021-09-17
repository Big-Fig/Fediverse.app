import 'package:fedi/app/settings/settings_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'push_settings_model.g.dart';

@JsonSerializable()
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 47)
class PushSettings extends ISettings<PushSettings> {
  @HiveField(1)
  final bool? favourite;
  @HiveField(2)
  final bool? follow;
  @HiveField(3)
  final bool? mention;
  @HiveField(4)
  final bool? reblog;
  @HiveField(5)
  final bool? poll;
  @HiveField(6)
  final bool? chatMention;
  @HiveField(7)
  final bool? emojiReaction;

  PushSettings({
    required this.favourite,
    required this.follow,
    required this.mention,
    required this.reblog,
    required this.poll,
    required this.chatMention,
    required this.emojiReaction,
  });

  PushSettings.defaultAllEnabled()
      : this(
          favourite: true,
          follow: true,
          mention: true,
          reblog: true,
          poll: true,
          chatMention: true,
          emojiReaction: true,
        );

  PushSettings.defaultAllDisabled()
      : this(
          favourite: false,
          follow: false,
          mention: false,
          reblog: false,
          poll: false,
          chatMention: false,
          emojiReaction: false,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushSettings &&
          runtimeType == other.runtimeType &&
          favourite == other.favourite &&
          follow == other.follow &&
          mention == other.mention &&
          reblog == other.reblog &&
          poll == other.poll &&
          chatMention == other.chatMention &&
          emojiReaction == other.emojiReaction;

  @override
  int get hashCode =>
      favourite.hashCode ^
      follow.hashCode ^
      mention.hashCode ^
      reblog.hashCode ^
      poll.hashCode ^
      chatMention.hashCode ^
      emojiReaction.hashCode;

  @override
  String toString() {
    return 'PushSettings{favourite: $favourite,'
        ' follow: $follow, mention: $mention,'
        ' reblog: $reblog, poll: $poll,'
        ' pleromaChat: $chatMention, emojiReaction: $emojiReaction}';
  }

  static PushSettings fromJson(Map<String, dynamic> json) =>
      _$PushSettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PushSettingsToJson(this);

  // ignore: long-parameter-list
  PushSettings copyWith({
    bool? favourite,
    bool? follow,
    bool? mention,
    bool? reblog,
    bool? poll,
    bool? chatMention,
    bool? emojiReaction,
  }) =>
      PushSettings(
        favourite: favourite ?? this.favourite,
        follow: follow ?? this.follow,
        mention: mention ?? this.mention,
        reblog: reblog ?? this.reblog,
        poll: poll ?? this.poll,
        chatMention: chatMention ?? this.chatMention,
        emojiReaction: emojiReaction ?? this.emojiReaction,
      );

  @override
  PushSettings clone() => copyWith();
}
