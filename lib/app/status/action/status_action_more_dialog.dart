import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/action/account_action_more_dialog.dart';
import 'package:fedi/app/account/local_account_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/remote_account_bloc_impl.dart';
import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_status_page.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_status_page.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/share/external/external_share_status_page.dart';
import 'package:fedi/app/share/share_chooser_dialog.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/remote_status_thread_page.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void showStatusActionMoreDialog({
  @required BuildContext context,
  @required IStatusBloc statusBloc,
}) {
  showFediModalBottomSheetDialog(
    context: context,
    child: Provider<IStatusBloc>.value(
      value: statusBloc,
      child: Provider.value(
        value: statusBloc.status,
        child: const StatusActionMoreDialogBody(),
      ),
    ),
  );
}

class StatusActionMoreDialogBody extends StatelessWidget {
  const StatusActionMoreDialogBody();

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);
    IStatus status = statusBloc.status;
    var myAccountBloc = IMyAccountBloc.of(context, listen: false);
    var isStatusFromMe = myAccountBloc.checkIsStatusFromMe(status);

    var isLocal = statusBloc.instanceLocation == InstanceLocation.local;

    return ListView(
      shrinkWrap: true,
      children: [
        const _StatusActionMoreDialogBodyStatusActionsWidget(),
        if (!isStatusFromMe) ...[
          const FediUltraLightGreyDivider(
            height: 4,
          ),
          const FediBigVerticalSpacer(),
          DisposableProvider<IAccountBloc>(
            create: (context) {
              var isNeedWatchWebSocketsEvents = false;
              var isNeedRefreshFromNetworkOnInit = false;
              var isNeedWatchLocalRepositoryForUpdates = false;
              var isNeedPreFetchRelationship = true;
              if (isLocal) {
                return LocalAccountBloc.createFromContext(
                  context,
                  account: statusBloc.account,
                  isNeedWatchWebSocketsEvents: isNeedWatchWebSocketsEvents,
                  isNeedRefreshFromNetworkOnInit:
                      isNeedRefreshFromNetworkOnInit,
                  isNeedWatchLocalRepositoryForUpdates:
                      isNeedWatchLocalRepositoryForUpdates,
                  isNeedPreFetchRelationship: isNeedPreFetchRelationship,
                );
              } else {
                return RemoteAccountBloc.createFromContext(
                  context,
                  account: statusBloc.account,
                  isNeedRefreshFromNetworkOnInit:
                      isNeedRefreshFromNetworkOnInit,
                );
              }
            },
            child: const AccountActionMoreDialog(
              cancelable: true,
              showReportAction: true,
            ),
          ),
        ]
      ],
    );
  }

  static DialogAction buildOpenInBrowserAction(BuildContext context) =>
      DialogAction(
          icon: FediIcons.browser,
          label: S.of(context).app_status_action_openInBrowser,
          onAction: (context) async {
            var statusBloc = IStatusBloc.of(context, listen: false);
            var status = statusBloc.status;
            var url = status.url;
            await UrlHelper.handleUrlClick(context, url);
            Navigator.of(context).pop();
          });

  static DialogAction buildAccountOpenOnRemoteInstance(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);

    return DialogAction(
      icon: FediIcons.instance,
      label: S.of(context).app_status_action_openOnRemoteInstance(
          statusBloc.account.acctRemoteDomainOrNull),
      onAction: (context) async {
        await goToRemoteStatusThreadPageBasedOnLocalInstanceRemoteStatus(
          context,
          localInstanceRemoteStatus: statusBloc.status,
          localInstanceRemoteInitialMediaAttachment: null,
        );
      },
    );
  }

  static DialogAction buildCopyAction(BuildContext context) => DialogAction(
        icon: FediIcons.link,
        label: S.of(context).app_status_action_copyLink,
        onAction: (context) async {
          var statusBloc = IStatusBloc.of(context, listen: false);
          var status = statusBloc.status;
          await Clipboard.setData(
            ClipboardData(text: status.uri),
          );
          Navigator.of(context).pop();
          IToastService.of(context, listen: false).showInfoToast(
            context: context,
            title: S.of(context).app_status_copyLink_toast,
            content: null,
          );
        },
      );

  static DialogAction buildDeleteAction(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);
    return DialogAction(
        icon: FediIcons.delete,
        label: S.of(context).app_status_action_delete,
        onAction: (context) async {
          await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
            context: context,
            asyncCode: () => statusBloc.delete(),
          );

          Navigator.of(context).pop();
        });
  }

  static DialogAction buildPinAction(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);

    return DialogAction(
      icon: statusBloc.pinned == true ? FediIcons.pin : FediIcons.unpin,
      label: statusBloc.pinned == true
          ? S.of(context).app_status_action_unpin
          : S.of(context).app_status_action_pin,
      onAction: (context) async {
        await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
            context: context, asyncCode: () => statusBloc.togglePin());

        Navigator.of(context).pop();
      },
    );
  }

  static DialogAction buildMuteConversationAction(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);
    return DialogAction(
      icon: statusBloc.muted == true ? FediIcons.unmute : FediIcons.mute,
      label: statusBloc.muted == true
          ? S.of(context).app_status_action_unmute
          : S.of(context).app_status_action_mute,
      onAction: (context) async {
        await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
            context: context, asyncCode: () => statusBloc.toggleMute());

        Navigator.of(context).pop();
      },
    );
  }

  static DialogAction buildBookmarkAction(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);
    return DialogAction(
      icon: statusBloc.bookmarked == true
          ? FediIcons.bookmark
          : FediIcons.unbookmark,
      label: statusBloc.bookmarked == true
          ? S.of(context).app_status_action_unbookmark
          : S.of(context).app_status_action_bookmark,
      onAction: (context) async {
        await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
            context: context, asyncCode: () => statusBloc.toggleBookmark());

        Navigator.of(context).pop();
      },
    );
  }

  static DialogAction buildShareAction(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);
    var instanceLocation = statusBloc.instanceLocation;
    var status = statusBloc.status;
    return DialogAction(
      icon: FediIcons.share,
      label: S.of(context).app_share_action_share,
      onAction: (context) async {
        showShareChooserDialog(
          context,
          externalShareAction: () {
            Navigator.of(context).pop();
            goToExternalShareStatusPage(
              context: context,
              status: status,
              instanceLocation: instanceLocation,
            );
          },
          conversationsShareAction: () {
            Navigator.of(context).pop();
            goToConversationShareStatusPage(
              context: context,
              status: status,
              instanceLocation: instanceLocation,
            );
          },
          chatsShareAction: () {
            Navigator.of(context).pop();
            goToPleromaChatShareStatusPage(
              context: context,
              status: status,
              instanceLocation: instanceLocation,
            );
          },
        );
      },
    );
  }
}

