import 'package:collection/collection.dart' show IterableExtension;
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/hashtag_model_adapter.dart';
import 'package:fedi/app/html/html_text_helper.dart';
import 'package:fedi/app/poll/poll_bloc.dart';
import 'package:fedi/app/poll/poll_bloc_impl.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_service.dart';
import 'package:fedi/pleroma/status/emoji_reaction/pleroma_status_emoji_reaction_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/tag/pleroma_tag_model.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("status_bloc_impl.dart");

abstract class StatusBloc extends DisposableOwner implements IStatusBloc {
  @override
  late IPollBloc pollBloc;

  final BehaviorSubject<IStatus> statusSubject;

  final IPleromaStatusService pleromaStatusService;
  final IPleromaAccountService pleromaAccountService;
  final IPleromaStatusEmojiReactionService? pleromaStatusEmojiReactionService;
  final IPleromaPollService? pleromaPollService;

  // todo: remove hack. Don't init when bloc quickly disposed. Help
  StatusBloc({
    required this.pleromaStatusService,
    required this.pleromaAccountService,
    required this.pleromaStatusEmojiReactionService,
    required this.pleromaPollService,
    required IStatus status,
    required bool isNeedRefreshFromNetworkOnInit,
    required bool delayInit,
  }) : statusSubject = BehaviorSubject.seeded(status) {
    _logger.finest(() => "required constructor ${status.remoteId}");

    if (status.poll != null) {
      pollBloc = PollBloc(
        pleromaPollService: pleromaPollService,
        poll: status.poll!,
        instanceLocation: instanceLocation,
      );
      addDisposable(disposable: pollBloc);
      addDisposable(
        streamSubscription: pollBloc.pollStream.listen(
          (IPleromaPoll? poll) {
            // update status poll data if something changed in pollBloc
            var isChanged = this.poll == poll;
            if (!isChanged) {
              _logger.finest(
                  () => "update status poll data isChanged $isChanged \n"
                      "old ${this.poll} \n"
                      "new $poll");
              onPollUpdated(poll);
            }
          },
        ),
      );
      addDisposable(
        streamSubscription: pollStream.listen(
          (poll) {
            // update pollBloc after status poll data changed
            var isSame = pollBloc.poll == poll;
            if (!isSame) {
              _logger.finest(
                  () => "update pollBloc poll data isSame $isSame \n"
                      "old ${pollBloc.poll} \n"
                      "new $poll");
              pollBloc.onPollUpdated(poll);
            }
          },
        ),
      );
    }

    addDisposable(subject: statusSubject);

    if (delayInit) {
      Future.delayed(Duration(seconds: 1), () {
        _init(
          status: status,
          isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
        );
      });
    } else {
      _init(
        status: status,
        isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
      );
    }
  }

  Future _init({
    required IStatus status,
    required bool isNeedRefreshFromNetworkOnInit,
  }) async {
    if (!isDisposed) {
      await actualInit(
        status: status,
        isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
      );
    }
  }

  @override
  IStatus get status => statusSubject.value!;

  @override
  Stream<IStatus> get statusStream => statusSubject.stream;

  @override
  IStatus get reblogOrOriginal => reblog ?? status;

  @override
  Stream<IStatus> get reblogOrOriginalStream => Rx.combineLatest2(
        statusStream,
        reblogStream,
        (IStatus original, IStatus? reblog) => reblog ?? original,
      );

  @override
  IAccount get account => status.account;

  @override
  Stream<IAccount> get accountStream =>
      statusStream.map((status) => status.account);

  @override
  IAccount get reblogOrOriginalAccount => reblogOrOriginal.account;

  @override
  Stream<IAccount> get reblogOrOriginalAccountStream =>
      reblogOrOriginalStream.map((status) => status.account);

  @override
  List<IPleromaMediaAttachment>? get reblogOrOriginalMediaAttachments =>
      reblogOrOriginal.mediaAttachments;

  @override
  Stream<List<IPleromaMediaAttachment>?>
      get reblogOrOriginalMediaAttachmentsStream =>
          reblogOrOriginalStream.map((status) => status.mediaAttachments);

  @override
  DateTime get createdAt => status.createdAt;

  @override
  Stream<DateTime> get createdAtStream =>
      statusStream.map((status) => status.createdAt);

  @override
  String get remoteId => status.remoteId;

  @override
  List<IPleromaMention>? get mentions => status.mentions;

  @override
  List<IPleromaMention>? get reblogOrOriginalMentions =>
      reblogOrOriginal.mentions;

  @override
  List<IPleromaTag>? get tags => status.tags;

  @override
  List<IPleromaTag>? get reblogOrOriginalTags => reblogOrOriginal.tags;

  @override
  Stream<List<IPleromaMention>?> get mentionsStream => statusStream.map(
        (status) => status.mentions,
      );

  @override
  String? get content => status.content;

