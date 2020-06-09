import 'package:fedi/app/status/reply/status_reply_loader_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:flutter/widgets.dart';

class StatusReplyLoaderBloc extends AsyncInitLoadingBloc
    implements IStatusReplyLoaderBloc {
  final IPleromaStatusService pleromaStatusService;
  final IStatusRepository statusRepository;
  @override
  final IStatus originalStatus;
  @override
  IStatus inReplyToStatus;

  static StatusReplyLoaderBloc createFromContext(
    BuildContext context,
    IStatus originalStatus,
  ) =>
      StatusReplyLoaderBloc(
        pleromaStatusService: IPleromaStatusService.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        originalStatus: originalStatus,
      );

  StatusReplyLoaderBloc({
    @required this.pleromaStatusService,
    @required this.statusRepository,
    @required this.originalStatus,
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
    var inReplyToRemoteId = originalStatus.inReplyToRemoteId;

    inReplyToStatus = await statusRepository.findByRemoteId(inReplyToRemoteId);

    if (inReplyToStatus == null) {
      var replyToRemoteStatus = await pleromaStatusService.getStatus(
          statusRemoteId: inReplyToRemoteId);

      if (replyToRemoteStatus != null) {
        await statusRepository.upsertRemoteStatus(replyToRemoteStatus,
            listRemoteId: null, conversationRemoteId: null);

        inReplyToStatus =
            await statusRepository.findByRemoteId(inReplyToRemoteId);
      } else {
        throw "Can't load inReplyToStatus";
      }
    }
  }
}
