import 'dart:convert';

import 'package:fedi/mastodon/api/media/attachment/mastodon_api_media_attachment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_media_attachment_model.g.dart';

abstract class IPleromaMediaAttachment extends IMastodonApiMediaAttachment {
  PleromaMediaAttachmentPleromaPart? get pleroma;
}

extension IPleromaMediaAttachmentExtension on IPleromaMediaAttachment {
  PleromaMediaAttachment toPleromaMediaAttachment() {
    if (this is PleromaMediaAttachment) {
      return this as PleromaMediaAttachment;
    } else {
      return PleromaMediaAttachment(
        description: description,
        id: id,
        previewUrl: previewUrl,
        remoteUrl: remoteUrl,
        textUrl: textUrl,
        type: type,
        url: url,
        pleroma: pleroma,
      );
    }
  }
}

extension IPleromaMediaAttachmentListExtension
    on List<IPleromaMediaAttachment> {
  List<PleromaMediaAttachment> toPleromaMediaAttachments() {
    if (this is List<PleromaMediaAttachment>) {
      return this as List<PleromaMediaAttachment>;
    } else {
      return map(
        (mediaAttachment) => mediaAttachment.toPleromaMediaAttachment(),
      ).toList();
    }
  }

  List<String> toPleromaMediaAttachmentIds() {
    return map(
      (mediaAttachment) => mediaAttachment.id,
    ).toList();
  }
}

@JsonSerializable()
class PleromaMediaAttachment implements IPleromaMediaAttachment {
  @override
  final String? description;
  @override
  final String id;

  @override
  @JsonKey(name: "preview_url")
  final String? previewUrl;
  @override
  @JsonKey(name: "remote_url")
  final String? remoteUrl;
  @override
  @JsonKey(name: "text_url")
  final String? textUrl;
  @override
  @JsonKey(name: "type")
  final String type;

  @override
  MastodonApiMediaAttachmentType get typeAsMastodonApi =>
      type.toMastodonApiMediaAttachmentType();

  @override
  final String url;
  @override
  PleromaMediaAttachmentPleromaPart? pleroma;

  PleromaMediaAttachment({
    required this.description,
    required this.id,
    required this.previewUrl,
    required this.remoteUrl,
    required this.textUrl,
    required this.type,
    required this.url,
    required this.pleroma,
  });

  PleromaMediaAttachment.only({
    this.description,
    required this.id,
    this.previewUrl,
    this.remoteUrl,
    this.textUrl,
    required this.type,
    required this.url,
    this.pleroma,
  });

  factory PleromaMediaAttachment.fromJson(Map<String, dynamic> json) =>
      _$PleromaMediaAttachmentFromJson(json);

  factory PleromaMediaAttachment.fromJsonString(String jsonString) =>
      _$PleromaMediaAttachmentFromJson(jsonDecode(jsonString));

  bool get isImage => typeAsMastodonApi == MastodonApiMediaAttachmentType.image;

  bool get isMedia {
    switch (typeAsMastodonApi) {
      case MastodonApiMediaAttachmentType.image:
      case MastodonApiMediaAttachmentType.gifv:
      case MastodonApiMediaAttachmentType.video:
      case MastodonApiMediaAttachmentType.audio:
        return true;
      case MastodonApiMediaAttachmentType.unknown:
      default:
        return false;
    }
  }

  bool get isImageOrGif {
    switch (typeAsMastodonApi) {
      case MastodonApiMediaAttachmentType.image:
      case MastodonApiMediaAttachmentType.gifv:
        return true;
      case MastodonApiMediaAttachmentType.video:
      case MastodonApiMediaAttachmentType.audio:
      case MastodonApiMediaAttachmentType.unknown:
      default:
        return false;
    }
  }

  Map<String, dynamic> toJson() => _$PleromaMediaAttachmentToJson(this);

  String toJsonString() => jsonEncode(_$PleromaMediaAttachmentToJson(this));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaMediaAttachment &&
          runtimeType == other.runtimeType &&
          description == other.description &&
          id == other.id &&
          previewUrl == other.previewUrl &&
          remoteUrl == other.remoteUrl &&
          textUrl == other.textUrl &&
          type == other.type &&
          url == other.url &&
          pleroma == other.pleroma;

  @override
  int get hashCode =>
      description.hashCode ^
      id.hashCode ^
      previewUrl.hashCode ^
      remoteUrl.hashCode ^
      textUrl.hashCode ^
      type.hashCode ^
      url.hashCode ^
      pleroma.hashCode;

  @override
  String toString() {
    return 'PleromaMediaAttachment{description: $description, id: $id,'
        ' previewUrl: $previewUrl, remoteUrl: $remoteUrl, textUrl: $textUrl,'
        ' type: $type, url: $url, pleroma: $pleroma}';
  }

  static PleromaMediaAttachment fromIPleromaMediaAttachment(
    IPleromaMediaAttachment mediaAttachment,
  ) =>
      PleromaMediaAttachment(
        description: mediaAttachment.description,
        id: mediaAttachment.id,
        previewUrl: mediaAttachment.previewUrl,
        remoteUrl: mediaAttachment.remoteUrl,
        textUrl: mediaAttachment.textUrl,
        type: mediaAttachment.type,
        url: mediaAttachment.url,
        pleroma: mediaAttachment.pleroma,
      );
}

@JsonSerializable()
class PleromaMediaAttachmentPleromaPart {
  @JsonKey(name: "mime_type")
  final String? mimeType;

  PleromaMediaAttachmentPleromaPart({
    this.mimeType,
  });

  factory PleromaMediaAttachmentPleromaPart.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaMediaAttachmentPleromaPartFromJson(json);

  factory PleromaMediaAttachmentPleromaPart.fromJsonString(String jsonString) =>
      _$PleromaMediaAttachmentPleromaPartFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() =>
      _$PleromaMediaAttachmentPleromaPartToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaMediaAttachmentPleromaPartToJson(this));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaMediaAttachmentPleromaPart &&
          runtimeType == other.runtimeType &&
          mimeType == other.mimeType;

  @override
  int get hashCode => mimeType.hashCode;
}
