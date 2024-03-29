import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/status/draft/draft_status_model.dart';
import 'package:fedi_app/app/status/draft/repository/draft_status_repository.dart';
import 'package:fedi_app/app/status/post/post_status_bloc.dart';
import 'package:fedi_app/app/status/post/post_status_model.dart';
import 'package:fedi_app/app/toast/toast_service.dart';
import 'package:fedi_app/app/ui/dialog/alert/fedi_base_alert_dialog.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/dialog/dialog_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

void showPostStatusUnsavedDialog(
  BuildContext context,
  IPostStatusBloc postStatusBloc,
) {
  var fediUiTextTheme = IFediUiTextTheme.of(context, listen: false);

  FediBaseAlertDialog(
    actionsBorderVisible: false,
    title: S.of(context).app_status_post_new_unsaved_dialog_title,
    contentText: S.of(context).app_status_post_new_unsaved_dialog_content,
    actionsAxis: Axis.vertical,
    cancelable: false,
    actions: [
      DialogAction(
        customTextStyle: fediUiTextTheme.bigTallPrimaryDark,
        label:
            S.of(context).app_status_post_new_unsaved_dialog_action_saveAsDraft,
        onAction: (context) async {
          var isAllAttachedMediaUploaded = postStatusBloc
              .uploadMediaAttachmentsBloc.isAllAttachedMediaUploaded;

          if (isAllAttachedMediaUploaded) {
            var postStatusData =
                postStatusBloc.calculateCurrentPostStatusData();

            var draftStatusRepository =
                IDraftStatusRepository.of(context, listen: false);
            await draftStatusRepository.addDraftStatus(
              draftStatus: DbDraftStatusPopulatedWrapper(
                dbDraftStatusPopulated: DbDraftStatusPopulated(
                  dbDraftStatus: DbDraftStatus(
                    id: null,
                    updatedAt: DateTime.now(),
                    data: postStatusData.toPostStatusData(),
                  ),
                ),
              ),
            );
            Navigator.pop(context);
            Navigator.pop(context);
          } else {
            var toastService = IToastService.of(context, listen: false);
            // ignore: cascade_invocations
            toastService.showErrorToast(
              context: context,
              title:
                  S.of(context).app_status_draft_error_cantSaveNotUploadedMedia,
            );
          }
        },
      ),
      DialogAction(
        customTextStyle: fediUiTextTheme.bigTallError,
        customColor: fediUiTextTheme.bigTallError.color,
        label: S.of(context).app_status_post_new_unsaved_dialog_action_discard,
        onAction: (context) {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
      DialogAction(
        label: S
            .of(context)
            .app_status_post_new_unsaved_dialog_action_keep_editing,
        customTextStyle: fediUiTextTheme.bigTallBoldPrimaryDark,
        onAction: (context) {
          Navigator.pop(context);
        },
      ),
    ],
  ).show<void>(context);
}
