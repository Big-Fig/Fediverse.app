import 'package:collection/collection.dart' show IterableExtension;
import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:fedi/app/instance/remote/remote_instance_error_data.dart';
import 'package:fedi/app/status/post/thread/thread_post_status_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/app/status/thread/remote_status_thread_bloc_impl.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_bloc_proxy_provider.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/dialog/async/async_dialog_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/mastodon/api/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_status_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pedantic/pedantic.dart';

Future goToRemoteStatusThreadPageBasedOnRemoteInstanceStatus(
  BuildContext context, {
  required IStatus remoteInstanceStatus,
  required IPleromaMediaAttachment? remoteInstanceInitialMediaAttachment,
}) {
  return Navigator.push(
    context,
    createRemoteStatusThreadPageRouteBasedOnRemoteInstanceStatus(
      status: remoteInstanceStatus,
      initialMediaAttachment: remoteInstanceInitialMediaAttachment,
    ),
  );
}

Future goToRemoteStatusThreadPageBasedOnLocalInstanceRemoteStatus(
  BuildContext context, {
  required IStatus? localInstanceRemoteStatus,
  required IMastodonMediaAttachment? localInstanceRemoteInitialMediaAttachment,
}) async {
  AsyncDialogResult<IStatus?> remoteInstanceStatusDialogResult =
      await PleromaAsyncOperationHelper.performPleromaAsyncOperation<IStatus?>(
    context: context,
    errorDataBuilders: [
      remoteInstanceLoadDataErrorAlertDialogBuilder,
    ],
    asyncCode: () async {
      IStatus? result;
      RemoteInstanceBloc? remoteInstanceBloc;
      PleromaStatusService? pleromaStatusService;
      try {
        var instanceUri = localInstanceRemoteStatus!.urlRemoteHostUri;

        var remoteInstanceStatusRemoteId =
            localInstanceRemoteStatus.urlRemoteId;

        remoteInstanceBloc = RemoteInstanceBloc(
          instanceUri: instanceUri,
          connectionService: IConnectionService.of(
            context,
            listen: false,
          ),
        );

        pleromaStatusService = PleromaStatusService(
          restService: remoteInstanceBloc.pleromaRestService,
        );

        var remoteInstanceRemoteStatus = await pleromaStatusService.getStatus(
          statusRemoteId: remoteInstanceStatusRemoteId,
        );

        result = remoteInstanceRemoteStatus.toDbStatusPopulatedWrapper();
      } finally {
        unawaited(pleromaStatusService?.dispose());
        unawaited(remoteInstanceBloc?.dispose());
      }

      return result;
    },
  );

  IStatus? remoteInstanceStatus = remoteInstanceStatusDialogResult.result;

  if (remoteInstanceStatus != null) {
    IPleromaMediaAttachment? remoteInstanceInitialMediaAttachment;

    if (localInstanceRemoteInitialMediaAttachment != null) {
      remoteInstanceInitialMediaAttachment =
          (remoteInstanceStatus.reblog?.mediaAttachments ??
                  remoteInstanceStatus.mediaAttachments)!
              .firstWhereOrNull(
        (mediaAttachment) =>
            mediaAttachment.url ==
            localInstanceRemoteInitialMediaAttachment.url,
      );
    }

    await goToRemoteStatusThreadPageBasedOnRemoteInstanceStatus(
      context,
      remoteInstanceStatus: remoteInstanceStatus,
      remoteInstanceInitialMediaAttachment:
          remoteInstanceInitialMediaAttachment,
    );
  }
}

MaterialPageRoute createRemoteStatusThreadPageRouteBasedOnRemoteInstanceStatus({
  required IStatus status,
  required IPleromaMediaAttachment? initialMediaAttachment,
}) {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<IRemoteInstanceBloc>(
      create: (context) {
        var instanceUri = status.urlRemoteHostUri;

        return RemoteInstanceBloc(
          instanceUri: instanceUri,
          connectionService: IConnectionService.of(
            context,
            listen: false,
          ),
        );
      },
      child: DisposableProvider<IStatusThreadBloc>(
        create: (context) => RemoteStatusThreadBloc.createFromContext(
          context,
          initialStatusToFetchThread: status,
          initialMediaAttachment: initialMediaAttachment,
        ),
        child: StatusThreadBlocProxyProvider(
          child: ThreadPostStatusBloc.provideToContext(
            context,
            inReplyToStatus: status,
            child: const StatusThreadPage(),
          ),
        ),
      ),
    ),
  );
}
