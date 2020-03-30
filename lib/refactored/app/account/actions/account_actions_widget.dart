import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/async/async_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_alert/flutter_alert.dart';
import 'package:logging/logging.dart';

var _logger = Logger("account_actions_widget.dart");

class AccountActionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    assert(!accountBloc.isMyAccount);
    return StreamBuilder<IPleromaAccountRelationship>(
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
                  AsyncButtonWidget(
                    asyncButtonAction: accountBloc.requestToggleFollow,
                    builder: (BuildContext context, VoidCallback onPressed) {
                      return OutlineButton(
                        child: Row(
                          children: <Widget>[
                            Text(relationship.following
                                ? AppLocalizations.of(context)
                                .tr("profile.header.action.unfollow")
                                : AppLocalizations.of(context)
                                .tr("profile.header.action.follow")),
                          ],
                        ),
                        onPressed: onPressed,
                      );
                    },
                  ),
                  OutlineButton(
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context)
                            .tr("profile.header.action.message"))
                      ],
                    ),
                    onPressed: () {
//                  Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => ChatPage(
//                          account: widget.profileAccount,
//                        ),
//                      ));
                    },
                  ),
                  OutlineButton(
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context)
                            .tr("profile.header.action.more")),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    onPressed: () {
                      showMoreOptions(context, accountBloc, relationship);
                    },
                  ),
                ],
              ),
            );
          }


        });
  }

  showMoreOptions(BuildContext context, IAccountBloc accountBloc,
      IPleromaAccountRelationship relationship) {
    showAlert(
      context: context,
      title: "More actions for:",
      body: "${accountBloc.acct}",
      actions: [
        AlertAction(
            text: relationship.muting
                ? AppLocalizations.of(context)
                    .tr("profile.header.action.unmute")
                : AppLocalizations.of(context).tr("profile.header.action.mute"),
            onPressed: accountBloc.requestToggleMute),
        AlertAction(
            text: relationship.blocking
                ? AppLocalizations.of(context)
                    .tr("profile.header.action.unblock")
                : AppLocalizations.of(context)
                    .tr("profile.header.action.block"),
            onPressed: accountBloc.requestToggleBlock),
        AlertAction(
            text: AppLocalizations.of(context)
                .tr("profile.header.report.alert.title"),
            onPressed: accountBloc.requestReport),
      ],
      cancelable: true,
    );
  }
}
