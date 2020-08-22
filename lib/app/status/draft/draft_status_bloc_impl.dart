import 'dart:async';

import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/draft/draft_status_bloc.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class DraftStatusBloc extends DisposableOwner implements IDraftStatusBloc {
  // ignore: close_sinks
  final BehaviorSubject<IDraftStatus> _draftStatusSubject;

  final IPleromaStatusService pleromaStatusService;
  final IDraftStatusRepository draftStatusRepository;
  final IStatusRepository statusRepository;
  final bool isNeedWatchLocalRepositoryForUpdates;

  DraftStatusBloc({
    @required this.pleromaStatusService,
    @required this.statusRepository,
    @required this.draftStatusRepository,
    @required IDraftStatus draftStatus, // for better performance we don't
    // todo: remove hack. Don't init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
    this.isNeedWatchLocalRepositoryForUpdates = true,
  }) : _draftStatusSubject = BehaviorSubject.seeded(draftStatus) {
    addDisposable(subject: _draftStatusSubject);

    assert(isNeedWatchLocalRepositoryForUpdates != null);
    if (delayInit) {
      Future.delayed(Duration(seconds: 1), () {
        _init(draftStatus);
      });
    } else {
      _init(draftStatus);
    }
  }

  void _init(IDraftStatus draftStatus) {
    if (!disposed) {
      if (isNeedWatchLocalRepositoryForUpdates) {
        addDisposable(
            streamSubscription: draftStatusRepository
                .watchById(draftStatus.localId)
                .listen((updatedStatus) {
          if (updatedStatus != null) {
            _draftStatusSubject.add(updatedStatus);
          }
        }));
      }
    }
  }

  @override
  IDraftStatus get draftStatus => _draftStatusSubject.value;

  @override
  Stream<IDraftStatus> get draftStatusStream => _draftStatusSubject.stream;

  static DraftStatusBloc createFromContext(
    BuildContext context,
    IDraftStatus status, {
    bool isNeedWatchLocalRepositoryForUpdates = true,
    bool delayInit = true,
  }) =>
      DraftStatusBloc(
        pleromaStatusService: IPleromaStatusService.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        draftStatusRepository:
            IDraftStatusRepository.of(context, listen: false),
        draftStatus: status,
        delayInit: delayInit,
        isNeedWatchLocalRepositoryForUpdates:
            isNeedWatchLocalRepositoryForUpdates,
      );

  @override
  DateTime get updatedAt => draftStatus.updatedAt;

  @override
  Stream<DateTime> get updatedAtStream =>
      draftStatusStream.map((draftStatus) => draftStatus.updatedAt);

  @override
  IPostStatusData calculatePostStatusData() => draftStatus.data;

  @override
  Future cancelDraft() => draftStatusRepository.deleteById(draftStatus.localId);

  @override
  Future updatePostStatusData(PostStatusData postStatusData) async {
    var localId = draftStatus.localId;
    await draftStatusRepository.updateById(
        localId,
        DbDraftStatus(
            id: localId, updatedAt: DateTime.now(), data: postStatusData));
  }
}
