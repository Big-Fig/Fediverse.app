import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/action/account_report_action.dart';
import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/conversation/start/status/post_status_start_conversation_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/button/text/fedi_transparent_text_button.dart';
import 'package:fedi/app/ui/dialog/fedi_alert_dialog.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

          var topPadding = 12.0;
          var bottomPadding = 16.0;
          if (relationship?.following == null) {
            return Container(
              height: FediSizes.defaultFilledButtonHeight +
                  topPadding +
                  bottomPadding,
              child: const Center(
                child: CircularProgressIndicator(
                  backgroundColor: FediColors.white,
                ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildFollowButton(accountBloc, relationship),
                  SizedBox(width: 16),
                  buildMessageButton(context, accountBloc),
                  SizedBox(width: 16),
                  buildMoreButton(context, accountBloc, relationship),
                ],
              ),
            );
          }
        });
  }

  Widget buildMoreButton(BuildContext context, IAccountBloc accountBloc,
      IPleromaAccountRelationship relationship) {
    return FediIconInCircleBlurredButton(
      FediIcons.menu,
      onPressed: () async {
        showMoreOptions(context, accountBloc, relationship);
      },
    );
  }

  Widget buildMessageButton(BuildContext context, IAccountBloc accountBloc) {
    return FediTransparentTextButton(
      tr("app.account.action.message"),
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
        return FediTransparentTextButton(
          relationship?.following == true
              ? tr("app.account.action.unfollow")
              : tr("app.account.action.follow"),
          onPressed: onPressed,
        );
      },
    );
  }

  void showMoreOptions(BuildContext context, IAccountBloc accountBloc,
      IPleromaAccountRelationship relationship) {
    showFediAlertDialog(
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
