import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/thread/thread_post_status_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_bloc_impl.dart';
import 'package:fedi/app/status/thread/status_thread_widget.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusThreadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      asd
        appBar: FediSubPageTitleAppBar(
            title: AppLocalizations.of(context).tr("app.status.thread.title")),
        body: StatusThreadWidget());
  }
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
