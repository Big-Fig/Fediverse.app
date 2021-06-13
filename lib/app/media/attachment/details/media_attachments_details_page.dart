import 'package:fedi/app/async/pleroma/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_media_page.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_media_page.dart';
import 'package:fedi/app/media/attachment/add_to_gallery/media_attachment_add_to_gallery_exception.dart';
import 'package:fedi/app/media/attachment/add_to_gallery/media_attachment_add_to_gallery_helper.dart';
import 'package:fedi/app/media/attachment/reupload/media_attachment_reupload_service.dart';
import 'package:fedi/app/media/settings/media_settings_bloc.dart';
import 'package:fedi/app/share/external/external_share_media_page.dart';
import 'package:fedi/app/share/share_chooser_dialog.dart';
import 'package:fedi/app/status/post/new/new_post_status_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/indicator/fedi_indicator_widget.dart';
import 'package:fedi/app/ui/media/player/audio/fedi_audio_player_widget.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_widget.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/mastodon/api/media/attachment/mastodon_api_media_attachment_model.dart';
import 'package:fedi/media/player/audio/audio_media_player_bloc_impl.dart';
import 'package:fedi/media/player/media_player_model.dart';
import 'package:fedi/media/player/video/video_media_player_bloc_impl.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:rxdart/rxdart.dart';

class MediaAttachmentDetailsPage extends StatefulWidget {
  final List<IPleromaApiMediaAttachment> mediaAttachments;
  final IPleromaApiMediaAttachment? initialMediaAttachment;

  int get initialIndex => initialMediaAttachment != null
      ? mediaAttachments.indexOf(initialMediaAttachment!)
      : 0;

  MediaAttachmentDetailsPage.multi({
    required this.mediaAttachments,
    required this.initialMediaAttachment,
  });

  MediaAttachmentDetailsPage.single({
    required IPleromaApiMediaAttachment mediaAttachment,
  }) : this.multi(
          mediaAttachments: [mediaAttachment],
          initialMediaAttachment: mediaAttachment,
        );

  @override
  _MediaAttachmentDetailsPageState createState() =>
      _MediaAttachmentDetailsPageState(
        initialMediaAttachment,
        initialIndex,
      );
}

