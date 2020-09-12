import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi/app/status/post/thread/thread_post_status_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/subjects.dart';

var _logger = Logger("thread_post_status_bloc_impl.dart");

class ThreadPostStatusBloc extends PostStatusBloc
    implements IThreadPostStatusBloc {
  final IStatusThreadBloc statusThreadBloc;

  @override
  IStatus get notCanceledOriginInReplyToStatus =>
      (originInReplyToStatus != null && !originInReplyToStatusCanceled)
          ? originInReplyToStatus
          : null;

  @override
  Stream<IStatus> get notCanceledOriginInReplyToStatusStream =>
      originInReplyToStatusCanceledStream.map((originInReplyToStatusCanceled) =>
          (originInReplyToStatus != null && !originInReplyToStatusCanceled)
              ? originInReplyToStatus
              : null);

  ThreadPostStatusBloc({
    @required IStatus inReplyToStatus,
    @required this.statusThreadBloc,
    @required IPleromaStatusService pleromaStatusService,
    @required IStatusRepository statusRepository,
    @required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
    @required int maximumMessageLength,
    @required PleromaInstancePollLimits pleromaInstancePollLimits,
    @required int maximumFileSizeInBytes,
    @required bool markMediaNsfwByDefault,
  }) : super(
          pleromaStatusService: pleromaStatusService,
          statusRepository: statusRepository,
          pleromaMediaAttachmentService: pleromaMediaAttachmentService,
          initialData: PostStatusBloc.defaultInitData.copyWith(
            visibility: PleromaVisibility.public.toJsonValue(),
            inReplyToPleromaStatus:
                mapLocalStatusToRemoteStatus(inReplyToStatus),
          ),
          maximumMessageLength: maximumMessageLength,
          pleromaInstancePollLimits: pleromaInstancePollLimits,
          maximumFileSizeInBytes: maximumFileSizeInBytes,
          markMediaNsfwByDefault: markMediaNsfwByDefault,
        ) {
    addDisposable(subject: originInReplyToStatusCanceledSubject);
  }

  static ThreadPostStatusBloc createFromContext(BuildContext context,
      {@required IStatus inReplyToStatus}) {
    var info = ICurrentAuthInstanceBloc.of(context, listen: false)
        .currentInstance
        .info;
    var myAccountSettingsBloc =
        IMyAccountSettingsBloc.of(context, listen: false);
    return ThreadPostStatusBloc(
      inReplyToStatus: inReplyToStatus,
      statusThreadBloc: IStatusThreadBloc.of(context, listen: false),
      pleromaStatusService: IPleromaStatusService.of(context, listen: false),
      statusRepository: IStatusRepository.of(context, listen: false),
      pleromaMediaAttachmentService:
          IPleromaMediaAttachmentService.of(context, listen: false),
      maximumMessageLength: info.maxTootChars,
      pleromaInstancePollLimits: info.pollLimits,
      maximumFileSizeInBytes: info.uploadLimit,
      markMediaNsfwByDefault:
          myAccountSettingsBloc.markMediaNsfwByDefaultFieldBloc.currentValue,
    );
  }

  static Widget provideToContext(BuildContext context,
      {@required IStatus inReplyToStatus, @required Widget child}) {
    return DisposableProvider<IThreadPostStatusBloc>(
      create: (context) => ThreadPostStatusBloc.createFromContext(
        context,
        inReplyToStatus: inReplyToStatus,
      ),
      child: ProxyProvider<IThreadPostStatusBloc, IPostStatusBloc>(
          update: (context, value, previous) => value,
          child: PostStatusMessageBlocProxyProvider(child: child)),
    );
  }

  @override
  bool get isPossibleToChangeVisibility => false;

  @override
  Future onStatusPosted(IPleromaStatus remoteStatus) async {
    var status = await statusRepository.findByRemoteId(remoteStatus.id);
    statusThreadBloc.addStatusInThread(status);
  }

  @override
  bool get originInReplyToStatusCanceled =>
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
    IStatus result;
    if (originInReplyToStatus != null && originInReplyToStatusCanceled) {
      var statuses = statusThreadBloc.statuses;
      if (mentionedAccts?.isNotEmpty == true) {
        IStatus statusToReply;
        for (var acct in mentionedAccts) {
          statusToReply = statuses.reversed.firstWhere(
              (status) => status.account.acct == acct,
              orElse: () => null);
          if (statusToReply != null) {
            _logger.finest(() => "calculateInReplyToStatusRemoteId "
                "statusToReply by acct $acct =>$result");
            break;
          }
        }
        if (statusToReply != null) {
          result = statusToReply;
        } else {
          _logger.finest(() => "calculateInReplyToStatusRemoteId "
              "statusToReply by acct not found => $result");
          result = statuses.last;
        }
      } else {
        _logger.finest(() => "calculateInReplyToStatusRemoteId "
            "statusToReply last => $result");
        result = statuses.last;
      }
    } else {
      _logger.finest(() => "calculateInReplyToStatusRemoteId "
          "statusToReply !originInReplyToStatusCanceled => $result");
      result = super.calculateInReplyToStatusField();
    }
    _logger.finest(() => "calculateInReplyToStatusRemoteId $result");
    return result;
  }

  @override
  String calculateVisibilityField() {
    // we should force DIRECT visibility if inReplyToStatus have DIRECT too
    var inReplyToStatus = notCanceledOriginInReplyToStatus;
    if (inReplyToStatus != null) {
      if (inReplyToStatus.visibility == PleromaVisibility.direct) {
        return PleromaVisibility.direct.toJsonValue();
      } else {
        return super.calculateVisibilityField();
      }
    } else {
      return super.calculateVisibilityField();
    }
  }

  @override
  List<String> calculateToField() {
    if (pleromaStatusService.isPleromaInstance) {
      if (originInReplyToStatus != null && !originInReplyToStatusCanceled) {
        var inReplyToStatusAcct = originInReplyToStatus.account.acct;

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
