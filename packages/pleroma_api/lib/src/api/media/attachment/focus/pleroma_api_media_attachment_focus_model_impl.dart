import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_media_attachment_focus_model.dart';

part 'pleroma_api_media_attachment_focus_model_impl.freezed.dart';

part 'pleroma_api_media_attachment_focus_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiMediaAttachmentFocus
    with _$PleromaApiMediaAttachmentFocus
    implements IPleromaApiMediaAttachmentFocus {
  @Assert('x >= -1 && x <= 1,')
  @Assert('y >= -1 && y <= 1,')
  const factory PleromaApiMediaAttachmentFocus({
    @HiveField(0) required double x,
    @HiveField(1) required double y,
  }) = _PleromaApiMediaAttachmentFocus;

  factory PleromaApiMediaAttachmentFocus.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiMediaAttachmentFocusFromJson(json);
}

extension PleromaApiMediaAttachmentFocusInterfaceExtension
    on IPleromaApiMediaAttachmentFocus {
  PleromaApiMediaAttachmentFocus toPleromaApiMediaAttachmentFocus({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiMediaAttachmentFocus(
          x: x,
          y: y,
        ),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiMediaAttachmentFocusInterfaceListExtension
    on List<IPleromaApiMediaAttachmentFocus> {
  List<PleromaApiMediaAttachmentFocus> toPleromaApiMediaAttachmentFocusList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiMediaAttachmentFocus item) =>
            item.toPleromaApiMediaAttachmentFocus(),
        forceNewObject: forceNewObject,
      );
}