class _MediaAttachmentDetailsPageState
    extends State<MediaAttachmentDetailsPage> {
  IPleromaApiMediaAttachment get mediaAttachment =>
      selectedMediaAttachmentSubject.value ?? widget.mediaAttachments.first;

  final PageController _controller;

  BehaviorSubject<IPleromaApiMediaAttachment?> selectedMediaAttachmentSubject;

  Stream<IPleromaApiMediaAttachment?> get selectedMediaAttachmentStream =>
      selectedMediaAttachmentSubject.stream;

  IPleromaApiMediaAttachment? get selectedMediaAttachment =>
      selectedMediaAttachmentSubject.value;
  // ignore: avoid-late-keyword
  late VoidCallback listener;

  _MediaAttachmentDetailsPageState(
    IPleromaApiMediaAttachment? initialMediaAttachment,
    int initialIndex,
  )   : _controller = PageController(
          initialPage: initialIndex,
        ),
        selectedMediaAttachmentSubject =
            BehaviorSubject.seeded(initialMediaAttachment) {
    listener = () {
      selectedMediaAttachmentSubject.add(
        widget.mediaAttachments[_controller.page!.toInt()],
      );
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
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_media_attachment_details_title,
        actions: <Widget>[
          _MediaAttachmentDetailsPageAddToGalleryAction(
            mediaAttachment: mediaAttachment,
          ),
          _MediaAttachmentDetailsPageShareAction(
            mediaAttachment: mediaAttachment,
          ),
        ],
      ),
      body: buildBody(context),
    );
  }

  Widget buildMediaAttachmentBody(
    BuildContext context,
    IPleromaApiMediaAttachment mediaAttachment,
  ) {
    switch (mediaAttachment.typeAsMastodonApi) {
      case MastodonApiMediaAttachmentType.image:
      case MastodonApiMediaAttachmentType.gifv:
        return IFilesCacheService.of(context).createCachedNetworkImageWidget(
          imageBuilder: (context, imageProvider) {
            return Container(
              child: PhotoView(
                backgroundDecoration: BoxDecoration(
                  color: IFediUiColorTheme.of(context).ultraLightGrey,
                ),
                imageProvider: imageProvider,
              ),
            );
          },
          placeholder: (context, url) => buildDetails(),
          errorWidget: (context, url, error) => buildDetails(),
          imageUrl: mediaAttachment.url,
        );
      case MastodonApiMediaAttachmentType.video:
        var mediaSettingsBloc = IMediaSettingsBloc.of(context, listen: false);
        return VideoMediaPlayerBloc.provideToContext(
          context,
          autoInit: mediaSettingsBloc.autoInit,
          autoPlay: mediaSettingsBloc.autoPlay,
          mediaPlayerSource:
              MediaPlayerSource.network(networkUrl: mediaAttachment.url),
          child: FediVideoPlayerWidget(),
          desiredAspectRatio:
              VideoMediaPlayerBloc.calculateDefaultAspectRatio(context),
          isFullscreen: false,
        );
      case MastodonApiMediaAttachmentType.audio:
        var mediaSettingsBloc = IMediaSettingsBloc.of(context, listen: false);
        return AudioMediaPlayerBloc.provideToContext(
          context,
          autoInit: mediaSettingsBloc.autoInit,
          autoPlay: mediaSettingsBloc.autoPlay,
          mediaPlayerSource:
              MediaPlayerSource.network(networkUrl: mediaAttachment.url),
          child: const FediAudioPlayerWidget(),
        );
      case MastodonApiMediaAttachmentType.unknown:
      default:
        return Center(
          child: Text(
            S.of(context).app_media_attachment_details_notSupported_type(
                  mediaAttachment.type,
                ),
          ),
        );
    }
  }

  Widget buildBody(BuildContext context) {
    if (widget.mediaAttachments.length == 1) {
      return buildMediaAttachmentBody(context, mediaAttachment);
    } else {
      return Stack(
        children: <Widget>[
          PageView(
            controller: _controller,
            children: widget.mediaAttachments
                .map(
                  (mediaAttachment) =>
                      buildMediaAttachmentBody(context, mediaAttachment),
                )
                .toList(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            // todo: refactor
            // ignore: no-magic-number
            bottom: 12.0,
            child: StreamBuilder<IPleromaApiMediaAttachment?>(
              stream: selectedMediaAttachmentStream,
              initialData: selectedMediaAttachment,
              builder: (context, snapshot) {
                var selectedMediaAttachment = snapshot.data;

                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: widget.mediaAttachments
                      .map(
                        (mediaAttachment) => FediIndicatorWidget(
                          active: selectedMediaAttachment == mediaAttachment,
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ],
      );
    }
  }

  Widget buildDetails() =>
      IFilesCacheService.of(context).createCachedNetworkImageWidget(
        imageUrl: mediaAttachment.url,
        imageBuilder: (context, imageProvider) {
          return Container(
            child: PhotoView(
              backgroundDecoration: BoxDecoration(
                color: IFediUiColorTheme.of(context).ultraLightGrey,
              ),
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

class _MediaAttachmentDetailsPageShareAction extends StatelessWidget {
  const _MediaAttachmentDetailsPageShareAction({
    Key? key,
    required this.mediaAttachment,
  }) : super(key: key);

  final IPleromaApiMediaAttachment mediaAttachment;

  @override
  Widget build(BuildContext context) {
    var parentContext = context;

    return FediIconButton(
      icon: Icon(
        FediIcons.share,
        color: IFediUiColorTheme.of(context).darkGrey,
        size: FediSizes.appBarIconSize,
      ),
      onPressed: () {
        showShareChooserDialog(
          context,
          externalShareAction: (context) {
            Navigator.of(context).pop();
            goToExternalShareMediaPage(
              context: context,
              mediaAttachment: mediaAttachment,
              isShareAsLinkPossible: true,
            );
          },
          conversationsShareAction: (context) {
            Navigator.of(context).pop();
            goToConversationShareMediaPage(
              context: context,
              mediaAttachment: mediaAttachment,
            );
          },
          chatsShareAction: (context) {
            Navigator.of(context).pop();
            goToPleromaChatShareMediaPage(
              context: context,
              mediaAttachment: mediaAttachment,
            );
          },
          newStatusShareAction: (context) async {
            Navigator.of(parentContext).pop();

            var dialogResult = await PleromaAsyncOperationHelper
                .performPleromaAsyncOperation<IPleromaApiMediaAttachment>(
              context: parentContext,
              asyncCode: () async {
                var mediaAttachmentReuploadService =
                    IMediaAttachmentReuploadService.of(context, listen: false);

                return await mediaAttachmentReuploadService
                    .reuploadMediaAttachment(
                  originalMediaAttachment: mediaAttachment,
                );
              },
            );

            if (dialogResult.success) {
              var reuploadedMediaAttachment = dialogResult.result!;
              goToNewPostStatusPageWithInitial(
                parentContext,
                initialMediaAttachments: [
                  reuploadedMediaAttachment.toPleromaApiMediaAttachment(),
                ],
              );
            }
          },
        );
      },
    );
  }
}

class _MediaAttachmentDetailsPageAddToGalleryAction extends StatelessWidget {
  const _MediaAttachmentDetailsPageAddToGalleryAction({
    Key? key,
    required this.mediaAttachment,
  }) : super(key: key);

  final IPleromaApiMediaAttachment mediaAttachment;

  @override
  Widget build(BuildContext context) {
    return PleromaAsyncOperationButtonBuilderWidget(
      progressContentMessage:
          S.of(context).app_media_attachment_addToGallery_progress_content,
      builder: (BuildContext context, VoidCallback? onPressed) =>
          FediIconButton(
        icon: Icon(
          FediIcons.download,
          color: IFediUiColorTheme.of(context).darkGrey,
          size: FediSizes.appBarIconSize,
        ),
        onPressed: onPressed,
      ),
      // todo: add localizaed message
      // successToastMessage:
      //     S.of(context).app_media_attachment_addToGallery_,
      asyncButtonAction: () async {
        var saved = await addMediaAttachmentToGallery(
          context: context,
          mediaAttachment: mediaAttachment,
        );

        if (!saved) {
          throw MediaAttachmentCantAddToGalleryException(
            mediaAttachment,
          );
        }
      },
      errorAlertDialogBuilders: [
        (BuildContext? context, dynamic error, StackTrace stackTrace) {
          return ErrorData(
            error: error,
            stackTrace: stackTrace,
            titleCreator: (context) => S
                .of(context)
                .app_media_attachment_addToGallery_error_dialog_title,
            contentCreator: (context) => S
                .of(context)
                .app_media_attachment_addToGallery_error_dialog_content,
          );
        },
      ],
    );
  }
}

void goToSingleMediaAttachmentDetailsPage(
  BuildContext context, {
  required IPleromaApiMediaAttachment mediaAttachment,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MediaAttachmentDetailsPage.single(
        mediaAttachment: mediaAttachment,
      ),
    ),
  );
}

void goToMultiMediaAttachmentDetailsPage(
  BuildContext context, {
  required List<IPleromaApiMediaAttachment> mediaAttachments,
  required IPleromaApiMediaAttachment? initialMediaAttachment,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MediaAttachmentDetailsPage.multi(
        mediaAttachments: mediaAttachments,
        initialMediaAttachment: initialMediaAttachment,
      ),
    ),
  );
}
