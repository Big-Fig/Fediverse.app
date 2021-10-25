import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/media/attachment/meta/unifedi_api_media_attachment_meta_model.dart';
import '../../../api/media/attachment/unifedi_api_media_attachment_model.dart';
import 'meta/unifedi_api_media_attachment_meta_model_pleroma_adapter.dart';
import 'type/unifedi_api_media_attachment_type_sealed_pleroma_converter.dart';

part 'unifedi_api_media_attachment_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_media_attachment_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiMediaAttachmentPleromaAdapter
    with _$UnifediApiMediaAttachmentPleromaAdapter
    implements IUnifediApiMediaAttachment {
  const UnifediApiMediaAttachmentPleromaAdapter._();
  const factory UnifediApiMediaAttachmentPleromaAdapter(
    @HiveField(0) PleromaApiMediaAttachment value,
  ) = _UnifediApiMediaAttachmentPleromaAdapter;

  @override
  String? get description => value.description;

  @override
  String get id => value.id;

  @override
  String? get mimeType => value.pleroma?.mimeType;

  @override
  String? get previewUrl => value.previewUrl;

  @override
  String? get remoteUrl => value.remoteUrl;

  @override
  String? get textUrl => value.textUrl;

  @override
  String get type =>
      value.typeAsPleromaApi.toUnifediApiMediaAttachmentType().stringValue;

  @override
  String? get url => value.url;

  @override
  String? get blurhash => value.blurhash;

  @override
  IUnifediApiMediaAttachmentMeta? get meta =>
      value.meta?.toUnifediApiMediaAttachmentMetaPleromaAdapter();
  factory UnifediApiMediaAttachmentPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMediaAttachmentPleromaAdapterFromJson(json);
}

extension PleromaApiMediaAttachmentUnifediExtension
    on IPleromaApiMediaAttachment {
  UnifediApiMediaAttachmentPleromaAdapter
      toUnifediApiMediaAttachmentPleromaAdapter() =>
          UnifediApiMediaAttachmentPleromaAdapter(
            toPleromaApiMediaAttachment(),
          );
}

extension PleromaApiMediaAttachmentUnifediListExtension
    on List<IPleromaApiMediaAttachment> {
  List<UnifediApiMediaAttachmentPleromaAdapter>
      toUnifediApiMediaAttachmentPleromaAdapterList() => map(
            (item) => item.toUnifediApiMediaAttachmentPleromaAdapter(),
          ).toList();
}
