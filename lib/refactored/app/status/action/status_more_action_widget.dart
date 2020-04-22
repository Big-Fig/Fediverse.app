import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class StatusShareActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);
    return IconButton(
      icon: Icon(Icons.more_vert),
      tooltip: AppLocalizations.of(context).tr("app.status.action.more"),
      onPressed: () {
        showMoreOptions(context, statusBloc);
      },
    );
  }

  showMoreOptions(BuildContext context, IStatusBloc statusBloc) {
    IStatus status = statusBloc.status;
    showModalBottomSheet(
        builder: (BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildTitleSeparator(context),
              buildCopyAction(context, status),
              buildOpenInBrowserAction(context, status),
              buildAccountDescSeparator(context),
              buildAccountNameSeparator(status),
              // public button
              buildAccountFollowAction(context, status),
              // public button
              buildAccountMuteAction(context, status),
              // Unlisted
              buildAccountBlockAction(context, status),
              // Private
              buildAccountReportAction(context, status),
            ],
          );
        },
        context: context);
  }

  Padding buildAccountNameSeparator(IStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Text(
          status.account.acct,
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }

  Padding buildAccountDescSeparator(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Center(
        child: Text(
          AppLocalizations.of(context)
              .tr("app.status.action.popup.more_actions_for"),
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }

  Padding buildTitleSeparator(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Center(
        child: Text(
          AppLocalizations.of(context).tr("app.status.action.popup.title"),
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }

  Padding buildAccountReportAction(BuildContext context, IStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: OutlineButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(AppLocalizations.of(context)
                      .tr("app.status.action.report"))
                ],
              ),
              onPressed: () {
                // todo: progress dialog
                IAccountBloc.of(context, listen: false).report();
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding buildAccountBlockAction(BuildContext context, IStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: OutlineButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // todo: localization toggle
                  Text(AppLocalizations.of(context)
                      .tr("app.status.action.block"))
                ],
              ),
              onPressed: () {
                // todo: progress dialog
                IAccountBloc.of(context, listen: false).toggleBlock();
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding buildAccountMuteAction(BuildContext context, IStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: OutlineButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // todo: localization toggle
                  Text(
                      AppLocalizations.of(context).tr("app.status.action.mute"))
                ],
              ),
              onPressed: () {
                // todo: progress dialog
                IAccountBloc.of(context, listen: false).toggleMute();
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding buildAccountFollowAction(BuildContext context, IStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: OutlineButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // todo: localization toggle
                  Text(AppLocalizations.of(context)
                      .tr("app.status.action.follow"))
                ],
              ),
              onPressed: () {
                // todo: progress dialog
                IAccountBloc.of(context, listen: false).toggleFollow();
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding buildOpenInBrowserAction(BuildContext context, IStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: OutlineButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(AppLocalizations.of(context)
                      .tr("app.status.action.open_in_browser"))
                ],
              ),
              onPressed: () {
                canLaunch(status.uri).then((result) {
                  launch(status.uri);
                });
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding buildCopyAction(BuildContext context, IStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: OutlineButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(AppLocalizations.of(context)
                      .tr("app.status.action.copy_link"))
                ],
              ),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: status.uri));
                Navigator.of(context).pop();
                Fluttertoast.showToast(
                    msg: AppLocalizations.of(context)
                        .tr("app.status.copy_link.toast"),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
