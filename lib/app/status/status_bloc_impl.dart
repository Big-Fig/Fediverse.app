import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/hashtag_model_adapter.dart';
import 'package:fedi/app/html/html_text_helper.dart';
import 'package:fedi/app/poll/poll_bloc.dart';
import 'package:fedi/app/poll/poll_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
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
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("status_bloc_impl.dart");

class StatusBloc extends DisposableOwner implements IStatusBloc {
  static StatusBloc createFromContext(
    BuildContext context,
    IStatus status, {
    bool isNeedWatchLocalRepositoryForUpdates = true,
    bool delayInit = true,
  }) =>
      StatusBloc(
        pleromaStatusService: IPleromaStatusService.of(context, listen: false),
        pleromaAccountService:
            IPleromaAccountService.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        accountRepository: IAccountRepository.of(context, listen: false),
        status: status,
        needRefreshFromNetworkOnInit: false,
        delayInit: delayInit,
        isNeedWatchLocalRepositoryForUpdates:
            isNeedWatchLocalRepositoryForUpdates,
        pleromaStatusEmojiReactionService:
            IPleromaStatusEmojiReactionService.of(context, listen: false),
        pleromaPollService: IPleromaPollService.of(context, listen: false),
      );

  @override
  IPollBloc pollBloc;

  final BehaviorSubject<IStatus> _statusSubject;

  final IPleromaStatusService pleromaStatusService;
  final IPleromaAccountService pleromaAccountService;
  final IPleromaStatusEmojiReactionService pleromaStatusEmojiReactionService;
  final IPleromaPollService pleromaPollService;
  final IStatusRepository statusRepository;
  final IAccountRepository accountRepository;
  final bool isNeedWatchLocalRepositoryForUpdates;

  StatusBloc({
    @required this.pleromaStatusService,
    @required this.pleromaAccountService,
    @required this.pleromaStatusEmojiReactionService,
    @required this.pleromaPollService,
    @required this.statusRepository,
    @required this.accountRepository,
    @required
        IStatus status, // for better performance we don't update account too
    // often
    bool needRefreshFromNetworkOnInit =
        false, // todo: remove hack. Don't init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
    this.isNeedWatchLocalRepositoryForUpdates = true,
  }) : _statusSubject = BehaviorSubject.seeded(status) {
    _logger.finest(() => "required constructor ${status.remoteId}");

    if (status.poll != null) {
      pollBloc = PollBloc(
        pleromaPollService: pleromaPollService,
        poll: status.poll,
      );
      addDisposable(disposable: pollBloc);
      addDisposable(streamSubscription: pollBloc.pollStream.listen((poll) {
        // update status poll data if something changed in pollBloc
        var isChanged = this.poll == poll;
        if (!isChanged) {
          _logger.finest(() => "update status poll data isChanged $isChanged \n"
              "old ${this.poll} \n"
              "new $poll");
          onPollUpdated(poll);
        }
      }));
      addDisposable(streamSubscription: pollStream.listen((poll) {
        // update pollBloc after status poll data changed
        var isChanged = pollBloc.poll == poll;
        if (!isChanged) {
          _logger
              .finest(() => "update pollBloc poll data isChanged $isChanged \n"
                  "old ${pollBloc.poll} \n"
                  "new $poll");
          pollBloc.onPollUpdated(poll);
        }
      }));
    }

    addDisposable(subject: _statusSubject);

    assert(needRefreshFromNetworkOnInit != null);
    assert(isNeedWatchLocalRepositoryForUpdates != null);
    if (delayInit) {
      Future.delayed(Duration(seconds: 1), () {
        _init(status, needRefreshFromNetworkOnInit);
      });
    } else {
      _init(status, needRefreshFromNetworkOnInit);
    }
  }

  void _init(IStatus status, bool needRefreshFromNetworkOnInit) {
    if (!isDisposed) {
      if (isNeedWatchLocalRepositoryForUpdates) {
        addDisposable(
            streamSubscription: statusRepository
                .watchByRemoteId(status.remoteId)
                .listen((updatedStatus) {
          if (updatedStatus != null) {
            _statusSubject.add(updatedStatus);
          }
        }));
      }
      if (needRefreshFromNetworkOnInit) {
        refreshFromNetwork();
      }
    }
  }

