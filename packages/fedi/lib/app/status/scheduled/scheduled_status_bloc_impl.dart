import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_bloc.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('scheduled_status_bloc_impl.dart');

class ScheduledStatusBloc extends DisposableOwner
    implements IScheduledStatusBloc {
  // ignore: close_sinks
  final BehaviorSubject<IScheduledStatus> _scheduledStatusSubject;

  // ignore: close_sinks
  final BehaviorSubject<ScheduledStatusState?> _stateSubject =
      BehaviorSubject();

  @override
  ScheduledStatusState? get state => _stateSubject.value;

  @override
  Stream<ScheduledStatusState?> get stateStream => _stateSubject.stream;

  final IUnifediApiStatusService unifediApiStatusService;
  final IScheduledStatusRepository scheduledStatusRepository;
  final IStatusRepository statusRepository;
  final bool isNeedWatchLocalRepositoryForUpdates;

  ScheduledStatusBloc({
    required this.unifediApiStatusService,
    required this.statusRepository,
    required this.scheduledStatusRepository,
    required IScheduledStatus scheduledStatus, // for better performance we dont
    // update
    // account too often
    bool needRefreshFromNetworkOnInit =
        false, // todo: remove hack. Dont init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
    this.isNeedWatchLocalRepositoryForUpdates = true,
  }) : _scheduledStatusSubject = BehaviorSubject.seeded(scheduledStatus) {
    _scheduledStatusSubject.disposeWith(this);
    _stateSubject.disposeWith(this);

    _updateState();
    // _checkCanceled
    scheduledStatusStream.listen(
      (_) {
        _updateState();
      },
    ).disposeWith(this);

    // check expired
    Timer.periodic(
      const Duration(minutes: 1),
      (_) {
        _updateState();
      },
    ).disposeWith(this);

    if (delayInit) {
      Future.delayed(const Duration(seconds: 1), () {
        _init(scheduledStatus, needRefreshFromNetworkOnInit);
      });
    } else {
      _init(scheduledStatus, needRefreshFromNetworkOnInit);
    }
  }

  void _init(
    IScheduledStatus scheduledStatus,
    bool needRefreshFromNetworkOnInit,
  ) {
    if (!isDisposed) {
      if (isNeedWatchLocalRepositoryForUpdates) {
        scheduledStatusRepository
            .watchByDbIdInAppType(scheduledStatus.localId!)
            .listen(
          (updatedStatus) {
            if (updatedStatus != null) {
              _scheduledStatusSubject.add(updatedStatus);
            }
          },
        ).disposeWith(this);
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
  String? get remoteId => scheduledStatus.remoteId;

  @override
  DateTime get scheduledAt => scheduledStatus.scheduledAt;

  @override
  Stream<DateTime> get scheduledAtStream => scheduledStatusStream.map(
        (scheduledStatus) => scheduledStatus.scheduledAt,
      );

  @override
  String? get spoilerText => scheduledStatus.params.spoilerText;

  @override
  Stream<String?> get spoilerTextStream => scheduledStatusStream.map(
        (scheduledStatus) => scheduledStatus.params.spoilerText,
      );

  @override
  List<IUnifediApiMediaAttachment>? get mediaAttachments =>
      scheduledStatus.mediaAttachments;

  @override
  Stream<List<IUnifediApiMediaAttachment>?> get mediaAttachmentsStream =>
      scheduledStatusStream
          .map((scheduledStatus) => scheduledStatus.mediaAttachments);

  @override
  Future<void> cancelSchedule() async {
    await unifediApiStatusService.cancelScheduledStatus(
      scheduledStatusId: remoteId!,
    );

    await scheduledStatusRepository.markAsCanceled(
      scheduledStatus: scheduledStatus,
      batchTransaction: null,
    );
  }

  @override
  Future<void> reSchedule({
    required DateTime scheduledAt,
  }) async {
    var newScheduledStatus = await unifediApiStatusService.reScheduleStatus(
      scheduledStatusId: remoteId!,
      scheduledAt: scheduledAt,
    );

    await scheduledStatusRepository.updateAppTypeByRemoteType(
      appItem: scheduledStatus,
      remoteItem: newScheduledStatus,
      batchTransaction: null,
    );
  }

  @override
  Future<void> refreshFromNetwork() async {
    var newScheduledStatus = await unifediApiStatusService.getScheduledStatus(
      scheduledStatusId: remoteId!,
    );

    await scheduledStatusRepository.updateAppTypeByRemoteType(
      appItem: scheduledStatus,
      remoteItem: newScheduledStatus,
      batchTransaction: null,
    );
  }

  static ScheduledStatusBloc createFromContext(
    BuildContext context,
    IScheduledStatus status, {
    bool isNeedWatchLocalRepositoryForUpdates = true,
    bool delayInit = true,
  }) =>
      ScheduledStatusBloc(
        unifediApiStatusService:
            Provider.of<IUnifediApiStatusService>(context, listen: false),
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
    _logger.finest(() => '_updateState isCanceled ${scheduledStatus.canceled}');
    var isCanceled = scheduledStatus.canceled;
    if (isCanceled) {
      _stateSubject.add(ScheduledStatusState.canceled);
    } else {
      var scheduledAt = scheduledStatus.scheduledAt;

      var isExpired = scheduledAt.isBefore(DateTime.now());

      _logger.finest(() => '_updateState isExpired $isExpired');
      if (isExpired) {
        _stateSubject.add(ScheduledStatusState.alreadyPosted);
      } else {
        _stateSubject.add(ScheduledStatusState.scheduled);
      }
    }
  }

  @override
  Future<void> postScheduledPost(PostStatusData postStatusData) async {
    await cancelSchedule();

    var pleromaScheduledStatus = await unifediApiStatusService.scheduleStatus(
      idempotencyKey: null,
      postStatus: UnifediApiSchedulePostStatus(
        mediaIds: postStatusData.mediaAttachments
            ?.toUnifediApiMediaAttachmentIdList(),
        status: postStatusData.text,
        sensitive: postStatusData.isNsfwSensitiveEnabled,
        visibility: postStatusData.visibilityString,
        inReplyToId: postStatusData.inReplyToUnifediApiStatus?.id,
        inReplyToConversationId: postStatusData.inReplyToConversationId,
        scheduledAt: postStatusData.scheduledAt!,
        to: postStatusData.to,
        poll: postStatusData.poll?.toUnifediApiPostStatusPoll(),
        spoilerText: postStatusData.subject,
        language: postStatusData.language,
        expiresInSeconds: postStatusData.expiresInSeconds,
        preview: null,
        contentType: null,
      ),
    );

    // ignore: avoid-ignoring-return-values
    await scheduledStatusRepository.upsertInRemoteType(pleromaScheduledStatus);
  }

  @override
  IPostStatusData calculatePostStatusData() {
    assert(
      scheduledStatus.params.inReplyToId == null,
      'inReplyToId not supported',
    );

    return PostStatusData(
      subject: scheduledStatus.params.spoilerText,
      text: scheduledStatus.params.text,
      scheduledAt: scheduledStatus.scheduledAt,
      visibilityString:
          scheduledStatus.params.visibilityAsUnifediApi.stringValue,
      mediaAttachments: scheduledStatus.mediaAttachments,
      poll: scheduledStatus.params.poll?.toPostStatusPoll(),
      inReplyToUnifediApiStatus:
          // todo: rework
          null,
      inReplyToConversationId: scheduledStatus.params.inReplyToConversationId,
      isNsfwSensitiveEnabled: scheduledStatus.params.sensitive,
      to: scheduledStatus.params.to,
      language: scheduledStatus.params.language,
      expiresInSeconds: scheduledStatus.params.expiresInSeconds,
    );
  }
}
