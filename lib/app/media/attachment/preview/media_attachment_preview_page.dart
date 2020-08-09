import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/share/chat_share_media_page.dart';
import 'package:fedi/app/conversation/share/conversation_share_media_page.dart';
import 'package:fedi/app/media/attachment/add_to_gallery/media_attachment_add_to_gallery_exception.dart';
import 'package:fedi/app/media/attachment/add_to_gallery/media_attachment_add_to_gallery_helper.dart';
import 'package:fedi/app/media/player/media_video_player_widget.dart';
import 'package:fedi/app/share/external/external_share_media_bloc_impl.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MediaAttachmentPreviewPage extends StatelessWidget {
  final IPleromaMediaAttachment mediaAttachment;

  const MediaAttachmentPreviewPage({@required this.mediaAttachment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: tr("app.media.attachment.preview.title"),
        actions: <Widget>[
          buildAddToGalleryAction(context),
          buildShareAction(context)
        ],
      ),
      body: buildBody(context),
    );
  }

  Widget buildShareAction(BuildContext context) {
    var currentAuthInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);
    return FediIconButton(
        icon: Icon(
          FediIcons.share,
          color: FediColors.darkGrey,
          size: FediSizes.appBarIconSize,
        ),
        onPressed: () {
          showFediChooserDialog(
              context: context,
              title: "app.media.attachment.share.title".tr(),
              actions: [
                buildExternalShareDialogAction(context),
                DialogAction(
                  icon: FediIcons.share,
                  label:
                      "app.media.attachment.share.action.share_to_conversations"
                          .tr(),
                  onAction: () {
                    goToConversationShareMediaPage(
                        context: context, mediaAttachment: mediaAttachment);
                  },
                ),
                if (currentAuthInstanceBloc.currentInstance.isSupportChats)
                  DialogAction(
                    icon: FediIcons.share,
                    label:
                        "app.media.attachment.share.action.share_to_chats".tr(),
                    onAction: () {
                      goToChatShareMediaPage(
                          context: context, mediaAttachment: mediaAttachment);
                    },
                  ),
              ]);
        });
  }

  DialogAction buildExternalShareDialogAction(BuildContext context) =>
      DialogAction(
          icon: FediIcons.share,
          label: "app.media.attachment.share.action.share_as_media".tr(),
          onAction: () {
            PleromaAsyncOperationHelper.performPleromaAsyncOperation(
              asyncCode: () async {
                var externalShareMediaBloc = ExternalShareMediaBloc(
                  popupTitle: tr("app.media.attachment.share.title"),
                  mediaAttachment: mediaAttachment,
                );

                try {
                  await externalShareMediaBloc.share();
                } finally {
                  externalShareMediaBloc.dispose();
                }
              },
              context: context,
              contentMessage: tr("app.media.attachment.share.progress.content"),
              showProgressDialog: true,
            );
          });

  Widget buildAddToGalleryAction(BuildContext context) {
    return PleromaAsyncOperationButtonBuilderWidget(
      progressContentMessage:
          tr("app.media.attachment.add_to_gallery.progress.content"),
      builder: (BuildContext context, VoidCallback onPressed) => FediIconButton(
          icon: Icon(
            Icons.file_download,
            color: FediColors.darkGrey,
            size: FediSizes.appBarIconSize,
          ),
          onPressed: onPressed),
      successToastMessage: tr("app.media.attachment.add_to_gallery.success"
          ".toast"),
      asyncButtonAction: () async {
        var saved = await addMediaAttachmentToGallery(
            context: context, mediaAttachment: mediaAttachment);

        if (!saved) {
          throw MediaAttachmentCantAddToGalleryException(mediaAttachment);
        }
      },
      errorAlertDialogBuilders: [
        (BuildContext context, dynamic error, StackTrace stackTrace) {
          return ErrorData(
            error: error,
            stackTrace: stackTrace,
            titleText: tr("app.media.attachment.add_to_gallery.error.dialog"
                ".title"),
            contentText: tr("app.media.attachment.add_to_gallery.error.dialog"
                ".content"),
          );
        }
      ],
    );
  }

  Widget buildBody(BuildContext context) {
    switch (mediaAttachment.typeMastodon) {
      case MastodonMediaAttachmentType.image:
      case MastodonMediaAttachmentType.gifv:
        return CachedNetworkImage(
          imageBuilder: (context, imageProvider) {
            return Container(
              child: PhotoView(
                imageProvider: imageProvider,
              ),
            );
          },
          placeholder: (context, url) => buildPreview(),
          errorWidget: (context, url, error) => buildPreview(),
          imageUrl: mediaAttachment.url,
        );
        break;
      case MastodonMediaAttachmentType.video:
        return MediaVideoPlayerWidget.network(networkUrl: mediaAttachment.url);
        break;
      case MastodonMediaAttachmentType.audio:
        // TODO: use special UI for audio
        return MediaVideoPlayerWidget.network(networkUrl: mediaAttachment.url);
        break;
      case MastodonMediaAttachmentType.unknown:
      default:
        return Center(
            child: Text(tr("app.media.attachment.preview.not_supported_type",
                args: [mediaAttachment.type])));
        break;
    }
  }

  Widget buildPreview() => CachedNetworkImage(
        imageUrl: mediaAttachment.url,
        imageBuilder: (context, imageProvider) {
          return Container(
            child: PhotoView(
              imageProvider: imageProvider,
            ),
          );
        },
        placeholder: (context, url) =>
            Center(child: FediCircularProgressIndicator()),
        errorWidget: (context, url, error) => Center(
          child: Icon(
            FediIcons.failed,
          ),
        ),
      );
}

void goToMediaAttachmentPreviewPage(BuildContext context,
    {@required IPleromaMediaAttachment mediaAttachment}) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) =>
            MediaAttachmentPreviewPage(mediaAttachment: mediaAttachment)),
  );
}
