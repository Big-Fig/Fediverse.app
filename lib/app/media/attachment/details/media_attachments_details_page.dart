import 'package:fedi/app/async/pleroma/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_entity_page.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_entity_page.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/media/attachment/add_to_gallery/media_attachment_add_to_gallery_exception.dart';
import 'package:fedi/app/media/attachment/add_to_gallery/media_attachment_add_to_gallery_helper.dart';
import 'package:fedi/app/media/attachment/media_attachment_unknown_widget.dart';
import 'package:fedi/app/media/attachment/metadata/media_attachment_metadata_button_widget.dart';
import 'package:fedi/app/media/attachment/reupload/media_attachment_reupload_service.dart';
import 'package:fedi/app/media/settings/media_settings_bloc.dart';
import 'package:fedi/app/share/entity/share_entity_model.dart';
import 'package:fedi/app/share/external/external_share_entity_page.dart';
import 'package:fedi/app/share/share_chooser_dialog.dart';
import 'package:fedi/app/status/post/new/new_post_status_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/indicator/fedi_indicator_widget.dart';
import 'package:fedi/app/ui/media/player/audio/fedi_audio_player_widget.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_widget.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/media/player/audio/audio_media_player_bloc_impl.dart';
import 'package:fedi/media/player/media_player_model.dart';
import 'package:fedi/media/player/video/video_media_player_bloc_impl.dart';
import 'package:flutter/material.dart';
import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class MediaAttachmentDetailsPage extends StatefulWidget {
  final List<IPleromaApiMediaAttachment> mediaAttachments;
  final IPleromaApiMediaAttachment? initialMediaAttachment;
  final InstanceLocation instanceLocation;

  int get initialIndex => initialMediaAttachment != null
      ? mediaAttachments.indexOf(initialMediaAttachment!)
      : 0;

  MediaAttachmentDetailsPage.multi({
    required this.mediaAttachments,
    required this.initialMediaAttachment,
    required this.instanceLocation,
  });

  MediaAttachmentDetailsPage.single({
    required IPleromaApiMediaAttachment mediaAttachment,
    required InstanceLocation instanceLocation,
  }) : this.multi(
          mediaAttachments: [mediaAttachment],
          initialMediaAttachment: mediaAttachment,
          instanceLocation: instanceLocation,
        );

  @override
  _MediaAttachmentDetailsPageState createState() =>
      _MediaAttachmentDetailsPageState();
}

class _MediaAttachmentDetailsPageState
    extends State<MediaAttachmentDetailsPage> {
  IPleromaApiMediaAttachment get mediaAttachment =>
      selectedMediaAttachmentSubject.valueOrNull ??
      widget.mediaAttachments.first;

  // ignore: avoid-late-keyword
  late PageController _controller;

  // ignore: avoid-late-keyword
  late BehaviorSubject<IPleromaApiMediaAttachment?>
      selectedMediaAttachmentSubject;

  Stream<IPleromaApiMediaAttachment?> get selectedMediaAttachmentStream =>
      selectedMediaAttachmentSubject.stream;

  IPleromaApiMediaAttachment? get selectedMediaAttachment =>
      selectedMediaAttachmentSubject.valueOrNull;

  // ignore: avoid-late-keyword
  late VoidCallback listener;

  _MediaAttachmentDetailsPageState();

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: widget.initialIndex,
    );
    selectedMediaAttachmentSubject =
        BehaviorSubject.seeded(widget.initialMediaAttachment);
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
    var currentAuthInstanceBloc = ICurrentAuthInstanceBloc.of(context);
    var currentInstance = currentAuthInstanceBloc.currentInstance;

    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_media_attachment_details_title,
        actions: <Widget>[
          _MediaAttachmentDetailsPageAddToGalleryAction(
            mediaAttachment: mediaAttachment,
          ),
          if (currentInstance != null)
            _MediaAttachmentDetailsPageShareAction(
              mediaAttachment: mediaAttachment,
              instanceLocation: widget.instanceLocation,
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
    return Provider<IPleromaApiMediaAttachment>.value(
      value: mediaAttachment,
      child: Stack(
        children: [
          buildMediaAttachmentItemBodyContent(mediaAttachment, context),
          Positioned(
            top: 8.0,
            right: 8.0,
            child: const MediaAttachmentMetadataButtonWidget(),
          ),
        ],
      ),
    );
  }

  Widget buildMediaAttachmentItemBodyContent(
    IPleromaApiMediaAttachment mediaAttachment,
    BuildContext context,
  ) {
    switch (mediaAttachment.typeAsMastodonApi) {
      case MastodonApiMediaAttachmentType.image:
      case MastodonApiMediaAttachmentType.gifv:
        return IFilesCacheService.of(context).createCachedNetworkImageWidget(
          imageBuilder: (context, imageProvider) {
            return PhotoView(
              backgroundDecoration: BoxDecoration(
                color: IFediUiColorTheme.of(context).ultraLightGrey,
              ),
              imageProvider: imageProvider,
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
        return Padding(
          padding: FediPadding.allBigPadding,
          child: Center(
            child: MediaAttachmentUnknownWidget(),
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
          return PhotoView(
            backgroundDecoration: BoxDecoration(
              color: IFediUiColorTheme.of(context).ultraLightGrey,
            ),
            imageProvider: imageProvider,
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
    required this.instanceLocation,
  }) : super(key: key);

  final IPleromaApiMediaAttachment mediaAttachment;
  final InstanceLocation instanceLocation;

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
            goToExternalShareEntityPage(
              context: context,
              shareEntity: _mapMediaAttachmentToShareEntity(mediaAttachment),
              instanceLocation: instanceLocation,
            );
          },
          conversationsShareAction: (context) {
            Navigator.of(context).pop();
            goToConversationChatShareEntityPage(
              context: context,
              shareEntity: _mapMediaAttachmentToShareEntity(mediaAttachment),
              instanceLocation: instanceLocation,
            );
          },
          chatsShareAction: (context) {
            Navigator.of(context).pop();
            goToPleromaChatShareEntityPage(
              context: context,
              shareEntity: _mapMediaAttachmentToShareEntity(mediaAttachment),
              instanceLocation: instanceLocation,
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

ShareEntity _mapMediaAttachmentToShareEntity(
  IPleromaApiMediaAttachment mediaAttachment,
) =>
    ShareEntity(
      items: [
        ShareEntityItem(
          createdAt: null,
          fromAccount: null,
          text: null,
          linkToOriginal: mediaAttachment.url,
          mediaAttachments: [
            mediaAttachment,
          ],
          mediaLocalFiles: null,
          isNeedReUploadMediaAttachments: true,
        ),
      ],
    );

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
  required InstanceLocation instanceLocation,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MediaAttachmentDetailsPage.single(
        instanceLocation: instanceLocation,
        mediaAttachment: mediaAttachment,
      ),
    ),
  );
}

void goToMultiMediaAttachmentDetailsPage(
  BuildContext context, {
  required List<IPleromaApiMediaAttachment> mediaAttachments,
  required IPleromaApiMediaAttachment? initialMediaAttachment,
  required InstanceLocation instanceLocation,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MediaAttachmentDetailsPage.multi(
        instanceLocation: instanceLocation,
        mediaAttachments: mediaAttachments,
        initialMediaAttachment: initialMediaAttachment,
      ),
    ),
  );
}
