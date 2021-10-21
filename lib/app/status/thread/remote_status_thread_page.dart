import 'package:collection/collection.dart' show IterableExtension;
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
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
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

Future<void> goToRemoteStatusThreadPageBasedOnRemoteInstanceStatus(
  BuildContext context, {
  required IStatus remoteInstanceStatus,
  required IUnifediApiMediaAttachment? remoteInstanceInitialMediaAttachment,
}) =>
    Navigator.push(
      context,
      createRemoteStatusThreadPageRouteBasedOnRemoteInstanceStatus(
        status: remoteInstanceStatus,
        initialMediaAttachment: remoteInstanceInitialMediaAttachment,
      ),
    );

Future<void> goToRemoteStatusThreadPageBasedOnLocalInstanceRemoteStatus(
  BuildContext context, {
  required IStatus? localInstanceRemoteStatus,
  required IUnifediApiMediaAttachment?
      localInstanceRemoteInitialMediaAttachment,
}) async {
  var remoteInstanceStatusDialogResult =
      await PleromaAsyncOperationHelper.performPleromaAsyncOperation<IStatus?>(
    context: context,
    errorDataBuilders: [
      remoteInstanceLoadDataErrorAlertDialogBuilder,
    ],
    asyncCode: () async {
      IStatus? result;
      RemoteInstanceBloc? remoteInstanceBloc;
      IUnifediApiStatusService? unifediApiStatusService;
      try {
        var instanceUri = localInstanceRemoteStatus!.urlRemoteHostUri;

        var remoteInstanceStatusRemoteId =
            localInstanceRemoteStatus.urlRemoteId;

        remoteInstanceBloc = RemoteInstanceBloc(
          instanceUri: instanceUri,
          connectionService: Provider.of<IConnectionService>(
            context,
            listen: false,
          ),
          unifediApiInstance: null,
        );

        await remoteInstanceBloc.performAsyncInit();

        unifediApiStatusService =
            remoteInstanceBloc.unifediApiManager.createStatusService();

        var remoteInstanceRemoteStatus =
            await unifediApiStatusService.getStatus(
          statusId: remoteInstanceStatusRemoteId,
        );

        result = remoteInstanceRemoteStatus.toDbStatusPopulatedWrapper();
      } finally {
        // ignore: unawaited_futures
        unifediApiStatusService?.dispose();
        // ignore: unawaited_futures
        remoteInstanceBloc?.dispose();
      }

      return result;
    },
  );

  var remoteInstanceStatus = remoteInstanceStatusDialogResult.result;

  if (remoteInstanceStatus != null) {
    IUnifediApiMediaAttachment? remoteInstanceInitialMediaAttachment;

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

MaterialPageRoute<void>
    createRemoteStatusThreadPageRouteBasedOnRemoteInstanceStatus({
  required IStatus status,
  required IUnifediApiMediaAttachment? initialMediaAttachment,
}) =>
        MaterialPageRoute<void>(
          builder: (context) => DisposableProvider<IRemoteInstanceBloc>(
            create: (context) {
              var instanceUri = status.urlRemoteHostUri;

              return RemoteInstanceBloc(
                instanceUri: instanceUri,
                connectionService: Provider.of<IConnectionService>(
                  context,
                  listen: false,
                ),
                unifediApiInstance: null,
              );
            },
            child: Builder(
              builder: (context) => FediAsyncInitLoadingWidget(
                asyncInitLoadingBloc: IRemoteInstanceBloc.of(context),
                // todo: remove hack
                loadingFinishedBuilder: (_) =>
                    DisposableProvider<IStatusThreadBloc>(
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
            ),
          ),
        );
