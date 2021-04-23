import 'package:fedi/app/media/attachment/details/media_attachments_details_page.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_bloc.dart';
import 'package:fedi/app/media/attachment/media_attachment_widget.dart';
import 'package:fedi/app/ui/media/fedi_media_carousel_bloc.dart';
import 'package:fedi/app/ui/media/fedi_media_carousel_bloc_impl.dart';
import 'package:fedi/app/ui/media/fedi_media_carousel_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/mastodon/api/media/attachment/mastodon_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MediaAttachmentListCarouselWidget extends StatelessWidget {
  const MediaAttachmentListCarouselWidget();

  @override
  Widget build(BuildContext context) {
    var mediaAttachmentListBloc = IMediaAttachmentListBloc.of(context);

    if (mediaAttachmentListBloc.mediaAttachments.isNotEmpty == true) {
      return SizedBox(
        width: double.infinity,
        child: const MediaAttachmentListCarouselBodyWidget(),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class MediaAttachmentListCarouselBodyWidget extends StatelessWidget {
  const MediaAttachmentListCarouselBodyWidget();

  @override
  Widget build(BuildContext context) {
    var mediaAttachmentListBloc = IMediaAttachmentListBloc.of(context);
    var mediaAttachments = mediaAttachmentListBloc.mediaAttachments;

    assert(mediaAttachments.isNotEmpty == true);

    if (mediaAttachments.length == 1) {
      return Provider<IPleromaMediaAttachment>.value(
        value: mediaAttachments.first,
        child: const MediaAttachmentListItemWidget(),
      );
    } else {
      return DisposableProxyProvider<IMediaAttachmentListBloc,
          IFediMediaCarouselBloc>(
        update: (context, listBloc, _) => FediMediaCarouselBloc(
          items: listBloc.mediaAttachments,
          currentIndex: listBloc.currentIndex,
        ),
        child: const FediMediaCarouselWidget(
          builder: _carouselWidgetBuilder,
        ),
      );
    }
  }
}

class MediaAttachmentListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaAttachment = Provider.of<IPleromaMediaAttachment>(context);
    Widget child = const MediaAttachmentWidget();
    if (mediaAttachment.typeAsMastodonApi == MastodonApiMediaAttachmentType.image ||
        mediaAttachment.typeAsMastodonApi == MastodonApiMediaAttachmentType.gifv) {
      child = InkWell(
        onTap: () {
          var mediaAttachmentListBloc =
              IMediaAttachmentListBloc.of(context, listen: false);
          var mediaAttachments = mediaAttachmentListBloc.mediaAttachments;

          goToMultiMediaAttachmentDetailsPage(
            context,
            mediaAttachments: mediaAttachments,
            initialMediaAttachment: mediaAttachment,
          );
        },
        child: child,
      );
    }
    return child;
  }

  const MediaAttachmentListItemWidget();
}

Widget _carouselWidgetBuilder(BuildContext context, int index) {
  var mediaAttachmentListBloc = IMediaAttachmentListBloc.of(context);
  var mediaAttachments = mediaAttachmentListBloc.mediaAttachments;

  return Provider<IPleromaMediaAttachment>.value(
    value: mediaAttachments[index],
    child: const MediaAttachmentListItemWidget(),
  );
}
