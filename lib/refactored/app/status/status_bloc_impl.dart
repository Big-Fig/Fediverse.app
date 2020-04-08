import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/account_model_adapter.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/refactored/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/refactored/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/refactored/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/refactored/pleroma/status/emoji_reaction/pleroma_status_emoji_reaction_service.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("status_bloc_impl.dart");

class StatusBloc extends DisposableOwner implements IStatusBloc {
  static StatusBloc createFromContext(BuildContext context, IStatus status,
          {bool needWatchLocalRepositoryForUpdates = true}) =>
      StatusBloc(
        pleromaStatusService: IPleromaStatusService.of(context, listen: false),
        pleromaAccountService:
            IPleromaAccountService.of(context, listen: false),
        myAccountBloc: IMyAccountBloc.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        accountRepository: IAccountRepository.of(context, listen: false),
        status: status,
        needRefreshFromNetworkOnInit: false,
        needWatchLocalRepositoryForUpdates: needWatchLocalRepositoryForUpdates,
        pleromaStatusEmojiReactionService:
            IPleromaStatusEmojiReactionService.of(context, listen: false),
      );

  final BehaviorSubject<IStatus> _statusSubject;

  final IMyAccountBloc myAccountBloc;
  final IPleromaStatusService pleromaStatusService;
  final IPleromaAccountService pleromaAccountService;
  final IPleromaStatusEmojiReactionService pleromaStatusEmojiReactionService;
  final IStatusRepository statusRepository;
  final IAccountRepository accountRepository;

  StatusBloc({
    @required this.pleromaStatusService,
    @required this.pleromaAccountService,
    @required this.pleromaStatusEmojiReactionService,
    @required this.myAccountBloc,
    @required this.statusRepository,
    @required this.accountRepository,
    @required IStatus status,
    @required bool needRefreshFromNetworkOnInit,
    @required bool needWatchLocalRepositoryForUpdates,
  }) : _statusSubject = BehaviorSubject.seeded(status) {
    addDisposable(subject: _statusSubject);

    assert(needRefreshFromNetworkOnInit != null);
    assert(needWatchLocalRepositoryForUpdates != null);
    Future.delayed(Duration(seconds: 1), () {
      if (!disposed) {
        if (needWatchLocalRepositoryForUpdates) {
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
          updateFromNetwork();
        }
      }
    });
  }

  @override
  IStatus get status => _statusSubject.value;

  @override
  Stream<IStatus> get statusStream => _statusSubject.stream.distinct();

  IStatus get reblogOrOriginal => reblog ?? status;
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
  IAccount get accountReblogOrOriginalAccount => reblogOrOriginal?.account;

  @override
  Stream<IAccount> get accountReblogOrOriginalStream =>
      reblogOrOriginalStream.map((status) => status.account).distinct();

  @override
  DateTime get createdAt => status?.createdAt;

  @override
  Stream<DateTime> get createdAtStream =>
      statusStream.map((status) => status?.createdAt).distinct();

  @override
  bool get isFromMyAccount =>
      myAccountBloc.account.remoteId == status.account.remoteId;

  @override
  bool get isHaveReblog => status?.reblogStatusRemoteId != null;

  @override
  Stream<bool> get isHaveReblogStream => statusStream
      .map((status) => status?.reblogStatusRemoteId != null)
      .distinct();

  @override
  String get remoteId => status.remoteId;

  List<IPleromaMention> get mentions => status.mentions;

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
  IPleromaCard get cardOriginal => status?.card;

  @override
  Stream<IPleromaCard> get cardOriginalStream =>
      statusStream.map((status) => status?.card).distinct();

  @override
  IPleromaCard get cardReblog => status?.card;

  @override
  Stream<IPleromaCard> get cardReblogStream =>
      statusStream.map((status) => status?.card).distinct();
  @override
  IPleromaCard get cardReblogOrOriginal => cardReblog ?? cardOriginal;

