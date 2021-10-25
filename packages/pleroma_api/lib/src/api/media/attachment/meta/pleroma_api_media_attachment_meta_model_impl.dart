import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../focus/pleroma_api_media_attachment_focus_model_impl.dart';
import '../size/pleroma_api_media_attachment_size_model_impl.dart';
import 'pleroma_api_media_attachment_meta_model.dart';

part 'pleroma_api_media_attachment_meta_model_impl.freezed.dart';

part 'pleroma_api_media_attachment_meta_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiMediaAttachmentMeta
    with _$PleromaApiMediaAttachmentMeta
    implements IPleromaApiMediaAttachmentMeta {
  const factory PleromaApiMediaAttachmentMeta({
    @HiveField(0) required PleromaApiMediaAttachmentFocus? focus,
    @HiveField(1) required PleromaApiMediaAttachmentSize? original,
    @HiveField(2) required PleromaApiMediaAttachmentSize? small,
  }) = _PleromaApiMediaAttachmentMeta;

  factory PleromaApiMediaAttachmentMeta.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiMediaAttachmentMetaFromJson(json);
}

extension PleromaApiMediaAttachmentMetaInterfaceExtension
    on IPleromaApiMediaAttachmentMeta {
  PleromaApiMediaAttachmentMeta toPleromaApiMediaAttachmentMeta({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiMediaAttachmentMeta(
          focus: focus?.toPleromaApiMediaAttachmentFocus(
            forceNewObject: forceNewObject,
          ),
          original: original?.toPleromaApiMediaAttachmentSize(
            forceNewObject: forceNewObject,
          ),
          small: small?.toPleromaApiMediaAttachmentSize(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiMediaAttachmentMetaInterfaceListExtension
    on List<IPleromaApiMediaAttachmentMeta> {
  List<PleromaApiMediaAttachmentMeta> toPleromaApiMediaAttachmentMetaList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiMediaAttachmentMeta item) =>
            item.toPleromaApiMediaAttachmentMeta(),
        forceNewObject: forceNewObject,
      );
}
