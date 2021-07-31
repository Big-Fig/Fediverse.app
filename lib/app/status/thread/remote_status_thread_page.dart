import 'package:collection/collection.dart' show IterableExtension;
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
import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

Future goToRemoteStatusThreadPageBasedOnRemoteInstanceStatus(
  BuildContext context, {
  required IStatus remoteInstanceStatus,
  required IPleromaApiMediaAttachment? remoteInstanceInitialMediaAttachment,
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
  required IMastodonApiMediaAttachment?
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
      PleromaApiStatusService? pleromaStatusService;
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
          pleromaApiInstance: null,
        );

        pleromaStatusService = PleromaApiStatusService(
          restService: remoteInstanceBloc.pleromaRestService,
        );

        var remoteInstanceRemoteStatus = await pleromaStatusService.getStatus(
          statusRemoteId: remoteInstanceStatusRemoteId,
        );

        result = remoteInstanceRemoteStatus.toDbStatusPopulatedWrapper();
      } finally {
        // ignore: unawaited_futures
        pleromaStatusService?.dispose();
        // ignore: unawaited_futures
        remoteInstanceBloc?.dispose();
      }

      return result;
    },
  );

  var remoteInstanceStatus = remoteInstanceStatusDialogResult.result;

  if (remoteInstanceStatus != null) {
    IPleromaApiMediaAttachment? remoteInstanceInitialMediaAttachment;

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
  required IPleromaApiMediaAttachment? initialMediaAttachment,
}) {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<IRemoteInstanceBloc>(
      create: (context) {
        var instanceUri = status.urlRemoteHostUri;

        return RemoteInstanceBloc(
          instanceUri: instanceUri,
          connectionService: Provider.of<IConnectionService>(
            context,
            listen: false,
          ),
          pleromaApiInstance: null,
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
