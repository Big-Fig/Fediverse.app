import 'package:fedi/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_bloc_impl.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_widget.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_confirm_alert_dialog.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/material.dart';

class EditMyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var editMyAccountBloc = IEditMyAccountBloc.of(context, listen: false);
    return WillPopScope(
      // override back button
      onWillPop: () async {
        handleBackPressed(context, editMyAccountBloc);
        return true;
      },
      child: Scaffold(
        appBar: FediSubPageTitleAppBar(
          title: S.of(context).app_account_my_edit_title,
          leading: FediBackIconButton(
            customOnPressed: () {
              handleBackPressed(context, editMyAccountBloc);
            },
          ),
          actions: <Widget>[
            buildSaveAppBarAction(editMyAccountBloc),
          ],
        ),
        body: SafeArea(child: EditMyAccountWidget()),
      ),
    );
  }

  Widget buildSaveAppBarAction(IEditMyAccountBloc editMyAccountBloc) =>
      StreamBuilder<bool>(
          stream: editMyAccountBloc.isReadyToSubmitStream,
          initialData: editMyAccountBloc.isReadyToSubmit,
          builder: (context, snapshot) {
            var isReadyToSubmit = snapshot.data;

            return PleromaAsyncOperationButtonBuilderWidget(
              showProgressDialog: true,
              progressContentMessage:
                  S.of(context).app_status_post_dialog_async_content,
              asyncButtonAction: () async {
                await editMyAccountBloc.submitChanges();
                Navigator.pop(context);
              },
              errorAlertDialogBuilders: [
                // todo: handle specific cases by error code
//                          (context, error) => SimpleAlertDialog(
//                          title: of(context)
//                              .tr("app.status.post.dialog.error.title"),
//                          content: tr(
//                              "app.status.post.dialog.error.content",
//                              args: [error.toString()]),
//                          context: context)
              ],
              builder: (BuildContext context, onPressed) {
                return FlatButton(
                  child: Text(
                    S.of(context).app_account_my_edit_action_save,
                    style: isReadyToSubmit
                        ? IFediUiTextTheme.of(context).bigShortPrimary
                        : IFediUiTextTheme.of(context).bigShortGrey,
                  ),
                  onPressed: isReadyToSubmit ? onPressed : null,
                );
              },
            );
          });

  void handleBackPressed(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    var isSomethingChanged = editMyAccountBloc.isSomethingChanged;
    if (isSomethingChanged) {
      alertUnsaved(context);
    } else {
      Navigator.pop(context);
    }
  }

  void alertUnsaved(BuildContext context) {
    FediConfirmAlertDialog(
      context: context,
      title: S.of(context).app_account_my_edit_unsaved_dialog_title,
      okActionLabel: S.of(context).app_account_my_edit_unsaved_dialog_action_discard,
      onAction: (context) {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    ).show(context);
  }

  const EditMyAccountPage();
}

void goToEditMyAccountPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IEditMyAccountBloc>(
            create: (context) => EditMyAccountBloc.createFromContext(context),
            child: const EditMyAccountPage())),
  );
}