  @override
  IStatus get status => _statusSubject.value;

  @override
  Stream<IStatus> get statusStream => _statusSubject.stream;

  @override
  IStatus get reblogOrOriginal => reblog ?? status;

  @override
  Stream<IStatus> get reblogOrOriginalStream => Rx.combineLatest2(
      statusStream, reblogStream, (original, reblog) => reblog ?? original);

  @override
  IAccount get account => status?.account;

  @override
  Stream<IAccount> get accountStream =>
      statusStream.map((status) => status.account);

  @override
  IAccount get reblogOrOriginalAccount => reblogOrOriginal?.account;

  @override
  Stream<IAccount> get reblogOrOriginalAccountStream =>
      reblogOrOriginalStream.map((status) => status.account);

  @override
  DateTime get createdAt => status?.createdAt;

  @override
  Stream<DateTime> get createdAtStream =>
      statusStream.map((status) => status?.createdAt);

  @override
  String get remoteId => status.remoteId;

  @override
  List<IPleromaMention> get mentions => status.mentions;

  @override
  Stream<List<IPleromaMention>> get mentionsStream =>
      statusStream.map((status) => status.mentions);

  @override
  Future<IAccount> getInReplyToAccount() {
    assert(status.inReplyToAccountRemoteId != null);
    return accountRepository.findByRemoteId(status.inReplyToAccountRemoteId);
  }

  @override
  Stream<IAccount> watchInReplyToAccount() {
    assert(status.inReplyToAccountRemoteId != null);
    return accountRepository.watchByRemoteId(status.inReplyToAccountRemoteId);
  }

  @override
  Future<IStatus> getInReplyToStatus() async {
    assert(status.inReplyToRemoteId != null);
    if (status.inReplyToStatus != null) {
      return status.inReplyToStatus;
    }
    return await statusRepository.findByRemoteId(status.inReplyToRemoteId);
  }

  @override
  Stream<IStatus> watchInReplyToStatus() {
    assert(status.inReplyToRemoteId != null);
    return statusRepository.watchByRemoteId(status.inReplyToRemoteId);
  }

  @override
  String get content => status?.content;

  @override
  Stream<String> get contentStream =>
      statusStream.map((status) => status?.content);

  @override
  String get contentRawText =>
      HtmlTextHelper.extractRawStringFromHtmlString(content);

  @override
  Stream<String> get contentRawTextStream => contentStream
      .map((content) => HtmlTextHelper.extractRawStringFromHtmlString(content));

  @override
  IPleromaCard get card => status?.card;

  @override
  Stream<IPleromaCard> get cardStream =>
      statusStream.map((status) => status?.card);

  IPleromaCard get reblogCard => reblog?.card;

  Stream<IPleromaCard> get reblogCardStream =>
      reblogStream.map((status) => status?.card);

  @override
  IPleromaCard get reblogOrOriginalCard => reblogCard ?? card;

  @override
  Stream<IPleromaCard> get reblogOrOriginalCardStream => Rx.combineLatest2(
      cardStream,
      reblogCardStream,
      (originalCard, reblogCard) => reblogCard ?? originalCard);

  @override
  List<IPleromaMediaAttachment> get mediaAttachments =>
      status?.mediaAttachments;

  @override
  Stream<List<IPleromaMediaAttachment>> get mediaAttachmentsStream =>
      statusStream.map((status) => status.mediaAttachments);

  @override
  IPleromaPoll get poll => status?.poll;

  @override
  Stream<IPleromaPoll> get pollStream =>
      statusStream.map((status) => status.poll);

  @override
  String get accountAvatar => account?.avatar;

  @override
  Stream<String> get accountAvatarStream =>
      accountStream.map((account) => account.avatar);

  @override
  bool get favourited => status?.favourited;

  @override
  Stream<bool> get favouritedStream =>
      statusStream.map((status) => status?.favourited);

  @override
  Future refreshFromNetwork() async {
    var remoteStatus =
        await pleromaStatusService.getStatus(statusRemoteId: remoteId);

    return _updateByRemoteStatus(remoteStatus);
  }

