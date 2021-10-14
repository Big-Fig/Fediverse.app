import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/status/reply/status_reply_loader_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:unifedi_api/unifedi_api.dart';

class RemoteStatusReplyLoaderBloc extends AsyncInitLoadingBloc
    implements IStatusReplyLoaderBloc {
  final IUnifediApiStatusService unifediApiStatusService;
  @override
  final IStatus originalStatus;
  @override
  IStatus? inReplyToStatus;

  static RemoteStatusReplyLoaderBloc createFromContext(
    BuildContext context,
    IStatus originalStatus,
  ) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);

    var unifediApiStatusService =
        remoteInstanceBloc.unifediApiManager.createStatusService();
    var bloc = RemoteStatusReplyLoaderBloc(
      unifediApiStatusService: unifediApiStatusService,
      originalStatus: originalStatus,
    );

    // ignore: cascade_invocations
    bloc.addDisposable(unifediApiStatusService);

    return bloc;
  }

  RemoteStatusReplyLoaderBloc({
    required this.unifediApiStatusService,
    required this.originalStatus,
  }) : assert(
          originalStatus.inReplyToRemoteId != null,
          'original status is not reply',
        ) {
    if (originalStatus.inReplyToStatus != null) {
      inReplyToStatus = originalStatus.inReplyToStatus;
      markAsAlreadyInitialized();
    }
  }

  @override
  Future internalAsyncInit() async {
    if (inReplyToStatus != null) {
      return;
    }
    var inReplyToRemoteId = originalStatus.inReplyToRemoteId!;

    var replyToRemoteStatus = await unifediApiStatusService.getStatus(
      statusId: inReplyToRemoteId,
    );

    inReplyToStatus = replyToRemoteStatus.toDbStatusPopulatedWrapper();
  }
}
