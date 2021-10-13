import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/action/mute/account_action_mute_bloc.dart';
import 'package:fedi/app/account/action/mute/account_action_mute_bloc_impl.dart';
import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/form/field/value/duration/date_time/duration_date_time_form_field_row_widget.dart';
import 'package:fedi/app/ui/dialog/fedi_dialog.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Future<void> showAccountActionMuteDialog({
  required BuildContext context,
  required IAccountBloc accountBloc,
}) =>
    AccountActionMuteDialog(
      accountBloc: accountBloc,
      actionsBorderVisible: false,
      title: S.of(context).app_account_mute_dialog_title,
      actionsAxis: Axis.vertical,
      cancelable: true,
      actions: [
        DialogAction(
          label: S.of(context).app_account_mute_dialog_action_clearDate,
          isActionVisibleFetcher: (context) {
            var accountActionMuteBloc =
                IAccountActionMuteBloc.of(context, listen: false);

            return accountActionMuteBloc
                    .expireDurationFieldBloc.currentValueDuration !=
                null;
          },
          isActionVisibleStreamFetcher: (context) {
            var accountActionMuteBloc =
                IAccountActionMuteBloc.of(context, listen: false);

            return accountActionMuteBloc
                .expireDurationFieldBloc.currentValueDurationStream
                .map(
              (duration) => duration != null,
            );
          },
          customTextStyle: IFediUiTextTheme.of(
            context,
            listen: false,
          ).bigTallPrimaryDark,
          onAction: (context) async {
            var accountActionMuteBloc =
                IAccountActionMuteBloc.of(context, listen: false);

            accountActionMuteBloc.expireDurationFieldBloc.clear();
          },
        ),
        DialogAction(
          label: S.of(context).app_account_mute_dialog_action_mute,
          customTextStyle: IFediUiTextTheme.of(
            context,
            listen: false,
          ).bigTallBoldPrimaryDark,
          onAction: (context) async {
            var accountActionMuteBloc =
                IAccountActionMuteBloc.of(context, listen: false);

            await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
              context: context,
              asyncCode: () => accountActionMuteBloc.mute(),
            );

            Navigator.pop(context);
          },
        ),
      ],
    ).show(context);

class AccountActionMuteDialog extends FediDialog {
  final IAccountActionMuteBloc accountActionMuteBloc;

  AccountActionMuteDialog({
    required IAccountBloc accountBloc,
    required String title,
    required List<DialogAction> actions,
    Axis actionsAxis = Axis.horizontal,
    bool cancelable = true,
    bool actionsBorderVisible = true,
  })  : accountActionMuteBloc = AccountActionMuteBloc(
          accountBloc: accountBloc,
        ),
        super(
          title: title,
          actions: actions,
          actionsAxis: actionsAxis,
          cancelable: cancelable,
          actionsBorderVisible: actionsBorderVisible,
        ) {
    accountActionMuteBloc.disposeWith(this);
  }

  @override
  Widget buildDialogBody(BuildContext context) {
    return Provider<IAccountActionMuteBloc>.value(
      value: accountActionMuteBloc,
      child: super.buildDialogBody(context),
    );
  }

  @override
  Widget buildContentWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _AccountActionMuteDialogDescriptionWidget(),
        const _AccountActionMuteDialogNotificationsField(),
        const _AccountActionMuteDialogExpireField(),
      ],
    );
  }
}

class _AccountActionMuteDialogExpireField extends StatelessWidget {
  const _AccountActionMuteDialogExpireField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IAccountActionMuteBloc,
        IDurationDateTimeValueFormFieldBloc>(
      update: (context, value, _) => value.expireDurationFieldBloc,
      child: DurationDateTimeValueFormFieldRowWidget(
        label: S.of(context).app_account_mute_dialog_field_expire_label,
        useDialogPickerForValueSelection: false,
      ),
    );
  }
}

class _AccountActionMuteDialogDescriptionWidget extends StatelessWidget {
  const _AccountActionMuteDialogDescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        S.of(context).app_account_mute_description,
        textAlign: TextAlign.center,
        style: IFediUiTextTheme.of(context).dialogContentDarkGrey,
      );
}

class _AccountActionMuteDialogNotificationsField extends StatelessWidget {
  const _AccountActionMuteDialogNotificationsField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IAccountActionMuteBloc, IBoolValueFormFieldBloc>(
        update: (context, value, _) => value.notificationsBoolFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label:
              S.of(context).app_account_mute_dialog_field_notifications_label,
          description: S
              .of(context)
              .app_account_mute_dialog_field_notifications_description,
        ),
      );
}
