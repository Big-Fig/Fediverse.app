import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/report/account_report_bloc.dart';
import 'package:fedi/app/account/report/account_report_bloc_impl.dart';
import 'package:fedi/app/account/report/account_report_bloc_proxy_provider.dart';
import 'package:fedi/app/account/report/account_report_widget.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/app/ui/button/fedi_text_button.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/account/auth/pleroma_auth_account_service.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountReportPage extends StatelessWidget {
  const AccountReportPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AccountReportPageAppBar(),
      body: const SafeArea(
        child: AccountReportWidget(),
      ),
    );
  }
}

class _AccountReportPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _AccountReportPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountReportBloc = IAccountReportBloc.of(context);
    var account = accountReportBloc.account!;
    return FediPageTitleAppBar(
      title: S.of(context).app_account_report_title(account.acct!),
      actions: [
        const _AccountReportSendButton(),
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
        return PleromaAsyncOperationButtonBuilderWidget(
          builder: (context, onPressed) => FediTextButton(
            text: S.of(context).app_account_report_action_send,
            onPressed: isHaveAtLeastOneError! ? null : onPressed,
          ),
          asyncButtonAction: () async {
            var success = await accountReportBloc.send();

            var toastService = IToastService.of(context, listen: false);

            if (success) {
              toastService.showInfoToast(
                context: context,
                title: S.of(context).app_account_report_toast_success,
              );
              Navigator.of(context).pop();
            } else {
              toastService.showErrorToast(
                context: context,
                title: S.of(context).app_account_report_toast_fail,
              );
            }
          },
        );
      },
    );
  }
}

void goToAccountReportPage(
  BuildContext context, {
  required IAccount? account,
  required List<IStatus?> statuses,
}) {
  Navigator.push(
    context,
    createAccountReportPageRoute(
      account: account,
      statuses: statuses,
    ),
  );
}

MaterialPageRoute createAccountReportPageRoute({
  required IAccount? account,
  required List<IStatus?> statuses,
}) {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<IAccountReportBloc>(
      create: (context) => AccountReportBloc(
        account: account,
        statuses: statuses,
        pleromaAuthAccountService: IPleromaAuthAccountService.of(
          context,
          listen: false,
        ),
      ),
      child: AccountReportBlocProxyProvider(
        child: const AccountReportPage(),
      ),
    ),
  );
}
