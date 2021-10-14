import 'package:collection/collection.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/media/attachment/media_attachment_widget.dart';
import 'package:fedi/app/media/file/path/media_file_path_bloc.dart';
import 'package:fedi/app/media/file/path/media_file_path_bloc_impl.dart';
import 'package:fedi/app/media/file/path/media_file_path_widget.dart';
import 'package:fedi/app/share/entity/settings/share_entity_settings_bloc.dart';
import 'package:fedi/app/share/entity/settings/share_entity_settings_model.dart';
import 'package:fedi/app/share/entity/settings/share_entity_settings_widget.dart';
import 'package:fedi/app/share/entity/share_entity_bloc.dart';
import 'package:fedi/app/share/entity/share_entity_model.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/media/fedi_media_carousel_bloc.dart';
import 'package:fedi/app/ui/media/fedi_media_carousel_bloc_impl.dart';
import 'package:fedi/app/ui/media/fedi_media_carousel_widget.dart';
import 'package:fedi/app/ui/media/player/audio/fedi_audio_player_widget.dart';
import 'package:fedi/app/ui/media/player/video/fedi_video_player_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/media/player/audio/audio_media_player_bloc.dart';
import 'package:fedi/media/player/audio/audio_media_player_bloc_impl.dart';
import 'package:fedi/media/player/media_player_model.dart';
import 'package:fedi/media/player/video/video_media_player_bloc.dart';
import 'package:fedi/media/player/video/video_media_player_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mime_type/mime_type.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'share_entity_widget.freezed.dart';

class ShareEntityWidget extends StatelessWidget {
  final Widget? footer;

  const ShareEntityWidget({
    required this.footer,
  });

