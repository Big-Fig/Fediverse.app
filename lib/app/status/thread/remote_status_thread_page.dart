import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:fedi/app/status/post/thread/thread_post_status_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/remote_status_thread_bloc_impl.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_bloc_proxy_provider.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void goToRemoteStatusThreadPage(
  BuildContext context, {
  @required IStatus status,
  @required IMastodonMediaAttachment initialMediaAttachment,
}) {
  Navigator.push(
    context,
    createRemoteStatusThreadPageRoute(
      status: status,
      initialMediaAttachment: initialMediaAttachment,
    ),
  );
}

MaterialPageRoute createRemoteStatusThreadPageRoute({
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