class _StatusActionMoreDialogBodyStatusActionsWidget extends StatelessWidget {
  const _StatusActionMoreDialogBodyStatusActionsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);
    IStatus status = statusBloc.status;
    var myAccountBloc = IMyAccountBloc.of(context, listen: false);
    var isStatusFromMe = myAccountBloc.checkIsStatusFromMe(status);
    var isLocal = statusBloc.instanceLocation == InstanceLocation.local;
    return FediChooserDialogBody(
        title: S.of(context).app_status_action_popup_title,
        actions: [
          if (isStatusFromMe)
            StatusActionMoreDialogBody.buildDeleteAction(context),
          if (isStatusFromMe)
            StatusActionMoreDialogBody.buildPinAction(context),
          if (isStatusFromMe)
            StatusActionMoreDialogBody.buildMuteConversationAction(context),
          StatusActionMoreDialogBody.buildBookmarkAction(context),
          StatusActionMoreDialogBody.buildCopyAction(context),
          StatusActionMoreDialogBody.buildOpenInBrowserAction(context),
          if (isLocal && statusBloc.account.isAcctRemoteDomainExist)
            StatusActionMoreDialogBody.buildAccountOpenOnRemoteInstance(
                context),
          StatusActionMoreDialogBody.buildShareAction(context),
        ],
        cancelable: false);
  }
}
