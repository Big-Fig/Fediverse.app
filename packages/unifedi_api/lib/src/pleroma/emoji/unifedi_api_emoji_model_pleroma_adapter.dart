import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../api/emoji/unifedi_api_emoji_model.dart';

part 'unifedi_api_emoji_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_emoji_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiEmojiPleromaAdapter
    with _$UnifediApiEmojiPleromaAdapter
    implements IUnifediApiEmoji {
  const UnifediApiEmojiPleromaAdapter._();

  const factory UnifediApiEmojiPleromaAdapter(
    @HiveField(0) PleromaApiEmoji value,
  ) = _UnifediApiEmojiPleromaAdapter;

  @override
  String get name => value.shortcode;

  @override
  String? get staticUrl => value.staticUrl;

  @override
  List<String>? get tags {
    var category = value.category;
    List<String>? tags;

    if (category != null && category.isNotEmpty) {
      tags = [
        category,
      ];
    }

    return tags;
  }

  @override
  String? get url => value.url;

  @override
  bool? get visibleInPicker => value.visibleInPicker;

  factory UnifediApiEmojiPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiEmojiPleromaAdapterFromJson(json);
}

extension PleromaApiEmojiUnifediExtension on IPleromaApiEmoji {
  UnifediApiEmojiPleromaAdapter toUnifediApiEmojiPleromaAdapter() =>
      UnifediApiEmojiPleromaAdapter(
        toPleromaApiEmoji(),
      );
}

extension PleromaApiEmojiUnifediListExtension on List<IPleromaApiEmoji> {
  List<UnifediApiEmojiPleromaAdapter> toUnifediApiEmojiPleromaAdapterList() =>
      map(
        (item) => item.toUnifediApiEmojiPleromaAdapter(),
      ).toList();
}

extension UnifediApiEmojiPleromaExtension on IUnifediApiEmoji {
  PleromaApiEmoji toPleromaApiEmojiPleromaAdapter() => PleromaApiEmoji(
        shortcode: name,
        url: url,
        staticUrl: staticUrl,
        visibleInPicker: visibleInPicker,
        category: tags?.firstOrNull,
      );
}

extension PleromaApiEmojiPleromaListExtension on List<IUnifediApiEmoji> {
  List<PleromaApiEmoji> toPleromaApiEmojiList() => map(
        (item) => item.toPleromaApiEmojiPleromaAdapter(),
      ).toList();
}
