import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/conversation/start/status/post_status_start_conversation_page.dart';
import 'package:fedi/app/share/share_service.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StatusShareActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);
    return IconButton(
      color: FediColors.darkGrey,
      iconSize: 20.0,
      icon: Icon(FediIcons.menu),
      tooltip: tr("app.status.action.more"),
      onPressed: () {
        showMoreOptions(context, statusBloc);
      },
    );
  }

  void showMoreOptions(BuildContext context, IStatusBloc statusBloc) {
    IStatus status = statusBloc.status;
    showModalBottomSheet(
        builder: (BuildContext context) {
          return ListView(
            children: <Widget>[
              buildTitleSeparator(context),
              buildCopyAction(context, status),
              buildOpenInBrowserAction(context, status),
              buildShareAction(context, status),
              buildAccountDescSeparator(context),
              buildAccountNameSeparator(status),
              buildAccountFollowAction(context, status),
              buildAccountMessageAction(context, status),
              buildAccountMuteAction(context, status),
              buildAccountBlockAction(context, status),
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
          tr("app.status.action.popup.more_actions_for"),
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
          tr("app.status.action.popup.title"),
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }

  Padding buildAccountReportAction(BuildContext context, IStatus status) =>
      buildButton(tr("app.account.action.report"),
          () async {
        await doAsyncOperationWithDialog(
            context: context,
            asyncCode: () async {
              await IAccountBloc.of(context, listen: false).report();
            });

        Navigator.of(context).pop();
      });

  Padding buildAccountBlockAction(BuildContext context, IStatus status) =>
      buildButton(
          tr(
              status.account.pleromaRelationship?.blocking == true
                  ? "app.account.action.unblock"
                  : "app.account.action.block"), () async {
        await doAsyncOperationWithDialog(
            context: context,
            asyncCode: () async {
              await IAccountBloc.of(context, listen: false).toggleBlock();
            });

        Navigator.of(context).pop();
      });

  Padding buildAccountMuteAction(BuildContext context, IStatus status) =>
      buildButton(
          tr(
              status.account.pleromaRelationship?.muting == true
                  ? "app.account.action.unmute"
                  : "app.account.action.mute"), () async {
        await doAsyncOperationWithDialog(
            context: context,
            asyncCode: () async {
              await IAccountBloc.of(context, listen: false).toggleMute();
            });

        Navigator.of(context).pop();
      });

  Padding buildAccountFollowAction(BuildContext context, IStatus status) =>
      buildButton(
          tr(
              status.account.pleromaRelationship?.following == true
                  ? "app.account.action.unfollow"
                  : "app.account.action.follow"), () async {
        await doAsyncOperationWithDialog(
            context: context,
            asyncCode: () async {
              await IAccountBloc.of(context, listen: false).toggleFollow();
            });

        Navigator.of(context).pop();
      });

  Padding buildOpenInBrowserAction(BuildContext context, IStatus status) =>
      buildButton(
          tr("app.status.action.open_in_browser"),
          () async {
        var url = status.uri;
        await UrlHelper.handleUrlClick(context, url);
        Navigator.of(context).pop();
      });

  Padding buildCopyAction(BuildContext context, IStatus status) => buildButton(
          tr("app.status.action.copy_link"),
          () async {
        await Clipboard.setData(ClipboardData(text: status.uri));
        Navigator.of(context).pop();
        await Fluttertoast.showToast(
            msg: tr("app.status.copy_link.toast"),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      });

  Padding buildShareAction(BuildContext context, IStatus status) =>
      buildButton(tr("app.status.action.share"),
          () async {
        var popupTitle = tr("app.status.share.title");
        var progressMessage =
            tr("app.status.share.progress.content");

        await doAsyncOperationWithDialog(
            context: context,
            contentMessage: progressMessage,
            asyncCode: () async {
              var shareService = IShareService.of(context, listen: false);

              return shareService.shareStatus(
                  context: context, popupTitle: popupTitle, status: status);
            });
      });

  Padding buildAccountMessageAction(BuildContext context, IStatus status) =>
      buildButton(tr("app.account.action.message"),
          () {
        goToPostStatusStartConversationPage(context,
            conversationAccountsWithoutMe: <IAccount>[status.account]);
      });

  Padding buildButton(String title, onPressed()) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: FediPrimaryFilledTextButton(
              title,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }

  const StatusShareActionWidget();
}
