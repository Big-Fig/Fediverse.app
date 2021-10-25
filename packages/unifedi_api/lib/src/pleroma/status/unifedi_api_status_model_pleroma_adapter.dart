import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

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
import '../account/unifedi_api_account_model_pleroma_adapter.dart';
import '../application/unifedi_api_application_model_pleroma_adapter.dart';
import '../card/unifedi_api_card_model_pleroma_adapter.dart';
import '../content/variants/unifedi_api_content_variants_model_pleroma_adapter.dart';
import '../emoji/unifedi_api_emoji_model_pleroma_adapter.dart';
import '../media/attachment/unifedi_api_media_attachment_model_pleroma_adapter.dart';
import '../mention/unifedi_api_mention_model_pleroma_adapter.dart';
import '../poll/unifedi_api_poll_model_pleroma_adapter.dart';
import '../tag/unifedi_api_tag_model_pleroma_adapter.dart';
import '../visibility/unifedi_api_visibility_sealed_pleroma_converter.dart';
import 'emoji_reaction/unifedi_api_status_emoji_reaction_model_pleroma_adapter.dart';

part 'unifedi_api_status_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_status_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiStatusPleromaAdapter
    with _$UnifediApiStatusPleromaAdapter
    implements IUnifediApiStatus {
  const UnifediApiStatusPleromaAdapter._();

  const factory UnifediApiStatusPleromaAdapter(
    @HiveField(0) PleromaApiStatus value,
  ) = _UnifediApiStatusPleromaAdapter;

  @override
  IUnifediApiAccount get account =>
      value.account.toUnifediApiAccountPleromaAdapter();

  @override
  IUnifediApiApplication? get application =>
      value.application?.toUnifediApiApplicationPleromaAdapter();

  @override
  bool? get bookmarked => value.bookmarked;

  @override
  IUnifediApiCard? get card => value.card?.toUnifediApiCardPleromaAdapter();

  @override
  String? get content => value.content;

  @override
  IUnifediApiContentVariants? get contentVariants =>
      value.pleroma?.content?.toUnifediApiContentVariantsPleromaAdapter();

  @override
  int? get conversationId => value.pleroma?.conversationId;

  @override
  DateTime get createdAt => value.createdAt;

  @override
  int? get directConversationId => value.pleroma?.directConversationId;

  @override
  List<IUnifediApiEmojiReaction>? get emojiReactions =>
      value.pleroma?.emojiReactions
          ?.toUnifediApiStatusEmojiReactionPleromaAdapterList();

  @override
  List<IUnifediApiEmoji>? get emojis =>
      value.emojis?.toUnifediApiEmojiPleromaAdapterList();

  @override
  DateTime? get expiresAt => value.pleroma?.expiresAt;

  @override
  bool? get favourited => value.favourited;

  @override
  int? get favouritesCount => value.favouritesCount;

  @override
  String get id => value.id;

  @override
  String? get inReplyToAccountAcct => value.pleroma?.inReplyToAccountAcct;

  @override
  String? get inReplyToAccountId => value.inReplyToAccountId;

  @override
  String? get inReplyToId => value.inReplyToId;

  @override
  String? get language => value.language;

  @override
  bool? get local => value.pleroma?.local;

  @override
  List<IUnifediApiMediaAttachment>? get mediaAttachments =>
      value.mediaAttachments?.toUnifediApiMediaAttachmentPleromaAdapterList();

  @override
  List<IUnifediApiMention>? get mentions =>
      value.mentions?.toUnifediApiMentionPleromaAdapterList();

  @override
  bool? get muted => value.muted;

  @override
  bool? get pinned => value.pinned;

  @override
  IUnifediApiPoll? get poll => value.poll?.toUnifediApiPollPleromaAdapter();

  @override
  IUnifediApiStatus? get reblog =>
      value.reblog?.toUnifediApiStatusPleromaAdapter();

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
  IUnifediApiContentVariants? get spoilerTextVariants =>
      value.pleroma?.spoilerText?.toUnifediApiContentVariantsPleromaAdapter();

  @override
  List<IUnifediApiTag>? get tags =>
      value.tags?.toUnifediApiTagPleromaAdapterList();

  @override
  bool? get threadMuted => value.pleroma?.threadMuted;

  @override
  String get uri => value.uri;

  @override
  String? get url => value.url;

  @override
  String get visibility =>
      value.visibilityAsPleromaApi.toUnifediApiVisibility().stringValue;

  factory UnifediApiStatusPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiStatusPleromaAdapterFromJson(json);
}

extension PleromaApiStatusUnifediExtension on IPleromaApiStatus {
  UnifediApiStatusPleromaAdapter toUnifediApiStatusPleromaAdapter() =>
      UnifediApiStatusPleromaAdapter(
        toPleromaApiStatus(),
      );
}

extension PleromaApiStatusUnifediListExtension on List<IPleromaApiStatus> {
  List<UnifediApiStatusPleromaAdapter> toUnifediApiStatusPleromaAdapterList() =>
      map(
        (item) => item.toUnifediApiStatusPleromaAdapter(),
      ).toList();
}