  @override
  Stream<IPleromaCard> get cardReblogOrOriginalStream => Rx.combineLatest2(
      cardOriginalStream,
      cardReblogStream,
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

  String get accountAvatar => account?.avatar;

  Stream<String> get accountAvatarStream =>
      accountStream.map((account) => account.avatar).distinct();

  @override
  bool get favourited => status?.favourited;

  @override
  Stream<bool> get favouritedStream =>
      statusStream.map((status) => status?.favourited).distinct();

  @override
  Future updateFromNetwork() async {
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
      _addEmojiToHtmlContent(status.content, status.emojis);

  @override
  Stream<String> get contentWithEmojisStream => statusStream
      .map((status) => _addEmojiToHtmlContent(status.content, status.emojis))
      .distinct();

  @override
  bool get reblogged => status.reblogged;

  @override
  Stream<bool> get rebloggedStream =>
      statusStream.map((status) => status.reblogged).distinct();

  @override
  Future<IAccount> findMentionAccountByUrl({@required String url}) async {
    var foundMention = mentions?.firstWhere((mention) => mention.url == url,
        orElse: () => null);

    var account;
    if (foundMention != null) {
      var accountRemoteId = foundMention.id;
      if (pleromaAccountService.isApiReadyToUse) {
        var remoteAccount = await pleromaAccountService.getAccount(
            accountRemoteId: accountRemoteId);
        await accountRepository.upsertRemoteAccount(remoteAccount,
            conversationRemoteId: null);
      }
      account = await accountRepository.findByRemoteId(accountRemoteId);
    }

    return account;
  }

  @override
  Future<List<IAccount>> loadFavouritedByAccounts() async {
    var remoteAccounts = await pleromaStatusService.favouritedBy(
        statusRemoteId: status.remoteId);

    // don't await because we don't actually need this, just update local
    // storage with new info
    accountRepository.upsertRemoteAccounts(remoteAccounts,
        conversationRemoteId: null);

    // TODO: rework to many-many relationship table
    return remoteAccounts
        .map((remoteAccount) =>
            DbAccountWrapper(mapRemoteAccountToDbAccount(remoteAccount)))
        .toList();
  }

  @override
  Future<List<IAccount>> loadRebloggedByAccounts() async {
    var remoteAccounts =
        await pleromaStatusService.reblogedBy(statusRemoteId: status.remoteId);

    // don't await because we don't actually need this, just update local
    // storage with new info
    accountRepository.upsertRemoteAccounts(remoteAccounts,
        conversationRemoteId: null);

    // TODO: rework to many-many relationship table
    return remoteAccounts
        .map((remoteAccount) =>
            DbAccountWrapper(mapRemoteAccountToDbAccount(remoteAccount)))
        .toList();
  }

  @override
  int get favouritesOriginalCount => status.favouritesCount;

  @override
  Stream<int> get favouritesOriginalCountStream =>
      statusStream.map((status) => status.favouritesCount).distinct();

  @override
  int get favouritesReblogCount => reblog?.favouritesCount;

  @override
  Stream<int> get favouritesReblogCountStream =>
      reblogStream.map((status) => status?.favouritesCount).distinct();

  @override
  int get favouritesReblogPlusOriginalCount =>
      favouritesOriginalCount + (favouritesReblogCount ?? 0);

  @override
  Stream<int> get favouritesReblogPlusOriginalCountStream => Rx.combineLatest2(
      favouritesOriginalCountStream,
      favouritesReblogCountStream,
      (originalCount, reblogCount) => originalCount + (reblogCount ?? 0));

  @override
  int get reblogsOriginalCount => status.reblogsCount;

  @override
  Stream<int> get reblogsOriginalCountStream =>
      statusStream.map((status) => status.reblogsCount).distinct();

  @override
  int get reblogsReblogCount => reblog?.reblogsCount;

  @override
  Stream<int> get reblogsReblogCountStream =>
      reblogStream.map((status) => status?.reblogsCount).distinct();

  @override
  int get reblogsReblogPlusOriginalCount =>
      reblogsOriginalCount + (reblogsReblogCount ?? 0);

  @override
  Stream<int> get reblogsReblogPlusOriginalCountStream => Rx.combineLatest2(
      reblogsOriginalCountStream,
      reblogsReblogCountStream,
      (originalCount, reblogCount) => originalCount + (reblogCount ?? 0));

  @override
  int get repliesCount => status.repliesCount;

  @override
  Stream<int> get repliesCountStream =>
      statusStream.map((status) => status.repliesCount).distinct();

  @override
  Future<IStatus> requestToggleFavourite() async {
    IPleromaStatus remoteStatus;
    if (status.favourited) {
      remoteStatus = await pleromaStatusService.unFavouriteStatus(
          statusRemoteId: status.remoteId);
    } else {
      remoteStatus = await pleromaStatusService.favouriteStatus(
          statusRemoteId: status.remoteId);
    }

    await statusRepository.upsertRemoteStatus(remoteStatus, listRemoteId:
    null, conversationRemoteId: null);

    // todo: check local status update
//
//    await statusRepository.updateLocalStatusByRemoteStatus(
//        oldLocalStatus: status, newRemoteStatus: remoteStatus);

    return statusRepository.findByRemoteId(status.remoteId);
  }

  @override
  Future<IStatus> requestToggleReblog() async {
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

    await statusRepository.upsertRemoteStatus(remoteStatus, listRemoteId:
    null, conversationRemoteId: null);

    // todo: check local status update
//
//    await statusRepository.updateLocalStatusByRemoteStatus(
//        oldLocalStatus: status, newRemoteStatus: remoteStatus);

    return statusRepository.findByRemoteId(status.remoteId);
  }

  @override
  Future<IStatus> requestToggleMute() async {
    IPleromaStatus remoteStatus;
    if (status.muted) {
      remoteStatus = await pleromaStatusService.unMuteStatus(
          statusRemoteId: status.remoteId);
    } else {
      remoteStatus = await pleromaStatusService.muteStatus(
          statusRemoteId: status.remoteId);
    }

    await statusRepository.upsertRemoteStatus(remoteStatus, listRemoteId:
    null, conversationRemoteId: null);

    // todo: check local status update
//
//    await statusRepository.updateLocalStatusByRemoteStatus(
//        oldLocalStatus: status, newRemoteStatus: remoteStatus);

    return statusRepository.findByRemoteId(status.remoteId);
  }

  @override
  Future<IStatus> requestToggleBookmark() async {
    IPleromaStatus remoteStatus;
    if (status.bookmarked) {
      remoteStatus = await pleromaStatusService.unBookmarkStatus(
          statusRemoteId: status.remoteId);
    } else {
      remoteStatus = await pleromaStatusService.bookmarkStatus(
          statusRemoteId: status.remoteId);
    }

    await statusRepository.upsertRemoteStatus(remoteStatus, listRemoteId:
    null, conversationRemoteId: null);

    // todo: check local status update
//
//    await statusRepository.updateLocalStatusByRemoteStatus(
//        oldLocalStatus: status, newRemoteStatus: remoteStatus);

    return statusRepository.findByRemoteId(status.remoteId);
  }

  @override
  Future<IStatus> requestTogglePin() async {
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

    await statusRepository.upsertRemoteStatus(remoteStatus, listRemoteId:
    null, conversationRemoteId: null);

    // todo: check local status update
//
//    await statusRepository.updateLocalStatusByRemoteStatus(
//        oldLocalStatus: status, newRemoteStatus: remoteStatus);

    return statusRepository.findByRemoteId(status.remoteId);
  }

  @override
  List<IPleromaStatusEmojiReaction> get emojiReactionsOriginal =>
      status.pleromaEmojiReactions;

  @override
  Stream<List<IPleromaStatusEmojiReaction>> get emojiReactionsOriginalStream =>
      statusStream.map((status) => status.pleromaEmojiReactions).distinct();

  @override
  List<IPleromaStatusEmojiReaction> get emojiReactionsReblog =>
      reblog?.pleromaEmojiReactions;

  @override
  Stream<List<IPleromaStatusEmojiReaction>> get emojiReactionsReblogStream =>
      reblogStream.map((status) => status?.pleromaEmojiReactions).distinct();

  List<IPleromaStatusEmojiReaction> get emojiReactionsOriginalPlusReblog =>
      mergeEmojiReactionsLists(emojiReactionsOriginal, emojiReactionsReblog);

  Stream<List<IPleromaStatusEmojiReaction>>
      get emojiReactionsOriginalPlusReblogStream => Rx.combineLatest2(
          emojiReactionsOriginalStream,
          emojiReactionsReblogStream,
          (emojiReactionsOriginal, emojiReactionsReblog) =>
              mergeEmojiReactionsLists(
                  emojiReactionsOriginal, emojiReactionsReblog));

  @override
  Future<IPleromaStatus> requestToggleEmojiReaction(
      {@required String emoji}) async {
    var alreadyAdded;
    var foundEmojiReaction = emojiReactionsOriginal?.firstWhere(
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
}

String _excludeAccountFromHtmlContent(String htmlContent, String accountURL) {
  String newHtmlContent =
      htmlContent?.replaceFirst(RegExp('@<span>.*<\/span>'), "</a>");
  // String newHtmlContent =
  //     html.replaceAll(RegExp('<\s*a[^>]*>(?=@).*<\s*\/\s*a>'), "");
  // print(newHtmlContent);
  return newHtmlContent;
}

String _addEmojiToHtmlContent(
  String content,
  List<IPleromaEmoji> emoji,
) {
  List<IPleromaEmoji> customEmoji = emoji ?? [];

  var newHtmlContent = content;
  for (int i = 0; i < customEmoji.length; i++) {
    var emoji = customEmoji[i];
    String shortcode = emoji.shortcode;
    String url = emoji.url;

    newHtmlContent = newHtmlContent.replaceAll(
        ":$shortcode:", '<img src="$url" width="20">');
  }
  newHtmlContent = "<html> <body>$newHtmlContent</body></html>";
  return newHtmlContent;
}
