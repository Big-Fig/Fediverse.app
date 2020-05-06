import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/status/status_model_adapter.dart';
import 'package:fedi/refactored/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:pedantic/pedantic.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("status_thread_bloc_impl.dart");

class StatusThreadBloc extends DisposableOwner implements IStatusThreadBloc {
  final IPleromaStatusService pleromaStatusService;
  final IStatusRepository statusRepository;
  @override
  IStatus startStatus;
  final BehaviorSubject<List<IStatus>> _statusesSubject;

  StatusThreadBloc({
    @required this.pleromaStatusService,
    @required this.statusRepository,
    @required this.startStatus,
  }) : _statusesSubject = BehaviorSubject.seeded([startStatus]) {
    addDisposable(subject: _statusesSubject);
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
    String inReplyToId = startStatus.remoteId;

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
          statusRemoteId: startStatus.remoteId);
      if (updatedStartRemoteStatus != null) {
        // don't await because we don't need it
        unawaited(statusRepository.updateLocalStatusByRemoteStatus(
            oldLocalStatus: startStatus,
            newRemoteStatus: updatedStartRemoteStatus));
        startStatus = mapRemoteStatusToLocalStatus(updatedStartRemoteStatus);

        _logger.finest(() => "refresh getStatus startStatus $startStatus ");
      }

      // update context
      var remoteStatusContext = await pleromaStatusService.getStatusContext(
          statusRemoteId: startStatus.remoteId);

      List<IStatus> newStatuses = [];
      newStatuses.addAll(remoteStatusContext.ancestors
          .map((remoteStatus) => mapRemoteStatusToLocalStatus(remoteStatus)));
      newStatuses.add(startStatus);
      newStatuses.addAll(remoteStatusContext.descendants
          .map((remoteStatus) => mapRemoteStatusToLocalStatus(remoteStatus)));
      _logger.finest(
          () => "refresh getStatusContext newStatuses ${newStatuses.length} ");
      _statusesSubject.add(newStatuses);
      return true;
    } catch (error, stackTrace) {
      _logger.severe(() => "refresh error ", error, stackTrace);
      return false;
    }
  }

  @override
  int get startStatusIndex => statuses.indexOf(startStatus);
}
