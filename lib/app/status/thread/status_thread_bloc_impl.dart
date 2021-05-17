import 'dart:async';

import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/mention/pleroma_api_mention_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_service.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

var _logger = Logger('status_thread_bloc_impl.dart');

abstract class StatusThreadBloc extends AsyncInitLoadingBloc
    implements IStatusThreadBloc {
  final IPleromaApiStatusService pleromaStatusService;

  @override
  late IStatus initialStatusToFetchThread;
  final BehaviorSubject<List<IStatus>> statusesSubject;

  final BehaviorSubject<bool> firstStatusInThreadSubject;
  final StreamController<IStatus> onNewStatusAddedStreamController =
  StreamController.broadcast();

  @override
  Stream<IStatus> get onNewStatusAddedStream =>
      onNewStatusAddedStreamController.stream;

  @override
  final IPleromaApiMediaAttachment? initialMediaAttachment;

  @override
  final ItemScrollController itemScrollController = ItemScrollController();
  @override
  final ItemPositionsListener itemPositionListener =
  ItemPositionsListener.create();

  late List<IFilter> filters;

  @override
  bool isJumpedToStartState = false;

  StatusThreadBloc({
    required this.pleromaStatusService,
    required this.initialStatusToFetchThread,
    required this.initialMediaAttachment,
  })   : statusesSubject = BehaviorSubject.seeded(
    [
      initialStatusToFetchThread,
    ],
  ),
        firstStatusInThreadSubject =
        BehaviorSubject.seeded(!initialStatusToFetchThread.isReply) {
    addDisposable(subject: statusesSubject);
    addDisposable(subject: firstStatusInThreadSubject);
    addDisposable(streamController: onNewStatusAddedStreamController);
    refresh();
  }

  @override
  List<IStatus> get statuses => statusesSubject.value!;

  @override
  Stream<List<IStatus>> get statusesStream => statusesSubject.stream;

  @override
  Stream<List<IStatus>> get statusesDistinctStream => statusesStream.distinct(
        (a, b) => listEquals(a, b),
  );

  @override
  List<IPleromaApiMention> get mentions => statuses.findAllMentions();

  @override
  Stream<List<IPleromaApiMention>> get mentionsStream =>
      statusesStream.map((statuses) => statuses.findAllMentions());

  @override
  List<String?> get mentionAccts => mentions.toAccts();

  @override
  Stream<List<String?>> get mentionAcctsStream => mentionsStream.map(
        (mentions) => mentions.toAccts(),
  );

  @override
  String get mentionAcctsListString =>
      mentionAccts.map((acct) => '@$acct').join(' ');

  @override
  Future<bool> refresh() async {
    try {
      _logger.finest(() => 'refresh');

      // update start status
      var updatedStartRemoteStatus = await pleromaStatusService.getStatus(
        statusRemoteId: initialStatusToFetchThread.remoteId!,
      );
      // dont await because we dont need it
      onInitialStatusUpdated(updatedStartRemoteStatus);
      initialStatusToFetchThread =
          updatedStartRemoteStatus.toDbStatusPopulatedWrapper();

      _logger.finest(
            () => 'refresh getStatus startStatus $initialStatusToFetchThread ',
      );

      // update context
      var remoteStatusContext = await pleromaStatusService.getStatusContext(
        statusRemoteId: initialStatusToFetchThread.remoteId!,
      );
      var ancestors = remoteStatusContext.ancestors.where(
            (remoteStatus) => isNotFiltered(
          remoteStatus: remoteStatus,
          filters: filters,
        ),
      );
      var descendants = remoteStatusContext.descendants.where(
            (remoteStatus) => isNotFiltered(
          remoteStatus: remoteStatus,
          filters: filters,
        ),
      );

      List<IStatus> newStatuses = [];
      newStatuses.addAll(
        ancestors.map(
              (remoteStatus) => remoteStatus.toDbStatusPopulatedWrapper(),
        ),
      );
      newStatuses.add(initialStatusToFetchThread);
      newStatuses.addAll(
        descendants.map(
              (remoteStatus) => remoteStatus.toDbStatusPopulatedWrapper(),
        ),
      );
      _logger.finest(
            () => 'refresh getStatusContext newStatuses ${newStatuses.length} ',
      );
      statusesSubject.add(newStatuses);
      firstStatusInThreadSubject.add(true);

      return true;
    } catch (error, stackTrace) {
      _logger.severe(() => 'refresh error ', error, stackTrace);

      return false;
    }
  }

  Future<List<IFilter>> loadFilters();

  Stream<List<IFilter>> watchFilters();

  void onInitialStatusUpdated(IPleromaApiStatus updatedStartRemoteStatus);

  @override
  int get initialStatusToFetchThreadIndex =>
      statuses.indexOf(initialStatusToFetchThread);

  @override
  IAccount? get firstStatusAccountInThread => firstStatusInThread?.account;

  @override
  Stream<IAccount?> get firstStatusAccountInThreadStream =>
      firstStatusInThreadStream.map(
            (firstStatusInThread) => firstStatusInThread?.account,
      );

  @override
  IStatus? get firstStatusInThread =>
      _calculateFirstStatus(statuses, firstStatusInThreadLoaded);

  @override
  Stream<IStatus?> get firstStatusInThreadStream => Rx.combineLatest2(
    statusesStream,
    firstStatusInThreadLoadedStream,
        (List<IStatus> statuses, bool threadContextLoaded) =>
        _calculateFirstStatus(
          statuses,
          threadContextLoaded,
        ),
  );

  @override
  bool get firstStatusInThreadLoaded => firstStatusInThreadSubject.value!;

  @override
  Stream<bool> get firstStatusInThreadLoadedStream =>
      firstStatusInThreadSubject.stream;

  IStatus? _calculateFirstStatus(
      List<IStatus> statuses,
      bool threadContextLoaded,
      ) {
    if (threadContextLoaded) {
      return statuses.first;
    } else {
      return null;
    }
  }

  @override
  bool isFirstStatusInThread(IStatus status) =>
      firstStatusInThread?.remoteId == status.remoteId;

  @override
  void addStatusInThread(IStatus status) {
    _logger.finest(() => 'addStatusInThread $status');
    statusesSubject.add(
      [
        ...statuses,
        status,
      ],
    );
    onNewStatusAddedStreamController.add(status);
  }

  @override
  void jumpToIndex(int index) {
    if (itemScrollController.isAttached) {
      itemScrollController.jumpTo(
        index: index,
      );
    }
  }

  @override
  void jumpToStartIndex() {
    if (!isJumpedToStartState) {
      isJumpedToStartState = true;
      jumpToIndex(initialStatusToFetchThreadIndex);
    }
  }

  bool isNotFiltered({
    required IPleromaApiStatus remoteStatus,
    required List<IFilter> filters,
  }) {
    var spoilerText = remoteStatus.spoilerText;
    var content = remoteStatus.content;

    bool filtered = false;
    for (var filter in filters) {
      var phrase = filter.phrase;
      if (filter.wholeWord) {
        var regex = RegExp('\b$phrase\b');
        if (content != null) {
          filtered |= regex.hasMatch(content);
        }

        if (spoilerText != null) {
          filtered |= regex.hasMatch(spoilerText);
        }
      } else {
        if (content != null) {
          filtered |= content.contains(phrase);
        }

        if (spoilerText != null) {
          filtered |= spoilerText.contains(phrase);
        }
      }
      if (filtered) {
        break;
      }
    }

    return !filtered;
  }

  @override
  Future internalAsyncInit() async {
    filters = await loadFilters();

    addDisposable(
      streamSubscription: watchFilters().listen(
            (newFilters) {
          if (!listEquals(filters, newFilters)) {
            filters = newFilters;
            refresh();
          }
        },
      ),
    );
  }
}