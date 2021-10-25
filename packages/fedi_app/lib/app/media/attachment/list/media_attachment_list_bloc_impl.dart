import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/media/attachment/list/media_attachment_list_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MediaAttachmentListBloc extends DisposableOwner
    implements IMediaAttachmentListBloc {
  @override
  final List<IUnifediApiMediaAttachment> mediaAttachments;
  @override
  final IUnifediApiMediaAttachment? initialMediaAttachment;

  // TODO: refactor
  @override
  final InstanceLocation instanceLocation;

  @override
  final Uri? remoteInstanceUriOrNull;

  MediaAttachmentListBloc({
    required List<IUnifediApiMediaAttachment>? mediaAttachments,
    required this.initialMediaAttachment,
    required this.instanceLocation,
    required this.remoteInstanceUriOrNull,
  }) : mediaAttachments = mediaAttachments ?? [];

  @override
  int get currentIndex {
    var initialPageIndex = 0;
    if (initialMediaAttachment != null) {
      initialPageIndex = mediaAttachments.indexOf(initialMediaAttachment!);
      if (initialPageIndex == -1) {
        initialPageIndex = 0;
      }
    }

    return initialPageIndex;
  }
}
