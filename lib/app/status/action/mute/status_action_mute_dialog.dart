import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/form/field/value/duration/date_time/duration_date_time_form_field_row_widget.dart';
import 'package:fedi/app/status/action/mute/status_action_mute_bloc.dart';
import 'package:fedi/app/status/action/mute/status_action_mute_bloc_impl.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/dialog/fedi_dialog.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Future<T?> showStatusActionMuteDialog<T>({
  required BuildContext context,
  required IStatusBloc statusBloc,
}) =>
    StatusActionMuteDialog(
      statusBloc: statusBloc,
      actionsBorderVisible: false,
      title: S.of(context).app_status_mute_dialog_title,
      actionsAxis: Axis.vertical,
      cancelable: true,
      actions: [
        DialogAction(
          label: S.of(context).app_status_mute_dialog_action_clearDate,
          isActionVisibleFetcher: (context) {
            var statusActionMuteBloc =
                IStatusActionMuteBloc.of(context, listen: false);

            return statusActionMuteBloc
                    .expireDurationFieldBloc.currentValueDuration !=
                null;
          },
          isActionVisibleStreamFetcher: (context) {
            var statusActionMuteBloc =
                IStatusActionMuteBloc.of(context, listen: false);

            return statusActionMuteBloc
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
            var statusActionMuteBloc =
                IStatusActionMuteBloc.of(context, listen: false);

            statusActionMuteBloc.expireDurationFieldBloc.clear();
          },
        ),
        DialogAction(
          label: S.of(context).app_status_mute_dialog_action_mute,
          customTextStyle: IFediUiTextTheme.of(
            context,
            listen: false,
          ).bigTallBoldPrimaryDark,
          onAction: (context) async {
            var statusActionMuteBloc =
                IStatusActionMuteBloc.of(context, listen: false);

            await PleromaAsyncOperationHelper.performPleromaAsyncOperation<
                void>(
              context: context,
              asyncCode: () => statusActionMuteBloc.mute(),
            );

            Navigator.pop(context);
          },
        ),
      ],
    ).show(context);

class StatusActionMuteDialog extends FediDialog {
  final IStatusActionMuteBloc statusActionMuteBloc;

  StatusActionMuteDialog({
    required IStatusBloc statusBloc,
    required String title,
    required List<DialogAction> actions,
    Axis actionsAxis = Axis.horizontal,
    bool cancelable = true,
    bool actionsBorderVisible = true,
  })  : statusActionMuteBloc = StatusActionMuteBloc(
          statusBloc: statusBloc,
        ),
        super(
          title: title,
          actions: actions,
          actionsAxis: actionsAxis,
          cancelable: cancelable,
          actionsBorderVisible: actionsBorderVisible,
        ) {
    addDisposable(statusActionMuteBloc);
  }

  @override
  Widget buildDialogBody(BuildContext context) {
    return Provider<IStatusActionMuteBloc>.value(
      value: statusActionMuteBloc,
      child: super.buildDialogBody(context),
    );
  }

  @override
  Widget buildContentWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _StatusActionMuteDialogExpireField(),
      ],
    );
  }
}

class _StatusActionMuteDialogExpireField extends StatelessWidget {
  const _StatusActionMuteDialogExpireField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IStatusActionMuteBloc,
        IDurationDateTimeValueFormFieldBloc>(
      update: (context, value, _) => value.expireDurationFieldBloc,
      child: DurationDateTimeValueFormFieldRowWidget(
        label: S.of(context).app_status_mute_dialog_field_expire_label,
        useDialogPickerForValueSelection: false,
      ),
    );
  }
}
