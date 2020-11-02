import 'package:collection/collection.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/widgets.dart';

Function eq = const ListEquality().equals;

class MediaAttachmentListBloc extends DisposableOwner
    implements IMediaAttachmentListBloc {
  @override
  final List<IPleromaMediaAttachment> mediaAttachments;
  @override
  final IPleromaMediaAttachment initialMediaAttachment;
  MediaAttachmentListBloc({
    @required this.mediaAttachments,
    @required this.initialMediaAttachment,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaAttachmentListBloc &&
          runtimeType == other.runtimeType &&
          eq(mediaAttachments, other.mediaAttachments) &&
          initialMediaAttachment == other.initialMediaAttachment;
  @override
  int get hashCode =>
      mediaAttachments.hashCode ^ initialMediaAttachment.hashCode;
  @override
  String toString() {
    return 'MediaAttachmentListBloc{mediaAttachments: $mediaAttachments,'
        ' initialMediaAttachment: $initialMediaAttachment}';
  }

  @override
  int get currentIndex {
    var initialPageIndex = 0;
    if (initialMediaAttachment != null) {
      initialPageIndex = mediaAttachments.indexOf(initialMediaAttachment);
      if (initialPageIndex == -1) {
        initialPageIndex = 0;
      }
    }
    return initialPageIndex;
  }
}