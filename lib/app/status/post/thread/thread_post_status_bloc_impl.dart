import 'package:collection/collection.dart';
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
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_service.dart';
import 'package:fedi/pleroma/api/status/auth/pleroma_api_auth_status_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';

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
    required IPleromaApiAuthStatusService pleromaAuthStatusService,
    required IStatusRepository statusRepository,
    required IScheduledStatusRepository scheduledStatusRepository,
    required IPleromaApiMediaAttachmentService pleromaMediaAttachmentService,
    required int? maximumMessageLength,
    required PleromaApiInstancePollLimits? pleromaInstancePollLimits,
    required int? maximumFileSizeInBytes,
    required bool markMediaAsNsfwOnAttach,
    required String? language,
    required bool isPleromaInstance,
  }) : super(
          isExpirePossible: isPleromaInstance,
          pleromaAuthStatusService: pleromaAuthStatusService,
          statusRepository: statusRepository,
          scheduledStatusRepository: scheduledStatusRepository,
          pleromaMediaAttachmentService: pleromaMediaAttachmentService,
          initialData: PostStatusBloc.defaultInitData.copyWith(
            visibilityString: PleromaApiVisibility.public.toJsonValue(),
            language: language,
            inReplyToPleromaStatus: inReplyToStatus.toPleromaApiStatus(),
          ),
          maximumMessageLength: maximumMessageLength,
          pleromaInstancePollLimits: pleromaInstancePollLimits,
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
      pleromaAuthStatusService:
          IPleromaApiAuthStatusService.of(context, listen: false),
      statusRepository: IStatusRepository.of(context, listen: false),
      pleromaMediaAttachmentService:
          IPleromaApiMediaAttachmentService.of(context, listen: false),
      maximumMessageLength: info.maxTootChars,
      pleromaInstancePollLimits: info.pollLimits,
      maximumFileSizeInBytes: info.uploadLimit,
      markMediaAsNsfwOnAttach:
          IPostStatusSettingsBloc.of(context, listen: false)
              .markMediaAsNsfwOnAttach,
      language: IPostStatusSettingsBloc.of(context, listen: false)
          .defaultStatusLocale
          ?.localeString,
      isPleromaInstance: info.isPleroma,
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
  Future onStatusPosted(IPleromaApiStatus remoteStatus) async {
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
      if (inReplyToStatus.visibility == PleromaApiVisibility.direct) {
        return PleromaApiVisibility.direct.toJsonValue();
      } else {
        return super.calculateVisibilityField();
      }
    } else {
      return super.calculateVisibilityField();
    }
  }

  @override
  List<String>? calculateToField() {
    if (pleromaAuthStatusService.isPleroma) {
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
