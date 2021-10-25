import 'package:fedi_app/app/status/reply/status_reply_loader_bloc.dart';
import 'package:fedi_app/app/status/repository/status_repository.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class LocalStatusReplyLoaderBloc extends AsyncInitLoadingBloc
    implements IStatusReplyLoaderBloc {
  final IUnifediApiStatusService unifediApiStatusService;
  final IStatusRepository statusRepository;
  @override
  final IStatus originalStatus;
  @override
  IStatus? inReplyToStatus;

  static LocalStatusReplyLoaderBloc createFromContext(
    BuildContext context,
    IStatus originalStatus,
  ) =>
      LocalStatusReplyLoaderBloc(
        unifediApiStatusService:
            Provider.of<IUnifediApiStatusService>(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        originalStatus: originalStatus,
      );

  LocalStatusReplyLoaderBloc({
    required this.unifediApiStatusService,
    required this.statusRepository,
    required this.originalStatus,
  }) : assert(
          originalStatus.inReplyToRemoteId != null,
          'original status should be reply to another status',
        ) {
    if (originalStatus.inReplyToStatus != null) {
      inReplyToStatus = originalStatus.inReplyToStatus;
      markAsAlreadyInitialized();
    }
  }

  @override
  Future<void> internalAsyncInit() async {
    if (inReplyToStatus != null) {
      // already loaded
      return;
    }
    var inReplyToRemoteId = originalStatus.inReplyToRemoteId!;

    inReplyToStatus =
        await statusRepository.findByRemoteIdInAppType(inReplyToRemoteId);

    if (inReplyToStatus == null) {
      var replyToRemoteStatus = await unifediApiStatusService.getStatus(
        statusId: inReplyToRemoteId,
      );

      // ignore: avoid-ignoring-return-values
      await statusRepository.upsertInRemoteType(
        replyToRemoteStatus,
      );

      inReplyToStatus = await statusRepository.findByRemoteIdInAppType(
        inReplyToRemoteId,
      );
    }
  }
}
