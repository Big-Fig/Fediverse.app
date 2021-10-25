import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../focus/unifedi_api_media_attachment_focus_model_impl.dart';
import '../size/unifedi_api_media_attachment_size_model_impl.dart';
import 'unifedi_api_media_attachment_meta_model.dart';

part 'unifedi_api_media_attachment_meta_model_impl.freezed.dart';

part 'unifedi_api_media_attachment_meta_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiMediaAttachmentMeta
    with _$UnifediApiMediaAttachmentMeta
    implements IUnifediApiMediaAttachmentMeta {
  const factory UnifediApiMediaAttachmentMeta({
    @HiveField(0) required UnifediApiMediaAttachmentFocus? focus,
    @HiveField(1) required UnifediApiMediaAttachmentSize? original,
    @HiveField(2) required UnifediApiMediaAttachmentSize? small,
  }) = _UnifediApiMediaAttachmentMeta;

  factory UnifediApiMediaAttachmentMeta.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMediaAttachmentMetaFromJson(json);
}

extension UnifediApiMediaAttachmentMetaInterfaceExtension
    on IUnifediApiMediaAttachmentMeta {
  UnifediApiMediaAttachmentMeta toUnifediApiMediaAttachmentMeta({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiMediaAttachmentMeta(
          focus: focus?.toUnifediApiMediaAttachmentFocus(
            forceNewObject: forceNewObject,
          ),
          original: original?.toUnifediApiMediaAttachmentSize(
            forceNewObject: forceNewObject,
          ),
          small: small?.toUnifediApiMediaAttachmentSize(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}

extension UnifediApiMediaAttachmentMetaInterfaceListExtension
    on List<IUnifediApiMediaAttachmentMeta> {
  List<UnifediApiMediaAttachmentMeta> toUnifediApiMediaAttachmentMetaList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiMediaAttachmentMeta item) =>
            item.toUnifediApiMediaAttachmentMeta(),
        forceNewObject: forceNewObject,
      );
}
