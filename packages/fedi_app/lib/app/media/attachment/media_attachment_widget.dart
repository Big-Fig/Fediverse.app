import 'package:fedi_app/app/media/attachment/media_attachment_audio_widget.dart';
import 'package:fedi_app/app/media/attachment/media_attachment_image_widget.dart';
import 'package:fedi_app/app/media/attachment/media_attachment_unknown_widget.dart';
import 'package:fedi_app/app/media/attachment/media_attachment_video_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

const _maxHeight = 350.0;

class MediaAttachmentWidget extends StatelessWidget {
  const MediaAttachmentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaAttachment = Provider.of<IUnifediApiMediaAttachment>(context);

    return mediaAttachment.typeAsUnifediApi.map(
      image: (_) => const MediaAttachmentImageWidget(
        maxHeight: _maxHeight,
      ),
      // ignore: no-equal-arguments
      gifv: (_) => const MediaAttachmentImageWidget(
        maxHeight: _maxHeight,
      ),
      video: (_) => const MediaAttachmentVideoWidget(),
      audio: (_) => const MediaAttachmentAudioWidget(),
      unknown: (_) => const MediaAttachmentUnknownWidget(),
    );
  }
}
