import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../api/emoji/unifedi_api_emoji_model.dart';

part 'unifedi_api_emoji_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_emoji_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiEmojiMastodonAdapter
    with _$UnifediApiEmojiMastodonAdapter
    implements IUnifediApiEmoji {
  const UnifediApiEmojiMastodonAdapter._();

  const factory UnifediApiEmojiMastodonAdapter(
    @HiveField(0) MastodonApiEmoji value,
  ) = _UnifediApiEmojiMastodonAdapter;

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

  factory UnifediApiEmojiMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiEmojiMastodonAdapterFromJson(json);
}

extension MastodonApiEmojiUnifediExtension on IMastodonApiEmoji {
  UnifediApiEmojiMastodonAdapter toUnifediApiEmojiMastodonAdapter() =>
      UnifediApiEmojiMastodonAdapter(
        toMastodonApiEmoji(),
      );
}

extension MastodonApiEmojiUnifediListExtension on List<IMastodonApiEmoji> {
  List<UnifediApiEmojiMastodonAdapter> toUnifediApiEmojiMastodonAdapterList() =>
      map(
        (item) => item.toUnifediApiEmojiMastodonAdapter(),
      ).toList();
}

extension UnifediApiEmojiMastodonExtension on IUnifediApiEmoji {
  MastodonApiEmoji toMastodonApiEmojiMastodonAdapter() => MastodonApiEmoji(
        shortcode: name,
        url: url,
        staticUrl: staticUrl,
        visibleInPicker: visibleInPicker,
        category: tags?.firstOrNull,
      );
}

extension MastodonApiEmojiMastodonListExtension on List<IUnifediApiEmoji> {
  List<MastodonApiEmoji> toMastodonApiEmojiList() => map(
        (item) => item.toMastodonApiEmojiMastodonAdapter(),
      ).toList();
}
