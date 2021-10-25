import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_custom_emoji_model.dart';

part 'pleroma_api_custom_emoji_model_impl.freezed.dart';

part 'pleroma_api_custom_emoji_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class PleromaApiCustomEmoji
    with _$PleromaApiCustomEmoji
    implements IPleromaApiCustomEmoji {
  const factory PleromaApiCustomEmoji({
    @HiveField(0) required List<String>? tags,
    @HiveField(1) @JsonKey(name: 'image_url') required String imageUrl,
    @HiveField(2) required String name,
  }) = _PleromaApiCustomEmoji;

  factory PleromaApiCustomEmoji.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiCustomEmojiFromJson(json);
}

extension PleromaApiCustomEmojiInterfaceExtension on IPleromaApiCustomEmoji {
  PleromaApiCustomEmoji toPleromaApiCustomEmoji({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiCustomEmoji(
          tags: tags,
          imageUrl: imageUrl,
          name: name,
        ),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiCustomEmojiInterfaceListExtension
    on List<IPleromaApiCustomEmoji> {
  List<PleromaApiCustomEmoji> toPleromaApiCustomEmojiList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiCustomEmoji item) => item.toPleromaApiCustomEmoji(),
        forceNewObject: forceNewObject,
      );
}
