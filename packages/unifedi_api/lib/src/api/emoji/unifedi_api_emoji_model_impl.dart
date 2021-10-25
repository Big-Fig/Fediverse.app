import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_emoji_model.dart';

part 'unifedi_api_emoji_model_impl.freezed.dart';

// ignore_for_file: no-magic-number
part 'unifedi_api_emoji_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiEmoji with _$UnifediApiEmoji implements IUnifediApiEmoji {
  const factory UnifediApiEmoji({
    @HiveField(0) required String name,
    @HiveField(1) required String? url,
    @HiveField(2) @JsonKey(name: 'static_url') required String? staticUrl,
    @JsonKey(name: 'visible_in_picker')
    @HiveField(3)
        required bool? visibleInPicker,
    @HiveField(4) required List<String>? tags,
  }) = _UnifediApiEmoji;

  factory UnifediApiEmoji.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiEmojiFromJson(json);
}

extension UnifediApiEmojiInterfaceExtension on IUnifediApiEmoji {
  UnifediApiEmoji toUnifediApiEmoji({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiEmoji(
          name: name,
          url: url,
          staticUrl: staticUrl,
          visibleInPicker: visibleInPicker,
          tags: tags,
        ),
        forceNewObject: forceNewObject,
      );
}

extension UnifediApiEmojiInterfaceListExtension on List<IUnifediApiEmoji> {
  List<UnifediApiEmoji> toUnifediApiEmojiList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiEmoji item) => item.toUnifediApiEmoji(),
        forceNewObject: forceNewObject,
      );
}
