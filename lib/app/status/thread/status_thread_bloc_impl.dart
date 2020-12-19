import 'dart:async';

import 'package:collection/collection.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/mastodon/filter/mastodon_filter_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:pedantic/pedantic.dart';
import 'package:rxdart/rxdart.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

Function eq = const ListEquality().equals;
var _logger = Logger("status_thread_bloc_impl.dart");

class StatusThreadBloc extends DisposableOwner implements IStatusThreadBloc {
  final IPleromaStatusService pleromaStatusService;
  final IStatusRepository statusRepository;
  final IFilterRepository filterRepository;
  @override
  IStatus initialStatusToFetchThread;
  final BehaviorSubject<List<IStatus>> _statusesSubject;

  final BehaviorSubject<bool> _firstStatusInThreadSubject;
  final StreamController<IStatus> _onNewStatusAddedStreamController =
      StreamController.broadcast();

  @override
  Stream<IStatus> get onNewStatusAddedStream =>
      _onNewStatusAddedStreamController.stream;

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
    @required this.statusRepository,
    @required this.filterRepository,
    @required this.initialStatusToFetchThread,
    @required this.initialMediaAttachment,
  })  : _statusesSubject = BehaviorSubject.seeded([initialStatusToFetchThread]),
        _firstStatusInThreadSubject =
            BehaviorSubject.seeded(!initialStatusToFetchThread.isReply) {
    addDisposable(subject: _statusesSubject);
    addDisposable(subject: _firstStatusInThreadSubject);
    addDisposable(streamController: _onNewStatusAddedStreamController);
    refresh();
  }

  @override
  List<IStatus> get statuses => _statusesSubject.value;

  @override
  Stream<List<IStatus>> get statusesStream => _statusesSubject.stream;

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

      var filters = await filterRepository.getFilters(
        olderThanFilter: null,
        newerThanFilter: null,
        limit: null,
        offset: null,
        orderingTermData: null,
        onlyWithContextTypes: [MastodonFilterContextType.thread],
        notExpired: true,
      );

      // update start status
      var updatedStartRemoteStatus = await pleromaStatusService.getStatus(
        statusRemoteId: initialStatusToFetchThread.remoteId,
      );
      if (updatedStartRemoteStatus != null) {
        // don't await because we don't need it
        unawaited(
          statusRepository.updateLocalStatusByRemoteStatus(
            oldLocalStatus: initialStatusToFetchThread,
            newRemoteStatus: updatedStartRemoteStatus,
          ),
        );
        initialStatusToFetchThread =
            mapRemoteStatusToLocalStatus(updatedStartRemoteStatus);

        _logger.finest(
            () => "refresh getStatus startStatus $initialStatusToFetchThread ");
      }

      // update context
      var remoteStatusContext = await pleromaStatusService.getStatusContext(
          statusRemoteId: initialStatusToFetchThread.remoteId);
      var ancestors = remoteStatusContext.ancestors.where(
        (remoteStatus) => isNotFiltered(remoteStatus, filters),
      );
      var descendants = remoteStatusContext.descendants.where(
        (remoteStatus) => isNotFiltered(remoteStatus, filters),
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
      _statusesSubject.add(newStatuses);
      _firstStatusInThreadSubject.add(true);
      return true;
    } catch (error, stackTrace) {
      _logger.severe(() => "refresh error ", error, stackTrace);
      return false;
    }
  }

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
  bool get firstStatusInThreadLoaded => _firstStatusInThreadSubject.value;

  @override
  Stream<bool> get firstStatusInThreadLoadedStream =>
      _firstStatusInThreadSubject.stream;

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
    _statusesSubject.add([...statuses, status]);
    _onNewStatusAddedStreamController.add(status);
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

  bool isNotFiltered(
      IPleromaStatus remoteStatus, List<DbFilterPopulatedWrapper> filters) {
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