  @override
  Stream<String?> get contentStream => statusStream.map(
        (status) => status.content,
      );

  @override
  String? get contentRawText => content?.extractRawStringFromHtmlString();

  @override
  Stream<String?> get contentRawTextStream => contentStream.map(
        (content) => content?.extractRawStringFromHtmlString(),
      );

  @override
  IPleromaCard? get card => status.card;

  @override
  Stream<IPleromaCard?> get cardStream =>
      statusStream.map((status) => status.card);

  IPleromaCard? get reblogCard => reblog?.card;

  Stream<IPleromaCard?> get reblogCardStream =>
      reblogStream.map((status) => status?.card);

  @override
  IPleromaCard? get reblogOrOriginalCard => reblogCard ?? card;

  @override
  Stream<IPleromaCard?> get reblogOrOriginalCardStream => Rx.combineLatest2(
      cardStream,
      reblogCardStream,
      (dynamic originalCard, dynamic reblogCard) => reblogCard ?? originalCard);

  @override
  List<IPleromaMediaAttachment>? get mediaAttachments =>
      status.mediaAttachments;

  @override
  Stream<List<IPleromaMediaAttachment>?> get mediaAttachmentsStream =>
      statusStream.map((status) => status.mediaAttachments);

  @override
  IPleromaPoll? get poll => status.poll;

  @override
  Stream<IPleromaPoll?> get pollStream => statusStream.map(
        (status) => status.poll,
      );

  @override
  String get accountAvatar => account.avatar;

  @override
  Stream<String> get accountAvatarStream => accountStream.map(
        (account) => account.avatar,
      );

  @override
  bool get favourited => status.favourited;

  @override
  Stream<bool> get favouritedStream =>
      statusStream.map((status) => status.favourited);

  Future<IPleromaStatus> loadRemoteStatus() async {
    var remoteStatus = await pleromaStatusService.getStatus(
      statusRemoteId: remoteId,
    );
    return remoteStatus;
  }

  @override
  EmojiText? get contentWithEmojis => status.toContentEmojiText();

  @override
  Stream<EmojiText?> get contentWithEmojisStream => statusStream.map(
        (status) => status.toContentEmojiText(),
      );

  @override
  bool get reblogged => status.reblogged;

  @override
  Stream<bool> get rebloggedStream =>
      statusStream.map((status) => status.reblogged);

  @override
  bool get muted => status.muted;

  @override
  Stream<bool> get mutedStream => statusStream.map((status) => status.muted);

  @override
  bool get bookmarked => status.bookmarked;

  @override
  Stream<bool> get bookmarkedStream =>
      statusStream.map((status) => status.bookmarked);

  @override
  bool get pinned => status.pinned;

  @override
  Stream<bool> get pinnedStream => statusStream.map((status) => status.pinned);

  @override
  Future<IHashtag?> loadHashtagByUrl({
    required String url,
  }) async {
    var tagsToSearch = reblogOrOriginalTags;
    var foundPleromaHashtag = tagsToSearch?.firstWhereOrNull(
      (pleromaHashtag) {
        // todo: ask user open on local instance or remote
        var pleromaHashtagUrl = pleromaHashtag.url!.toLowerCase();
        var success = url.toLowerCase().contains(pleromaHashtagUrl);
        return success;
      },
    );

    var hashtag = foundPleromaHashtag?.toHashtag();

    return hashtag;
  }

  @override
  int get favouritesCount => status.favouritesCount;

  @override
  Stream<int> get favouritesCountStream =>
      statusStream.map((status) => status.favouritesCount);

  int? get reblogFavouritesCount => reblog?.favouritesCount;

  Stream<int?> get reblogFavouritesCountStream =>
      reblogStream.map((status) => status?.favouritesCount);

  @override
  int get reblogPlusOriginalFavouritesCount =>
      favouritesCount + (reblogFavouritesCount ?? 0);

  @override
  Stream<int> get reblogPlusOriginalFavouritesCountStream => Rx.combineLatest2(
        favouritesCountStream,
        reblogFavouritesCountStream,
        (int originalCount, int? reblogCount) =>
            originalCount + (reblogCount ?? 0),
      );

  @override
  int get reblogsCount => status.reblogsCount;

  @override
  Stream<int> get reblogsCountStream =>
      statusStream.map((status) => status.reblogsCount);

  int? get reblogReblogsCount => reblog?.reblogsCount;

  Stream<int?> get reblogReblogsCountStream =>
      reblogStream.map((status) => status?.reblogsCount);

  @override
  int get reblogPlusOriginalReblogsCount =>
      reblogsCount + (reblogReblogsCount ?? 0);

  @override
  Stream<int> get reblogPlusOriginalReblogsCountStream => Rx.combineLatest2(
        reblogsCountStream,
        reblogReblogsCountStream,
        (int originalCount, int? reblogCount) =>
            originalCount + (reblogCount ?? 0),
      );

  @override
  int get repliesCount => status.repliesCount;

