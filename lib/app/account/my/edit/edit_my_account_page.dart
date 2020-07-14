import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_bloc_impl.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_widget.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/dialog/fedi_alert_dialog.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
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
          title: tr("app.account.my.edit.title"),
          leading: FediBackIconButton(
            customOnPressed: () {
              handleBackPressed(context, editMyAccountBloc);
            },
          ),
          actions: <Widget>[
            buildSaveAppBarAction(editMyAccountBloc),
          ],
        ),
        body: EditMyAccountWidget(),
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
                  tr("app.status.post.dialog.async.content"),
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
                    tr("app.account.my.edit.action.save"),
                    style: isReadyToSubmit
                        ? FediTextStyles.bigShortGrey
                        : FediTextStyles.bigShortPrimary,
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
    showFediAlertDialog(
      context: context,
      title: tr("app.account.my.edit.unsaved.dialog.title"),
      //      body:
      // "",
      actions: [
        AlertAction(
          text: tr("app.account.my.edit.unsaved.dialog.action.discard"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
      cancelable: true,
    );
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
