import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaAttachmentListBloc implements IDisposable {
  static IMediaAttachmentListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMediaAttachmentListBloc>(context, listen: listen);

  int get currentIndex;

  List<IPleromaMediaAttachment> get mediaAttachments;

  IPleromaMediaAttachment? get initialMediaAttachment;
}
