import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/report/account_report_bloc.dart';
import 'package:fedi_app/app/account/report/account_report_bloc_impl.dart';
import 'package:fedi_app/app/account/report/account_report_bloc_proxy_provider.dart';
import 'package:fedi_app/app/account/report/account_report_widget.dart';
import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/toast/toast_service.dart';
import 'package:fedi_app/app/ui/button/fedi_text_button.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class AccountReportPage extends StatelessWidget {
  const AccountReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: _AccountReportPageAppBar(),
        body: SafeArea(
          child: AccountReportWidget(),
        ),
      );
}

class _AccountReportPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _AccountReportPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountReportBloc = IAccountReportBloc.of(context);
    var account = accountReportBloc.account;

    return FediPageTitleAppBar(
      title: S.of(context).app_account_report_title(account.acct),
      actions: const [
        _AccountReportSendButton(),
      ],
    );
  }

  @override
  Size get preferredSize => FediPageTitleAppBar.calculatePreferredSize();
}

class _AccountReportSendButton extends StatelessWidget {
  const _AccountReportSendButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountReportBloc = IAccountReportBloc.of(context);

    return StreamBuilder<bool>(
      stream: accountReportBloc.isHaveAtLeastOneErrorStream,
      initialData: accountReportBloc.isHaveAtLeastOneError,
      builder: (context, snapshot) {
        var isHaveAtLeastOneError = snapshot.data;

        return UnifediAsyncOperationButtonBuilderWidget(
          builder: (context, onPressed) => FediTextButton(
            text: S.of(context).app_account_report_action_send,
            onPressed: isHaveAtLeastOneError! ? null : onPressed,
          ),
          asyncButtonAction: () async {
            await accountReportBloc.send();

            var toastService = IToastService.of(context, listen: false);

            // ignore: cascade_invocations
            toastService.showInfoToast(
              context: context,
              title: S.of(context).app_account_report_toast_success,
            );
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}

void goToAccountReportPage(
  BuildContext context, {
  required IAccount account,
  required List<IStatus> statuses,
}) {
  Navigator.push<void>(
    context,
    createAccountReportPageRoute(
      account: account,
      statuses: statuses,
    ),
  );
}

MaterialPageRoute createAccountReportPageRoute({
  required IAccount account,
  required List<IStatus> statuses,
}) =>
    MaterialPageRoute<void>(
      builder: (context) => DisposableProvider<IAccountReportBloc>(
        create: (context) => AccountReportBloc(
          account: account,
          statuses: statuses,
          unifediAuthAccountService: Provider.of<IUnifediApiAccountService>(
            context,
            listen: false,
          ),
        ),
        child: const AccountReportBlocProxyProvider(
          child: AccountReportPage(),
        ),
      ),
    );
