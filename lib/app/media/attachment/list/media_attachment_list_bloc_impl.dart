import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/media/attachment/list/media_attachment_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/foundation.dart';

class MediaAttachmentListBloc extends DisposableOwner
    implements IMediaAttachmentListBloc {
  @override
  final List<IPleromaApiMediaAttachment> mediaAttachments;
  @override
  final IPleromaApiMediaAttachment? initialMediaAttachment;

  // TODO: refactor
  @override
  final InstanceLocation instanceLocation;

  @override
  final Uri? remoteInstanceUriOrNull;

  MediaAttachmentListBloc({
    required List<IPleromaApiMediaAttachment>? mediaAttachments,
    required this.initialMediaAttachment,
    required this.instanceLocation,
    required this.remoteInstanceUriOrNull,
  }) : mediaAttachments = mediaAttachments ?? [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaAttachmentListBloc &&
          runtimeType == other.runtimeType &&
          listEquals(mediaAttachments, other.mediaAttachments) &&
          initialMediaAttachment == other.initialMediaAttachment &&
          instanceLocation == other.instanceLocation &&
          remoteInstanceUriOrNull == other.remoteInstanceUriOrNull;

  @override
  int get hashCode =>
      mediaAttachments.hashCode ^
      instanceLocation.hashCode ^
      remoteInstanceUriOrNull.hashCode ^
      initialMediaAttachment.hashCode;

  @override
  String toString() {
    return 'MediaAttachmentListBloc{'
        'mediaAttachments: $mediaAttachments,'
        'initialMediaAttachment: $initialMediaAttachment'
        '}';
  }

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
