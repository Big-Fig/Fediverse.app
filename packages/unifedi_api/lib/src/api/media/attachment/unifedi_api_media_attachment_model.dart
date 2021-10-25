import '../../unifedi_api_model.dart';
import 'meta/unifedi_api_media_attachment_meta_model.dart';
import 'type/unifedi_api_media_attachment_type_sealed.dart';

abstract class IUnifediApiMediaAttachment implements IUnifediApiResponse {
  String? get description;

  String get id;

  String? get previewUrl;

  String? get remoteUrl;

  String? get textUrl;

  String get type;

  String? get url;

  String? get mimeType;

  String? get blurhash;

  IUnifediApiMediaAttachmentMeta? get meta;
}

extension IUnifediApiMediaAttachmentExtension on IUnifediApiMediaAttachment {
  UnifediApiMediaAttachmentType get typeAsUnifediApi =>
      UnifediApiMediaAttachmentType.fromStringValue(type);
}

extension UnifediApiMediaAttachmentInterfaceIdListExtension
    on List<IUnifediApiMediaAttachment> {
  List<String> toUnifediApiMediaAttachmentIdList() => map((e) => e.id).toList();
}
