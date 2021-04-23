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
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:fedi/pleroma/api/card/pleroma_api_card_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/mention/pleroma_api_mention_model.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_model.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_service.dart';
import 'package:fedi/pleroma/api/status/emoji_reaction/pleroma_api_status_emoji_reaction_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_service.dart';
import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("status_bloc_impl.dart");

abstract class StatusBloc extends DisposableOwner implements IStatusBloc {
  @override
  late IPollBloc pollBloc;

  final BehaviorSubject<IStatus> statusSubject;

  final IPleromaApiStatusService pleromaStatusService;
  final IPleromaApiAccountService pleromaAccountService;
  final IPleromaApiStatusEmojiReactionService? PleromaApiStatusEmojiReactionService;
  final IPleromaApiPollService? pleromaPollService;

  // todo: remove hack. Don't init when bloc quickly disposed. Help
  StatusBloc({
    required this.pleromaStatusService,
    required this.pleromaAccountService,
    required this.PleromaApiStatusEmojiReactionService,
    required this.pleromaPollService,
    required IStatus status,
    required bool isNeedRefreshFromNetworkOnInit,
    required bool delayInit,
  }) : statusSubject = BehaviorSubject.seeded(status) {

    if (status.poll != null) {
      pollBloc = PollBloc(
        pleromaPollService: pleromaPollService,
        poll: status.poll!,
        instanceLocation: instanceLocation,
      );
      addDisposable(disposable: pollBloc);
      addDisposable(
        streamSubscription: pollBloc.pollStream.listen(
          (IPleromaApiPoll? poll) {
            // update status poll data if something changed in pollBloc
            var isChanged = this.poll == poll;
            if (!isChanged) {
              _logger.finest(
                () => "update status poll data isChanged $isChanged \n"
                    "old ${this.poll} \n"
                    "new $poll",
              );
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
              _logger.finest(() => "update pollBloc poll data isSame $isSame \n"
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
  List<IPleromaApiMediaAttachment>? get reblogOrOriginalMediaAttachments =>
      reblogOrOriginal.mediaAttachments;

  @override
  Stream<List<IPleromaApiMediaAttachment>?>
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
  List<IPleromaApiMention>? get mentions => status.mentions;

  @override
  List<IPleromaApiMention>? get reblogOrOriginalMentions =>
      reblogOrOriginal.mentions;

  @override
  List<IPleromaApiTag>? get tags => status.tags;

  @override
  List<IPleromaApiTag>? get reblogOrOriginalTags => reblogOrOriginal.tags;

  @override
  Stream<List<IPleromaApiMention>?> get mentionsStream => statusStream.map(
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
  IPleromaApiCard? get card => status.card;

  @override
  Stream<IPleromaApiCard?> get cardStream =>
      statusStream.map((status) => status.card);

  IPleromaApiCard? get reblogCard => reblog?.card;

  Stream<IPleromaApiCard?> get reblogCardStream =>
      reblogStream.map((status) => status?.card);

  @override
  IPleromaApiCard? get reblogOrOriginalCard => reblogCard ?? card;

  @override
  Stream<IPleromaApiCard?> get reblogOrOriginalCardStream => Rx.combineLatest2(
        cardStream,
        reblogCardStream,
        (dynamic originalCard, dynamic reblogCard) =>
            reblogCard ?? originalCard,
      );

  @override
  List<IPleromaApiMediaAttachment>? get mediaAttachments =>
      status.mediaAttachments;

  @override
  Stream<List<IPleromaApiMediaAttachment>?> get mediaAttachmentsStream =>
      statusStream.map((status) => status.mediaAttachments);

  @override
  IPleromaApiPoll? get poll => status.poll;

  @override
  Stream<IPleromaApiPoll?> get pollStream => statusStream.map(
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

  Future<IPleromaApiStatus> loadRemoteStatus() async {
    var remoteStatus = await pleromaStatusService.getStatus(
      statusRemoteId: remoteId!,
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
    var foundPleromaHashtag = tagsToSearch?.firstWhereOrNull(
      (pleromaHashtag) {
        // todo: ask user open on local instance or remote
        var pleromaHashtagUrl = pleromaHashtag.url.toLowerCase();
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
  List<IPleromaApiStatusEmojiReaction>? get pleromaEmojiReactions =>
      status.pleromaEmojiReactions;

  @override
  Stream<List<IPleromaApiStatusEmojiReaction>?> get pleromaEmojiReactionsStream =>
      statusStream.map((status) => status.pleromaEmojiReactions);

  @override
  int? get pleromaEmojiReactionsCount =>
      pleromaEmojiReactions?.sumPleromaApiEmojiReactions();

  @override
  Stream<int?> get pleromaEmojiReactionsCountStream =>
      pleromaEmojiReactionsStream.map(
        (pleromaEmojiReactions) =>
            pleromaEmojiReactions?.sumPleromaApiEmojiReactions(),
      );

  List<IPleromaApiStatusEmojiReaction>? get reblogPleromaEmojiReactions =>
      reblog?.pleromaEmojiReactions;

  Stream<List<IPleromaApiStatusEmojiReaction>?>
      get reblogPleromaEmojiReactionsStream => reblogStream.map(
            (status) => status?.pleromaEmojiReactions,
          );

  @override
  int? get reblogPlusOriginalEmojiReactionsCount =>
      reblogPlusOriginalPleromaEmojiReactions?.sumPleromaApiEmojiReactions();

  @override
  Stream<int?> get reblogPlusOriginalEmojiReactionsCountStream =>
      reblogPlusOriginalEmojiReactionsStream.map(
        (pleromaEmojiReactions) =>
            pleromaEmojiReactions?.sumPleromaApiEmojiReactions(),
      );

  @override
  List<IPleromaApiStatusEmojiReaction>?
      get reblogPlusOriginalPleromaEmojiReactions =>
          pleromaEmojiReactions?.mergePleromaApiEmojiReactionsLists(
            reblogPleromaEmojiReactions,
          );

  @override
  Stream<List<IPleromaApiStatusEmojiReaction>?>
      get reblogPlusOriginalEmojiReactionsStream => Rx.combineLatest2(
            pleromaEmojiReactionsStream,
            reblogPleromaEmojiReactionsStream,
            (
              List<IPleromaApiStatusEmojiReaction>? emojiReactionsOriginal,
              List<IPleromaApiStatusEmojiReaction>? emojiReactionsReblog,
            ) =>
                pleromaEmojiReactions?.mergePleromaApiEmojiReactionsLists(
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
  Future<IStatus> onPollUpdated(IPleromaApiPoll? poll) async {
    var updatedLocalStatus = status.copyWith(
      poll: poll?.toPleromaApiPoll(),
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
