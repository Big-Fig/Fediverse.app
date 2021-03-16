import 'package:fedi/app/status/post/thread/thread_post_status_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/local_status_thread_bloc_impl.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_bloc_proxy_provider.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future goToLocalStatusThreadPage(
  BuildContext context, {
  required IStatus status,
  required IPleromaMediaAttachment? initialMediaAttachment,
}) {
  return Navigator.push(
    context,
    createLocalStatusThreadPageRoute(
      status: status,
      initialMediaAttachment: initialMediaAttachment,
    ),
  );
}

MaterialPageRoute createLocalStatusThreadPageRoute({
  required IStatus status,
  required IPleromaMediaAttachment? initialMediaAttachment,
}) {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<IStatusThreadBloc>(
      create: (context) => LocalStatusThreadBloc.createFromContext(
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
  );
}
