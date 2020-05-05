import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/my/my_account_model.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/refactored/app/status/scheduled/scheduled_status_bloc.dart';
import 'package:fedi/refactored/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/refactored/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/refactored/pleroma/status/scheduled/pleroma_scheduled_status_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("scheduled_status_bloc_impl.dart");

class ScheduledStatusBloc extends DisposableOwner
    implements IScheduledStatusBloc {
  static ScheduledStatusBloc createFromContext(
    BuildContext context,
    IScheduledStatus status, {
    bool isNeedWatchLocalRepositoryForUpdates = true,
    bool delayInit = true,
  }) =>
      ScheduledStatusBloc(
        pleromaStatusService: IPleromaStatusService.of(context, listen: false),
        pleromaScheduledStatusService:
            IPleromaScheduledStatusService.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        scheduledStatusRepository:
            IScheduledStatusRepository.of(context, listen: false),
        scheduledStatus: status,
        needRefreshFromNetworkOnInit: false,
        delayInit: delayInit,
        isNeedWatchLocalRepositoryForUpdates:
            isNeedWatchLocalRepositoryForUpdates,
      );

  final BehaviorSubject<IScheduledStatus> _scheduledStatusSubject;

  final IPleromaStatusService pleromaStatusService;
  final IPleromaScheduledStatusService pleromaScheduledStatusService;
  final IScheduledStatusRepository scheduledStatusRepository;
  final IStatusRepository statusRepository;
  final bool isNeedWatchLocalRepositoryForUpdates;

  ScheduledStatusBloc({
    @required this.pleromaStatusService,
    @required this.pleromaScheduledStatusService,
    @required this.statusRepository,
    @required this.scheduledStatusRepository,
    @required
        IScheduledStatus
            scheduledStatus, // for better performance we don't update
    // account too often
    bool needRefreshFromNetworkOnInit =
        false, // todo: remove hack. Don't init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
    this.isNeedWatchLocalRepositoryForUpdates = true,
  }) : _scheduledStatusSubject = BehaviorSubject.seeded(scheduledStatus) {
    addDisposable(subject: _scheduledStatusSubject);

    assert(needRefreshFromNetworkOnInit != null);
    assert(isNeedWatchLocalRepositoryForUpdates != null);
    if (delayInit) {
      Future.delayed(Duration(seconds: 1), () {
        _init(scheduledStatus, needRefreshFromNetworkOnInit);
      });
    } else {
      _init(scheduledStatus, needRefreshFromNetworkOnInit);
    }
  }

  void _init(
      IScheduledStatus scheduledStatus, bool needRefreshFromNetworkOnInit) {
    if (!disposed) {
      if (isNeedWatchLocalRepositoryForUpdates) {
        addDisposable(
            streamSubscription: scheduledStatusRepository
                .watchByRemoteId(scheduledStatus.remoteId)
                .listen((updatedStatus) {
          if (updatedStatus != null) {
            _scheduledStatusSubject.add(updatedStatus);
          }
        }));
      }
      if (needRefreshFromNetworkOnInit) {
        refreshFromNetwork();
      }
    }
  }

  IScheduledStatus get scheduledStatus => _scheduledStatusSubject.value;

  Stream<IScheduledStatus> get scheduledStatusStream =>
      _scheduledStatusSubject.stream;

  @override
  String get remoteId => scheduledStatus.remoteId;

  @override
  DateTime get scheduledAt => scheduledStatus.scheduledAt;

  @override
  Stream<DateTime> get scheduledAtStream => scheduledStatusStream
      .map((scheduledStatus) => scheduledStatus.scheduledAt);

  @override
  String get spoilerText => scheduledStatus.params.spoilerText;

  @override
  Stream<String> get spoilerTextStream => scheduledStatusStream
      .map((scheduledStatus) => scheduledStatus.params.spoilerText);

  @override
  List<IPleromaMediaAttachment> get mediaAttachments =>
      scheduledStatus.mediaAttachments;

  @override
  Stream<List<IPleromaMediaAttachment>> get mediaAttachmentsStream =>
      scheduledStatusStream
          .map((scheduledStatus) => scheduledStatus.mediaAttachments);

  @override
  Future cancelSchedule() async {
    var success = await pleromaScheduledStatusService.cancelScheduledStatus(
        scheduledStatusRemoteId: remoteId);

    if (success) {
      await scheduledStatusRepository.markAsCanceled(
          scheduledStatus: scheduledStatus);
    }
  }

  @override
  Future reSchedule({@required DateTime scheduledAt}) async {
    var newScheduledStatus =
        await pleromaScheduledStatusService.reScheduleStatus(
            scheduledStatusRemoteId: remoteId, scheduledAt: scheduledAt);

    await scheduledStatusRepository
        .updateLocalScheduledStatusByRemoteScheduledStatus(
            oldLocalScheduledStatus: scheduledStatus,
            newRemoteScheduledStatus: newScheduledStatus);
  }

  @override
  Future refreshFromNetwork() async {
    var newScheduledStatus = await pleromaScheduledStatusService
        .getScheduledStatus(scheduledStatusRemoteId: remoteId);

    await scheduledStatusRepository
        .updateLocalScheduledStatusByRemoteScheduledStatus(
            oldLocalScheduledStatus: scheduledStatus,
            newRemoteScheduledStatus: newScheduledStatus);
  }

  @override
  // TODO: implement account
  IAccount get account => null;

  @override
  // TODO: implement accountAvatar
  String get accountAvatar => null;

  @override
  // TODO: implement accountAvatarStream
  Stream<String> get accountAvatarStream => null;

  @override
  // TODO: implement accountStream
  Stream<IAccount> get accountStream => null;

  @override
  // TODO: implement bookmarked
  bool get bookmarked => null;

  @override
  // TODO: implement bookmarkedStream
  Stream<bool> get bookmarkedStream => null;

  @override
  // TODO: implement card
  IPleromaCard get card => null;

  @override
  // TODO: implement cardStream
  Stream<IPleromaCard> get cardStream => null;

  @override
  changeDisplayNsfwSensitive(bool display) {
    // TODO: implement changeDisplayNsfwSensitive
    return null;
  }

  @override
  changeDisplaySpoiler(bool display) {
    // TODO: implement changeDisplaySpoiler
    return null;
  }

  @override
  // TODO: implement containsSpoiler
  bool get containsSpoiler => null;

  @override
  // TODO: implement containsSpoilerAndDisplayEnabled
  bool get containsSpoilerAndDisplayEnabled => null;

  @override
  // TODO: implement containsSpoilerAndDisplayEnabledStream
  Stream<bool> get containsSpoilerAndDisplayEnabledStream => null;

  @override
  // TODO: implement containsSpoilerStream
  Stream<bool> get containsSpoilerStream => null;

  @override
  // TODO: implement content
  String get content => null;

  @override
  // TODO: implement contentStream
  Stream<String> get contentStream => null;

  @override
  // TODO: implement contentWithEmojis
  String get contentWithEmojis => null;

  @override
  // TODO: implement contentWithEmojisStream
  Stream<String> get contentWithEmojisStream => null;

  @override
  // TODO: implement contentWithEmojisWithoutAccount
  String get contentWithEmojisWithoutAccount => null;

  @override
  // TODO: implement contentWithEmojisWithoutAccountStream
  Stream<String> get contentWithEmojisWithoutAccountStream => null;

  @override
  // TODO: implement createdAt
  DateTime get createdAt => null;

  @override
  // TODO: implement createdAtStream
  Stream<DateTime> get createdAtStream => null;

  @override
  // TODO: implement favourited
  bool get favourited => null;

  @override
  // TODO: implement favouritedStream
  Stream<bool> get favouritedStream => null;

  @override
  // TODO: implement favouritesCount
  int get favouritesCount => null;

  @override
  // TODO: implement favouritesCountStream
  Stream<int> get favouritesCountStream => null;

  @override
  // TODO: implement isHaveInReplyToAccount
  bool get isHaveInReplyToAccount => null;

  @override
  // TODO: implement isHaveInReplyToAccountStream
  Stream<bool> get isHaveInReplyToAccountStream => null;

  @override
  // TODO: implement isHaveReblog
  bool get isHaveReblog => null;

  @override
  // TODO: implement isHaveReblogStream
  Stream<bool> get isHaveReblogStream => null;

  @override
  Future<IAccount> loadAccountByMentionUrl({String url}) {
    // TODO: implement loadAccountByMentionUrl
    return null;
  }

  @override
  Future<IAccount> loadInReplyToAccount() {
    // TODO: implement loadInReplyToAccount
    return null;
  }

  @override
  // TODO: implement mentions
  List<IPleromaMention> get mentions => null;

  @override
  // TODO: implement mentionsStream
  Stream<List<IPleromaMention>> get mentionsStream => null;

  @override
  // TODO: implement muted
  bool get muted => null;

  @override
  // TODO: implement mutedStream
  Stream<bool> get mutedStream => null;

  @override
  // TODO: implement nsfwSensitive
  bool get nsfwSensitive => null;

  @override
  // TODO: implement nsfwSensitiveAndDisplayEnabled
  bool get nsfwSensitiveAndDisplayEnabled => null;

  @override
  // TODO: implement nsfwSensitiveAndDisplayEnabledStream
  Stream<bool> get nsfwSensitiveAndDisplayEnabledStream => null;

  @override
  // TODO: implement nsfwSensitiveStream
  Stream<bool> get nsfwSensitiveStream => null;

  @override
  // TODO: implement pinned
  bool get pinned => null;

  @override
  // TODO: implement pinnedStream
  Stream<bool> get pinnedStream => null;

  @override
  // TODO: implement pleromaEmojiReactions
  List<IPleromaStatusEmojiReaction> get pleromaEmojiReactions => null;

  @override
  // TODO: implement pleromaEmojiReactionsStream
  Stream<List<IPleromaStatusEmojiReaction>> get pleromaEmojiReactionsStream =>
      null;

  @override
  // TODO: implement reblog
  IStatus get reblog => null;

  @override
  // TODO: implement reblogOrOriginal
  IStatus get reblogOrOriginal => null;

  @override
  // TODO: implement reblogOrOriginalAccount
  IAccount get reblogOrOriginalAccount => null;

  @override
  // TODO: implement reblogOrOriginalAccountStream
  Stream<IAccount> get reblogOrOriginalAccountStream => null;

  @override
  // TODO: implement reblogOrOriginalCard
  IPleromaCard get reblogOrOriginalCard => null;

  @override
  // TODO: implement reblogOrOriginalCardStream
  Stream<IPleromaCard> get reblogOrOriginalCardStream => null;

  @override
  // TODO: implement reblogOrOriginalStream
  Stream<IStatus> get reblogOrOriginalStream => null;

  @override
  // TODO: implement reblogPlusOriginalEmojiReactionsStream
  Stream<List<IPleromaStatusEmojiReaction>>
      get reblogPlusOriginalEmojiReactionsStream => null;

  @override
  // TODO: implement reblogPlusOriginalFavouritesCount
  int get reblogPlusOriginalFavouritesCount => null;

  @override
  // TODO: implement reblogPlusOriginalFavouritesCountStream
  Stream<int> get reblogPlusOriginalFavouritesCountStream => null;

  @override
  // TODO: implement reblogPlusOriginalPleromaEmojiReactions
  List<IPleromaStatusEmojiReaction>
      get reblogPlusOriginalPleromaEmojiReactions => null;

  @override
  // TODO: implement reblogPlusOriginalReblogsCount
  int get reblogPlusOriginalReblogsCount => null;

  @override
  // TODO: implement reblogPlusOriginalReblogsCountStream
  Stream<int> get reblogPlusOriginalReblogsCountStream => null;

  @override
  // TODO: implement reblogStream
  Stream<IStatus> get reblogStream => null;

  @override
  // TODO: implement reblogged
  bool get reblogged => null;

  @override
  // TODO: implement rebloggedStream
  Stream<bool> get rebloggedStream => null;

  @override
  // TODO: implement reblogsCount
  int get reblogsCount => null;

  @override
  // TODO: implement reblogsCountStream
  Stream<int> get reblogsCountStream => null;

  @override
  // TODO: implement repliesCount
  int get repliesCount => null;

  @override
  // TODO: implement repliesCountStream
  Stream<int> get repliesCountStream => null;

  @override
  // TODO: implement status
  IStatus get status => null;

  @override
  // TODO: implement statusStream
  Stream<IStatus> get statusStream => null;

  @override
  Future<IStatus> toggleBookmark() {
    // TODO: implement toggleBookmark
    return null;
  }

  @override
  Future<IPleromaStatus> toggleEmojiReaction({String emoji}) {
    // TODO: implement toggleEmojiReaction
    return null;
  }

  @override
  Future<IStatus> toggleFavourite() {
    // TODO: implement toggleFavourite
    return null;
  }

  @override
  Future<IStatus> toggleMute() {
    // TODO: implement toggleMute
    return null;
  }

  @override
  Future<IStatus> togglePin() {
    // TODO: implement togglePin
    return null;
  }

  @override
  Future<IStatus> toggleReblog() {
    // TODO: implement toggleReblog
    return null;
  }

  @override
  Stream<IAccount> watchInReplyToAccount() {
    // TODO: implement watchInReplyToAccount
    return null;
  }
}
