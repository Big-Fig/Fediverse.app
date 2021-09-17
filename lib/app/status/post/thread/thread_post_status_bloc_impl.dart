import 'package:collection/collection.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/post/thread/thread_post_status_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('thread_post_status_bloc_impl.dart');

class ThreadPostStatusBloc extends PostStatusBloc
    implements IThreadPostStatusBloc {
  final IStatusThreadBloc statusThreadBloc;

  @override
  IStatus? get notCanceledOriginInReplyToStatus =>
      (originInReplyToStatus != null && !originInReplyToStatusCanceled!)
          ? originInReplyToStatus
          : null;

  @override
  Stream<IStatus?> get notCanceledOriginInReplyToStatusStream =>
      originInReplyToStatusCanceledStream.map(
        (originInReplyToStatusCanceled) =>
            (originInReplyToStatus != null && !originInReplyToStatusCanceled)
                ? originInReplyToStatus
                : null,
      );

  ThreadPostStatusBloc({
    required IStatus inReplyToStatus,
    required this.statusThreadBloc,
    required IUnifediApiStatusService unifediApiStatusService,
    required IStatusRepository statusRepository,
    required IScheduledStatusRepository scheduledStatusRepository,
    required IUnifediApiMediaAttachmentService unifediApiMediaAttachmentService,
    required int? maximumMessageLength,
    required UnifediApiInstancePollLimits? pollLimits,
    required int? maximumFileSizeInBytes,
    required bool markMediaAsNsfwOnAttach,
    required String? language,
    required bool isPleromaInstance,
  }) : super(
          isExpirePossible: isPleromaInstance,
          unifediApiStatusService: unifediApiStatusService,
          statusRepository: statusRepository,
          scheduledStatusRepository: scheduledStatusRepository,
          unifediApiMediaAttachmentService: unifediApiMediaAttachmentService,
          initialData: PostStatusBloc.defaultInitData.copyWith(
            visibilityString: UnifediApiVisibility.publicValue.stringValue,
            language: language,
            inReplyToPleromaStatus: inReplyToStatus.toUnifediApiStatus(),
          ),
          maximumMessageLength: maximumMessageLength,
          pollLimits: pollLimits,
          maximumFileSizeInBytes: maximumFileSizeInBytes,
          markMediaAsNsfwOnAttach: markMediaAsNsfwOnAttach,
          unfocusOnClear: true,
        ) {
    originInReplyToStatusCanceledSubject.disposeWith(this);
  }

  static ThreadPostStatusBloc createFromContext(
    BuildContext context, {
    required IStatus inReplyToStatus,
  }) {
    var info = ICurrentAuthInstanceBloc.of(context, listen: false)
        .currentInstance!
        .info!;

    return ThreadPostStatusBloc(
      inReplyToStatus: inReplyToStatus,
      statusThreadBloc: IStatusThreadBloc.of(context, listen: false),
      unifediApiStatusService:
          Provider.of<IUnifediApiStatusService>(context, listen: false),
      statusRepository: IStatusRepository.of(context, listen: false),
      unifediApiMediaAttachmentService:
          Provider.of<IUnifediApiMediaAttachmentService>(
        context,
        listen: false,
      ),
      maximumMessageLength: info.maxTootChars,
      pollLimits: info.pollLimits,
      maximumFileSizeInBytes: info.uploadLimit,
      markMediaAsNsfwOnAttach:
          IPostStatusSettingsBloc.of(context, listen: false)
              .markMediaAsNsfwOnAttach,
      language: IPostStatusSettingsBloc.of(context, listen: false)
          .defaultStatusLocale
          ?.localeString,
      isPleromaInstance: info.typeAsUnifediApi.isPleroma,
      scheduledStatusRepository: IScheduledStatusRepository.of(
        context,
        listen: false,
      ),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required IStatus inReplyToStatus,
    required Widget child,
  }) {
    return DisposableProvider<IThreadPostStatusBloc>(
      create: (context) => ThreadPostStatusBloc.createFromContext(
        context,
        inReplyToStatus: inReplyToStatus,
      ),
      child: ProxyProvider<IThreadPostStatusBloc, IPostStatusBloc>(
        update: (context, value, previous) => value,
        child: PostStatusMessageBlocProxyProvider(
          child: child,
        ),
      ),
    );
  }

  @override
  bool get isPossibleToChangeVisibility => false;

  @override
  Future onStatusPosted(IUnifediApiStatus remoteStatus) async {
    _logger.finest(() => 'onStatusPosted $onStatusPosted');
    var status =
        await statusRepository.findByRemoteIdInAppType(remoteStatus.id);
    if (status != null) {
      statusThreadBloc.addStatusInThread(status);
    }
  }

  @override
  bool? get originInReplyToStatusCanceled =>
      originInReplyToStatusCanceledSubject.value;

  @override
  Stream<bool> get originInReplyToStatusCanceledStream =>
      originInReplyToStatusCanceledSubject.stream;

  @override
  void cancelOriginInReplyToStatus() {
    originInReplyToStatusCanceledSubject.add(true);
  }

  BehaviorSubject<bool> originInReplyToStatusCanceledSubject =
      BehaviorSubject.seeded(false);

  @override
  IStatus calculateInReplyToStatusField() {
    IStatus? result;
    if (originInReplyToStatus != null && originInReplyToStatusCanceled!) {
      var statuses = statusThreadBloc.statuses;
      if (mentionedAccts.isNotEmpty) {
        IStatus? statusToReply;
        for (var acct in mentionedAccts) {
          statusToReply = statuses.reversed.firstWhereOrNull(
            (status) => status.account.acct == acct,
          );
          if (statusToReply != null) {
            _logger.finest(() => 'calculateInReplyToStatusRemoteId '
                'statusToReply by acct $acct =>$result');
            break;
          }
        }
        if (statusToReply != null) {
          result = statusToReply;
        } else {
          _logger.finest(() => 'calculateInReplyToStatusRemoteId '
              'statusToReply by acct not found => $result');
          result = statuses.last;
        }
      } else {
        _logger.finest(() => 'calculateInReplyToStatusRemoteId '
            'statusToReply last => $result');
        result = statuses.last;
      }
    } else {
      _logger.finest(() => 'calculateInReplyToStatusRemoteId '
          'statusToReply !originInReplyToStatusCanceled => $result');
      result = super.calculateInReplyToStatusField();
    }
    _logger.finest(() => 'calculateInReplyToStatusRemoteId $result');

    return result!;
  }

  @override
  String calculateVisibilityField() {
    // we should force DIRECT visibility if inReplyToStatus have DIRECT too
    var inReplyToStatus = notCanceledOriginInReplyToStatus;
    if (inReplyToStatus != null) {
      if (inReplyToStatus.visibility == UnifediApiVisibility.directValue) {
        return UnifediApiVisibility.directValue.stringValue;
      } else {
        return super.calculateVisibilityField();
      }
    } else {
      return super.calculateVisibilityField();
    }
  }

  @override
  List<String>? calculateToField() {
    if (unifediApiStatusService.isPleroma) {
      if (originInReplyToStatus != null && !originInReplyToStatusCanceled!) {
        var inReplyToStatusAcct = originInReplyToStatus!.account.acct;

        var toField = [...mentionedAccts];

        if (!toField.contains(inReplyToStatusAcct)) {
          toField.add(inReplyToStatusAcct);
        }

        return toField;
      } else {
        return mentionedAccts;
      }
    } else {
      return null;
    }
  }
}
