import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/chat/share/chat_share_media_page.dart';
import 'package:fedi/app/conversation/share/conversation_share_media_page.dart';
import 'package:fedi/app/media/attachment/add_to_gallery/media_attachment_add_to_gallery_exception.dart';
import 'package:fedi/app/media/attachment/add_to_gallery/media_attachment_add_to_gallery_helper.dart';
import 'package:fedi/app/media/player/media_video_player_widget.dart';
import 'package:fedi/app/share/external/external_share_media_page.dart';
import 'package:fedi/app/share/share_chooser_dialog.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/indicator/fedi_indicator_widget.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:rxdart/rxdart.dart';

class MediaAttachmentDetailsPage extends StatefulWidget {
  final List<IPleromaMediaAttachment> mediaAttachments;
  final IPleromaMediaAttachment initialMediaAttachment;
  int get initialIndex => mediaAttachments.indexOf(initialMediaAttachment);

  MediaAttachmentDetailsPage.multi({
    @required this.mediaAttachments,
    @required this.initialMediaAttachment,
  });

  MediaAttachmentDetailsPage.single(
      {@required IPleromaMediaAttachment mediaAttachment})
      : this.multi(
            mediaAttachments: [mediaAttachment],
            initialMediaAttachment: mediaAttachment);

  @override
  _MediaAttachmentDetailsPageState createState() =>
      _MediaAttachmentDetailsPageState(initialMediaAttachment, initialIndex);
}

class _MediaAttachmentDetailsPageState
    extends State<MediaAttachmentDetailsPage> {
  IPleromaMediaAttachment get mediaAttachment =>
      selectedMediaAttachmentSubject.value;

  final PageController _controller;

  BehaviorSubject<IPleromaMediaAttachment> selectedMediaAttachmentSubject;
  Stream<IPleromaMediaAttachment> get selectedMediaAttachmentStream =>
      selectedMediaAttachmentSubject.stream;

  IPleromaMediaAttachment get selectedMediaAttachment =>
      selectedMediaAttachmentSubject.value;
  VoidCallback listener;

  _MediaAttachmentDetailsPageState(
      IPleromaMediaAttachment initialMediaAttachment, int initialIndex)
      : _controller = PageController(
          initialPage: initialIndex,
        ),
        selectedMediaAttachmentSubject =
            BehaviorSubject.seeded(initialMediaAttachment) {
    listener = () {
      selectedMediaAttachmentSubject
          .add(widget.mediaAttachments[_controller.page.toInt()]);
    };
    _controller.addListener(listener);
  }

  @override
  void dispose() {
    _controller.removeListener(listener);
    _controller.dispose();
    selectedMediaAttachmentSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: tr("app.media.attachment.details.title"),
        actions: <Widget>[
          buildAddToGalleryAction(context),
          buildShareAction(context)
        ],
      ),
      body: buildBody(context),
    );
  }

  Widget buildShareAction(BuildContext context) {
    return FediIconButton(
        icon: Icon(
          FediIcons.share,
          color: FediColors.darkGrey,
          size: FediSizes.appBarIconSize,
        ),
        onPressed: () {
          showShareChooserDialog(
            context,
            externalShareAction: () {
              Navigator.of(context).pop();
              goToExternalShareMediaPage(
                  context: context, mediaAttachment: mediaAttachment);
            },
            conversationsShareAction: () {
              Navigator.of(context).pop();
              goToConversationShareMediaPage(
                  context: context, mediaAttachment: mediaAttachment);
            },
            chatsShareAction: () {
              Navigator.of(context).pop();
              goToChatShareMediaPage(
                  context: context, mediaAttachment: mediaAttachment);
            },
          );
        });
  }

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

  Widget buildMediaAttachmentBody(IPleromaMediaAttachment mediaAttachment) {
    switch (mediaAttachment.typeMastodon) {
      case MastodonMediaAttachmentType.image:
      case MastodonMediaAttachmentType.gifv:
        return CachedNetworkImage(
          imageBuilder: (context, imageProvider) {
            return Container(
              child: PhotoView(
                backgroundDecoration:
                    BoxDecoration(color: FediColors.ultraLightGrey),
                imageProvider: imageProvider,
              ),
            );
          },
          placeholder: (context, url) => buildDetails(),
          errorWidget: (context, url, error) => buildDetails(),
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
            child: Text(tr("app.media.attachment.details.not_supported_type",
                args: [mediaAttachment.type])));
        break;
    }
  }

  Widget buildBody(BuildContext context) {
    if (widget.mediaAttachments.length == 1) {
      return buildMediaAttachmentBody(mediaAttachment);
    } else {
      return Stack(
        children: <Widget>[
          PageView(
            controller: _controller,
            children: widget.mediaAttachments
                .map((mediaAttachment) =>
                    buildMediaAttachmentBody(mediaAttachment))
                .toList(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 12.0,
            child: StreamBuilder<IPleromaMediaAttachment>(
                stream: selectedMediaAttachmentStream,
                initialData: selectedMediaAttachment,
                builder: (context, snapshot) {
                  var selectedMediaAttachment = snapshot.data;

                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: widget.mediaAttachments
                        .map((mediaAttachment) => FediIndicatorWidget(
                            active: selectedMediaAttachment == mediaAttachment))
                        .toList(),
                  );
                }),
          )
        ],
      );
    }
  }

  Widget buildDetails() => CachedNetworkImage(
        imageUrl: mediaAttachment.url,
        imageBuilder: (context, imageProvider) {
          return Container(
            child: PhotoView(
              backgroundDecoration:
                  BoxDecoration(color: FediColors.ultraLightGrey),
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

void goToSingleMediaAttachmentDetailsPage(BuildContext context,
    {@required IPleromaMediaAttachment mediaAttachment}) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => MediaAttachmentDetailsPage.single(
            mediaAttachment: mediaAttachment)),
  );
}

void goToMultiMediaAttachmentDetailsPage(BuildContext context,
    {@required List<IPleromaMediaAttachment> mediaAttachments,
    @required IPleromaMediaAttachment initialMediaAttachment}) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => MediaAttachmentDetailsPage.multi(
              mediaAttachments: mediaAttachments,
              initialMediaAttachment: initialMediaAttachment,
            )),
  );
}
