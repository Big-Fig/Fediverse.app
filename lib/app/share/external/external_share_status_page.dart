import 'package:fedi/app/share/external/external_share_as_link_field_widget.dart';
import 'package:fedi/app/share/external/external_share_status_bloc_impl.dart';
import 'package:fedi/app/share/share_icon_button_widget.dart';
import 'package:fedi/app/share/status/share_status_with_message_widget.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_bloc.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_bloc_impl.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExternalShareStatusPage extends StatelessWidget {
  const ExternalShareStatusPage();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediSubPageTitleAppBar(
          title: S.of(context).app_share_external_title,
          actions: [
            ShareIconButtonWidget(
              iconSize: FediSizes.appBarIconSize,
            ),
          ],
        ),
        body: const ShareStatusWithMessageWidget(
          footer: Padding(
            padding: FediPadding.horizontalSmallPadding,
            child: ExternalShareAsLinkFieldWidget(),
          ),
        ),
      );
}

void goToExternalShareStatusPage(
    {@required BuildContext context, @required IStatus status}) {
  Navigator.push(
    context,
    createExternalShareStatusPageRoute(
      context: context,
      status: status,
    ),
  );
}

MaterialPageRoute createExternalShareStatusPageRoute({
  @required BuildContext context,
  @required IStatus status,
}) {
  return MaterialPageRoute(
    builder: (context) => ExternalShareStatusBloc.provideToContext(
      context,
      status: status,
      child: Provider.value(
        value: status,
        child: DisposableProxyProvider<IStatus, IStatusBloc>(
          update: (context, value, previous) =>
              StatusBloc.createFromContext(context, status),
          child: DisposableProxyProvider<IStatusBloc, IStatusSensitiveBloc>(
            update: (context, statusBloc, _) =>
                StatusSensitiveBloc.createFromContext(
              context: context,
              statusBloc: statusBloc,
              initialDisplayEnabled: true,
            ),
            child: const ExternalShareStatusPage(),
          ),
        ),
      ),
      popupTitle: S.of(context).app_share_external_title,
    ),
  );
}