  @override
  Widget build(BuildContext context) {
    var shareEntitySettingsBloc = IShareEntitySettingsBloc.of(context);

    return Padding(
      padding: FediPadding.allBigPadding,
      child: StreamBuilder<ShareEntitySettings>(
        stream: shareEntitySettingsBloc.shareEntitySettingsStream,
        initialData: shareEntitySettingsBloc.shareEntitySettings,
        builder: (context, snapshot) {
          var shareEntitySettings = snapshot.data!;

          return Provider<ShareEntitySettings>.value(
            value: shareEntitySettings,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ShareEntitySettingsWidget(),
                FediBigVerticalSpacer(),
                _ShareEntityContentWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ShareEntityContentWidget extends StatelessWidget {
  const _ShareEntityContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(FediSizes.smallPadding),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(FediSizes.smallPadding),
              // ignore: no-equal-arguments
              bottomRight: Radius.circular(FediSizes.smallPadding),
            ),
            border:
                Border.all(color: IFediUiColorTheme.of(context).ultraLightGrey),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _ShareEntityTextWidget(),
              _ShareEntityMediaWidget(),
            ],
          ),
        ),
      );
}

class _ShareEntityTextWidget extends StatelessWidget {
  const _ShareEntityTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shareEntitySettings = Provider.of<ShareEntitySettings>(context);
    var shareEntityBloc = IShareEntityBloc.of(context);
    var rawText = shareEntityBloc.convertAllItemsToRawText(
      settings: shareEntitySettings,
    );
    if (rawText?.isNotEmpty == true) {
      return Padding(
        padding: FediPadding.allSmallPadding,
        child: Text(
          rawText!,
          style: IFediUiTextTheme.of(context).bigTallDarkGrey,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class _ShareEntityMediaWidget extends StatelessWidget {
  const _ShareEntityMediaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shareEntitySettings = Provider.of<ShareEntitySettings>(context);

    var displayMedia = shareEntitySettings.withMedia &&
        !shareEntitySettings.mediaAsLink &&
        !shareEntitySettings.wholeAsLink;

    if (displayMedia) {
      var shareEntityBloc = IShareEntityBloc.of(context);
      var shareEntity = shareEntityBloc.shareEntity;

      var isHaveMedia = shareEntity.isHaveMedia;
      if (isHaveMedia) {
        var allMediaAttachments = shareEntity.allMediaAttachments;
        var allMediaLocalFiles = shareEntity.allMediaLocalFiles;
        var items = <ShareEntityCarouselItem>[];

        // ignore: cascade_invocations
        items
          ..addAll(
            allMediaAttachments.map(
              (mediaAttachment) => ShareEntityCarouselItem(
                unifediApiMediaAttachment: mediaAttachment,
                localFile: null,
              ),
            ),
          )
          ..addAll(
            allMediaLocalFiles.map(
              (localFile) => ShareEntityCarouselItem(
                unifediApiMediaAttachment: null,
                localFile: localFile,
              ),
            ),
          );
        if (items.length == 1) {
          return Provider<ShareEntityCarouselItem>.value(
            value: items.first,
            child: const _ShareEntityCarouselItemWidget(),
          );
        } else {
          return Provider<List<ShareEntityCarouselItem>>.value(
            value: items,
            child: DisposableProxyProvider<List<ShareEntityCarouselItem>,
                IFediMediaCarouselBloc>(
              update: (context, value, previous) =>
                  FediMediaCarouselBloc<ShareEntityCarouselItem>(items: value),
              child: const FediMediaCarouselWidget(
                builder: _shareEntityCarouselItemWidgetBuilder,
              ),
            ),
          );
        }
      } else {
        return const SizedBox.shrink();
      }
    } else {
      return const SizedBox.shrink();
    }
  }
}

@freezed
class ShareEntityCarouselItem with _$ShareEntityCarouselItem {
  const factory ShareEntityCarouselItem({
    required IUnifediApiMediaAttachment? unifediApiMediaAttachment,
    required ShareEntityItemLocalMediaFile? localFile,
  }) = _ShareEntityCarouselItem;
}

Widget _shareEntityCarouselItemWidgetBuilder(BuildContext context, int index) {
  var items = Provider.of<List<ShareEntityCarouselItem>>(context);
  var item = items[index];

  return Provider<ShareEntityCarouselItem>.value(
    value: item,
    child: const _ShareEntityCarouselItemWidget(),
  );
}

class _ShareEntityCarouselItemWidget extends StatelessWidget {
  const _ShareEntityCarouselItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = Provider.of<ShareEntityCarouselItem>(context);

    if (item.unifediApiMediaAttachment != null) {
      return ProxyProvider<ShareEntityCarouselItem, IUnifediApiMediaAttachment>(
        update: (context, value, previous) => value.unifediApiMediaAttachment!,
        child: const MediaAttachmentWidget(),
      );
    } else {
      return ProxyProvider<ShareEntityCarouselItem,
          ShareEntityItemLocalMediaFile>(
        update: (context, value, previous) => value.localFile!,
        child: const _ShareEntityCarouselItemLocalFileWidget(),
      );
    }
  }
}

class _ShareEntityCarouselItemLocalFileWidget extends StatelessWidget {
  const _ShareEntityCarouselItemLocalFileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localMediaFile = Provider.of<ShareEntityItemLocalMediaFile>(context);

    var file = localMediaFile.file;

    var mimeType = mime(file.path);

    var type = _mapMimeToType(mimeType);

    return type.map(
      image: (_) => Image.file(file),
      // ignore: no-equal-arguments
      gifv: (_) => Image.file(file),
      video: (_) => DisposableProvider<IVideoMediaPlayerBloc>(
        create: (context) => VideoMediaPlayerBloc(
          mediaPlayerSource: MediaPlayerSource.localFile(file: file),
          autoInit: true,
          autoPlay: false,
          desiredAspectRatio:
              VideoMediaPlayerBloc.calculateDefaultAspectRatio(context),
          isFullScreenSupportEnabled: false,
          isFullscreen: false,
        ),
        child: const FediVideoPlayerWidget(),
      ),
      audio: (_) => DisposableProvider<IAudioMediaPlayerBloc>(
        create: (context) => AudioMediaPlayerBloc(
          mediaPlayerSource: MediaPlayerSource.localFile(file: file),
          autoInit: true,
          autoPlay: false,
        ),
        child: const FediAudioPlayerWidget(),
      ),
      unknown: (_) => DisposableProxyProvider<ShareEntityItemLocalMediaFile,
          IMediaFilePathBloc>(
        update: (context, value, _) => MediaFilePathBloc(path: value.file.path),
        child: const MediaFilePathWidget(
          opacity: 1.0,
          actionsWidget: null,
        ),
      ),
    );
  }

  UnifediApiMediaAttachmentType _mapMimeToType(String? mimeType) {
    var mimeTypePrefix = mimeType?.split('/').firstOrNull;

    UnifediApiMediaAttachmentType type;

    switch (mimeTypePrefix) {
      case 'audio':
        type = UnifediApiMediaAttachmentType.audioValue;
        break;
      case 'video':
        type = UnifediApiMediaAttachmentType.videoValue;
        break;
      case 'image':
        type = UnifediApiMediaAttachmentType.imageValue;
        break;

      default:
        type = const UnifediApiMediaAttachmentType.unknown(
          stringValue: 'mimeTypePrefix',
        );
        break;
    }

    return type;
  }
}
