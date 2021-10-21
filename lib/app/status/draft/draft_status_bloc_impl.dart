import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/draft/draft_status_bloc.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

class DraftStatusBloc extends DisposableOwner implements IDraftStatusBloc {
  // ignore: close_sinks
  final BehaviorSubject<IDraftStatus> _draftStatusSubject;

  final IUnifediApiStatusService unifediApiStatusService;
  final IDraftStatusRepository draftStatusRepository;
  final IScheduledStatusRepository scheduledStatusRepository;
  final IStatusRepository statusRepository;
  final bool isNeedWatchLocalRepositoryForUpdates;

  // ignore: close_sinks
  final BehaviorSubject<DraftStatusState> _stateSubject =
      BehaviorSubject.seeded(DraftStatusState.draft);

  @override
  DraftStatusState? get state => _stateSubject.value;

  @override
  Stream<DraftStatusState> get stateStream => _stateSubject.stream;

  DraftStatusBloc({
    required this.unifediApiStatusService,
    required this.statusRepository,
    required this.scheduledStatusRepository,
    required this.draftStatusRepository,
    required IDraftStatus draftStatus, // for better performance we dont
    // todo: remove hack. Dont init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
    this.isNeedWatchLocalRepositoryForUpdates = true,
  }) : _draftStatusSubject = BehaviorSubject.seeded(draftStatus) {
    _draftStatusSubject.disposeWith(this);
    _stateSubject.disposeWith(this);

    if (delayInit) {
      Future.delayed(const Duration(seconds: 1), () {
        _init(draftStatus);
      });
    } else {
      _init(draftStatus);
    }
  }

  void _init(IDraftStatus draftStatus) {
    if (!isDisposed) {
      if (isNeedWatchLocalRepositoryForUpdates) {
        draftStatusRepository.watchByDbIdInAppType(draftStatus.localId!).listen(
          (updatedStatus) {
            if (updatedStatus != null) {
              _draftStatusSubject.add(updatedStatus);
            }
          },
        ).disposeWith(this);
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
        unifediApiStatusService:
            Provider.of<IUnifediApiStatusService>(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        draftStatusRepository:
            IDraftStatusRepository.of(context, listen: false),
        draftStatus: status,
        delayInit: delayInit,
        isNeedWatchLocalRepositoryForUpdates:
            isNeedWatchLocalRepositoryForUpdates,
        scheduledStatusRepository:
            IScheduledStatusRepository.of(context, listen: false),
      );

  @override
  DateTime? get updatedAt => draftStatus.updatedAt;

  @override
  Stream<DateTime?> get updatedAtStream =>
      draftStatusStream.map((draftStatus) => draftStatus.updatedAt);

  @override
  IPostStatusData? calculatePostStatusData() => draftStatus.postStatusData;

  @override
  Future<void> cancelDraft() {
    _stateSubject.add(DraftStatusState.canceled);

    return draftStatusRepository.deleteById(
      draftStatus.localId!,
      batchTransaction: null,
    );
  }

  @override
  Future<void> postDraft(PostStatusData postStatusData) async {
    if (postStatusData.isScheduled) {
      var pleromaScheduledStatus = await unifediApiStatusService.scheduleStatus(
        idempotencyKey: null,
        postStatus: postStatusData.toUnifediApiSchedulePostStatus(),
      );
      // ignore: avoid-ignoring-return-values
      await scheduledStatusRepository
          .upsertInRemoteType(pleromaScheduledStatus);
    } else {
      var inReplyToConversationIdSupported =
          unifediApiStatusService.isFeatureSupported(
        unifediApiStatusService.postStatusInReplyToConversationIdFeature,
      );

      var previewSupported = unifediApiStatusService.isFeatureSupported(
        unifediApiStatusService.postStatusPreviewFeature,
      );

      var expiresInSupported = unifediApiStatusService.isFeatureSupported(
        unifediApiStatusService.postStatusExpiresInFeature,
      );

      var postStatus = postStatusData.toPostStatus(
        inReplyToConversationIdSupported: inReplyToConversationIdSupported,
        previewSupported: previewSupported,
        expiresInSupported: expiresInSupported,
      );

      var unifediApiStatus = await unifediApiStatusService.postStatus(
        idempotencyKey: null,
        postStatus: postStatus,
      );
      await statusRepository.upsertRemoteStatusWithAllArguments(
        unifediApiStatus,
        listRemoteId: null,
        conversationRemoteId: postStatusData.inReplyToConversationId,
        isFromHomeTimeline: null,
        batchTransaction: null,
      );
    }

    await draftStatusRepository.deleteById(
      draftStatus.localId!,
      batchTransaction: null,
    );

    _stateSubject.add(DraftStatusState.alreadyPosted);
  }

  @override
  Future<void> updatePostStatusData(
    PostStatusData postStatusData, {
    required Batch? batchTransaction,
  }) async {
    var localId = draftStatus.localId;
    await draftStatusRepository.updateByDbIdInDbType(
      dbId: localId!,
      dbItem: DbDraftStatus(
        id: localId,
        updatedAt: DateTime.now(),
        data: postStatusData,
      ),
      batchTransaction: batchTransaction,
    );
  }
}
