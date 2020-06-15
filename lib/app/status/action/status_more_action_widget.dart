import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/action/account_report_action.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/conversation/start/status/post_status_start_conversation_page.dart';
import 'package:fedi/app/share/share_service.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
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

    var myAccountBloc = IMyAccountBloc.of(context, listen: false);
    var isStatusFromMe = myAccountBloc.checkIsStatusFromMe(status);
    showModalBottomSheet(
        builder: (BuildContext context) {
          return DisposableProvider<IAccountBloc>(
            create: (context) => AccountBloc.createFromContext(
              context,
              account: statusBloc.account,
              isNeedWatchWebSocketsEvents: false,
              isNeedRefreshFromNetworkOnInit: false,
              isNeedWatchLocalRepositoryForUpdates: false,
              isNeedPreFetchRelationship: true,
            ),
            child: Builder(
              builder: (context) => ListView(
                children: <Widget>[
                  buildTitleSeparator(context),
                  buildCopyAction(context, status),
                  buildOpenInBrowserAction(context, status),
                  buildShareAction(context, status),
                  if (!isStatusFromMe) buildAccountActionsWidget(context)
                ],
              ),
            ),
          );
        },
        context: context);
  }

  Padding buildAccountNameSeparator(IAccount account) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Text(
          account.acct,
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

  Padding buildAccountReportAction(
      BuildContext context, IAccountBloc accountBloc) {
    return buildButton(tr("app.account.action.report.label"), () async {
      var success = await doAsyncActionReport(context, accountBloc);

      if (success) {
        Navigator.of(context).pop();
      }
    });
  }

  Padding buildAccountBlockAction(
      BuildContext context, IAccountBloc accountBloc) {
    return buildButton(
        tr(accountBloc.accountRelationship?.blocking == true
            ? "app.account.action.unblock"
            : "app.account.action.block"), () async {
      await doAsyncOperationWithDialog(
          context: context, asyncCode: () async => accountBloc.toggleBlock());

      Navigator.of(context).pop();
    });
  }

  Padding buildAccountMuteAction(
      BuildContext context, IAccountBloc accountBloc) {
    return buildButton(
        tr(accountBloc.accountRelationship?.muting == true
            ? "app.account.action.unmute"
            : "app.account.action.mute"), () async {
      await doAsyncOperationWithDialog(
          context: context, asyncCode: () => accountBloc.toggleMute());

      Navigator.of(context).pop();
    });
  }

  Padding buildAccountFollowAction(
      BuildContext context, IAccountBloc accountBloc) {
    return buildButton(
        tr(accountBloc.accountRelationship?.following == true
            ? "app.account.action.unfollow"
            : "app.account.action.follow"), () async {
      await doAsyncOperationWithDialog(
          context: context, asyncCode: () => accountBloc.toggleFollow());

      Navigator.of(context).pop();
    });
  }

  Padding buildOpenInBrowserAction(BuildContext context, IStatus status) =>
      buildButton(tr("app.status.action.open_in_browser"), () async {
        var url = status.uri;
        await UrlHelper.handleUrlClick(context, url);
        Navigator.of(context).pop();
      });

  Padding buildCopyAction(BuildContext context, IStatus status) =>
      buildButton(tr("app.status.action.copy_link"), () async {
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
      buildButton(tr("app.status.action.share"), () async {
        var popupTitle = tr("app.status.share.title");
        var progressMessage = tr("app.status.share.progress.content");

        await doAsyncOperationWithDialog(
            context: context,
            contentMessage: progressMessage,
            asyncCode: () async {
              var shareService = IShareService.of(context, listen: false);

              return shareService.shareStatus(
                  context: context, popupTitle: popupTitle, status: status);
            });
      });

  Padding buildAccountMessageAction(
          BuildContext context, IAccountBloc accountBloc) =>
      buildButton(tr("app.account.action.message"), () {
        goToPostStatusStartConversationPage(context,
            conversationAccountsWithoutMe: <IAccount>[accountBloc.account]);
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

  Widget buildAccountActionsWidget(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    return Column(
      children: [
        buildAccountDescSeparator(context),
        buildAccountNameSeparator(accountBloc.account),
        StreamBuilder<IPleromaAccountRelationship>(
            stream: accountBloc.accountRelationshipStream,
            builder: (context, snapshot) {
              // hack we should compare relationship field with null
              if (snapshot.data?.following == null) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return Column(
                children: [
                  buildAccountFollowAction(context, accountBloc),
                  buildAccountMessageAction(context, accountBloc),
                  buildAccountMuteAction(context, accountBloc),
                  buildAccountBlockAction(context, accountBloc),
                  buildAccountReportAction(context, accountBloc),
                ],
              );
            }),
      ],
    );
  }
}
