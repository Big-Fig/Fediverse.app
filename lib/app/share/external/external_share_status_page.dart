import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/share/external/external_share_as_link_field_widget.dart';
import 'package:fedi/app/share/external/external_share_status_bloc_impl.dart';
import 'package:fedi/app/share/page/share_page_app_bar_send_text_action_widget.dart';
import 'package:fedi/app/share/status/share_status_with_message_widget.dart';
import 'package:fedi/app/status/local_status_bloc_impl.dart';
import 'package:fedi/app/status/remote_status_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_bloc.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_bloc_impl.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExternalShareStatusPage extends StatelessWidget {
  final bool isShareAsLinkPossible;

  const ExternalShareStatusPage({
    @required this.isShareAsLinkPossible,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_share_external_title,
          actions: [
            const SharePageAppBarSendTextActionWidget(),
          ],
        ),
        body: ShareStatusWithMessageWidget(
          footer: isShareAsLinkPossible
              ? const Padding(
                  padding: FediPadding.horizontalSmallPadding,
                  child: ExternalShareAsLinkFieldWidget(),
                )
              : null,
        ),
      );
}

void goToExternalShareStatusPage({
  @required BuildContext context,
  @required IStatus status,
  @required InstanceLocation instanceLocation,
  @required bool isShareAsLinkPossible,
}) {
  Navigator.push(
    context,
    createExternalShareStatusPageRoute(
      context: context,
      status: status,
      instanceLocation: instanceLocation,
      isShareAsLinkPossible: isShareAsLinkPossible,
    ),
  );
}

MaterialPageRoute createExternalShareStatusPageRoute({
  @required BuildContext context,
  @required IStatus status,
  @required InstanceLocation instanceLocation,
  @required bool isShareAsLinkPossible,
}) {
  return MaterialPageRoute(
    builder: (context) => ExternalShareStatusBloc.provideToContext(
      context,
      status: status,
      child: Provider.value(
        value: status,
        child: DisposableProxyProvider<IStatus, IStatusBloc>(
          update: (context, value, previous) {
            var isLocal = instanceLocation == InstanceLocation.local;
            if (isLocal) {
              return LocalStatusBloc.createFromContext(
                context,
                status: status,
              );
            } else {
              return RemoteStatusBloc.createFromContext(
                context,
                status: status,
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
            child: ExternalShareStatusPage(
              isShareAsLinkPossible: isShareAsLinkPossible,
            ),
          ),
        ),
      ),
      popupTitle: S.of(context).app_share_external_title,
    ),
  );
}
