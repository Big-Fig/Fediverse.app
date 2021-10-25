import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_media_attachment_focus_model.dart';

part 'unifedi_api_media_attachment_focus_model_impl.freezed.dart';

part 'unifedi_api_media_attachment_focus_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiMediaAttachmentFocus
    with _$UnifediApiMediaAttachmentFocus
    implements IUnifediApiMediaAttachmentFocus {
  @Assert('x >= -1 && x <= 1,')
  @Assert('y >= -1 && y <= 1,')
  const factory UnifediApiMediaAttachmentFocus({
    @HiveField(0) required double x,
    @HiveField(1) required double y,
  }) = _UnifediApiMediaAttachmentFocus;

  factory UnifediApiMediaAttachmentFocus.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMediaAttachmentFocusFromJson(json);
}

extension UnifediApiMediaAttachmentFocusInterfaceExtension
    on IUnifediApiMediaAttachmentFocus {
  UnifediApiMediaAttachmentFocus toUnifediApiMediaAttachmentFocus({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiMediaAttachmentFocus(
          x: x,
          y: y,
        ),
        forceNewObject: forceNewObject,
      );
}

extension UnifediApiMediaAttachmentFocusInterfaceListExtension
    on List<IUnifediApiMediaAttachmentFocus> {
  List<UnifediApiMediaAttachmentFocus> toUnifediApiMediaAttachmentFocusList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiMediaAttachmentFocus item) =>
            item.toUnifediApiMediaAttachmentFocus(),
        forceNewObject: forceNewObject,
      );
}
