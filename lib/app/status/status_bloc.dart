import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:fedi/app/poll/poll_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/pleroma/api/card/pleroma_api_card_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/mention/pleroma_api_mention_model.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusBloc implements IDisposable, IInstanceLocationBloc {
  static IStatusBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusBloc>(context, listen: listen);

  bool get isPleroma;

  IStatus get status;

  Stream<IStatus> get statusStream;

  IStatus? get reblog;

  Stream<IStatus?> get reblogStream;

  IStatus get reblogOrOriginal;

  Stream<IStatus> get reblogOrOriginalStream;

  String? get content;

  Stream<String?> get contentStream;

  String? get contentRawText;

  Stream<String?> get contentRawTextStream;

  EmojiText? get contentWithEmojis;

  Stream<EmojiText?> get contentWithEmojisStream;

  IPleromaApiCard? get card;

  Stream<IPleromaApiCard?> get cardStream;

  IPleromaApiCard? get reblogOrOriginalCard;

  Stream<IPleromaApiCard?> get reblogOrOriginalCardStream;

  IAccount get account;

  Stream<IAccount> get accountStream;

  IAccount get reblogOrOriginalAccount;

  Stream<IAccount> get reblogOrOriginalAccountStream;

  DateTime get createdAt;

  Stream<DateTime> get createdAtStream;

  String? get remoteId;

  List<IPleromaApiMediaAttachment>? get mediaAttachments;

  Stream<List<IPleromaApiMediaAttachment>?> get mediaAttachmentsStream;

  List<IPleromaApiMediaAttachment>? get reblogOrOriginalMediaAttachments;

  Stream<List<IPleromaApiMediaAttachment>?>
      get reblogOrOriginalMediaAttachmentsStream;

  IPleromaApiPoll? get poll;

  Stream<IPleromaApiPoll?> get pollStream;

  IPollBloc get pollBloc;

  List<IPleromaApiStatusEmojiReaction>? get pleromaEmojiReactions;

  Stream<List<IPleromaApiStatusEmojiReaction>?> get pleromaEmojiReactionsStream;

  int? get pleromaEmojiReactionsCount;

  Stream<int?> get pleromaEmojiReactionsCountStream;

  List<IPleromaApiStatusEmojiReaction>?
      get reblogPlusOriginalPleromaEmojiReactions;

  Stream<List<IPleromaApiStatusEmojiReaction>?>
      get reblogPlusOriginalEmojiReactionsStream;

  int? get reblogPlusOriginalEmojiReactionsCount;

  Stream<int?> get reblogPlusOriginalEmojiReactionsCountStream;

  String get accountAvatar;

  Stream<String> get accountAvatarStream;

  bool get favourited;

  Stream<bool> get favouritedStream;

  List<IPleromaApiMention>? get mentions;

  Stream<List<IPleromaApiMention>?> get mentionsStream;

  List<IPleromaApiMention>? get reblogOrOriginalMentions;

  List<IPleromaApiTag>? get tags;

  List<IPleromaApiTag>? get reblogOrOriginalTags;

  bool get reblogged;

  Stream<bool> get rebloggedStream;

  bool? get bookmarked;

  Stream<bool?> get bookmarkedStream;

  bool get muted;

  Stream<bool> get mutedStream;

  bool get pinned;

  Stream<bool> get pinnedStream;

  int get favouritesCount;

  Stream<int> get favouritesCountStream;

  int get reblogPlusOriginalFavouritesCount;

  Stream<int> get reblogPlusOriginalFavouritesCountStream;

  int get reblogsCount;

  Stream<int> get reblogsCountStream;

  int get reblogPlusOriginalReblogsCount;

  Stream<int> get reblogPlusOriginalReblogsCountStream;

  int get repliesCount;

  Stream<int> get repliesCountStream;

  String? get reblogOrOriginalSpoilerText;

  Stream<String?> get reblogOrOriginalSpoilerTextStream;

  EmojiText? get spoilerTextWithEmojis;

  Stream<EmojiText?> get spoilerTextWithEmojisStream;

  bool get nsfwSensitive;

  Stream<bool> get nsfwSensitiveStream;

  bool get containsSpoiler;

  Stream<bool> get containsSpoilerStream;

  Future refreshFromNetwork();

  Future<IAccount?> loadAccountByMentionUrl({
    required String url,
  });

  Future<IHashtag?> loadHashtagByUrl({
    required String url,
  });

  Future<IAccount?> getInReplyToAccount();

  Stream<IAccount?> watchInReplyToAccount();

  Future<IStatus?> getInReplyToStatus();

  Stream<IStatus?> watchInReplyToStatus();

  Future<IStatus> toggleReblog();

  Future<IStatus> toggleFavourite();

  Future<IStatus> mute({
    required Duration? duration,
  });

  Future<IStatus> toggleMute({
    required Duration? duration,
  });

  Future<IStatus> toggleBookmark();

  Future<IStatus> togglePin();

  Future delete();

  Future<IPleromaApiStatus> toggleEmojiReaction({
    required String emoji,
  });

  Future<IStatus> onPollUpdated(
    IPleromaApiPoll poll,
  );

  bool get deleted;

  Stream<bool> get deletedStream;
}

extension IStatusBlocExtension on IStatusBloc {
  bool get isHaveTextContent => content?.isNotEmpty == true;

  bool get isReply => status.isReply;

  bool get isHaveReblog => status.isHaveReblog;
}
