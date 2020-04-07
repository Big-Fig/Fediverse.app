import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:fedi/refactored/app/status/post/thread/thread_post_status_bloc_impl.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/status/thread/status_thread_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'status_thread_bloc.dart';
import 'status_thread_bloc_impl.dart';

class StatusThreadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context)
                .tr("app.status.thread.title")),
      ),
      body: SafeArea(child: StatusThreadWidget()));
}

void goToStatusThreadPage(BuildContext context, IStatus status) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IStatusThreadBloc>(
            create: (context) => StatusThreadBloc(
                statusRepository: IStatusRepository.of(context, listen: false),
                pleromaStatusService:
                    IPleromaStatusService.of(context, listen: false),
                startStatus: status),
            child: DisposableProvider<IPostStatusBloc>(
                create: (context) => ThreadPostStatusBloc.createFromContext(
                    context,
                    inReplyToStatus: status),
                child: StatusThreadPage()))),
  );
}
