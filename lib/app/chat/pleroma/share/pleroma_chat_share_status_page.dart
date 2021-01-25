import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_status_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/share/select_account/share_select_account_widget.dart';
import 'package:fedi/app/share/status/share_status_with_message_widget.dart';
import 'package:fedi/app/status/local_status_bloc_impl.dart';
import 'package:fedi/app/status/remote_status_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_bloc.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_bloc_impl.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PleromaChatShareStatusPage extends StatelessWidget {
  const PleromaChatShareStatusPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_chat_pleroma_share_title,
      ),
      body: const ShareSelectAccountWidget(
        header: ShareStatusWithMessageWidget(
          footer: null,
        ),
        alwaysShowHeader: true,
      ),
    );
  }
}

void goToPleromaChatShareStatusPage({
  @required BuildContext context,
  @required IStatus status,
  @required InstanceLocation instanceLocation,
}) {
  Navigator.push(
    context,
    createPleromaChatShareStatusPageRoute(
      context: context,
      status: status,
      instanceLocation: instanceLocation,
    ),
  );
}

MaterialPageRoute createPleromaChatShareStatusPageRoute({
  @required BuildContext context,
  @required IStatus status,
  @required InstanceLocation instanceLocation,
}) {
  return MaterialPageRoute(
    builder: (context) => PleromaChatShareStatusBloc.provideToContext(context,
        status: status,
        child: Provider.value(
          value: status,
          child: DisposableProxyProvider<IStatus, IStatusBloc>(
            update: (context, value, previous) {
              var isLocal = instanceLocation == InstanceLocation.local;
              if (isLocal) {
                return LocalStatusBloc.createFromContext(
                  context,
                  status: value,
                );
              } else {
                return RemoteStatusBloc.createFromContext(
                  context,
                  status: value,
                );
              }
            },
            child: DisposableProxyProvider<IStatusBloc, IStatusSensitiveBloc>(
              update: (context, statusBloc, _) =>
                  StatusSensitiveBloc.createFromContext(
                context: context,
                statusBloc: statusBloc,
                initialDisplayEnabled: true,
              ),
              child: const PleromaChatShareStatusPage(),
            ),
          ),
        )),
  );
}
