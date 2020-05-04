import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/refactored/app/status/scheduled/scheduled_status_bloc.dart';
import 'package:fedi/refactored/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/refactored/pleroma/status/scheduled/pleroma_scheduled_status_service.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
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
  bool get sensitive => scheduledStatus.params.sensitive;

  @override
  Stream<bool> get sensitiveStream => scheduledStatusStream
      .map((scheduledStatus) => scheduledStatus.params.sensitive);

  @override
  String get spoilerText => scheduledStatus.params.spoilerText;

  @override
  Stream<String> get spoilerTextStream => scheduledStatusStream
      .map((scheduledStatus) => scheduledStatus.params.spoilerText);

  @override
  String get visibility => scheduledStatus.params.visibility;

  @override
  Stream<String> get visibilityStream => scheduledStatusStream
      .map((scheduledStatus) => scheduledStatus.params.visibility);

  @override
  String get inReplyToId => scheduledStatus.params.inReplyToId;

  @override
  Stream<String> get inReplyToIdStream => scheduledStatusStream
      .map((scheduledStatus) => scheduledStatus.params.inReplyToId);

  @override
  List<IPleromaMediaAttachment> get mediaAttachments =>
      scheduledStatus.mediaAttachments;

  @override
  Stream<List<IPleromaMediaAttachment>> get mediaAttachmentsStream =>
      scheduledStatusStream
          .map((scheduledStatus) => scheduledStatus.mediaAttachments);

  @override
  String get text => scheduledStatus.params.text;

  @override
  Stream<String> get textStream => scheduledStatusStream
      .map((scheduledStatus) => scheduledStatus.params.text);

  @override
  PleromaVisibility get pleromaVisibility =>
      scheduledStatus.params.pleromaVisibility;

  @override
  Stream<PleromaVisibility> get pleromaVisibilityStream => scheduledStatusStream
      .map((scheduledStatus) => scheduledStatus.params.pleromaVisibility);

  @override
  Future cancelSchedule() async {
    var success = await pleromaScheduledStatusService.cancelScheduledStatus(
        scheduledStatusRemoteId: remoteId);

    // TODO: implement cancelSchedule
    throw UnimplementedError();
  }

  @override
  Future reSchedule({@required DateTime scheduledAt}) async {
    var newScheduledStatus = await pleromaScheduledStatusService
        .reScheduleStatus(scheduledStatusRemoteId: remoteId, scheduledAt:scheduledAt);

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
}
