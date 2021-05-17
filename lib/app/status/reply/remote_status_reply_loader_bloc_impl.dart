import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/status/reply/status_reply_loader_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_service_impl.dart';
import 'package:flutter/widgets.dart';

class RemoteStatusReplyLoaderBloc extends AsyncInitLoadingBloc
    implements IStatusReplyLoaderBloc {
  final IPleromaApiStatusService pleromaStatusService;
  @override
  final IStatus originalStatus;
  @override
  IStatus? inReplyToStatus;

  static RemoteStatusReplyLoaderBloc createFromContext(
    BuildContext context,
    IStatus originalStatus,
  ) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);

    var pleromaStatusService = PleromaApiStatusService(
      restService: remoteInstanceBloc.pleromaRestService,
    );
    var bloc = RemoteStatusReplyLoaderBloc(
      pleromaStatusService: pleromaStatusService,
      originalStatus: originalStatus,
    );

    bloc.addDisposable(disposable: bloc);

    return bloc;
  }

  RemoteStatusReplyLoaderBloc({
    required this.pleromaStatusService,
    required this.originalStatus,
  }) {
    assert(originalStatus.inReplyToRemoteId != null);
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

    var replyToRemoteStatus = await pleromaStatusService.getStatus(
      statusRemoteId: inReplyToRemoteId,
    );

    inReplyToStatus = replyToRemoteStatus.toDbStatusPopulatedWrapper();
  }
}
