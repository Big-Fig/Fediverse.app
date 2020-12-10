import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/report/account_report_bloc.dart';
import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/form/field/value/string/string_value_form_field_row_widget.dart';
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
  Widget build(BuildContext context) {
    var accountReportBloc = IAccountReportBloc.of(context);
    return Column(
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

class _AccountReportDescriptionWidget extends StatelessWidget {
  const _AccountReportDescriptionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(S.of(context).app_account_report_description);
  }
}

class _AccountReportForwardWidget extends StatelessWidget {
  const _AccountReportForwardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountReportBloc = IAccountReportBloc.of(context);
    var account = accountReportBloc.account;
    var acctRemoteHost = account.acctRemoteHost;
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
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IAccountReportBloc, IStringValueFormFieldBloc>(
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
}
