import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_entity_page.dart';
import 'package:fedi/app/chat/unifedi/share/unifedi_chat_share_entity_page.dart';
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
import 'package:fedi/app/toast/toast_service.dart';
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
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MediaAttachmentDetailsPage extends StatefulWidget {
  final List<IUnifediApiMediaAttachment> mediaAttachments;
  final IUnifediApiMediaAttachment? initialMediaAttachment;
  final InstanceLocation instanceLocation;

  int get initialIndex => initialMediaAttachment != null
      ? mediaAttachments.indexOf(initialMediaAttachment!)
      : 0;

  const MediaAttachmentDetailsPage.multi({
    Key? key,
    required this.mediaAttachments,
    required this.initialMediaAttachment,
    required this.instanceLocation,
  }) : super(key: key);

  MediaAttachmentDetailsPage.single({
    Key? key,
    required IUnifediApiMediaAttachment mediaAttachment,
    required InstanceLocation instanceLocation,
  }) : this.multi(
          key: key,
          mediaAttachments: [mediaAttachment],
          initialMediaAttachment: mediaAttachment,
          instanceLocation: instanceLocation,
        );

  @override
  MediaAttachmentDetailsPageState createState() =>
      MediaAttachmentDetailsPageState();
}

class MediaAttachmentDetailsPageState
    extends State<MediaAttachmentDetailsPage> {
  IUnifediApiMediaAttachment get mediaAttachment =>
      selectedMediaAttachmentSubject.valueOrNull ??
      widget.mediaAttachments.first;

  // ignore: avoid-late-keyword
  late PageController _controller;

  // ignore: avoid-late-keyword
  late BehaviorSubject<IUnifediApiMediaAttachment?>
      selectedMediaAttachmentSubject;

  Stream<IUnifediApiMediaAttachment?> get selectedMediaAttachmentStream =>
      selectedMediaAttachmentSubject.stream;

  IUnifediApiMediaAttachment? get selectedMediaAttachment =>
      selectedMediaAttachmentSubject.valueOrNull;

  // ignore: avoid-late-keyword
  late VoidCallback listener;

  MediaAttachmentDetailsPageState();

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
    _controller
      ..removeListener(listener)
      ..dispose();
    // ignore: avoid-ignoring-return-values
    selectedMediaAttachmentSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentUnifediApiAccessBloc = ICurrentUnifediApiAccessBloc.of(context);
    var currentInstance = currentUnifediApiAccessBloc.currentInstance;

    var mediaAttachments = widget.mediaAttachments;

    Widget child;

    if (mediaAttachments.length == 1) {
      child = Provider.value(
        value: mediaAttachments.first,
        child: const _MediaAttachmentDetailsPageItemBody(),
      );
    } else {
      child = Stack(
        children: <Widget>[
          PageView(
            controller: _controller,
            children: mediaAttachments
                .map(
                  (mediaAttachment) => Provider.value(
                    value: mediaAttachment,
                    child: const _MediaAttachmentDetailsPageItemBody(),
                  ),
                )
                .toList(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            // todo: refactor
            // ignore: no-magic-number
            bottom: 12.0,
            child: StreamBuilder<IUnifediApiMediaAttachment?>(
              stream: selectedMediaAttachmentStream,
              initialData: selectedMediaAttachment,
              builder: (context, snapshot) {
                var selectedMediaAttachment = snapshot.data;

                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: mediaAttachments
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
      body: child,
    );
  }
}

class _MediaAttachmentDetailsPageShareAction extends StatelessWidget {
  const _MediaAttachmentDetailsPageShareAction({
    Key? key,
    required this.mediaAttachment,
    required this.instanceLocation,
  }) : super(key: key);

  final IUnifediApiMediaAttachment mediaAttachment;
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
            goToUnifediChatShareEntityPage(
              context: context,
              shareEntity: _mapMediaAttachmentToShareEntity(mediaAttachment),
              instanceLocation: instanceLocation,
            );
          },
          newStatusShareAction: (context) async {
            Navigator.of(parentContext).pop();

            var dialogResult = await UnifediAsyncOperationHelper
                .performUnifediAsyncOperation<IUnifediApiMediaAttachment>(
              context: parentContext,
              asyncCode: () async {
                var mediaAttachmentReuploadService =
                    IMediaAttachmentReuploadService.of(context, listen: false);

                return mediaAttachmentReuploadService.reuploadMediaAttachment(
                  originalMediaAttachment: mediaAttachment,
                );
              },
            );

            if (dialogResult.success) {
              var reuploadedMediaAttachment = dialogResult.result!;
              goToNewPostStatusPageWithInitial(
                parentContext,
                initialMediaAttachments: [
                  reuploadedMediaAttachment.toUnifediApiMediaAttachment(),
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
  IUnifediApiMediaAttachment mediaAttachment,
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

  final IUnifediApiMediaAttachment mediaAttachment;

  @override
  Widget build(BuildContext context) =>
      UnifediAsyncOperationButtonBuilderWidget(
        showProgressDialog: false,
        builder: (BuildContext context, VoidCallback? onPressed) =>
            FediIconButton(
          icon: Icon(
            FediIcons.download,
            color: IFediUiColorTheme.of(context).darkGrey,
            size: FediSizes.appBarIconSize,
          ),
          onPressed: onPressed,
        ),
        // todo: add localized message
        successToastMessage:
            S.of(context).app_media_attachment_addToGallery_success,
        asyncButtonAction: () async {
          IToastService.of(context, listen: false).showInfoToast(
            context: context,
            title: S.of(context).app_media_attachment_addToGallery_start_saving,
          );

          var saved = await addMediaAttachmentToGallery(
            context: context,
            mediaAttachment: mediaAttachment,
          );

          if (!saved) {
            throw MediaAttachmentCantAddToGalleryException(
              mediaAttachment,
            );
          }

          return mediaAttachment;
        },
        errorAlertDialogBuilders: [
          (BuildContext? context, dynamic error, StackTrace stackTrace) =>
              ErrorData(
                error: error,
                stackTrace: stackTrace,
                titleCreator: (context) => S
                    .of(context)
                    .app_media_attachment_addToGallery_error_dialog_title,
                contentCreator: (context) => S
                    .of(context)
                    .app_media_attachment_addToGallery_error_dialog_content,
              ),
        ],
      );
}

void goToSingleMediaAttachmentDetailsPage(
  BuildContext context, {
  required IUnifediApiMediaAttachment mediaAttachment,
  required InstanceLocation instanceLocation,
}) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => MediaAttachmentDetailsPage.single(
        instanceLocation: instanceLocation,
        mediaAttachment: mediaAttachment,
      ),
    ),
  );
}

void goToMultiMediaAttachmentDetailsPage(
  BuildContext context, {
  required List<IUnifediApiMediaAttachment> mediaAttachments,
  required IUnifediApiMediaAttachment? initialMediaAttachment,
  required InstanceLocation instanceLocation,
}) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => MediaAttachmentDetailsPage.multi(
        instanceLocation: instanceLocation,
        mediaAttachments: mediaAttachments,
        initialMediaAttachment: initialMediaAttachment,
      ),
    ),
  );
}

class _MediaAttachmentDetailsPageItemBody extends StatelessWidget {
  const _MediaAttachmentDetailsPageItemBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: const [
          _MediaAttachmentDetailsPageItemBodyContent(),
          Positioned(
            top: 8.0,
            right: 8.0,
            child: MediaAttachmentMetadataButtonWidget(),
          ),
        ],
      );
}

class _MediaAttachmentDetailsPageItemBodyContent extends StatelessWidget {
  const _MediaAttachmentDetailsPageItemBodyContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaAttachment = Provider.of<IUnifediApiMediaAttachment>(context);

    return mediaAttachment.typeAsUnifediApi.map(
      image: (_) => const _MediaAttachmentDetailsPageItemBodyContentCached(),
      // ignore: no-equal-arguments
      gifv: (_) => const _MediaAttachmentDetailsPageItemBodyContentCached(),
      video: (_) {
        var mediaSettingsBloc = IMediaSettingsBloc.of(context, listen: false);

        return VideoMediaPlayerBloc.provideToContext(
          context,
          autoInit: mediaSettingsBloc.autoInit,
          autoPlay: mediaSettingsBloc.autoPlay,
          mediaPlayerSource:
              MediaPlayerSource.network(networkUrl: mediaAttachment.url),
          child: const FediVideoPlayerWidget(),
          desiredAspectRatio:
              VideoMediaPlayerBloc.calculateDefaultAspectRatio(context),
          isFullscreen: false,
        );
      },
      audio: (_) {
        var mediaSettingsBloc = IMediaSettingsBloc.of(context, listen: false);

        return AudioMediaPlayerBloc.provideToContext(
          context,
          autoInit: mediaSettingsBloc.autoInit,
          autoPlay: mediaSettingsBloc.autoPlay,
          mediaPlayerSource:
              MediaPlayerSource.network(networkUrl: mediaAttachment.url),
          child: const FediAudioPlayerWidget(),
        );
      },
      unknown: (_) => const Padding(
        padding: FediPadding.allBigPadding,
        child: Center(
          child: MediaAttachmentUnknownWidget(),
        ),
      ),
    );
  }
}

