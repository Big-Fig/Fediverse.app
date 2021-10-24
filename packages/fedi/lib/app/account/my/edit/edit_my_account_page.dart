import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_bloc_impl.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_widget.dart';
import 'package:fedi/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_confirm_alert_dialog.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_app_bar_text_action_widget.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/material.dart';

class EditMyAccountPage extends StatelessWidget {
  const EditMyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editMyAccountBloc = IEditMyAccountBloc.of(context);

    return WillPopScope(
      // override back button
      onWillPop: () async {
        handleBackPressed(context, editMyAccountBloc);

        return true;
      },
      child: Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_account_my_edit_title,
          leading: FediBackIconButton(
            customOnPressed: () {
              handleBackPressed(context, editMyAccountBloc);
            },
          ),
          actions: const <Widget>[
            _EditMyAccountPageAppBarSaveAction(),
          ],
        ),
        body: const SafeArea(child: EditMyAccountWidget()),
      ),
    );
  }

  void handleBackPressed(
    BuildContext context,
    IEditMyAccountBloc editMyAccountBloc,
  ) {
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
      okActionLabel:
          S.of(context).app_account_my_edit_unsaved_dialog_action_discard,
      onAction: (context) {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    ).show<void>(context);
  }
}

class _EditMyAccountPageAppBarSaveAction extends StatelessWidget {
  const _EditMyAccountPageAppBarSaveAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editMyAccountBloc = IEditMyAccountBloc.of(context);

    return StreamBuilder<bool>(
      stream: editMyAccountBloc.isHaveChangesAndNoErrorsStream,
      initialData: editMyAccountBloc.isHaveChangesAndNoErrors,
      builder: (context, snapshot) {
        var isReadyToSubmit = snapshot.data;

        return UnifediAsyncOperationButtonBuilderWidget(
          showProgressDialog: true,
          progressContentMessage:
              S.of(context).app_status_post_dialog_async_content,
          asyncButtonAction: () async {
            await editMyAccountBloc.submitChanges();
            Navigator.pop(context);
          },
          errorAlertDialogBuilders: const [
            // todo: handle specific cases by error code
//                          (context, error) => SimpleAlertDialog(
//                          title: of(context)
//                              .tr('app.status.post.dialog.error.title'),
//                          content: tr(
//                              'app.status.post.dialog.error.content',
//                              args: [error.toString()]),
//                          context: context)
          ],
          builder: (BuildContext context, onPressed) =>
              FediPageAppBarTextActionWidget(
            text: S.of(context).app_account_my_edit_action_save,
            onPressed: isReadyToSubmit! ? onPressed : null,
          ),
        );
      },
    );
  }
}

void goToEditMyAccountPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => DisposableProvider<IEditMyAccountBloc>(
        create: EditMyAccountBloc.createFromContext,
        child: const EditMyAccountPage(),
      ),
    ),
  );
}
