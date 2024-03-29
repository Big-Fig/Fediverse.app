import 'package:fedi_app/app/media/attachment/media_attachment_non_media_widget.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/url/url_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MediaAttachmentUnknownWidget extends StatelessWidget {
  const MediaAttachmentUnknownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaAttachment = Provider.of<IUnifediApiMediaAttachment>(context);

    return InkWell(
      onTap: () {
        UrlHelper.handleUrlClick(
          context: context,
          url: mediaAttachment.url!,
        );
      },
      child: const Padding(
        padding: FediPadding.allSmallPadding,
        child: MediaAttachmentNonMediaWidget(
          actionsWidget: null,
        ),
      ),
    );
  }
}
