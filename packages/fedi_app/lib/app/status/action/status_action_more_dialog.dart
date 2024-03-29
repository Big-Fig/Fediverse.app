import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/action/account_action_more_dialog.dart';
import 'package:fedi_app/app/account/local_account_bloc_impl.dart';
import 'package:fedi_app/app/account/my/my_account_bloc.dart';
import 'package:fedi_app/app/account/remote_account_bloc_impl.dart';
import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/chat/conversation/share/conversation_chat_share_entity_page.dart';
import 'package:fedi_app/app/chat/unifedi/share/unifedi_chat_share_entity_page.dart';
import 'package:fedi_app/app/html/html_text_helper.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/media/attachment/reupload/media_attachment_reupload_service.dart';
import 'package:fedi_app/app/share/entity/share_entity_model.dart';
import 'package:fedi_app/app/share/external/external_share_entity_page.dart';
import 'package:fedi_app/app/share/share_chooser_dialog.dart';
import 'package:fedi_app/app/status/action/delete/status_action_delete_dialog.dart';
import 'package:fedi_app/app/status/action/mute/status_action_mute_dialog.dart';
import 'package:fedi_app/app/status/post/new/new_post_status_page.dart';
import 'package:fedi_app/app/status/status_bloc.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/status/thread/remote_status_thread_page.dart';
import 'package:fedi_app/app/toast/toast_service.dart';
import 'package:fedi_app/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi_app/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi_app/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi_app/app/url/url_helper.dart';
import 'package:fedi_app/dialog/dialog_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

Future<void> showStatusActionMoreDialog({
  required BuildContext context,
  required IStatusBloc statusBloc,
}) =>
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

class StatusActionMoreDialogBody extends StatelessWidget {
  const StatusActionMoreDialogBody({Key? key}) : super(key: key);

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
                  // actually we dont need unifediApiAccountService here
                  // should be refactored
                  unifediApiAccountService: null,
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
        await showStatusActionDeleteDialog<void>(
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
      icon: statusBloc.pinned ? FediIcons.pin : FediIcons.unpin,
      label: statusBloc.pinned
          ? S.of(context).app_status_action_unpin
          : S.of(context).app_status_action_pin,
      onAction: (context) async {
        // ignore: avoid-ignoring-return-values
        await UnifediAsyncOperationHelper.performUnifediAsyncOperation(
          context: context,
          asyncCode: () => statusBloc.togglePin(),
        );

        Navigator.of(context).pop();
      },
    );
  }

  static DialogAction buildMuteConversationAction(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);

    var unifediApiStatusService = Provider.of<IUnifediApiStatusService>(
      context,
      listen: false,
    );

    var muteExpiresInSupported = unifediApiStatusService.isFeatureSupported(
      unifediApiStatusService.muteStatusExpiresInFeature,
    );

    return DialogAction(
      icon: statusBloc.muted ? FediIcons.unmute : FediIcons.mute,
      label: statusBloc.muted
          ? S.of(context).app_status_action_unmute
          : S.of(context).app_status_action_mute,
      onAction: (context) async {
        if (statusBloc.muted || !muteExpiresInSupported) {
          // ignore: avoid-ignoring-return-values
          await UnifediAsyncOperationHelper.performUnifediAsyncOperation(
            context: context,
            asyncCode: () => statusBloc.toggleMute(
              duration: null,
            ),
          );

          Navigator.of(context).pop();
        } else {
          await showStatusActionMuteDialog<void>(
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
        // ignore: avoid-ignoring-return-values
        await UnifediAsyncOperationHelper.performUnifediAsyncOperation(
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
        await showShareChooserDialog(
          context,
          externalShareAction: (context) {
            Navigator.of(context).pop();
            goToExternalShareEntityPage(
              context: context,
              shareEntity: _mapStatusToShareEntity(status),
              instanceLocation: instanceLocation,
            );
          },
          conversationsShareAction: (context) {
            Navigator.of(context).pop();
            goToConversationChatShareEntityPage(
              context: context,
              shareEntity: _mapStatusToShareEntity(status),
              instanceLocation: instanceLocation,
            );
          },
          chatsShareAction: (context) {
            Navigator.of(context).pop();
            goToUnifediChatShareEntityPage(
              context: context,
              shareEntity: _mapStatusToShareEntity(status),
              instanceLocation: instanceLocation,
            );
          },
          newStatusShareAction: (context) async {
            Navigator.of(parentContext).pop();

            var originalMediaAttachments = status.mediaAttachments;
            List<IUnifediApiMediaAttachment>? reuploadedMediaAttachments;

            if (originalMediaAttachments?.isNotEmpty == true) {
              var dialogResult = await UnifediAsyncOperationHelper
                  .performUnifediAsyncOperation<
                      List<IUnifediApiMediaAttachment>>(
                context: parentContext,
                asyncCode: () async {
                  var mediaAttachmentReuploadService =
                      IMediaAttachmentReuploadService.of(
                    context,
                    listen: false,
                  );

                  var futures = originalMediaAttachments!.map(
                    (mediaAttachment) =>
                        mediaAttachmentReuploadService.reuploadMediaAttachment(
                      originalMediaAttachment: mediaAttachment,
                    ),
                  );

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
                    status.content?.extractRawStringFromHtmlString() ?? '',
                initialSubject:
                    status.spoilerText?.extractRawStringFromHtmlString(),
                initialMediaAttachments: reuploadedMediaAttachments
                    ?.toUnifediApiMediaAttachmentList(),
              );
            }
          },
        );
      },
    );
  }
}

ShareEntity _mapStatusToShareEntity(IStatus status) {
  var spoiler = status.spoilerText?.isNotEmpty == true
      ? status.spoilerText?.extractRawStringFromHtmlString()
      : null;
  var content = status.content?.isNotEmpty == true
      ? status.content?.extractRawStringFromHtmlString()
      : null;

  String? text;
  var spoilerExist = spoiler?.isNotEmpty == true;
  var contentExist = content?.isNotEmpty == true;
  if (spoilerExist && contentExist) {
    text = '$spoiler\n$content';
  } else if (contentExist) {
    text = content;
  } else if (spoilerExist) {
    text = spoiler;
  }

  // todo: think about replies and reblogs
  var shareEntityItem = ShareEntityItem(
    createdAt: status.createdAt,
    fromAccount: status.account,
    text: text,
    linkToOriginal: status.url,
    mediaAttachments: status.mediaAttachments,
    mediaLocalFiles: null,
    isNeedReUploadMediaAttachments: true,
  );

  return ShareEntity(
    items: [shareEntityItem],
  );
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

    var currentUnifediApiAccessBloc = ICurrentAccessBloc.of(context);
    var currentInstance = currentUnifediApiAccessBloc.currentInstance;

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
        if (currentInstance != null)
          StatusActionMoreDialogBody.buildShareAction(context),
      ],
      cancelable: false,
    );
  }
}
