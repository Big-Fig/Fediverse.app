import 'package:collection/collection.dart' show IterableExtension;
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/config/config_service.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_error_data.dart';
import 'package:fedi_app/app/status/post/thread/thread_post_status_bloc_impl.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/status/status_model_adapter.dart';
import 'package:fedi_app/app/status/thread/remote_status_thread_bloc_impl.dart';
import 'package:fedi_app/app/status/thread/status_thread_bloc.dart';
import 'package:fedi_app/app/status/thread/status_thread_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/thread/status_thread_page.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

// todo: remove hack
// remote instance my be fetched from previous
Future<void>
    goToRemoteStatusThreadPageBasedOnRemoteInstanceStatusWithoutRemoteInstanceBloc(
  BuildContext context, {
  required IStatus remoteInstanceStatus,
  required IUnifediApiMediaAttachment? remoteInstanceInitialMediaAttachment,
}) async {
  var instanceUri = remoteInstanceStatus.urlRemoteHostUri;

  var remoteInstanceBloc = RemoteInstanceBloc(
    instanceUri: instanceUri,
    configService: IConfigService.of(
      context,
      listen: false,
    ),
    connectionService: Provider.of<IConnectionService>(
      context,
      listen: false,
    ),
    unifediApiInstance: null,
  );

  await remoteInstanceBloc.performAsyncInit();

  return goToRemoteStatusThreadPageBasedOnRemoteInstanceStatus(
    context,
    remoteInstanceStatus: remoteInstanceStatus,
    remoteInstanceInitialMediaAttachment: remoteInstanceInitialMediaAttachment,
    remoteInstanceBloc: remoteInstanceBloc,
  );
}

Future<void> goToRemoteStatusThreadPageBasedOnRemoteInstanceStatus(
  BuildContext context, {
  required IStatus remoteInstanceStatus,
  required IUnifediApiMediaAttachment? remoteInstanceInitialMediaAttachment,
  required IRemoteInstanceBloc remoteInstanceBloc,
}) =>
    Navigator.push(
      context,
      createRemoteStatusThreadPageRouteBasedOnRemoteInstanceStatus(
        status: remoteInstanceStatus,
        remoteInstanceBloc: remoteInstanceBloc,
        initialMediaAttachment: remoteInstanceInitialMediaAttachment,
      ),
    );

// ignore: long-method
Future<void> goToRemoteStatusThreadPageBasedOnLocalInstanceRemoteStatus(
  BuildContext context, {
  required IStatus? localInstanceRemoteStatus,
  required IUnifediApiMediaAttachment?
      localInstanceRemoteInitialMediaAttachment,
}) async {
  var instanceUri = localInstanceRemoteStatus!.urlRemoteHostUri;

  var remoteInstanceStatusDialogResult =
      await UnifediAsyncOperationHelper.performUnifediAsyncOperation<IStatus?>(
    context: context,
    errorDataBuilders: [
      remoteInstanceLoadDataErrorAlertDialogBuilder,
    ],
    asyncCode: () async {
      IStatus? result;
      RemoteInstanceBloc? remoteInstanceBloc;
      IUnifediApiStatusService? unifediApiStatusService;
      try {
        var remoteInstanceStatusRemoteId =
            localInstanceRemoteStatus.urlRemoteId;

        remoteInstanceBloc = RemoteInstanceBloc(
          instanceUri: instanceUri,
          configService: IConfigService.of(
            context,
            listen: false,
          ),
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

    var remoteInstanceBloc2 = RemoteInstanceBloc(
      instanceUri: instanceUri,
      configService: IConfigService.of(
        context,
        listen: false,
      ),
      connectionService: Provider.of<IConnectionService>(
        context,
        listen: false,
      ),
      unifediApiInstance: null,
    );

    await remoteInstanceBloc2.performAsyncInit();

    await goToRemoteStatusThreadPageBasedOnRemoteInstanceStatus(
      context,
      remoteInstanceStatus: remoteInstanceStatus,
      // was disposed inside goToRemoteStatusThreadPageBasedOnRemoteInstanceStatus
      remoteInstanceBloc: remoteInstanceBloc2,
      remoteInstanceInitialMediaAttachment:
          remoteInstanceInitialMediaAttachment,
    );
  }
}

RemoteInstanceBloc createRemoteInstanceBloc({
  required BuildContext context,
  required IStatus status,
}) {
  var instanceUri = status.urlRemoteHostUri;

  return RemoteInstanceBloc(
    instanceUri: instanceUri,
    configService: IConfigService.of(
      context,
      listen: false,
    ),
    connectionService: Provider.of<IConnectionService>(
      context,
      listen: false,
    ),
    unifediApiInstance: null,
  );
}

MaterialPageRoute<void>
    createRemoteStatusThreadPageRouteBasedOnRemoteInstanceStatus({
  required IStatus status,
  required IUnifediApiMediaAttachment? initialMediaAttachment,
  required IRemoteInstanceBloc remoteInstanceBloc,
}) =>
        MaterialPageRoute<void>(
          builder: (context) => DisposableProvider<IRemoteInstanceBloc>(
            create: (context) => remoteInstanceBloc,
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
