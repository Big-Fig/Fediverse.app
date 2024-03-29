import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/media/attachment/details/media_attachments_details_page.dart';
import 'package:fedi_app/app/media/attachment/list/media_attachment_list_bloc.dart';
import 'package:fedi_app/app/media/attachment/media_attachment_widget.dart';
import 'package:fedi_app/app/ui/media/fedi_media_carousel_bloc.dart';
import 'package:fedi_app/app/ui/media/fedi_media_carousel_bloc_impl.dart';
import 'package:fedi_app/app/ui/media/fedi_media_carousel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MediaAttachmentListCarouselWidget extends StatelessWidget {
  const MediaAttachmentListCarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaAttachmentListBloc = IMediaAttachmentListBloc.of(context);

    if (mediaAttachmentListBloc.mediaAttachments.isNotEmpty) {
      return const SizedBox(
        width: double.infinity,
        child: MediaAttachmentListCarouselBodyWidget(),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class MediaAttachmentListCarouselBodyWidget extends StatelessWidget {
  const MediaAttachmentListCarouselBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaAttachmentListBloc = IMediaAttachmentListBloc.of(context);
    var mediaAttachments = mediaAttachmentListBloc.mediaAttachments;

    assert(
      mediaAttachments.isNotEmpty,
      'items to show shouldnt be empty',
    );

    if (mediaAttachments.length == 1) {
      return Provider<IUnifediApiMediaAttachment>.value(
        value: mediaAttachments.first,
        child: const MediaAttachmentListItemWidget(),
      );
    } else {
      return DisposableProxyProvider<IMediaAttachmentListBloc,
          IFediMediaCarouselBloc>(
        update: (context, listBloc, _) =>
            FediMediaCarouselBloc<IUnifediApiMediaAttachment>(
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
  const MediaAttachmentListItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaAttachment = Provider.of<IUnifediApiMediaAttachment>(context);
    Widget child = const MediaAttachmentWidget();
    if (mediaAttachment.typeAsUnifediApi ==
            UnifediApiMediaAttachmentType.imageValue ||
        mediaAttachment.typeAsUnifediApi ==
            UnifediApiMediaAttachmentType.gifvValue) {
      child = InkWell(
        onTap: () {
          var mediaAttachmentListBloc =
              IMediaAttachmentListBloc.of(context, listen: false);
          var mediaAttachments = mediaAttachmentListBloc.mediaAttachments;

          goToMultiMediaAttachmentDetailsPage(
            context,
            mediaAttachments: mediaAttachments,
            initialMediaAttachment: mediaAttachment,
            instanceLocation: mediaAttachmentListBloc.instanceLocation,
          );
        },
        child: child,
      );
    }

    return child;
  }
}

// ignore: avoid-returning-widgets
Widget _carouselWidgetBuilder(BuildContext context, int index) {
  var mediaAttachmentListBloc = IMediaAttachmentListBloc.of(context);
  var mediaAttachments = mediaAttachmentListBloc.mediaAttachments;

  return Provider<IUnifediApiMediaAttachment>.value(
    value: mediaAttachments[index],
    child: const MediaAttachmentListItemWidget(),
  );
}
