import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc_impl.dart';
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
import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pedantic/pedantic.dart';

void goToRemoteStatusThreadPageBasedOnRemoteInstanceStatus(
  BuildContext context, {
  @required IStatus remoteInstanceStatus,
  @required IMastodonMediaAttachment remoteInstanceInitialMediaAttachment,
}) {
  Navigator.push(
    context,
    createRemoteStatusThreadPageRouteBasedOnRemoteInstanceStatus(
      status: remoteInstanceStatus,
      initialMediaAttachment: remoteInstanceInitialMediaAttachment,
    ),
  );
}

Future goToRemoteStatusThreadPageBasedOnLocalInstanceRemoteStatus(
  BuildContext context, {
  @required IStatus localInstanceRemoteStatus,
  @required IMastodonMediaAttachment localInstanceRemoteInitialMediaAttachment,
}) async {
  var instanceUri = localInstanceRemoteStatus.urlRemoteHostUri;

  var remoteInstanceStatusRemoteId = localInstanceRemoteStatus.urlRemoteId;
  var remoteInstanceBloc = RemoteInstanceBloc(
    instanceUri: instanceUri,
    connectionService: IConnectionService.of(
      context,
      listen: false,
    ),
  );

  var pleromaStatusService = PleromaStatusService(
    restService: remoteInstanceBloc.pleromaRestService,
  );

  AsyncDialogResult<IStatus> remoteInstanceStatusDialogResult =
      await PleromaAsyncOperationHelper.performPleromaAsyncOperation<IStatus>(
    context: context,
    asyncCode: () async {
      var remoteInstanceRemoteStatus = await pleromaStatusService.getStatus(
          statusRemoteId: remoteInstanceStatusRemoteId);

      return mapRemoteStatusToLocalStatus(remoteInstanceRemoteStatus);
    },
  );

  IStatus remoteInstanceStatus = remoteInstanceStatusDialogResult.result;

  unawaited(pleromaStatusService.dispose());
  unawaited(remoteInstanceBloc.dispose());

  IMastodonMediaAttachment remoteInstanceInitialMediaAttachment;

  if (localInstanceRemoteInitialMediaAttachment != null) {
    remoteInstanceInitialMediaAttachment =
        remoteInstanceStatus.mediaAttachments.firstWhere(
      (mediaAttachment) =>
          mediaAttachment.url == localInstanceRemoteInitialMediaAttachment.url,
      orElse: () => null,
    );
  }

  goToRemoteStatusThreadPageBasedOnRemoteInstanceStatus(
    context,
    remoteInstanceStatus: remoteInstanceStatus,
    remoteInstanceInitialMediaAttachment: remoteInstanceInitialMediaAttachment,
  );
}

MaterialPageRoute createRemoteStatusThreadPageRouteBasedOnRemoteInstanceStatus({
  @required IStatus status,
  @required IMastodonMediaAttachment initialMediaAttachment,
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
