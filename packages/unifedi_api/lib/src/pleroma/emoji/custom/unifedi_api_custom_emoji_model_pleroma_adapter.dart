import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/emoji/unifedi_api_emoji_model.dart';

part 'unifedi_api_custom_emoji_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_custom_emoji_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiCustomEmojiPleromaAdapter
    with _$UnifediApiCustomEmojiPleromaAdapter
    implements IUnifediApiEmoji {
  const UnifediApiCustomEmojiPleromaAdapter._();
  const factory UnifediApiCustomEmojiPleromaAdapter(
    @HiveField(0) PleromaApiCustomEmoji value,
  ) = _UnifediApiCustomEmojiPleromaAdapter;

  @override
  String get name => value.name;

  @override
  String? get staticUrl => null;

  @override
  List<String>? get tags => value.tags;

  @override
  String? get url => value.imageUrl;

  @override
  bool? get visibleInPicker => null;
  factory UnifediApiCustomEmojiPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiCustomEmojiPleromaAdapterFromJson(json);
}

extension PleromaApiCustomEmojiUnifediExtension on IPleromaApiCustomEmoji {
  UnifediApiCustomEmojiPleromaAdapter toUnifediApiCustomEmojiPleromaAdapter() =>
      UnifediApiCustomEmojiPleromaAdapter(
        toPleromaApiCustomEmoji(),
      );
}

extension PleromaApiCustomEmojiUnifediListExtension
    on List<IPleromaApiCustomEmoji> {
  List<UnifediApiCustomEmojiPleromaAdapter>
      toUnifediApiCustomEmojiPleromaAdapterList() => map(
            (item) => item.toUnifediApiCustomEmojiPleromaAdapter(),
          ).toList();
}
