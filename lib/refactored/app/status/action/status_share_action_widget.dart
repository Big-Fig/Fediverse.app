import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/status/action/status_favourite_action_widget.dart';
import 'package:fedi/refactored/app/status/action/status_reblog_action_widget.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/status/thread/status_thread_page.dart';
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
      //      icon: Image(
//        height: 20,
//        width: 20,
//        color: Colors.black,
//        image: AssetImage("assets/images/share.png"),
//      ),
      icon: Icon(Icons.more_vert),
      tooltip:
      AppLocalizations.of(context).tr("timeline.status.cell.tooltip.more"),
      onPressed: () {
        showMoreOptions(context, statusBloc);
      },
    );
  }

  showMoreOptions(BuildContext context, IStatusBloc statusBloc) {
    IStatus status = statusBloc.status;
//    = statusBloc.;
//    if (widget.status.reblog != null) {
//      status = widget.status.reblog;
//    }

    showModalBottomSheet(
        builder: (BuildContext context) {
          return Container(
            child: Column(
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
                Container(
                  height: 30,
                ),
                // Cancel
                buildCancelAction(context),
              ],
            ),
          );
        },
        context: context);
  }

  Padding buildAccountNameSeparator(IStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Text(
          "${status.account.acct}",
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
              .tr("timeline.status.cell.status_actions.more_actions_for"),
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
          AppLocalizations.of(context)
              .tr("timeline.status.cell.status_actions.title"),
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }

  Padding buildCancelAction(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: OutlineButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)
                        .tr("timeline.status.cell.status_actions.action"
                        ".cancel"),
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
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
                      .tr("timeline.status.cell.status_actions.action"
                      ".report"))
                ],
              ),
              onPressed: () {
//                          var params = {"account_id": status.account.id};
//                          CurrentInstance.instance.currentClient
//                              .run(
//                              path: Accounts.reportAccount(),
//                              params: params,
//                              method: HTTPMethod.POST)
//                              .then((response) {
//                            print(response.body);
//                          }).catchError((error) {
//                            print(error);
//                          });
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
                  Text(AppLocalizations.of(context)
                      .tr("timeline.status.cell.status_actions.action"
                      ".block"))
                ],
              ),
              onPressed: () {
//                          CurrentInstance.instance.currentClient
//                              .run(
//                              path: Accounts.blockAccount(
//                                  status.account.id),
//                              method: HTTPMethod.POST)
//                              .then((response) {
//                            print(response.body);
//                          }).catchError((error) {
//                            print(error);
//                          });
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
                  Text(AppLocalizations.of(context)
                      .tr("timeline.status.cell.status_actions.action"
                      ".mute"))
                ],
              ),
              onPressed: () {
//                          CurrentInstance.instance.currentClient
//                              .run(
//                              path:
//                              Accounts.muteAccount(status.account.id),
//                              method: HTTPMethod.POST)
//                              .then((response) {
//                            print(response.body);
//                          }).catchError((error) {
//                            print(error);
//                          });
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
                  Text(AppLocalizations.of(context)
                      .tr("timeline.status.cell.status_actions.action.follow"))
                ],
              ),
              onPressed: () {
//                          CurrentInstance.instance.currentClient
//                              .run(
//                              path:
//                              Accounts.account(id: status.account.id),
//                              method: HTTPMethod.GET)
//                              .then((response) {
//                            Account account =
//                            Account.fromJsonString(response.body);
//                            CurrentInstance.instance.currentClient
//                                .run(
//                                path: Accounts.followAccount(account.id),
//                                method: HTTPMethod.POST)
//                                .then((response) {
//                              print("following response");
//                              print("following ${response.statusCode}");
//                              print(response.body);
//                            }).catchError((error) {
//                              print(error);
//                            });
//                          }).catchError((error) {
//                            print(error);
//                          });

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
                      .tr("timeline.status.cell.status_actions.action"
                      ".open_in_browser"))
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
                  Text(
                    AppLocalizations.of(context)
                        .tr("timeline.status.cell.status_actions.action"
                        ".copy_status_link"),
                  )
                ],
              ),
              onPressed: () {
                print(status.uri);
                Clipboard.setData(ClipboardData(text: status.uri));
                Navigator.of(context).pop();
                Fluttertoast.showToast(
                    msg: AppLocalizations.of(context)
                        .tr("timeline.status.cell.status_actions.toast"
                        ".copied"),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
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
