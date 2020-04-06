import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/async/async_button_widget.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_alert/flutter_alert.dart';
import 'package:logging/logging.dart';

var _logger = Logger("account_actions_widget.dart");

class AccountActionListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    assert(!accountBloc.isMyAccount);
    return InitialDataStreamBuilder<IPleromaAccountRelationship>(
        stream: accountBloc.accountRelationshipStream,
        initialData: accountBloc.accountRelationship,
        builder: (context, snapshot) {
          var relationship = snapshot.data;

          _logger.finest(() => "relationship $relationship");

          if (relationship == null) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                  buildMessageButton(context),
                  buildMoreButton(context, accountBloc, relationship),
                ],
              ),
            );
          }


        });
  }

  OutlineButton buildMoreButton(BuildContext context, IAccountBloc accountBloc, IPleromaAccountRelationship relationship) {
    return OutlineButton(
                  child: Row(
                    children: <Widget>[
                      Text(AppLocalizations.of(context)
                          .tr("app.account.action.more")),
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

  OutlineButton buildMessageButton(BuildContext context) {
    return OutlineButton(
                  child: Row(
                    children: <Widget>[
                      Text(AppLocalizations.of(context)
                          .tr("app.account.action.message"))
                    ],
                  ),
                  onPressed: () {
                    // todo: go to conversation
//                  Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => ChatPage(
//                          account: widget.profileAccount,
//                        ),
//                      ));
                  },
                );
  }

  AsyncButtonWidget buildFollowButton(IAccountBloc accountBloc, IPleromaAccountRelationship relationship) {
    return AsyncButtonWidget(
                  asyncButtonAction: accountBloc.requestToggleFollow,
                  builder: (BuildContext context, VoidCallback onPressed) {
                    return OutlineButton(
                      child: Row(
                        children: <Widget>[
                          Text(relationship.following
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

  showMoreOptions(BuildContext context, IAccountBloc accountBloc,
      IPleromaAccountRelationship relationship) {
    var appLocalizations = AppLocalizations.of(context);
    showAlert(
      context: context,
      title: appLocalizations.tr("app.account.action.popup.title", args:
          [accountBloc.acct]),
      body: "${accountBloc.acct}",
      actions: [
        AlertAction(
            text: relationship.muting
                ? appLocalizations
                    .tr("app.account.action.unmute")
                : appLocalizations.tr("app.account.action.mute"),
            onPressed: accountBloc.requestToggleMute),
        AlertAction(
            text: relationship.blocking
                ? appLocalizations
                    .tr("app.account.action.unblock")
                : appLocalizations
                    .tr("app.account.action.block"),
            onPressed: accountBloc.requestToggleBlock),
        AlertAction(
            text: appLocalizations
                .tr("app.account.action.report"),
            onPressed: accountBloc.requestReport),
      ],
      cancelable: true,
    );
  }
}
