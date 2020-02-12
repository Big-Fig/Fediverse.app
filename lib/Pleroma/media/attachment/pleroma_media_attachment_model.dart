import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'pleroma_media_attachment_model.g.dart';

@JsonSerializable()
class MediaAttachment {
  String description;
  String id;
  MediaAttachmentPleroma pleroma;
  @JsonKey(name: "preview_url")
  String previewUrl;
  @JsonKey(name: "remote_url")
  String remoteUrl;
  @JsonKey(name: "text_url")
  String textUrl;
  String type;
  String url;

  MediaAttachment({
    this.description,
    this.id,
    this.pleroma,
    this.previewUrl,
    this.remoteUrl,
    this.textUrl,
    this.type,
    this.url,
  });

  factory MediaAttachment.fromJson(Map<String, dynamic> json) =>
      _$MediaAttachmentFromJson(json);

  factory MediaAttachment.fromJsonString(String jsonString) =>
      _$MediaAttachmentFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$MediaAttachmentToJson(this);

  String toJsonString() => jsonEncode(_$MediaAttachmentToJson(this));
}

@JsonSerializable()
class MediaAttachmentPleroma {
  @JsonKey(name: "mime_type")
  String mimeType;

  MediaAttachmentPleroma({
    this.mimeType,
  });

  factory MediaAttachmentPleroma.fromJson(Map<String, dynamic> json) =>
      _$MediaAttachmentPleromaFromJson(json);

  factory MediaAttachmentPleroma.fromJsonString(String jsonString) =>
      _$MediaAttachmentPleromaFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$MediaAttachmentPleromaToJson(this);

  String toJsonString() => jsonEncode(_$MediaAttachmentPleromaToJson(this));
}