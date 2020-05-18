import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/refactored/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/refactored/app/conversation/start/status/post_status_start_conversation_page.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
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

          if (relationship == null) {
            return const Center(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
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

  OutlineButton buildMoreButton(BuildContext context, IAccountBloc accountBloc,
      IPleromaAccountRelationship relationship) {
    return OutlineButton(
      child: Row(
        children: <Widget>[
          Text(AppLocalizations.of(context).tr("app.account.action.more")),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey,
          )
        ],
      ),
      onPressed: () {
        showMoreOptions(context, accountBloc, relationship);
      },
    );
  }

  OutlineButton buildMessageButton(
      BuildContext context, IAccountBloc accountBloc) {
    return OutlineButton(
      child: Row(
        children: <Widget>[
          Text(AppLocalizations.of(context).tr("app.account.action.message"))
        ],
      ),
      onPressed: () async {
        goToPostStatusStartConversationPage(context,
            conversationAccountsWithoutMe: <IAccount>[accountBloc.account]);
      },
    );
  }

  AsyncOperationButtonBuilderWidget buildFollowButton(
      IAccountBloc accountBloc, IPleromaAccountRelationship relationship) {
    return PleromaAsyncOperationButtonBuilderWidget(
      showProgressDialog: false,
      asyncButtonAction: accountBloc.toggleFollow,
      builder: (BuildContext context, VoidCallback onPressed) {
        return OutlineButton(
          child: Row(
            children: <Widget>[
              Text(relationship?.following == true
                  ? AppLocalizations.of(context)
                      .tr("app.account.action.unfollow")
                  : AppLocalizations.of(context)
                      .tr("app.account.action.follow")),
            ],
          ),
          onPressed: onPressed,
        );
      },
    );
  }

  void showMoreOptions(BuildContext context, IAccountBloc accountBloc,
      IPleromaAccountRelationship relationship) {
    var appLocalizations = AppLocalizations.of(context);
    showAlert(
      context: context,
      title: appLocalizations
          .tr("app.account.action.popup.title", args: [accountBloc.acct]),
      body: "${accountBloc.acct}",
      actions: [
        AlertAction(
            text: relationship.muting
                ? appLocalizations.tr("app.account.action.unmute")
                : appLocalizations.tr("app.account.action.mute"),
            onPressed: accountBloc.toggleMute),
        AlertAction(
            text: relationship.blocking
                ? appLocalizations.tr("app.account.action.unblock")
                : appLocalizations.tr("app.account.action.block"),
            onPressed: accountBloc.toggleBlock),
        AlertAction(
            text: appLocalizations.tr("app.account.action.report"),
            onPressed: accountBloc.report),
      ],
      cancelable: true,
    );
  }

  const AccountActionListWidget();
}
