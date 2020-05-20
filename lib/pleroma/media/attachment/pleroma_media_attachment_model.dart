import 'dart:convert';

import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_media_attachment_model.g.dart';

abstract class IPleromaMediaAttachment extends IMastodonMediaAttachment {
  PleromaMediaAttachmentPleromaPart get pleroma;
}

@JsonSerializable()
class PleromaMediaAttachment implements IPleromaMediaAttachment {
  @override
  final String description;
  @override
  final String id;

  @override
  @JsonKey(name: "preview_url")
  final String previewUrl;
  @override
  @JsonKey(name: "remote_url")
  final String remoteUrl;
  @override
  @JsonKey(name: "text_url")
  final String textUrl;
  @override
  @JsonKey(name: "type")
  final String type;

  @override
  MastodonMediaAttachmentType get typeMastodon =>
      MastodonMediaAttachmentTypeTypeConverter().fromJson(type);
  @override
  final String url;
  @override
  PleromaMediaAttachmentPleromaPart pleroma;

  PleromaMediaAttachment(
      {this.description,
      this.id,
      this.previewUrl,
      this.remoteUrl,
      this.textUrl,
      this.type,
      this.url,
      this.pleroma});

  factory PleromaMediaAttachment.fromJson(Map<String, dynamic> json) =>
      _$PleromaMediaAttachmentFromJson(json);

  factory PleromaMediaAttachment.fromJsonString(String jsonString) =>
      _$PleromaMediaAttachmentFromJson(jsonDecode(jsonString));

  bool get isImage => typeMastodon == MastodonMediaAttachmentType.image;

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
}

@JsonSerializable()
class PleromaMediaAttachmentPleromaPart {
  @JsonKey(name: "mime_type")
  final String mimeType;

  PleromaMediaAttachmentPleromaPart({
    this.mimeType,
  });

  factory PleromaMediaAttachmentPleromaPart.fromJson(
          Map<String, dynamic> json) =>
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
