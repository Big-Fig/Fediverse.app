import 'dart:async';

import 'package:collection/collection.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

Function eq = const ListEquality().equals;
var _logger = Logger("status_thread_bloc_impl.dart");

abstract class StatusThreadBloc extends DisposableOwner
    implements IStatusThreadBloc {
  final IPleromaStatusService pleromaStatusService;

  @override
  IStatus initialStatusToFetchThread;
  final BehaviorSubject<List<IStatus>> statusesSubject;

  final BehaviorSubject<bool> firstStatusInThreadSubject;
  final StreamController<IStatus> onNewStatusAddedStreamController =
      StreamController.broadcast();

  @override
  Stream<IStatus> get onNewStatusAddedStream =>
      onNewStatusAddedStreamController.stream;

  @override
  final IPleromaMediaAttachment initialMediaAttachment;

  @override
  final ItemScrollController itemScrollController = ItemScrollController();
  @override
  final ItemPositionsListener itemPositionListener =
      ItemPositionsListener.create();

  @override
  bool isJumpedToStartState = false;

  StatusThreadBloc({
    @required this.pleromaStatusService,
    @required this.initialStatusToFetchThread,
    @required this.initialMediaAttachment,
  })  : statusesSubject = BehaviorSubject.seeded([initialStatusToFetchThread]),
        firstStatusInThreadSubject =
            BehaviorSubject.seeded(!initialStatusToFetchThread.isReply) {
    addDisposable(subject: statusesSubject);
    addDisposable(subject: firstStatusInThreadSubject);
    addDisposable(streamController: onNewStatusAddedStreamController);
    refresh();
  }

  @override
  List<IStatus> get statuses => statusesSubject.value;

  @override
  Stream<List<IStatus>> get statusesStream => statusesSubject.stream;

  @override
  Stream<List<IStatus>> get statusesDistinctStream => statusesStream.distinct(
        (a, b) => eq(a, b),
      );

  @override
  List<IPleromaMention> get mentions => findAllMentions(statuses);

  @override
  Stream<List<IPleromaMention>> get mentionsStream =>
      statusesStream.map((statuses) => findAllMentions(statuses));

  @override
  List<String> get mentionAccts => mentions?.map((mention) => mention.acct);

  @override
  Stream<List<String>> get mentionAcctsStream =>
      mentionsStream.map((mentions) => mentions.map((mention) => mention.acct));

  @override
  String get mentionAcctsListString =>
      mentionAccts.map((acct) => "@$acct").join(" ");

  static List<IPleromaMention> findAllMentions(List<IStatus> statuses) {
    Set<IPleromaMention> mentions = {};

    statuses.forEach((status) {
      if (status.mentions != null) {
        mentions.addAll(status.mentions);
      }
    });

    return mentions.toList();
  }

  @override
  Future<bool> refresh() async {
    try {
      _logger.finest(() => "refresh");

      List<IFilter> filters = await loadFilters();

      // update start status
      var updatedStartRemoteStatus = await pleromaStatusService.getStatus(
        statusRemoteId: initialStatusToFetchThread.remoteId,
      );
      if (updatedStartRemoteStatus != null) {
        // don't await because we don't need it
        onInitialStatusUpdated(updatedStartRemoteStatus);
        initialStatusToFetchThread =
            mapRemoteStatusToLocalStatus(updatedStartRemoteStatus);

        _logger.finest(
            () => "refresh getStatus startStatus $initialStatusToFetchThread ");
      }

      // update context
      var remoteStatusContext = await pleromaStatusService.getStatusContext(
          statusRemoteId: initialStatusToFetchThread.remoteId);
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
          (remoteStatus) => mapRemoteStatusToLocalStatus(remoteStatus),
        ),
      );
      newStatuses.add(initialStatusToFetchThread);
      newStatuses.addAll(
        descendants.map(
          (remoteStatus) => mapRemoteStatusToLocalStatus(remoteStatus),
        ),
      );
      _logger.finest(
          () => "refresh getStatusContext newStatuses ${newStatuses.length} ");
      statusesSubject.add(newStatuses);
      firstStatusInThreadSubject.add(true);
      return true;
    } catch (error, stackTrace) {
      _logger.severe(() => "refresh error ", error, stackTrace);
      return false;
    }
  }

  Future<List<IFilter>> loadFilters();

  void onInitialStatusUpdated(IPleromaStatus updatedStartRemoteStatus);

  @override
  int get initialStatusToFetchThreadIndex =>
      statuses.indexOf(initialStatusToFetchThread);

  @override
  IAccount get firstStatusAccountInThread => firstStatusInThread?.account;

  @override
  Stream<IAccount> get firstStatusAccountInThreadStream =>
      firstStatusInThreadStream
          .map((firstStatusInThread) => firstStatusInThread?.account);

  @override
  IStatus get firstStatusInThread =>
      _calculateFirstStatus(statuses, firstStatusInThreadLoaded);

  @override
  Stream<IStatus> get firstStatusInThreadStream => Rx.combineLatest2(
      statusesStream,
      firstStatusInThreadLoadedStream,
      (statuses, threadContextLoaded) =>
          _calculateFirstStatus(statuses, threadContextLoaded));

  @override
  bool get firstStatusInThreadLoaded => firstStatusInThreadSubject.value;

  @override
  Stream<bool> get firstStatusInThreadLoadedStream =>
      firstStatusInThreadSubject.stream;

  IStatus _calculateFirstStatus(
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
    _logger.finest(() => "addStatusInThread $status");
    statusesSubject.add([...statuses, status]);
    onNewStatusAddedStreamController.add(status);
  }

  @override
  void scrollToIndex(int index) {
    if (itemScrollController.isAttached) {
      itemScrollController.scrollTo(
        index: index,
        duration: Duration(milliseconds: 1000),
      );
    }
  }

  @override
  void scrollToStartIndex() {
    if (!isJumpedToStartState) {
      isJumpedToStartState = true;
      scrollToIndex(initialStatusToFetchThreadIndex);
    }
  }

  bool isNotFiltered({
    @required IPleromaStatus remoteStatus,
    @required List<IFilter> filters,
  }) {
    var spoilerText = remoteStatus.spoilerText;
    var content = remoteStatus.content;

    bool filtered = false;
    for (var filter in filters) {
      var phrase = filter.phrase;
      if (filter.wholeWord) {
        var regex = RegExp("\b$phrase\b");
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
}
