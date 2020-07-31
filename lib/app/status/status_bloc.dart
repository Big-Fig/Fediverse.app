import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/collapsible/collapsible_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusBloc implements Disposable, ICollapsibleItem {
  static IStatusBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusBloc>(context, listen: listen);

  IStatus get status;

  Stream<IStatus> get statusStream;

  IStatus get reblog;

  Stream<IStatus> get reblogStream;

  IStatus get reblogOrOriginal;

  Stream<IStatus> get reblogOrOriginalStream;

  String get content;

  Stream<String> get contentStream;

  String get contentRawText;

  Stream<String> get contentRawTextStream;

  String get contentWithEmojisWithoutAccount;

  Stream<String> get contentWithEmojisWithoutAccountStream;

  String get contentWithEmojis;

  Stream<String> get contentWithEmojisStream;

  IPleromaCard get card;

  Stream<IPleromaCard> get cardStream;

  IPleromaCard get reblogOrOriginalCard;

  Stream<IPleromaCard> get reblogOrOriginalCardStream;

  IAccount get account;

  Stream<IAccount> get accountStream;

  IAccount get reblogOrOriginalAccount;

  Stream<IAccount> get reblogOrOriginalAccountStream;

  DateTime get createdAt;

  Stream<DateTime> get createdAtStream;

  bool get isReply => status.isReply;

  bool get isHaveReblog => status.isHaveReblog;

  String get remoteId;

  List<IPleromaMediaAttachment> get mediaAttachments;

  Stream<List<IPleromaMediaAttachment>> get mediaAttachmentsStream;

  List<IPleromaStatusEmojiReaction> get pleromaEmojiReactions;

  Stream<List<IPleromaStatusEmojiReaction>> get pleromaEmojiReactionsStream;

  int get pleromaEmojiReactionsCount;

  Stream<int> get pleromaEmojiReactionsCountStream;

  List<IPleromaStatusEmojiReaction> get reblogPlusOriginalPleromaEmojiReactions;

  Stream<List<IPleromaStatusEmojiReaction>>
      get reblogPlusOriginalEmojiReactionsStream;

  int get reblogPlusOriginalEmojiReactionsCount;

  Stream<int> get reblogPlusOriginalEmojiReactionsCountStream;

  String get accountAvatar;

  Stream<String> get accountAvatarStream;

  bool get favourited;

  Stream<bool> get favouritedStream;

  List<IPleromaMention> get mentions;

  Stream<List<IPleromaMention>> get mentionsStream;

  bool get reblogged;

  Stream<bool> get rebloggedStream;

  bool get bookmarked;

  Stream<bool> get bookmarkedStream;

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

  String get spoilerText;

  Stream<String> get spoilerTextStream;

  String get spoilerTextWithEmojis;

  Stream<String> get spoilerTextWithEmojisStream;

  bool get nsfwSensitive;

  Stream<bool> get nsfwSensitiveStream;

  bool get nsfwSensitiveAndDisplayNsfwContentEnabled;

  Stream<bool> get nsfwSensitiveAndDisplayNsfwContentEnabledStream;

  bool get containsSpoiler;

  Stream<bool> get containsSpoilerStream;

  bool get containsSpoilerAndDisplaySpoilerContentEnabled;

  Stream<bool> get containsSpoilerAndDisplaySpoilerContentEnabledStream;

  void changeDisplayNsfwSensitive(bool display);

  void changeDisplaySpoiler(bool display);

  Future refreshFromNetwork();

  Future<IAccount> loadAccountByMentionUrl({@required String url});

  Future<IAccount> getInReplyToAccount();

  Stream<IAccount> watchInReplyToAccount();

  Future<IStatus> getInReplyToStatus();

  Stream<IStatus> watchInReplyToStatus();

  Future<IStatus> toggleReblog();

  Future<IStatus> toggleFavourite();

  Future<IStatus> toggleMute();

  Future<IStatus> toggleBookmark();

  Future<IStatus> togglePin();

  Future<IPleromaStatus> toggleEmojiReaction({@required String emoji});
}
