import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaAttachmentListBloc
    implements IDisposable, IInstanceLocationBloc {
  static IMediaAttachmentListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMediaAttachmentListBloc>(context, listen: listen);

  int get currentIndex;

  List<IPleromaApiMediaAttachment> get mediaAttachments;

  IPleromaApiMediaAttachment? get initialMediaAttachment;
}
