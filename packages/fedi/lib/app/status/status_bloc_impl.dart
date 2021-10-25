import 'package:collection/collection.dart' show IterableExtension;
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/hashtag_model_adapter.dart';
import 'package:fedi/app/html/html_text_helper.dart';
import 'package:fedi/app/poll/poll_bloc.dart';
import 'package:fedi/app/poll/poll_bloc_impl.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('status_bloc_impl.dart');

abstract class StatusBloc extends DisposableOwner implements IStatusBloc {
  @override
  // ignore: avoid-late-keyword
  late IPollBloc pollBloc;

  final BehaviorSubject<IStatus> statusSubject;

  final IUnifediApiAccountService unifediApiAccountService;
  final IUnifediApiStatusService unifediApiStatusService;
  final IUnifediApiPollService unifediApiPollService;

  // todo: remove hack. Dont init when bloc quickly disposed. Help
  StatusBloc({
    required this.unifediApiStatusService,
    required this.unifediApiAccountService,
    required this.unifediApiPollService,
    required IStatus status,
    required bool isNeedRefreshFromNetworkOnInit,
    required bool delayInit,
  }) : statusSubject = BehaviorSubject.seeded(status) {
    if (status.poll != null) {
      pollBloc = PollBloc(
        unifediApiPollService: unifediApiPollService,
        poll: status.poll!,
        instanceLocation: instanceLocation,
      );
      addDisposable(pollBloc);
      pollBloc.pollStream.listen(
        (IUnifediApiPoll? poll) {
          // update status poll data if something changed in pollBloc
          var isChanged = this.poll == poll;
          if (!isChanged) {
            _logger.finest(
              () => 'update status poll data isChanged $isChanged \n'
                  'old ${this.poll} \n'
                  'new $poll',
            );
            // ignore: avoid-ignoring-return-values
            onPollUpdated(poll);
          }
        },
      ).disposeWith(this);
      pollStream.listen(
        (poll) {
          // update pollBloc after status poll data changed
          var isSame = pollBloc.poll == poll;
          if (!isSame) {
            _logger.finest(
              () => 'update pollBloc poll data isSame $isSame \n'
                  'old ${pollBloc.poll} \n'
                  'new $poll',
            );
            pollBloc.onPollUpdated(poll);
          }
        },
      ).disposeWith(this);
    }

    statusSubject.disposeWith(this);

    if (delayInit) {
      Future.delayed(const Duration(seconds: 1), () {
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

  Future<void> _init({
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
  IStatus get status => statusSubject.value;

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
  List<IUnifediApiMediaAttachment>? get reblogOrOriginalMediaAttachments =>
      reblogOrOriginal.mediaAttachments;

  @override
  Stream<List<IUnifediApiMediaAttachment>?>
      get reblogOrOriginalMediaAttachmentsStream =>
          reblogOrOriginalStream.map((status) => status.mediaAttachments);

  @override
  DateTime get createdAt => status.createdAt;

  @override
  Stream<DateTime> get createdAtStream =>
      statusStream.map((status) => status.createdAt);

  @override
  String? get remoteId => status.remoteId;

  @override
  List<IUnifediApiMention>? get mentions => status.mentions;

  @override
  List<IUnifediApiMention>? get reblogOrOriginalMentions =>
      reblogOrOriginal.mentions;

  @override
  List<IUnifediApiTag>? get tags => status.tags;

  @override
  List<IUnifediApiTag>? get reblogOrOriginalTags => reblogOrOriginal.tags;

  @override
  Stream<List<IUnifediApiMention>?> get mentionsStream => statusStream.map(
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
  IUnifediApiCard? get card => status.card;

  @override
  Stream<IUnifediApiCard?> get cardStream =>
      statusStream.map((status) => status.card);

  IUnifediApiCard? get reblogCard => reblog?.card;

  Stream<IUnifediApiCard?> get reblogCardStream =>
      reblogStream.map((status) => status?.card);

  @override
  IUnifediApiCard? get reblogOrOriginalCard => reblogCard ?? card;

  @override
  Stream<IUnifediApiCard?> get reblogOrOriginalCardStream => Rx.combineLatest2(
        cardStream,
        reblogCardStream,
        (IUnifediApiCard? originalCard, IUnifediApiCard? reblogCard) =>
            reblogCard ?? originalCard,
      );

  @override
  List<IUnifediApiMediaAttachment>? get mediaAttachments =>
      status.mediaAttachments;

  @override
  Stream<List<IUnifediApiMediaAttachment>?> get mediaAttachmentsStream =>
      statusStream.map((status) => status.mediaAttachments);

  @override
  IUnifediApiPoll? get poll => status.poll;

  @override
  Stream<IUnifediApiPoll?> get pollStream => statusStream.map(
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

  Future<IUnifediApiStatus> loadRemoteStatus() async {
    var remoteStatus = await unifediApiStatusService.getStatus(
      statusId: remoteId!,
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
  bool? get bookmarked => status.bookmarked;

  @override
  Stream<bool?> get bookmarkedStream =>
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
    var foundUnifediHashtag = tagsToSearch?.firstWhereOrNull(
      (unifediHashtag) {
        // todo: ask user open on local instance or remote
        var unifediHashtagUrl = unifediHashtag.url?.toLowerCase();
        if (unifediHashtagUrl != null) {
          var success = url.toLowerCase().contains(unifediHashtagUrl);

          return success;
        } else {
          return false;
        }
      },
    );

    var hashtag = foundUnifediHashtag?.toHashtag();

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
  List<IUnifediApiEmojiReaction>? get emojiReactions => status.emojiReactions;

  @override
  Stream<List<IUnifediApiEmojiReaction>?> get emojiReactionsStream =>
      statusStream.map((status) => status.emojiReactions);

  @override
  int? get emojiReactionsCount => emojiReactions?.sumUnifediApiEmojiReactions();

  @override
  Stream<int?> get emojiReactionsCountStream => emojiReactionsStream.map(
        (emojiReactions) => emojiReactions?.sumUnifediApiEmojiReactions(),
      );

  List<IUnifediApiEmojiReaction>? get reblogEmojiReactions =>
      reblog?.emojiReactions;

  Stream<List<IUnifediApiEmojiReaction>?> get reblogEmojiReactionsStream =>
      reblogStream.map(
        (status) => status?.emojiReactions,
      );

  @override
  int? get reblogPlusOriginalEmojiReactionsCount =>
      reblogPlusOriginalEmojiReactions?.sumUnifediApiEmojiReactions();

  @override
  Stream<int?> get reblogPlusOriginalEmojiReactionsCountStream =>
      reblogPlusOriginalEmojiReactionsStream.map(
        (emojiReactions) => emojiReactions?.sumUnifediApiEmojiReactions(),
      );

  @override
  List<IUnifediApiEmojiReaction>? get reblogPlusOriginalEmojiReactions =>
      emojiReactions?.mergeUnifediApiEmojiReactionsLists(
        reblogEmojiReactions,
      );

  @override
  Stream<List<IUnifediApiEmojiReaction>?>
      get reblogPlusOriginalEmojiReactionsStream => Rx.combineLatest2(
            emojiReactionsStream,
            reblogEmojiReactionsStream,
            (
              List<IUnifediApiEmojiReaction>? emojiReactionsOriginal,
              List<IUnifediApiEmojiReaction>? emojiReactionsReblog,
            ) =>
                emojiReactions?.mergeUnifediApiEmojiReactionsLists(
              reblogEmojiReactions,
            ),
          );

  @override
  Future<void> dispose() {
    _logger.finest(() => 'dispose');

    return super.dispose();
  }

  @override
  IStatus? get reblog => status.reblog;

  @override
  Stream<IStatus?> get reblogStream =>
      statusStream.map((status) => status.reblog);

  @override
  bool get nsfwSensitive => reblogOrOriginal.nsfwSensitive;

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
  bool get deleted => status.deleted;

  @override
  Stream<bool> get deletedStream => statusStream.map(
        (status) => status.deleted,
      );

  @override
  Future<IStatus> onPollUpdated(IUnifediApiPoll? poll) async {
    var dbStatusPopulatedWrapper = status.toDbStatusPopulatedWrapper();

    var updatedLocalStatus = dbStatusPopulatedWrapper.copyWith(
      dbStatusPopulated: dbStatusPopulatedWrapper.dbStatusPopulated.copyWith(
        dbStatus: dbStatusPopulatedWrapper.dbStatusPopulated.dbStatus.copyWith(
          poll: poll?.toUnifediApiPoll(),
        ),
      ),
    );

    statusSubject.add(updatedLocalStatus);

    return updatedLocalStatus;
  }

  Future<void> actualInit({
    required IStatus status,
    required bool isNeedRefreshFromNetworkOnInit,
  });
}

extension StatusEmojiTextExtension on IStatus {
  EmojiText? toContentEmojiText() {
    if (content?.isNotEmpty == true) {
      return EmojiText(text: content!, emojis: emojis);
    } else {
      return null;
    }
  }

  EmojiText? toSpoilerEmojiText() {
    if (spoilerText?.isNotEmpty == true) {
      return EmojiText(text: spoilerText!, emojis: emojis);
    } else {
      return null;
    }
  }
}