  Future _updateByRemoteStatus(IPleromaStatus remoteStatus) {
    return statusRepository.updateLocalStatusByRemoteStatus(
        oldLocalStatus: status, newRemoteStatus: remoteStatus);
  }

  @override
  EmojiText get contentWithEmojis =>
      EmojiText(text: status.content, emojis: status.emojis);

  @override
  Stream<EmojiText> get contentWithEmojisStream => statusStream.map(
        (status) => EmojiText(text: status.content, emojis: status.emojis),
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
  Future<IAccount> loadAccountByMentionUrl({@required String url}) async {
    var foundMention = mentions?.firstWhere((mention) => mention.url == url,
        orElse: () => null);

    var account;
    if (foundMention != null) {
      var accountRemoteId = foundMention.id;
      if (pleromaAccountService.isApiReadyToUse) {
        var remoteAccount = await pleromaAccountService.getAccount(
            accountRemoteId: accountRemoteId);
        await accountRepository.upsertRemoteAccount(remoteAccount,
            conversationRemoteId: null, chatRemoteId: null);
      }
      account = await accountRepository.findByRemoteId(accountRemoteId);
    }

    return account;
  }

  @override
  Future<IHashtag> loadHashtagByUrl({@required String url}) async {
    var foundPleromaHashtag = status.tags?.firstWhere((pleromaHashtag) {
      // actually status.tags contains relative url (without domain)
      // todo: report to pleroma
      return url.contains(pleromaHashtag.url);
    }, orElse: () => null);

    var hashtag;
    if (foundPleromaHashtag != null) {
      hashtag = mapRemoteHashtagToLocalHashtag(foundPleromaHashtag);
    }

    return hashtag;
  }

  @override
  int get favouritesCount => status.favouritesCount;

  @override
  Stream<int> get favouritesCountStream =>
      statusStream.map((status) => status.favouritesCount);

  int get reblogFavouritesCount => reblog?.favouritesCount;

  Stream<int> get reblogFavouritesCountStream =>
      reblogStream.map((status) => status?.favouritesCount);

  @override
  int get reblogPlusOriginalFavouritesCount =>
      favouritesCount + (reblogFavouritesCount ?? 0);

  @override
  Stream<int> get reblogPlusOriginalFavouritesCountStream => Rx.combineLatest2(
      favouritesCountStream,
      reblogFavouritesCountStream,
      (originalCount, reblogCount) => originalCount + (reblogCount ?? 0));

  @override
  int get reblogsCount => status.reblogsCount;

  @override
  Stream<int> get reblogsCountStream =>
      statusStream.map((status) => status.reblogsCount);

  int get reblogReblogsCount => reblog?.reblogsCount;

  Stream<int> get reblogReblogsCountStream =>
      reblogStream.map((status) => status?.reblogsCount);

  @override
  int get reblogPlusOriginalReblogsCount =>
      reblogsCount + (reblogReblogsCount ?? 0);

  @override
  Stream<int> get reblogPlusOriginalReblogsCountStream => Rx.combineLatest2(
      reblogsCountStream,
      reblogReblogsCountStream,
      (originalCount, reblogCount) => originalCount + (reblogCount ?? 0));

  @override
  int get repliesCount => status.repliesCount;

  @override
  Stream<int> get repliesCountStream =>
      statusStream.map((status) => status.repliesCount);

  @override
  Future<IStatus> toggleFavourite() async {
    IPleromaStatus remoteStatus;
    if (reblogOrOriginal.favourited == true) {
      remoteStatus = await pleromaStatusService.unFavouriteStatus(
          statusRemoteId: reblogOrOriginal.remoteId);
    } else {
      remoteStatus = await pleromaStatusService.favouriteStatus(
          statusRemoteId: reblogOrOriginal.remoteId);
    }

    await statusRepository.updateLocalStatusByRemoteStatus(
        oldLocalStatus: reblogOrOriginal, newRemoteStatus: remoteStatus);

    return statusRepository.findByRemoteId(remoteStatus.id);
  }

  @override
  Future<IStatus> toggleReblog() async {
    _logger.finest(() =>
        "requestToggleReblog status.reblogged=${reblogOrOriginal.reblogged}");
    IPleromaStatus remoteStatus;
    if (reblogOrOriginal.reblogged == true) {
      remoteStatus = await pleromaStatusService.unReblogStatus(
          statusRemoteId: reblogOrOriginal.remoteId);
    } else {
      remoteStatus = await pleromaStatusService.reblogStatus(
          statusRemoteId: reblogOrOriginal.remoteId);
    }

    await statusRepository.upsertRemoteStatus(remoteStatus,
        listRemoteId: null, conversationRemoteId: null);

    return statusRepository.findByRemoteId(remoteStatus.id);
  }

  @override
  Future<IStatus> toggleMute() async {
    IPleromaStatus remoteStatus;
    if (reblogOrOriginal.muted == true) {
      remoteStatus = await pleromaStatusService.unMuteStatus(
          statusRemoteId: reblogOrOriginal.remoteId);
    } else {
      remoteStatus = await pleromaStatusService.muteStatus(
          statusRemoteId: reblogOrOriginal.remoteId);
    }

    await statusRepository.updateLocalStatusByRemoteStatus(
        oldLocalStatus: reblogOrOriginal, newRemoteStatus: remoteStatus);

    return statusRepository.findByRemoteId(reblogOrOriginal.remoteId);
  }

  @override
  Future<IStatus> toggleBookmark() async {
    IPleromaStatus remoteStatus;
    if (reblogOrOriginal.bookmarked == true) {
      remoteStatus = await pleromaStatusService.unBookmarkStatus(
          statusRemoteId: reblogOrOriginal.remoteId);
    } else {
      remoteStatus = await pleromaStatusService.bookmarkStatus(
          statusRemoteId: reblogOrOriginal.remoteId);
    }

    await statusRepository.updateLocalStatusByRemoteStatus(
        oldLocalStatus: reblogOrOriginal, newRemoteStatus: remoteStatus);

    return statusRepository.findByRemoteId(reblogOrOriginal.remoteId);
  }

  @override
  Future<IStatus> togglePin() async {
    IPleromaStatus remoteStatus;
    if (reblogOrOriginal.pinned == true) {
      remoteStatus = await pleromaStatusService.unPinStatus(
          statusRemoteId: reblogOrOriginal.remoteId);
    } else {
      // reblogged don't support pin
      if (reblogOrOriginal.reblogged) {
        remoteStatus = await pleromaStatusService.pinStatus(
            statusRemoteId: reblogOrOriginal.remoteId);
      } else {
        remoteStatus = await pleromaStatusService.pinStatus(
            statusRemoteId: reblogOrOriginal.remoteId);
      }
    }

    await statusRepository.updateLocalStatusByRemoteStatus(
        oldLocalStatus: reblogOrOriginal, newRemoteStatus: remoteStatus);

    return statusRepository.findByRemoteId(reblogOrOriginal.remoteId);
  }

  @override
  List<IPleromaStatusEmojiReaction> get pleromaEmojiReactions =>
      status.pleromaEmojiReactions;

  @override
  Stream<List<IPleromaStatusEmojiReaction>> get pleromaEmojiReactionsStream =>
      statusStream.map((status) => status.pleromaEmojiReactions);

  @override
  int get pleromaEmojiReactionsCount =>
      _sumPleromaEmojiReactions(pleromaEmojiReactions);

  @override
  Stream<int> get pleromaEmojiReactionsCountStream =>
      pleromaEmojiReactionsStream.map((pleromaEmojiReactions) =>
          _sumPleromaEmojiReactions(pleromaEmojiReactions));

  int _sumPleromaEmojiReactions(
          List<IPleromaStatusEmojiReaction> pleromaEmojiReactions) =>
      pleromaEmojiReactions?.fold(
          0, (previousValue, element) => previousValue + element.count) ??
      0;

  List<IPleromaStatusEmojiReaction> get reblogPleromaEmojiReactions =>
      reblog?.pleromaEmojiReactions;

  Stream<List<IPleromaStatusEmojiReaction>>
      get reblogPleromaEmojiReactionsStream =>
          reblogStream.map((status) => status?.pleromaEmojiReactions);

  @override
  int get reblogPlusOriginalEmojiReactionsCount =>
      _sumPleromaEmojiReactions(reblogPlusOriginalPleromaEmojiReactions);

  @override
  Stream<int> get reblogPlusOriginalEmojiReactionsCountStream =>
      reblogPlusOriginalEmojiReactionsStream.map((pleromaEmojiReactions) =>
          _sumPleromaEmojiReactions(pleromaEmojiReactions));

  @override
  List<IPleromaStatusEmojiReaction>
      get reblogPlusOriginalPleromaEmojiReactions => mergeEmojiReactionsLists(
          pleromaEmojiReactions, reblogPleromaEmojiReactions);

  @override
  Stream<List<IPleromaStatusEmojiReaction>>
      get reblogPlusOriginalEmojiReactionsStream => Rx.combineLatest2(
            pleromaEmojiReactionsStream,
            reblogPleromaEmojiReactionsStream,
            (emojiReactionsOriginal, emojiReactionsReblog) =>
                mergeEmojiReactionsLists(
                    emojiReactionsOriginal, emojiReactionsReblog),
          );

  @override
  Future<IPleromaStatus> toggleEmojiReaction({@required String emoji}) async {
    var alreadyAdded;
    var foundEmojiReaction = pleromaEmojiReactions?.firstWhere(
        (emojiReaction) => emojiReaction.name == emoji,
        orElse: () => null);

    if (foundEmojiReaction != null) {
      alreadyAdded = foundEmojiReaction.me;
    } else {
      alreadyAdded = false;
    }

    IPleromaStatus remoteStatus;
    if (alreadyAdded) {
      remoteStatus = await pleromaStatusEmojiReactionService.removeReaction(
          statusRemoteId: status.remoteId, emoji: emoji);
    } else {
      remoteStatus = await pleromaStatusEmojiReactionService.addReaction(
          statusRemoteId: status.remoteId, emoji: emoji);
    }

    await statusRepository.upsertRemoteStatus(remoteStatus,
        listRemoteId: null, conversationRemoteId: null);

    return remoteStatus;
  }

  @override
  Future dispose() {
    _logger.finest(() => "dispose");
    return super.dispose();
  }

  @override
  IStatus get reblog => status.reblog;

  @override
  Stream<IStatus> get reblogStream =>
      statusStream.map((status) => status.reblog);

  @override
  bool get nsfwSensitive => reblogOrOriginal.nsfwSensitive == true;

  @override
  Stream<bool> get nsfwSensitiveStream =>
      reblogOrOriginalStream.map((status) => status.nsfwSensitive);

  @override
  String get spoilerText => reblogOrOriginal.spoilerText;

  @override
  Stream<String> get spoilerTextStream =>
      reblogOrOriginalStream.map((status) => status.spoilerText);

  @override
  EmojiText get spoilerTextWithEmojis =>
      EmojiText(text: status.spoilerText, emojis: status.emojis);

  @override
  Stream<EmojiText> get spoilerTextWithEmojisStream => statusStream.map(
        (status) => EmojiText(text: status.spoilerText, emojis: status.emojis),
      );

  @override
  bool get containsSpoiler => spoilerText?.isNotEmpty == true;

  @override
  Stream<bool> get containsSpoilerStream =>
      spoilerTextStream.map((spoilerText) => spoilerText?.isNotEmpty == true);

  // todo: rework with mixin
  @override
  bool get isReply => status.isReply;

  // todo: rework with mixin
  @override
  bool get isHaveReblog => status.isHaveReblog;

  @override
  Future onPollUpdated(IPleromaPoll poll) async {
    var updatedLocalStatus = status.copyWith(poll: poll);
    _statusSubject.add(updatedLocalStatus);

    await statusRepository.updateById(
        status.localId, dbStatusFromStatus(updatedLocalStatus));
  }

  @override
  Future delete() async {
    await pleromaStatusService.deleteStatus(statusRemoteId: status.remoteId);

    await statusRepository.markStatusAsDeleted(statusRemoteId: status.remoteId);
  }

  @override
  bool get deleted => status.deleted;

  @override
  Stream<bool> get deletedStream =>
      statusStream.map((status) => status.deleted);
}
