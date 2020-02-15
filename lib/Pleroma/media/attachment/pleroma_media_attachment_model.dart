import 'dart:convert';

import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_media_attachment_model.g.dart';

abstract class IPleromaMediaAttachment extends IMastodonMediaAttachment {
  MediaAttachmentPleromaPart get pleroma;
}

@JsonSerializable()
class MediaAttachment implements IPleromaMediaAttachment {
  String description;
  String id;
  @JsonKey(name: "preview_url")
  String previewUrl;
  @JsonKey(name: "remote_url")
  String remoteUrl;
  @JsonKey(name: "text_url")
  String textUrl;
  String type;
  String url;
  MediaAttachmentPleromaPart pleroma;

  MediaAttachment(
      {this.description,
      this.id,
      this.previewUrl,
      this.remoteUrl,
      this.textUrl,
      this.type,
      this.url,
      this.pleroma});

  factory MediaAttachment.fromJson(Map<String, dynamic> json) =>
      _$MediaAttachmentFromJson(json);

  factory MediaAttachment.fromJsonString(String jsonString) =>
      _$MediaAttachmentFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$MediaAttachmentToJson(this);

  String toJsonString() => jsonEncode(_$MediaAttachmentToJson(this));
}

@JsonSerializable()
class MediaAttachmentPleromaPart {
  @JsonKey(name: "mime_type")
  String mimeType;

  MediaAttachmentPleromaPart({
    this.mimeType,
  });

  factory MediaAttachmentPleromaPart.fromJson(Map<String, dynamic> json) =>
      _$MediaAttachmentPleromaPartFromJson(json);

  factory MediaAttachmentPleromaPart.fromJsonString(String jsonString) =>
      _$MediaAttachmentPleromaPartFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$MediaAttachmentPleromaPartToJson(this);

  String toJsonString() => jsonEncode(_$MediaAttachmentPleromaPartToJson(this));
}
