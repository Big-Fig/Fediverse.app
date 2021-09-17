import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:fedi/app/poll/poll_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:unifedi_api/unifedi_api.dart';
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

  IUnifediApiCard? get card;

  Stream<IUnifediApiCard?> get cardStream;

  IUnifediApiCard? get reblogOrOriginalCard;

  Stream<IUnifediApiCard?> get reblogOrOriginalCardStream;

  IAccount get account;

  Stream<IAccount> get accountStream;

  IAccount get reblogOrOriginalAccount;

  Stream<IAccount> get reblogOrOriginalAccountStream;

  DateTime get createdAt;

  Stream<DateTime> get createdAtStream;

  String? get remoteId;

  List<IUnifediApiMediaAttachment>? get mediaAttachments;

  Stream<List<IUnifediApiMediaAttachment>?> get mediaAttachmentsStream;

  List<IUnifediApiMediaAttachment>? get reblogOrOriginalMediaAttachments;

  Stream<List<IUnifediApiMediaAttachment>?>
      get reblogOrOriginalMediaAttachmentsStream;

  IUnifediApiPoll? get poll;

  Stream<IUnifediApiPoll?> get pollStream;

  IPollBloc get pollBloc;

  List<IUnifediApiEmojiReaction>? get emojiReactions;

  Stream<List<IUnifediApiEmojiReaction>?> get emojiReactionsStream;

  int? get emojiReactionsCount;

  Stream<int?> get emojiReactionsCountStream;

  List<IUnifediApiEmojiReaction>?
      get reblogPlusOriginalEmojiReactions;

  Stream<List<IUnifediApiEmojiReaction>?>
      get reblogPlusOriginalEmojiReactionsStream;

  int? get reblogPlusOriginalEmojiReactionsCount;

  Stream<int?> get reblogPlusOriginalEmojiReactionsCountStream;

  String get accountAvatar;

  Stream<String> get accountAvatarStream;

  bool get favourited;

  Stream<bool> get favouritedStream;

  List<IUnifediApiMention>? get mentions;

  Stream<List<IUnifediApiMention>?> get mentionsStream;

  List<IUnifediApiMention>? get reblogOrOriginalMentions;

  List<IUnifediApiTag>? get tags;

  List<IUnifediApiTag>? get reblogOrOriginalTags;

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

  Future<IUnifediApiStatus> toggleEmojiReaction({
    required String emoji,
  });

  Future<IStatus> onPollUpdated(
    IUnifediApiPoll poll,
  );

  bool get deleted;

  Stream<bool> get deletedStream;
}

extension IStatusBlocExtension on IStatusBloc {
  bool get isHaveTextContent => content?.isNotEmpty == true;

  bool get isReply => status.isReply;

  bool get isHaveReblog => status.isHaveReblog;
}
