import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/status/draft/list/draft_status_list_page.dart';
import 'package:fedi_app/app/status/draft/repository/draft_status_repository.dart';
import 'package:fedi_app/app/status/post/new/new_post_status_page.dart';
import 'package:fedi_app/app/status/post/post_status_model.dart';
import 'package:fedi_app/app/status/status_bloc.dart';
import 'package:fedi_app/app/ui/dialog/alert/fedi_base_alert_dialog.dart';
import 'package:fedi_app/dialog/dialog_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

Future<T?> showStatusActionDeleteDialog<T>({
  required BuildContext context,
  required IStatusBloc statusBloc,
}) =>
    StatusActionDeleteDialog(
      actionsBorderVisible: false,
      title: S.of(context).app_status_delete_dialog_title,
      actionsAxis: Axis.vertical,
      cancelable: true,
      actions: [
        buildDeleteAction(context, statusBloc),
        buildDeleteAndSaveToDrafts(context, statusBloc),
        buildDeleteAndStartNewAction(context, statusBloc),
      ],
      contentText: null,
    ).show(context);

DialogAction buildDeleteAndSaveToDrafts(
  BuildContext context,
  IStatusBloc statusBloc,
) {
  var pollLimits = ICurrentAccessBloc.of(
    context,
    listen: false,
  ).currentInstance?.instance?.limits?.poll;

  return DialogAction(
    label: S.of(context).app_status_delete_dialog_action_deleteAndSaveToDrafts,
    onAction: (context) async {
      var dialogResult =
          await UnifediAsyncOperationHelper.performUnifediAsyncOperation<void>(
        context: context,
        asyncCode: () => statusBloc.delete(),
      );

      if (dialogResult.success) {
        Navigator.pop(context);

        var postStatusData = statusBloc.status.calculatePostStatusData(
          limits: pollLimits,
        );

        var draftStatusRepository = IDraftStatusRepository.of(
          context,
          listen: false,
        );

        // ignore: avoid-ignoring-return-values
        await draftStatusRepository.upsertInDbType(
          DbDraftStatus(
            data: postStatusData,
            updatedAt: DateTime.now(),
            id: null,
          ),
        );

        // delay to be sure pop already finished, it looks like bug in flutter
        Future.delayed(
          // todo: refactor
          // ignore: no-magic-number
          const Duration(milliseconds: 100),
          () {
            goToDraftStatusListPage(context);
          },
        );
      }
    },
  );
}

DialogAction buildDeleteAndStartNewAction(
  BuildContext context,
  IStatusBloc statusBloc,
) {
  var pollLimits = ICurrentAccessBloc.of(
    context,
    listen: false,
  ).currentInstance?.instance?.limits?.poll;

  return DialogAction(
    label: S.of(context).app_status_delete_dialog_action_deleteAndStartNew,
    onAction: (context) async {
      var dialogResult =
          await UnifediAsyncOperationHelper.performUnifediAsyncOperation<void>(
        context: context,
        asyncCode: () => statusBloc.delete(),
      );

      if (dialogResult.success) {
        Navigator.pop(context);

        var postStatusData = statusBloc.status.calculatePostStatusData(
          limits: pollLimits,
        );

        // delay to be sure pop already finished, it looks like bug in flutter
        Future.delayed(
          // todo: refactor
          // ignore: no-magic-number
          const Duration(milliseconds: 100),
          () {
            goToNewPostStatusPage(
              context,
              initialData: postStatusData,
            );
          },
        );
      }
    },
  );
}

DialogAction buildDeleteAction(
  BuildContext context,
  IStatusBloc statusBloc,
) =>
    DialogAction(
      label: S.of(context).app_status_delete_dialog_action_delete,
      onAction: (context) async {
        // ignore: avoid-ignoring-return-values
        await UnifediAsyncOperationHelper.performUnifediAsyncOperation<void>(
          context: context,
          asyncCode: () => statusBloc.delete(),
        );

        Navigator.pop(context);
      },
    );

class StatusActionDeleteDialog extends FediBaseAlertDialog {
  StatusActionDeleteDialog({
    required String title,
    required List<DialogAction> actions,
    required String? contentText,
    Axis actionsAxis = Axis.horizontal,
    bool cancelable = true,
    bool actionsBorderVisible = true,
  }) : super(
          title: title,
          contentText: contentText,
          actions: actions,
          actionsAxis: actionsAxis,
          cancelable: cancelable,
          actionsBorderVisible: actionsBorderVisible,
        );
}