class _MediaAttachmentDetailsPageItemBodyContentCached extends StatelessWidget {
  const _MediaAttachmentDetailsPageItemBodyContentCached({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaAttachment = Provider.of<IUnifediApiMediaAttachment>(context);

    return IFilesCacheService.of(context).createCachedNetworkImageWidget(
      imageBuilder: (context, imageProvider) => PhotoView(
        backgroundDecoration: BoxDecoration(
          color: IFediUiColorTheme.of(context).ultraLightGrey,
        ),
        imageProvider: imageProvider,
      ),
      placeholder: (context, url) =>
          const _MediaAttachmentDetailsPageItemBodyContentCachedDetails(),
      errorWidget: (context, url, dynamic error) =>
          const _MediaAttachmentDetailsPageItemBodyContentCachedDetails(),
      imageUrl: mediaAttachment.url!,
    );
  }
}

class _MediaAttachmentDetailsPageItemBodyContentCachedDetails
    extends StatelessWidget {
  const _MediaAttachmentDetailsPageItemBodyContentCachedDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaAttachment = Provider.of<IUnifediApiMediaAttachment>(context);

    return IFilesCacheService.of(context).createCachedNetworkImageWidget(
      imageUrl: mediaAttachment.url!,
      imageBuilder: (context, imageProvider) => PhotoView(
        backgroundDecoration: BoxDecoration(
          color: IFediUiColorTheme.of(context).ultraLightGrey,
        ),
        imageProvider: imageProvider,
      ),
      placeholder: (context, url) =>
          const Center(child: FediCircularProgressIndicator()),
      errorWidget: (context, url, dynamic error) => const Center(
        child: Icon(
          FediIcons.failed,
        ),
      ),
    );
  }
}
