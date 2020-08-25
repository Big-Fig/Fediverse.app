import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("thread_post_status_bloc_impl.dart");

class ThreadPostStatusBloc extends PostStatusBloc {
  final IStatusThreadBloc statusThreadBloc;

  ThreadPostStatusBloc({
    @required IStatus inReplyToStatus,
    @required this.statusThreadBloc,
    @required IPleromaStatusService pleromaStatusService,
    @required IStatusRepository statusRepository,
    @required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
  }) : super(
            originInReplyToStatus: inReplyToStatus,
            pleromaStatusService: pleromaStatusService,
            statusRepository: statusRepository,
            pleromaMediaAttachmentService: pleromaMediaAttachmentService,
            initialVisibility: PleromaVisibility.PUBLIC);

  static ThreadPostStatusBloc createFromContext(BuildContext context,
          {@required IStatus inReplyToStatus}) =>
      ThreadPostStatusBloc(
          inReplyToStatus: inReplyToStatus,
          statusThreadBloc: IStatusThreadBloc.of(context, listen: false),
          pleromaStatusService:
              IPleromaStatusService.of(context, listen: false),
          statusRepository: IStatusRepository.of(context, listen: false),
          pleromaMediaAttachmentService:
              IPleromaMediaAttachmentService.of(context, listen: false));

  static Widget provideToContext(BuildContext context,
      {@required IStatus inReplyToStatus, @required Widget child}) {
    return DisposableProvider<IPostStatusBloc>(
      create: (context) => ThreadPostStatusBloc.createFromContext(
        context,
        inReplyToStatus: inReplyToStatus,
      ),
      child: PostStatusMessageBlocProxyProvider(child: child),
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
  String calculateInReplyToStatusRemoteId() {
    String result;
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
          result = statusToReply.remoteId;
        } else {
          _logger.finest(() => "calculateInReplyToStatusRemoteId "
              "statusToReply by acct not found => $result");
          result = statuses.last.remoteId;
        }
      } else {
        _logger.finest(() => "calculateInReplyToStatusRemoteId "
            "statusToReply last => $result");
        result = statuses.last.remoteId;
      }
    } else {
      _logger.finest(() => "calculateInReplyToStatusRemoteId "
          "statusToReply !originInReplyToStatusCanceled => $result");
      result = super.calculateInReplyToStatusRemoteId();
    }
    _logger.finest(() => "calculateInReplyToStatusRemoteId $result");
    return result;
  }

  @override
  String calculateVisibilityField() {
    // we should force DIRECT visibility if inReplyToStatus have DIRECT too
    var inReplyToStatus = notCanceledOriginInReplyToStatus;
    if (inReplyToStatus != null) {
      if (inReplyToStatus.visibility == PleromaVisibility.DIRECT) {
        return pleromaVisibilityValues.reverse[PleromaVisibility.DIRECT];
      } else {
        return super.calculateVisibilityField();
      }
    } else {
      return super.calculateVisibilityField();
    }
  }
}
