import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_emoji_model.dart';

// ignore_for_file: no-magic-number
part 'mastodon_api_emoji_model_impl.freezed.dart';

part 'mastodon_api_emoji_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiEmoji with _$MastodonApiEmoji implements IMastodonApiEmoji {
  const factory MastodonApiEmoji({
    @HiveField(0) required String shortcode,
    @HiveField(1) required String? url,
    @HiveField(2) @JsonKey(name: 'static_url') required String? staticUrl,
    @JsonKey(name: 'visible_in_picker')
    @HiveField(3)
        required bool? visibleInPicker,
    @override @HiveField(4) required String? category,
  }) = _MastodonApiEmoji;

  factory MastodonApiEmoji.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiEmojiFromJson(json);
}

extension MastodonApiEmojiInterfaceExtension on IMastodonApiEmoji {
  MastodonApiEmoji toMastodonApiEmoji({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiEmoji(
          shortcode: shortcode,
          url: url,
          staticUrl: staticUrl,
          visibleInPicker: visibleInPicker,
          category: category,
        ),
        forceNewObject: forceNewObject,
      );
}

extension MastodonApiEmojiInterfaceListExtension on List<IMastodonApiEmoji> {
  List<MastodonApiEmoji> toMastodonApiEmojiList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiEmoji item) => item.toMastodonApiEmoji(),
        forceNewObject: forceNewObject,
      );
}
