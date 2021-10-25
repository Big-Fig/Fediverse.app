import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_emoji_model.dart';

part 'pleroma_api_emoji_model_impl.freezed.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_emoji_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiEmoji with _$PleromaApiEmoji implements IPleromaApiEmoji {
  const factory PleromaApiEmoji({
    @HiveField(0) required String shortcode,
    @HiveField(1) required String? url,
    @HiveField(2) @JsonKey(name: 'static_url') required String? staticUrl,
    @JsonKey(name: 'visible_in_picker')
    @HiveField(3)
        required bool? visibleInPicker,
    @HiveField(4) required String? category,
  }) = _PleromaApiEmoji;

  factory PleromaApiEmoji.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiEmojiFromJson(json);
}

extension PleromaApiEmojiInterfaceExtension on IPleromaApiEmoji {
  PleromaApiEmoji toPleromaApiEmoji({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiEmoji(
          shortcode: shortcode,
          url: url,
          staticUrl: staticUrl,
          visibleInPicker: visibleInPicker,
          category: category,
        ),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiEmojiInterfaceListExtension on List<IPleromaApiEmoji> {
  List<PleromaApiEmoji> toPleromaApiEmojiList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiEmoji item) => item.toPleromaApiEmoji(),
        forceNewObject: forceNewObject,
      );
}
