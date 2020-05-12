import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/emoji/emoji_text_helper.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/refactored/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/refactored/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/refactored/pleroma/status/emoji_reaction/pleroma_status_emoji_reaction_service.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("status_bloc_impl.dart");

final int minimumCharactersLimitToCollapse = 400;

// todo: extract nsfw, spoiler, collapsible logic in separate classes
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
      );

  // ignore: close_sinks
  final BehaviorSubject<bool> _isCollapsedSubject =
      BehaviorSubject.seeded(true);

  @override
  bool get isPossibleToCollapse =>
      (status.content?.length ?? 0) > minimumCharactersLimitToCollapse;

  @override
  Stream<bool> get isPossibleToCollapseStream => statusStream.map((status) =>
      (status.content?.length ?? 0) > minimumCharactersLimitToCollapse);

  @override
  bool get isCollapsed => _isCollapsedSubject.value;

  @override
  Stream<bool> get isCollapsedStream => _isCollapsedSubject.stream;

  @override
  void toggleCollapseExpand() {
    _isCollapsedSubject.add(!isCollapsed);
  }

  @override
  void collapse() {
    _isCollapsedSubject.add(true);
  }

  @override
  bool get isNeedShowFullContent => !(isPossibleToCollapse && isCollapsed);

  @override
  Stream<bool> get isNeedShowFullContentStream => Rx.combineLatest2(
      isPossibleToCollapseStream,
      isCollapsedStream,
      (isPossibleToCollapse, isCollapsed) =>
          !(isPossibleToCollapse && isCollapsed));

  final BehaviorSubject<IStatus> _statusSubject;

  // ignore: close_sinks
  final BehaviorSubject<bool> _displayNsfwSensitiveSubject =
      BehaviorSubject.seeded(false);

  // ignore: close_sinks
  final BehaviorSubject<bool> _displaySpoilerSubject =
      BehaviorSubject.seeded(false);

  final IPleromaStatusService pleromaStatusService;
  final IPleromaAccountService pleromaAccountService;
  final IPleromaStatusEmojiReactionService pleromaStatusEmojiReactionService;
  final IStatusRepository statusRepository;
  final IAccountRepository accountRepository;
  final bool isNeedWatchLocalRepositoryForUpdates;

  StatusBloc({
    @required this.pleromaStatusService,
    @required this.pleromaAccountService,
    @required this.pleromaStatusEmojiReactionService,
    @required this.statusRepository,
    @required this.accountRepository,
    @required
        IStatus
            status, // for better performance we don't update account too often
    bool needRefreshFromNetworkOnInit =
        false, // todo: remove hack. Don't init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
    this.isNeedWatchLocalRepositoryForUpdates = true,
  }) : _statusSubject = BehaviorSubject.seeded(status) {
    addDisposable(subject: _statusSubject);
    addDisposable(subject: _displayNsfwSensitiveSubject);
    addDisposable(subject: _displaySpoilerSubject);
    addDisposable(subject: _isCollapsedSubject);

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
    if (!disposed) {
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
  Stream<IStatus> get statusStream => _statusSubject.stream.distinct();

  @override
  IStatus get reblogOrOriginal => reblog ?? status;

  @override
  Stream<IStatus> get reblogOrOriginalStream => Rx.combineLatest2(
      statusStream, reblogStream, (original, reblog) => reblog ?? original);

  @override
  bool get isHaveInReplyToAccount => status.inReplyToAccountRemoteId != null;

  @override
  Stream<bool> get isHaveInReplyToAccountStream => statusStream
      .map((status) => status.inReplyToAccountRemoteId != null)
      .distinct();

  @override
  IAccount get account => status?.account;

  @override
  Stream<IAccount> get accountStream =>
      statusStream.map((status) => status.account).distinct();

  @override
  IAccount get reblogOrOriginalAccount => reblogOrOriginal?.account;

  @override
  Stream<IAccount> get reblogOrOriginalAccountStream =>
      reblogOrOriginalStream.map((status) => status.account).distinct();

  @override
  DateTime get createdAt => status?.createdAt;

  @override
  Stream<DateTime> get createdAtStream =>
      statusStream.map((status) => status?.createdAt).distinct();

  @override
  bool get isHaveReblog => status?.reblogStatusRemoteId != null;

  @override
  Stream<bool> get isHaveReblogStream => statusStream
      .map((status) => status?.reblogStatusRemoteId != null)
      .distinct();

  @override
  String get remoteId => status.remoteId;

  @override
  List<IPleromaMention> get mentions => status.mentions;

  @override
  Stream<List<IPleromaMention>> get mentionsStream =>
      statusStream.map((status) => status.mentions).distinct();

  @override
  Future<IAccount> loadInReplyToAccount() {
    assert(status.inReplyToAccountRemoteId != null);
    return accountRepository.findByRemoteId(status.inReplyToAccountRemoteId);
  }

  @override
  Stream<IAccount> watchInReplyToAccount() {
    assert(status.inReplyToAccountRemoteId != null);
    return accountRepository.watchByRemoteId(status.inReplyToAccountRemoteId);
  }

  @override
  String get content => status?.content;

  @override
  Stream<String> get contentStream =>
      statusStream.map((status) => status?.content).distinct();

  @override
  IPleromaCard get card => status?.card;

  @override
  Stream<IPleromaCard> get cardStream =>
      statusStream.map((status) => status?.card).distinct();

  IPleromaCard get reblogCard => reblog?.card;

  Stream<IPleromaCard> get reblogCardStream =>
      reblogStream.map((status) => status?.card).distinct();

  @override
  IPleromaCard get reblogOrOriginalCard => reblogCard ?? card;

  @override
  Stream<IPleromaCard> get reblogOrOriginalCardStream => Rx.combineLatest2(
      cardStream,
      reblogCardStream,
      (originalCard, reblogCard) => reblogCard ?? originalCard);

  @override
  String get contentWithEmojisWithoutAccount =>
      _excludeAccountFromHtmlContent(contentWithEmojis, account.url);

  @override
  Stream<String> get contentWithEmojisWithoutAccountStream =>
      contentWithEmojisStream
          // actually we should listen account too, but url don't changes too often
          .map((contentWithEmojis) =>
              _excludeAccountFromHtmlContent(contentWithEmojis, account.url))
          .distinct();

  @override
  List<IPleromaMediaAttachment> get mediaAttachments =>
      status?.mediaAttachments;

  @override
  Stream<List<IPleromaMediaAttachment>> get mediaAttachmentsStream =>
      statusStream.map((status) => status.mediaAttachments).distinct();

  @override
  String get accountAvatar => account?.avatar;

  @override
  Stream<String> get accountAvatarStream =>
      accountStream.map((account) => account.avatar).distinct();

  @override
  bool get favourited => status?.favourited;

  @override
  Stream<bool> get favouritedStream =>
      statusStream.map((status) => status?.favourited).distinct();

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
  String get contentWithEmojis =>
      addEmojiToHtmlContent(status.content, status.emojis);

  @override
  Stream<String> get contentWithEmojisStream => statusStream
      .map((status) => addEmojiToHtmlContent(status.content, status.emojis))
      .distinct();

  @override
  bool get reblogged => status.reblogged;

  @override
  Stream<bool> get rebloggedStream =>
      statusStream.map((status) => status.reblogged).distinct();

  @override
  bool get muted => status.muted;

  @override
  Stream<bool> get mutedStream =>
      statusStream.map((status) => status.muted).distinct();

  @override
  bool get bookmarked => status.bookmarked;

  @override
  Stream<bool> get bookmarkedStream =>
      statusStream.map((status) => status.bookmarked).distinct();

  @override
  bool get pinned => status.pinned;

  @override
  Stream<bool> get pinnedStream =>
      statusStream.map((status) => status.pinned).distinct();

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
  int get favouritesCount => status.favouritesCount;

  @override
  Stream<int> get favouritesCountStream =>
      statusStream.map((status) => status.favouritesCount).distinct();

  int get reblogFavouritesCount => reblog?.favouritesCount;

  Stream<int> get reblogFavouritesCountStream =>
      reblogStream.map((status) => status?.favouritesCount).distinct();

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
      statusStream.map((status) => status.reblogsCount).distinct();

  int get reblogReblogsCount => reblog?.reblogsCount;

  Stream<int> get reblogReblogsCountStream =>
      reblogStream.map((status) => status?.reblogsCount).distinct();

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
      statusStream.map((status) => status.repliesCount).distinct();

  @override
  Future<IStatus> toggleFavourite() async {
    IPleromaStatus remoteStatus;
    if (status.favourited) {
      remoteStatus = await pleromaStatusService.unFavouriteStatus(
          statusRemoteId: status.remoteId);
    } else {
      remoteStatus = await pleromaStatusService.favouriteStatus(
          statusRemoteId: status.remoteId);
    }

    await statusRepository.updateLocalStatusByRemoteStatus(
        oldLocalStatus: status, newRemoteStatus: remoteStatus);

    return statusRepository.findByRemoteId(status.remoteId);
  }

  @override
  Future<IStatus> toggleReblog() async {
    _logger.finest(
        () => "requestToggleReblog status.reblogged=${status.reblogged}");
    IPleromaStatus remoteStatus;
    if (status.reblogged) {
      remoteStatus = await pleromaStatusService.unReblogStatus(
          statusRemoteId: status.remoteId);
    } else {
      remoteStatus = await pleromaStatusService.reblogStatus(
          statusRemoteId: status.remoteId);
    }

    await statusRepository.updateLocalStatusByRemoteStatus(
        oldLocalStatus: status, newRemoteStatus: remoteStatus);

    return statusRepository.findByRemoteId(status.remoteId);
  }

  @override
  Future<IStatus> toggleMute() async {
    IPleromaStatus remoteStatus;
    if (status.muted) {
      remoteStatus = await pleromaStatusService.unMuteStatus(
          statusRemoteId: status.remoteId);
    } else {
      remoteStatus = await pleromaStatusService.muteStatus(
          statusRemoteId: status.remoteId);
    }

    await statusRepository.updateLocalStatusByRemoteStatus(
        oldLocalStatus: status, newRemoteStatus: remoteStatus);

    return statusRepository.findByRemoteId(status.remoteId);
  }

  @override
  Future<IStatus> toggleBookmark() async {
    IPleromaStatus remoteStatus;
    if (status.bookmarked) {
      remoteStatus = await pleromaStatusService.unBookmarkStatus(
          statusRemoteId: status.remoteId);
    } else {
      remoteStatus = await pleromaStatusService.bookmarkStatus(
          statusRemoteId: status.remoteId);
    }

    await statusRepository.updateLocalStatusByRemoteStatus(
        oldLocalStatus: status, newRemoteStatus: remoteStatus);

    return statusRepository.findByRemoteId(status.remoteId);
  }

  @override
  Future<IStatus> togglePin() async {
    IPleromaStatus remoteStatus;
    if (status.pinned) {
      remoteStatus = await pleromaStatusService.unPinStatus(
          statusRemoteId: status.remoteId);
    } else {
      // reblogged don't support pin
      if (status.reblogged) {
        remoteStatus = await pleromaStatusService.pinStatus(
            statusRemoteId: reblog.remoteId);
      } else {
        remoteStatus = await pleromaStatusService.pinStatus(
            statusRemoteId: status.remoteId);
      }
    }

    await statusRepository.updateLocalStatusByRemoteStatus(
        oldLocalStatus: status, newRemoteStatus: remoteStatus);

    return statusRepository.findByRemoteId(status.remoteId);
  }

  @override
  List<IPleromaStatusEmojiReaction> get pleromaEmojiReactions =>
      status.pleromaEmojiReactions;

  @override
  Stream<List<IPleromaStatusEmojiReaction>> get pleromaEmojiReactionsStream =>
      statusStream.map((status) => status.pleromaEmojiReactions).distinct();

  List<IPleromaStatusEmojiReaction> get reblogPleromaEmojiReactions =>
      reblog?.pleromaEmojiReactions;

  Stream<List<IPleromaStatusEmojiReaction>>
      get reblogPleromaEmojiReactionsStream => reblogStream
          .map((status) => status?.pleromaEmojiReactions)
          .distinct();

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
                  emojiReactionsOriginal, emojiReactionsReblog));

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
  void dispose() {
    super.dispose();

    _logger.finest(() => "dispose");
  }

  @override
  IStatus get reblog => status.reblog;

  @override
  Stream<IStatus> get reblogStream =>
      statusStream.map((status) => status.reblog).distinct();

  @override
  void changeDisplayNsfwSensitive(bool display) {
    _displayNsfwSensitiveSubject.add(display);
  }

  @override
  void changeDisplaySpoiler(bool display) {
    _displaySpoilerSubject.add(display);
  }

  @override
  bool get nsfwSensitive => reblogOrOriginal.nsfwSensitive;

  @override
  Stream<bool> get nsfwSensitiveStream =>
      reblogOrOriginalStream.map((status) => status.nsfwSensitive);

  @override
  String get spoilerText => reblogOrOriginal.spoilerText;

  @override
  Stream<String> get spoilerTextStream =>
      reblogOrOriginalStream.map((status) => status.spoilerText);

  @override
  bool get containsSpoiler => spoilerText?.isNotEmpty == true;

  @override
  Stream<bool> get containsSpoilerStream =>
      spoilerTextStream.map((spoilerText) => spoilerText?.isNotEmpty == true);

  @override
  bool get containsSpoilerAndDisplayEnabled {
    if (containsSpoiler) {
      return _displaySpoilerSubject.value;
    } else {
      return true;
    }
  }

  @override
  Stream<bool> get containsSpoilerAndDisplayEnabledStream =>
      Rx.combineLatest2(containsSpoilerStream, _displaySpoilerSubject.stream,
          (containsSpoiler, displaySpoiler) {
        if (containsSpoiler) {
          return displaySpoiler;
        } else {
          return true;
        }
      });

  @override
  bool get nsfwSensitiveAndDisplayEnabled {
    if (nsfwSensitive) {
      return _displayNsfwSensitiveSubject.value;
    } else {
      return true;
    }
  }

  @override
  @override
  Stream<bool> get nsfwSensitiveAndDisplayEnabledStream => Rx.combineLatest2(
          nsfwSensitiveStream, _displayNsfwSensitiveSubject.stream,
          (nsfwSensitive, displaySpoiler) {
        if (nsfwSensitive) {
          return displaySpoiler;
        } else {
          return true;
        }
      });

  // todo: recheck, regex looks very strange
  String _excludeAccountFromHtmlContent(String htmlContent, String accountURL) {
    String newHtmlContent =
        htmlContent?.replaceFirst(RegExp('@<span>.*<\/span>'), "</a>");
    // String newHtmlContent =
    //     html.replaceAll(RegExp('<\s*a[^>]*>(?=@).*<\s*\/\s*a>'), "");
    // print(newHtmlContent);
    return newHtmlContent;
  }

  @override
  String get contentWithEmojisCollapsible =>
      isCollapsed ? _collapseContent(contentWithEmojis) : contentWithEmojis;

  @override
  Stream<String> get contentWithEmojisCollapsibleStream => Rx.combineLatest2(
      contentWithEmojisStream,
      isCollapsedStream,
      (contentWithEmojis, isCollapsed) => isCollapsed
          ? _collapseContent(contentWithEmojis)
          : contentWithEmojis);

  String _collapseContent(String contentWithEmojis) {
    // todo: check html tags
    if (contentWithEmojis.length > minimumCharactersLimitToCollapse) {
      var collapsedContent =
          contentWithEmojis.substring(0, minimumCharactersLimitToCollapse);
      return "$collapsedContent...";
    } else {
      return contentWithEmojis;
    }
  }
}
