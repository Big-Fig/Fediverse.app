import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/action/account_action_more_dialog.dart';
import 'package:fedi/app/account/local_account_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/remote_account_bloc_impl.dart';
import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_status_page.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_status_page.dart';
import 'package:fedi/app/html/html_text_helper.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/media/attachment/reupload/media_attachment_reupload_service.dart';
import 'package:fedi/app/share/external/external_share_status_page.dart';
import 'package:fedi/app/share/share_chooser_dialog.dart';
import 'package:fedi/app/status/action/delete/status_action_delete_dialog.dart';
import 'package:fedi/app/status/action/mute/status_action_mute_dialog.dart';
import 'package:fedi/app/status/post/new/new_post_status_page.dart';
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
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void showStatusActionMoreDialog({
  required BuildContext context,
  required IStatusBloc statusBloc,
}) {
  showFediModalBottomSheetDialog(
    context: context,
    child: Provider<IStatusBloc>.value(
      value: statusBloc,
      child: Provider<IStatus>.value(
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
    IStatus? status = statusBloc.status;
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
                return RemoteAccountBloc(
                  // todo: remove hack
                  // actually we don't need pleromaAccountService here
                  // should be refactored
                  pleromaAccountService: null,
                  account: statusBloc.account,
                  instanceUri: statusBloc.remoteInstanceUriOrNull,
                  isNeedRefreshFromNetworkOnInit: false,
                  delayInit: false,
                );
              }
            },
            child: const AccountActionMoreDialog(
              cancelable: true,
              showReportAction: true,
            ),
          ),
        ],
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
          var url = status.url!;
          await UrlHelper.handleUrlClick(
            context: context,
            url: url,
          );
          Navigator.of(context).pop();
        },
      );

  static DialogAction buildAccountOpenOnRemoteInstance(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);

    return DialogAction(
      icon: FediIcons.instance,
      label: S.of(context).app_status_action_openOnRemoteInstance(
            statusBloc.account.acctRemoteDomainOrNull!,
          ),
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
        await showStatusActionDeleteDialog(
          context: context,
          statusBloc: statusBloc,
        );

        Navigator.of(context).pop();
      },
    );
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
          context: context,
          asyncCode: () => statusBloc.togglePin(),
        );

        Navigator.of(context).pop();
      },
    );
  }

  static DialogAction buildMuteConversationAction(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);
    var isPleromaInstance = statusBloc.isPleroma;
    return DialogAction(
      icon: statusBloc.muted == true ? FediIcons.unmute : FediIcons.mute,
      label: statusBloc.muted == true
          ? S.of(context).app_status_action_unmute
          : S.of(context).app_status_action_mute,
      onAction: (context) async {
        if (statusBloc.muted == true || isPleromaInstance != true) {
          await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
            context: context,
            asyncCode: () => statusBloc.toggleMute(
              duration: null,
            ),
          );

          Navigator.of(context).pop();
        } else {
          await showStatusActionMuteDialog(
            context: context,
            statusBloc: statusBloc,
          );
          Navigator.of(context).pop();
        }
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
          context: context,
          asyncCode: () => statusBloc.toggleBookmark(),
        );

        Navigator.of(context).pop();
      },
    );
  }

  // todoL refactor
  // ignore: long-method, code-metrics
  static DialogAction buildShareAction(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);
    var instanceLocation = statusBloc.instanceLocation;
    var status = statusBloc.status;
    var parentContext = context;
    return DialogAction(
      icon: FediIcons.share,
      label: S.of(context).app_share_action_share,
      onAction: (context) async {
        showShareChooserDialog(
          context,
          externalShareAction: (context) {
            Navigator.of(context).pop();
            goToExternalShareStatusPage(
              context: context,
              status: status,
              instanceLocation: instanceLocation,
              isShareAsLinkPossible: true,
            );
          },
          conversationsShareAction: (context) {
            Navigator.of(context).pop();
            goToConversationShareStatusPage(
              context: context,
              status: status,
              instanceLocation: instanceLocation,
            );
          },
          chatsShareAction: (context) {
            Navigator.of(context).pop();
            goToPleromaChatShareStatusPage(
              context: context,
              status: status,
              instanceLocation: instanceLocation,
            );
          },
          newStatusShareAction: (context) async {
            Navigator.of(parentContext).pop();

            var originalMediaAttachments = status.mediaAttachments;
            List<IPleromaApiMediaAttachment>? reuploadedMediaAttachments;

            if (originalMediaAttachments?.isNotEmpty == true) {
              var dialogResult = await PleromaAsyncOperationHelper
                  .performPleromaAsyncOperation<
                      List<IPleromaApiMediaAttachment>>(
                context: parentContext,
                asyncCode: () async {
                  var mediaAttachmentReuploadService =
                      IMediaAttachmentReuploadService.of(
                    context,
                    listen: false,
                  );

                  var futures = originalMediaAttachments!.map(
                      (mediaAttachment) => mediaAttachmentReuploadService
                              .reuploadMediaAttachment(
                            originalMediaAttachment: mediaAttachment,
                          ));

                  return Future.wait(futures);
                },
              );

              reuploadedMediaAttachments = dialogResult.result;
            }

            if (originalMediaAttachments?.length ==
                reuploadedMediaAttachments?.length) {
              goToNewPostStatusPageWithInitial(
                parentContext,
                initialText:
                    (status.content?.extractRawStringFromHtmlString() ?? ""),
                initialSubject:
                    status.spoilerText?.extractRawStringFromHtmlString(),
                initialMediaAttachments:
                    reuploadedMediaAttachments?.toPleromaApiMediaAttachments(),
              );
            }
          },
        );
      },
    );
  }
}

class _StatusActionMoreDialogBodyStatusActionsWidget extends StatelessWidget {
  const _StatusActionMoreDialogBodyStatusActionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);
    IStatus? status = statusBloc.status;
    var myAccountBloc = IMyAccountBloc.of(context, listen: false);
    var isStatusFromMe = myAccountBloc.checkIsStatusFromMe(status);
    var isLocal = statusBloc.instanceLocation == InstanceLocation.local;
    return FediChooserDialogBody(
      title: S.of(context).app_status_action_popup_title,
      actions: [
        if (isLocal && isStatusFromMe)
          StatusActionMoreDialogBody.buildDeleteAction(context),
        if (isLocal && isStatusFromMe)
          StatusActionMoreDialogBody.buildPinAction(context),
        if (isLocal && isStatusFromMe)
          StatusActionMoreDialogBody.buildMuteConversationAction(context),
        if (isLocal) StatusActionMoreDialogBody.buildBookmarkAction(context),
        StatusActionMoreDialogBody.buildCopyAction(context),
        StatusActionMoreDialogBody.buildOpenInBrowserAction(context),
        if (isLocal && statusBloc.account.isAcctRemoteDomainExist)
          StatusActionMoreDialogBody.buildAccountOpenOnRemoteInstance(
            context,
          ),
        StatusActionMoreDialogBody.buildShareAction(context),
      ],
      cancelable: false,
    );
  }
}
