import '../account/unifedi_api_account_model.dart';
import '../application/unifedi_api_application_model.dart';
import '../card/unifedi_api_card_model.dart';
import '../content/variants/unifedi_api_content_variants_model.dart';
import '../emoji/reaction/unifedi_api_emoji_reaction_model.dart';
import '../emoji/unifedi_api_emoji_model.dart';
import '../media/attachment/unifedi_api_media_attachment_model.dart';
import '../mention/unifedi_api_mention_model.dart';
import '../poll/unifedi_api_poll_model.dart';
import '../tag/unifedi_api_tag_model.dart';
import '../unifedi_api_model.dart';
import '../visibility/unifedi_api_visibility_sealed.dart';

abstract class IUnifediApiStatus implements IUnifediApiResponse {
  String get id;

  DateTime get createdAt;

  String? get inReplyToId;

  String? get inReplyToAccountId;

  bool get sensitive;

  String? get spoilerText;

  String get visibility;

  String get uri;

  String? get url;

  int? get repliesCount;

  int? get reblogsCount;

  int? get favouritesCount;

  bool? get favourited;

  bool? get reblogged;

  bool? get muted;

  bool? get bookmarked;

  bool? get pinned;

  String? get content;

  IUnifediApiStatus? get reblog;

  IUnifediApiApplication? get application;

  IUnifediApiAccount get account;

  List<IUnifediApiMediaAttachment>? get mediaAttachments;

  List<IUnifediApiMention>? get mentions;

  List<IUnifediApiTag>? get tags;

  List<IUnifediApiEmoji>? get emojis;

  IUnifediApiPoll? get poll;

  IUnifediApiCard? get card;

  String? get language;

  IUnifediApiContentVariants? get contentVariants;

  int? get conversationId;

  int? get directConversationId;

  String? get inReplyToAccountAcct;

  bool? get local;

  IUnifediApiContentVariants? get spoilerTextVariants;

  DateTime? get expiresAt;

  bool? get threadMuted;

  List<IUnifediApiEmojiReaction>? get emojiReactions;
}

extension IUnifediApiStatusExtension on IUnifediApiStatus {
  UnifediApiVisibility get visibilityAsUnifediApi =>
      UnifediApiVisibility.fromStringValue(visibility);
}
