import 'package:mastodon_api/mastodon_api.dart';

import '../account/pleroma_api_account_model.dart';
import '../application/pleroma_api_application_model.dart';
import '../card/pleroma_api_card_model.dart';
import '../content/variants/pleroma_api_content_variants_model.dart';
import '../emoji/pleroma_api_emoji_model.dart';
import '../media/attachment/pleroma_api_media_attachment_model.dart';
import '../mention/pleroma_api_mention_model.dart';
import '../pleroma_api_model.dart';
import '../poll/pleroma_api_poll_model.dart';
import '../tag/pleroma_api_tag_model.dart';
import '../visibility/pleroma_api_visibility_sealed.dart';
import 'emoji_reaction/pleroma_api_status_emoji_reaction_model.dart';

abstract class IPleromaApiStatus
    implements IMastodonApiStatus, IPleromaApiResponse {
  @override
  IPleromaApiApplication? get application;

  @override
  IPleromaApiAccount get account;

  @override
  List<IPleromaApiMediaAttachment>? get mediaAttachments;

  @override
  List<IPleromaApiMention>? get mentions;

  @override
  List<IPleromaApiTag>? get tags;

  @override
  List<IPleromaApiEmoji>? get emojis;

  @override
  IPleromaApiPoll? get poll;

  @override
  IPleromaApiCard? get card;

  @override
  IPleromaApiStatus? get reblog;

  IPleromaApiStatusPleromaPart? get pleroma;
}

abstract class IPleromaApiStatusPleromaPart implements IPleromaApiResponsePart {
  /// a map consisting of alternate representations of the content property with
  /// the key being it's mimetype.
  /// Currently the only alternate representation supported is text/plain
  IPleromaApiContentVariants? get content;

  /// the ID of the AP context the status is associated with (if any)
  int? get conversationId;

  /// the ID of the Mastodon direct message conversation the status
  /// is associated with (if any)
  int? get directConversationId;

  /// the acct property of User entity for replied user (if any)
  String? get inReplyToAccountAcct;

  bool? get local;

  /// a map consisting of alternate representations of the spoiler_text property
  /// with the key being it's mimetype. Currently the only alternate
  /// representation supported is text/plain
  IPleromaApiContentVariants? get spoilerText;

  /// a datetime (iso8601) that states when
  /// the post will expire (be deleted automatically),
  /// or empty if the post wont expire

  ///  will be resolved
  DateTime? get expiresAt;

  bool? get threadMuted;

  /// A list with emoji / reaction maps. The format is
  /// {name: '☕', count: 1, me: true}.
  /// Contains no information about the reacting users,
  /// for that use the /statuses/:id/reactions endpoint.
  List<IPleromaApiStatusEmojiReaction>? get emojiReactions;
}

extension IPleromaApiStatusVisibilityExtension on IPleromaApiStatus {
  PleromaApiVisibility get visibilityAsPleromaApi =>
      visibility.toPleromaApiVisibility();
}
