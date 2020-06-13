import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:pedantic/pedantic.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("status_thread_bloc_impl.dart");

class StatusThreadBloc extends DisposableOwner implements IStatusThreadBloc {
  final IPleromaStatusService pleromaStatusService;
  final IStatusRepository statusRepository;
  @override
  IStatus initialStatusToFetchThread;
  final BehaviorSubject<List<IStatus>> _statusesSubject;

  final BehaviorSubject<bool> _firstStatusInThreadSubject;

  StatusThreadBloc({
    @required this.pleromaStatusService,
    @required this.statusRepository,
    @required this.initialStatusToFetchThread,
  })  : _statusesSubject = BehaviorSubject.seeded([initialStatusToFetchThread]),
        _firstStatusInThreadSubject =
            BehaviorSubject.seeded(!initialStatusToFetchThread.isReply) {
    addDisposable(subject: _statusesSubject);
    addDisposable(subject: _firstStatusInThreadSubject);
    refresh();
  }

  @override
  List<IStatus> get statuses => _statusesSubject.value;

  @override
  Stream<List<IStatus>> get statusesStream => _statusesSubject.stream;

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
  Future<IStatus> sendMessageToAllMentionedAccounts(
      {@required String idempotencyKey, @required String text}) async {
    assert(text?.isNotEmpty == true);

    String status = "$mentionAcctsListString $text";
    String inReplyToId = initialStatusToFetchThread.remoteId;

    var remoteStatus = await pleromaStatusService.postStatus(
        data: PleromaPostStatus(
            status: status,
            to: mentionAccts,
            inReplyToId: inReplyToId,
            idempotencyKey: idempotencyKey));

    await statusRepository.upsertRemoteStatus(remoteStatus,
        listRemoteId: null, conversationRemoteId: null);
    var localStatus = await statusRepository.findByRemoteId(remoteStatus.id);

    statuses.add(localStatus);
    _statusesSubject.add(statuses);

    return localStatus;
  }

  @override
  Future<bool> refresh() async {
    try {
      _logger.finest(() => "refresh");
      // update start status
      var updatedStartRemoteStatus = await pleromaStatusService.getStatus(
          statusRemoteId: initialStatusToFetchThread.remoteId);
      if (updatedStartRemoteStatus != null) {
        // don't await because we don't need it
        unawaited(statusRepository.updateLocalStatusByRemoteStatus(
            oldLocalStatus: initialStatusToFetchThread,
            newRemoteStatus: updatedStartRemoteStatus));
        initialStatusToFetchThread =
            mapRemoteStatusToLocalStatus(updatedStartRemoteStatus);

        _logger.finest(
            () => "refresh getStatus startStatus $initialStatusToFetchThread ");
      }

      // update context
      var remoteStatusContext = await pleromaStatusService.getStatusContext(
          statusRemoteId: initialStatusToFetchThread.remoteId);

      List<IStatus> newStatuses = [];
      newStatuses.addAll(remoteStatusContext.ancestors
          .map((remoteStatus) => mapRemoteStatusToLocalStatus(remoteStatus)));
      newStatuses.add(initialStatusToFetchThread);
      newStatuses.addAll(remoteStatusContext.descendants
          .map((remoteStatus) => mapRemoteStatusToLocalStatus(remoteStatus)));
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
    statuses.add(status);
    _statusesSubject.add(statuses);
  }
}
