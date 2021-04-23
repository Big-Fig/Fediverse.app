import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_bloc_impl.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_service_impl.dart';
import 'package:flutter/widgets.dart';

class RemoteStatusThreadBloc extends StatusThreadBloc {
  final Uri instanceUri;

  RemoteStatusThreadBloc({
    required IStatus initialStatusToFetchThread,
    required IPleromaMediaAttachment? initialMediaAttachment,
    required IPleromaStatusService pleromaStatusService,
    required this.instanceUri,
  }) : super(
          pleromaStatusService: pleromaStatusService,
          initialStatusToFetchThread: initialStatusToFetchThread,
          initialMediaAttachment: initialMediaAttachment,
        );

  static RemoteStatusThreadBloc createFromContext(
    BuildContext context, {
    required IStatus initialStatusToFetchThread,
    required IPleromaMediaAttachment? initialMediaAttachment,
  }) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);

    var pleromaStatusService = PleromaStatusService(
      restService: remoteInstanceBloc.pleromaRestService,
    );

    var remoteStatusThreadBloc = RemoteStatusThreadBloc(
      initialStatusToFetchThread: initialStatusToFetchThread,
      initialMediaAttachment: initialMediaAttachment,
      pleromaStatusService: pleromaStatusService,
      instanceUri: remoteInstanceBloc.instanceUri,
    );

    remoteStatusThreadBloc.addDisposable(disposable: pleromaStatusService);

    return remoteStatusThreadBloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    required IStatus initialStatusToFetchThread,
    required IPleromaMediaAttachment initialMediaAttachment,
    required Widget child,
  }) {
    return DisposableProvider<IStatusThreadBloc>(
      create: (context) => RemoteStatusThreadBloc.createFromContext(
        context,
        initialStatusToFetchThread: initialStatusToFetchThread,
        initialMediaAttachment: initialMediaAttachment,
      ),
      child: child,
    );
  }

  @override
  Future<List<IFilter>> loadFilters() async => [];

  @override
  // ignore: no-empty-block
  Future<void> onInitialStatusUpdated(
    IPleromaStatus updatedStartRemoteStatus,
  // ignore: no-empty-block
  ) async {
    // nothing
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.remote;

  @override
  Uri get remoteInstanceUriOrNull => instanceUri;
}