  @override
  Stream<int> get repliesCountStream =>
      statusStream.map((status) => status.repliesCount);

  @override
  List<IPleromaStatusEmojiReaction>? get pleromaEmojiReactions =>
      status.pleromaEmojiReactions;

  @override
  Stream<List<IPleromaStatusEmojiReaction>?> get pleromaEmojiReactionsStream =>
      statusStream.map((status) => status.pleromaEmojiReactions);

  @override
  int? get pleromaEmojiReactionsCount =>
      pleromaEmojiReactions?.sumPleromaEmojiReactions();

  @override
  Stream<int?> get pleromaEmojiReactionsCountStream =>
      pleromaEmojiReactionsStream.map(
        (pleromaEmojiReactions) =>
            pleromaEmojiReactions?.sumPleromaEmojiReactions(),
      );

  List<IPleromaStatusEmojiReaction>? get reblogPleromaEmojiReactions =>
      reblog?.pleromaEmojiReactions;

  Stream<List<IPleromaStatusEmojiReaction>?>
      get reblogPleromaEmojiReactionsStream => reblogStream.map(
            (status) => status?.pleromaEmojiReactions,
          );

  @override
  int? get reblogPlusOriginalEmojiReactionsCount =>
      reblogPlusOriginalPleromaEmojiReactions?.sumPleromaEmojiReactions();

  @override
  Stream<int?> get reblogPlusOriginalEmojiReactionsCountStream =>
      reblogPlusOriginalEmojiReactionsStream.map(
        (pleromaEmojiReactions) =>
            pleromaEmojiReactions?.sumPleromaEmojiReactions(),
      );

  @override
  List<IPleromaStatusEmojiReaction>?
      get reblogPlusOriginalPleromaEmojiReactions =>
          pleromaEmojiReactions?.mergeEmojiReactionsLists(
            reblogPleromaEmojiReactions,
          );

  @override
  Stream<List<IPleromaStatusEmojiReaction>?>
      get reblogPlusOriginalEmojiReactionsStream => Rx.combineLatest2(
            pleromaEmojiReactionsStream,
            reblogPleromaEmojiReactionsStream,
            (
              List<IPleromaStatusEmojiReaction>? emojiReactionsOriginal,
              List<IPleromaStatusEmojiReaction>? emojiReactionsReblog,
            ) =>
                pleromaEmojiReactions?.mergeEmojiReactionsLists(
              reblogPleromaEmojiReactions,
            ),
          );

  @override
  Future dispose() {
    _logger.finest(() => "dispose");
    return super.dispose();
  }

  @override
  IStatus? get reblog => status.reblog;

  @override
  Stream<IStatus?> get reblogStream =>
      statusStream.map((status) => status.reblog);

  @override
  bool get nsfwSensitive => reblogOrOriginal.nsfwSensitive == true;

  @override
  Stream<bool> get nsfwSensitiveStream =>
      reblogOrOriginalStream.map((status) => status.nsfwSensitive);

  @override
  String? get reblogOrOriginalSpoilerText => reblogOrOriginal.spoilerText;

  @override
  Stream<String?> get reblogOrOriginalSpoilerTextStream =>
      reblogOrOriginalStream.map(
        (status) => status.spoilerText,
      );

  @override
  EmojiText? get spoilerTextWithEmojis => status.toSpoilerEmojiText();

  @override
  Stream<EmojiText?> get spoilerTextWithEmojisStream => statusStream.map(
        (status) => status.toSpoilerEmojiText(),
      );

  @override
  bool get containsSpoiler => reblogOrOriginalSpoilerText?.isNotEmpty == true;

  @override
  Stream<bool> get containsSpoilerStream => reblogOrOriginalSpoilerTextStream
      .map((spoilerText) => spoilerText?.isNotEmpty == true);

  @override
  bool get deleted => status.deleted == true;

  @override
  Stream<bool> get deletedStream => statusStream.map(
        (status) => status.deleted == true,
      );

  @override
  Future<IStatus> onPollUpdated(IPleromaPoll? poll) async {
    var updatedLocalStatus = status.copyWith(
      poll: poll?.toPleromaPoll(),
    );
    statusSubject.add(updatedLocalStatus);

    return updatedLocalStatus;
  }

  Future actualInit({
    required IStatus status,
    required bool isNeedRefreshFromNetworkOnInit,
  });
}

extension StatusEmojiTextExtension on IStatus {
  EmojiText? toContentEmojiText() {
    if (content?.isNotEmpty == true && emojis?.isNotEmpty == true) {
      return EmojiText(text: content!, emojis: emojis!);
    } else {
      return null;
    }
  }

  EmojiText? toSpoilerEmojiText() {
    if (spoilerText?.isNotEmpty == true && emojis?.isNotEmpty == true) {
      return EmojiText(text: spoilerText!, emojis: emojis!);
    } else {
      return null;
    }
  }
}

