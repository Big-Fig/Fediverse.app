import 'dart:async';

import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_bloc.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/status/scheduled/pleroma_scheduled_status_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("scheduled_status_bloc_impl.dart");

class ScheduledStatusBloc extends DisposableOwner
    implements IScheduledStatusBloc {
  // ignore: close_sinks
  final BehaviorSubject<IScheduledStatus> _scheduledStatusSubject;

  // ignore: close_sinks
  final BehaviorSubject<ScheduledStatusState> _stateSubject = BehaviorSubject();

  @override
  ScheduledStatusState get state => _stateSubject.value;

  @override
  Stream<ScheduledStatusState> get stateStream => _stateSubject.stream;

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
        IScheduledStatus scheduledStatus, // for better performance we don't
    // update
    // account too often
    bool needRefreshFromNetworkOnInit =
        false, // todo: remove hack. Don't init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
    this.isNeedWatchLocalRepositoryForUpdates = true,
  }) : _scheduledStatusSubject = BehaviorSubject.seeded(scheduledStatus) {
    addDisposable(subject: _scheduledStatusSubject);
    addDisposable(subject: _stateSubject);

    _updateState();
    // _checkCanceled
    addDisposable(streamSubscription: scheduledStatusStream.listen((_) {
      _updateState();
    }));

    // check expired
    addDisposable(
        timer: Timer.periodic(Duration(minutes: 1), (_) {
      _updateState();
    }));

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

  @override
  IScheduledStatus get scheduledStatus => _scheduledStatusSubject.value;

  @override
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

  void _updateState() {
    _logger.finest(() => "_updateState isCanceled ${scheduledStatus.canceled}");
    bool isCanceled = scheduledStatus.canceled;
    if (isCanceled) {
      _stateSubject.add(ScheduledStatusState.canceled);
    } else {
      DateTime scheduledAt = scheduledStatus.scheduledAt;

      var isExpired = scheduledAt.isBefore(DateTime.now());

      _logger.finest(() => "_updateState isExpired $isExpired");
      if (isExpired) {
        _stateSubject.add(ScheduledStatusState.alreadyPosted);
      } else {
        _stateSubject.add(ScheduledStatusState.scheduled);
      }
    }
  }

  @override
  Future<bool> postScheduledPost(PostStatusData postStatusData) async {
    await cancelSchedule();

    var pleromaScheduledStatus = await pleromaStatusService.scheduleStatus(
        data: PleromaScheduleStatus(
      mediaIds: postStatusData.mediaAttachments
          ?.map((mediaAttachment) => mediaAttachment.id)
          ?.toList(),
      status: postStatusData.text,
      sensitive: postStatusData.isNsfwSensitiveEnabled,
      visibility: postStatusData.visibility,
      inReplyToId: postStatusData.inReplyToPleromaStatus?.id,
      inReplyToConversationId: postStatusData.inReplyToConversationId,
      idempotencyKey: null,
      scheduledAt: postStatusData.scheduledAt,
      to: postStatusData.to,
      poll: postStatusData.poll != null
          ? PleromaPostStatusPoll(
              expiresInSeconds:
                  (postStatusData.poll.durationLength.inMicroseconds /
                          Duration.microsecondsPerSecond)
                      .floor(),
              multiple: postStatusData.poll.multiple,
              options: postStatusData.poll.options,
              hideTotals: postStatusData.poll.hideTotals,
            )
          : null,
      spoilerText: postStatusData.subject,
    ));

    await scheduledStatusRepository
        .upsertRemoteScheduledStatus(pleromaScheduledStatus);

    return true;
  }

  @override
  IPostStatusData calculatePostStatusData() {
    assert(
      scheduledStatus.params.inReplyToId == null,
      "inReplyToId not supported",
    );

    return PostStatusData(
      subject: scheduledStatus.params.spoilerText,
      text: scheduledStatus.params.text,
      scheduledAt: scheduledStatus.scheduledAt,
      visibility: scheduledStatus.params.visibilityPleroma.toJsonValue(),
      mediaAttachments: scheduledStatus.mediaAttachments,
      poll: scheduledStatus.params?.poll != null
          ? PostStatusPoll(
              durationLength: Duration(
                  seconds: scheduledStatus.params.poll.expiresInSeconds),
              hideTotals: scheduledStatus.params.poll.hideTotals,
              multiple: scheduledStatus.params.poll.multiple,
              options: scheduledStatus.params.poll.options,
            )
          : null,
      inReplyToPleromaStatus: null,
      inReplyToConversationId: null,
      isNsfwSensitiveEnabled: scheduledStatus.params.sensitive,
      // actually to should be extracted fro
      to: null,
    );
  }
}
