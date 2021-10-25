import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../api/account/unifedi_api_account_model.dart';
import '../../api/application/unifedi_api_application_model.dart';
import '../../api/card/unifedi_api_card_model.dart';
import '../../api/content/variants/unifedi_api_content_variants_model.dart';
import '../../api/emoji/reaction/unifedi_api_emoji_reaction_model.dart';
import '../../api/emoji/unifedi_api_emoji_model.dart';
import '../../api/media/attachment/unifedi_api_media_attachment_model.dart';
import '../../api/mention/unifedi_api_mention_model.dart';
import '../../api/poll/unifedi_api_poll_model.dart';
import '../../api/status/unifedi_api_status_model.dart';
import '../../api/tag/unifedi_api_tag_model.dart';
import '../account/unifedi_api_account_model_mastodon_adapter.dart';
import '../application/unifedi_api_application_model_mastodon_adapter.dart';
import '../card/unifedi_api_card_model_mastodon_adapter.dart';
import '../emoji/unifedi_api_emoji_model_mastodon_adapter.dart';
import '../media/attachment/unifedi_api_media_attachment_model_mastodon_adapter.dart';
import '../mention/unifedi_api_mention_model_mastodon_adapter.dart';
import '../poll/unifedi_api_poll_model_mastodon_adapter.dart';
import '../tag/unifedi_api_tag_model_mastodon_adapter.dart';
import '../visibility/unifedi_api_visibility_sealed_mastodon_converter.dart';

part 'unifedi_api_status_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_status_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiStatusMastodonAdapter
    with _$UnifediApiStatusMastodonAdapter
    implements IUnifediApiStatus {
  const UnifediApiStatusMastodonAdapter._();
  const factory UnifediApiStatusMastodonAdapter(
    @HiveField(0) MastodonApiStatus value,
  ) = _UnifediApiStatusMastodonAdapter;

  @override
  IUnifediApiAccount get account =>
      value.account.toUnifediApiAccountMastodonAdapter();

  @override
  IUnifediApiApplication? get application =>
      value.application?.toUnifediApiApplicationMastodonAdapter();

  @override
  bool? get bookmarked => value.bookmarked;

  @override
  IUnifediApiCard? get card => value.card?.toUnifediApiCardMastodonAdapter();

  @override
  String? get content => value.content;

  @override
  IUnifediApiContentVariants? get contentVariants => null;

  @override
  int? get conversationId => null;

  @override
  DateTime get createdAt => value.createdAt;

  @override
  int? get directConversationId => null;

  @override
  List<IUnifediApiEmojiReaction>? get emojiReactions => null;

  @override
  List<IUnifediApiEmoji>? get emojis =>
      value.emojis?.toUnifediApiEmojiMastodonAdapterList();

  @override
  DateTime? get expiresAt => null;

  @override
  bool? get favourited => value.favourited;

  @override
  int? get favouritesCount => value.favouritesCount;

  @override
  String get id => value.id;

  @override
  String? get inReplyToAccountAcct => null;

  @override
  String? get inReplyToAccountId => value.inReplyToAccountId;

  @override
  String? get inReplyToId => value.inReplyToId;

  @override
  String? get language => value.language;

  @override
  bool? get local => null;

  @override
  List<IUnifediApiMediaAttachment>? get mediaAttachments =>
      value.mediaAttachments?.toUnifediApiMediaAttachmentMastodonAdapterList();

  @override
  List<IUnifediApiMention>? get mentions =>
      value.mentions?.toUnifediApiMentionMastodonAdapterList();

  @override
  bool? get muted => value.muted;

  @override
  bool? get pinned => value.pinned;

  @override
  IUnifediApiPoll? get poll => value.poll?.toUnifediApiPollMastodonAdapter();

  @override
  IUnifediApiStatus? get reblog =>
      value.reblog?.toUnifediApiStatusMastodonAdapter();

  @override
  bool? get reblogged => value.reblogged;

  @override
  int? get reblogsCount => value.reblogsCount;

  @override
  int? get repliesCount => value.repliesCount;

  @override
  bool get sensitive => value.sensitive;

  @override
  String? get spoilerText => value.spoilerText;

  @override
  IUnifediApiContentVariants? get spoilerTextVariants => null;

  @override
  List<IUnifediApiTag>? get tags =>
      value.tags?.toUnifediApiTagMastodonAdapterList();

  @override
  bool? get threadMuted => null;

  @override
  String get uri => value.uri;

  @override
  String? get url => value.url;

  @override
  String get visibility =>
      value.visibilityAsMastodonApi.toUnifediApiVisibility().stringValue;
  factory UnifediApiStatusMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiStatusMastodonAdapterFromJson(json);
}

extension MastodonApiStatusUnifediExtension on IMastodonApiStatus {
  UnifediApiStatusMastodonAdapter toUnifediApiStatusMastodonAdapter() =>
      UnifediApiStatusMastodonAdapter(
        toMastodonApiStatus(),
      );
}

extension MastodonApiStatusUnifediListExtension on List<IMastodonApiStatus> {
  List<UnifediApiStatusMastodonAdapter>
      toUnifediApiStatusMastodonAdapterList() => map(
            (item) => item.toUnifediApiStatusMastodonAdapter(),
          ).toList();
}
