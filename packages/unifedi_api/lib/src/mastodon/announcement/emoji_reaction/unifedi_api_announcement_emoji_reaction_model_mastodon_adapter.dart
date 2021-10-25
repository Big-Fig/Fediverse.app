import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/account/unifedi_api_account_model.dart';
import '../../../api/emoji/reaction/unifedi_api_emoji_reaction_model.dart';

part 'unifedi_api_announcement_emoji_reaction_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_announcement_emoji_reaction_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiAnnouncementEmojiReactionMastodonAdapter
    with _$UnifediApiAnnouncementEmojiReactionMastodonAdapter
    implements IUnifediApiEmojiReaction {
  const UnifediApiAnnouncementEmojiReactionMastodonAdapter._();
  const factory UnifediApiAnnouncementEmojiReactionMastodonAdapter(
    @HiveField(0) MastodonApiAnnouncementEmojiReaction value,
  ) = _UnifediApiAnnouncementEmojiReactionMastodonAdapter;

  @override
  List<IUnifediApiAccount>? get accounts => null;

  @override
  int get count => value.count;

  @override
  bool get me => value.me;

  @override
  String get name => value.name;

  @override
  String? get staticUrl => value.staticUrl;

  @override
  String? get url => value.url;
  factory UnifediApiAnnouncementEmojiReactionMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiAnnouncementEmojiReactionMastodonAdapterFromJson(json);
}

extension MastodonApiAnnouncementEmojiReactionUnifediExtension
    on IMastodonApiAnnouncementEmojiReaction {
  UnifediApiAnnouncementEmojiReactionMastodonAdapter
      toUnifediApiAnnouncementEmojiReactionMastodonAdapter() =>
          UnifediApiAnnouncementEmojiReactionMastodonAdapter(
            toMastodonApiAnnouncementEmojiReaction(),
          );
}

extension MastodonApiAnnouncementEmojiReactionUnifediListExtension
    on List<IMastodonApiAnnouncementEmojiReaction> {
  List<UnifediApiAnnouncementEmojiReactionMastodonAdapter>
      toUnifediApiAnnouncementEmojiReactionMastodonAdapterList() => map(
            (item) =>
                item.toUnifediApiAnnouncementEmojiReactionMastodonAdapter(),
          ).toList();
}
