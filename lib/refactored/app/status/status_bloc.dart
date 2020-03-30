import 'package:fedi/refactored/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/refactored/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusBloc implements Disposable {
  static IStatusBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusBloc>(context, listen: listen);

  Future<IAccount> loadReblogOrOriginalAccount();

  IStatus get status;

  Stream<String> get contentStream;

  String get content;

  Stream<String> get contentWithEmojisWithoutAccountStream;

  String get contentWithEmojisWithoutAccount;

  Stream<String> get contentWithEmojisStream;

  IPleromaCard get card;

  Stream<IPleromaCard> get cardStream;

  String get contentWithEmojis;

  Stream<IStatus> get statusStream;

  IAccount get account;

  Stream<IAccount> get accountStream;

  DateTime get createdAt;

  Stream<DateTime> get createdAtStream;

  bool get isHaveInReplyToAccount;

  Stream<bool> get isHaveInReplyToAccountStream;

  Future<IAccount> loadInReplyToAccount();

  Stream<IAccount> watchInReplyToAccount();

  Future<List<IAccount>> loadFavouritedByAccounts();

  Future<List<IAccount>> loadRebloggedByAccounts();

  bool get isHaveReblog;

  Stream<bool> get isHaveReblogStream;

  Future<IStatus> loadRebloggedStatus();

  Stream<IStatus> watchRebloggedStatus();

  Future<IAccount> findMentionAccountByUrl({@required String url});

  bool get isFromMyAccount;

  String get remoteId;

  List<IPleromaMediaAttachment> get mediaAttachments;

  Stream<List<IPleromaMediaAttachment>> get mediaAttachmentsStream;

  List<IPleromaStatusEmojiReaction> get emojiReactions;

  Stream<List<IPleromaStatusEmojiReaction>> get emojiReactionsStream;

  Future updateFromNetwork();

  String get accountAvatar;

  Stream<String> get accountAvatarStream;

  bool get favourited;

  Stream<bool> get favouritedStream;

  List<IPleromaMention> get mentions;

  Stream<List<IPleromaMention>> get mentionsStream;

  bool get reblogged;

  Stream<bool> get rebloggedStream;

  int get favouritesCount;

  Stream<int> get favouritesCountStream;

  int get reblogsCount;

  Stream<int> get reblogsCountStream;

  int get repliesCount;

  Stream<int> get repliesCountStream;

  Future<IStatus> requestToggleReblog();

  Future<IStatus> requestToggleFavourite();

  Future<IStatus> requestToggleMute();

  Future<IStatus> requestToggleBookmark();

  Future<IStatus> requestTogglePin();

  Future<IPleromaStatus> requestToggleEmojiReaction(
      {@required String emoji});
}
