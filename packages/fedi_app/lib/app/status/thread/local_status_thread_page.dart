import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/status/post/thread/thread_post_status_bloc_impl.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/status/thread/local_status_thread_bloc_impl.dart';
import 'package:fedi_app/app/status/thread/status_thread_bloc.dart';
import 'package:fedi_app/app/status/thread/status_thread_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/thread/status_thread_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unifedi_api/unifedi_api.dart';

Future<void> goToLocalStatusThreadPage(
  BuildContext context, {
  required IStatus status,
  required IUnifediApiMediaAttachment? initialMediaAttachment,
}) =>
    Navigator.push(
      context,
      createLocalStatusThreadPageRoute(
        status: status,
        initialMediaAttachment: initialMediaAttachment,
      ),
    );

MaterialPageRoute<void> createLocalStatusThreadPageRoute({
  required IStatus status,
  required IUnifediApiMediaAttachment? initialMediaAttachment,
}) =>
    MaterialPageRoute<void>(
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
