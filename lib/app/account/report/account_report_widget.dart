import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/report/account_report_bloc.dart';
import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/form/field/value/string/string_value_form_field_row_widget.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc_impl.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/local_status_bloc_impl.dart';
import 'package:fedi/app/status/remote_status_bloc_impl.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountReportWidget extends StatelessWidget {
  const AccountReportWidget();

  @override
  Widget build(BuildContext context) => ListView(
        children: [
          Padding(
            padding: FediPadding.allBigPadding,
            child: const _AccountReportFormWidget(),
          ),
          const _AccountReportStatusesWidget(),
        ],
      );
}

class _AccountReportFormWidget extends StatelessWidget {
  const _AccountReportFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountReportBloc = IAccountReportBloc.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _AccountReportDescriptionWidget(),
        const FediSmallVerticalSpacer(),
        const _AccountReportMessageWidget(),
        if (accountReportBloc.isAccountOnRemoteHost)
          const FediSmallVerticalSpacer(),
        if (accountReportBloc.isAccountOnRemoteHost)
          const _AccountReportForwardWidget(),
      ],
    );
  }
}

class _AccountReportStatusesWidget extends StatelessWidget {
  const _AccountReportStatusesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountReportBloc = IAccountReportBloc.of(context);
    var isLocal = accountReportBloc.instanceLocation == InstanceLocation.local;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...accountReportBloc.statuses.map(
          (status) => Provider<IStatus>.value(
            value: status,
            child: DisposableProxyProvider<IStatus, IStatusBloc>(
              update: (context, status, _) {
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
              child:
                  DisposableProxyProvider<IStatus, IStatusListItemTimelineBloc>(
                update: (context, status, _) => StatusListItemTimelineBloc.list(
                  status: status,
                  collapsible: false,
                  statusCallback: null,
                  initialMediaAttachment: null,
                ),
                child: const FediListTile(
                  child: StatusListItemTimelineWidget(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AccountReportDescriptionWidget extends StatelessWidget {
  const _AccountReportDescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Text(S.of(context).app_account_report_description);
}

class _AccountReportForwardWidget extends StatelessWidget {
  const _AccountReportForwardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountReportBloc = IAccountReportBloc.of(context);
    var account = accountReportBloc.account;
    var acctRemoteHost = account.acctRemoteHost!;

    return ProxyProvider<IAccountReportBloc, IBoolValueFormFieldBloc>(
      update: (context, value, _) => value.forwardBoolValueFormFieldBloc,
      child: BoolValueFormFieldBlocProxyProvider(
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_account_report_forward_label(acctRemoteHost),
        ),
      ),
    );
  }
}

class _AccountReportMessageWidget extends StatelessWidget {
  const _AccountReportMessageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IAccountReportBloc, IStringValueFormFieldBloc>(
        update: (context, value, _) => value.messageStringValueFormFieldBloc,
        child: StringValueFormFieldBlocProxyProvider(
          child: StringValueFormFieldRowWidget(
            label: S.of(context).app_account_report_message_label,
            autocorrect: true,
            hint: S.of(context).app_account_report_message_hint,
            onSubmitted: null,
            textInputAction: TextInputAction.done,
          ),
        ),
      );
}
