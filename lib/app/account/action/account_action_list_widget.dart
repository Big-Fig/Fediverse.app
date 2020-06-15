import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/action/account_report_action.dart';
import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/conversation/start/status/post_status_start_conversation_page.dart';
import 'package:fedi/app/ui/button/text/fedi_grey_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_alert/flutter_alert.dart';
import 'package:logging/logging.dart';

var _logger = Logger("account_actions_widget.dart");

class AccountActionListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    return StreamBuilder<IPleromaAccountRelationship>(
        stream: accountBloc.accountRelationshipStream,
        initialData: accountBloc.accountRelationship,
        builder: (context, snapshot) {
          var relationship = snapshot.data;

          _logger.finest(() => "relationship $relationship");

          if (relationship?.following == null) {
            return const Center(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                backgroundColor: FediColors.white,
              ),
            ));
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildFollowButton(accountBloc, relationship),
                  buildMessageButton(context, accountBloc),
                  buildMoreButton(context, accountBloc, relationship),
                ],
              ),
            );
          }
        });
  }

  Widget buildMoreButton(BuildContext context, IAccountBloc accountBloc,
      IPleromaAccountRelationship relationship) {
    return FediGreyFilledTextButton(
      tr("app.account.action.more"),
      onPressed: () async {
        showMoreOptions(context, accountBloc, relationship);
      },
      textColor: FediColors.darkGrey,
    );
  }

  Widget buildMessageButton(BuildContext context, IAccountBloc accountBloc) {
    return FediGreyFilledTextButton(
      tr("app.account.action.message"),
      onPressed: () async {
        goToPostStatusStartConversationPage(context,
            conversationAccountsWithoutMe: <IAccount>[accountBloc.account]);
      },
      textColor: FediColors.darkGrey,
    );
  }

  AsyncOperationButtonBuilderWidget buildFollowButton(
      IAccountBloc accountBloc, IPleromaAccountRelationship relationship) {
    return PleromaAsyncOperationButtonBuilderWidget(
      showProgressDialog: false,
      asyncButtonAction: accountBloc.toggleFollow,
      builder: (BuildContext context, VoidCallback onPressed) {
        return FediGreyFilledTextButton(
          relationship?.following == true
              ? tr("app.account.action.unfollow")
              : tr("app.account.action.follow"),
          onPressed: onPressed,
          textColor: FediColors.darkGrey,
        );
      },
    );
  }

  void showMoreOptions(BuildContext context, IAccountBloc accountBloc,
      IPleromaAccountRelationship relationship) {
    showAlert(
      context: context,
      title: tr("app.account.action.popup.title", args: [accountBloc.acct]),
      body: "${accountBloc.acct}",
      actions: [
        AlertAction(
            text: relationship.muting
                ? tr("app.account.action.unmute")
                : tr("app.account.action.mute"),
            onPressed: accountBloc.toggleMute),
        AlertAction(
            text: relationship.blocking
                ? tr("app.account.action.unblock")
                : tr("app.account.action.block"),
            onPressed: accountBloc.toggleBlock),
        AlertAction(
            text: tr("app.account.action.report.label"),
            onPressed: () async {
              var success = await doAsyncActionReport(
                  context, IAccountBloc.of(context, listen: false));

              if (success) {
                Navigator.of(context).pop();
              }
            }),
      ],
      cancelable: true,
    );
  }

  const AccountActionListWidget();
}
