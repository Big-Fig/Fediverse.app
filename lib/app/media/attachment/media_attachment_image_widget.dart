import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MediaAttachmentImageWidget extends StatelessWidget {
  final double? maxHeight;

  const MediaAttachmentImageWidget({this.maxHeight});

  @override
  Widget build(BuildContext context) {
    var mediaAttachment = Provider.of<IUnifediApiMediaAttachment>(context);

    return Container(
      color: IFediUiColorTheme.of(context).ultraLightGrey,
      child: IFilesCacheService.of(context).createCachedNetworkImageWidget(
        imageUrl: mediaAttachment.previewUrl!,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            const _MediaAttachmentImageLoadingWidget(),
        imageBuilder: (context, imageProvider) {
          if (maxHeight != null) {
            return LimitedBox(
              maxHeight: maxHeight!,
              child: Image(
                fit: BoxFit.cover,
                image: imageProvider,
              ),
            );
          } else {
            return Image(
              fit: BoxFit.cover,
              image: imageProvider,
            );
          }
        },
        errorWidget: (context, url, dynamic error) =>
            const _MediaAttachmentImageErrorWidget(),
      ),
    );
  }
}

class _MediaAttachmentImageLoadingWidget extends StatelessWidget {
  const _MediaAttachmentImageLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Padding(
        padding: FediPadding.allBigPadding,
        child: Center(
          child: SizedBox(
            // todo: refactor
            // ignore: no-magic-number
            width: 30,
            // ignore: no-magic-number
            height: 30,
            child: FediCircularProgressIndicator(),
          ),
        ),
      );
}

class _MediaAttachmentImageErrorWidget extends StatelessWidget {
  const _MediaAttachmentImageErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Padding(
        padding: FediPadding.allBigPadding,
        child: Icon(FediIcons.warning),
      );
}
