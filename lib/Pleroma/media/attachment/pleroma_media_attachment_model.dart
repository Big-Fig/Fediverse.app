import 'dart:convert';

import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_media_attachment_model.g.dart';

abstract class IPleromaMediaAttachment extends IMastodonMediaAttachment {
  PleromaMediaAttachmentPleromaPart get pleroma;
}

@JsonSerializable()
class PleromaMediaAttachment implements IPleromaMediaAttachment {
  final String description;
  final String id;
  @JsonKey(name: "preview_url")
  final String previewUrl;
  @JsonKey(name: "remote_url")
  final String remoteUrl;
  @JsonKey(name: "text_url")
  final String textUrl;
  final String type;
  final String url;
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

  Map<String, dynamic> toJson() => _$PleromaMediaAttachmentToJson(this);

  String toJsonString() => jsonEncode(_$PleromaMediaAttachmentToJson(this));
}

@JsonSerializable()
class PleromaMediaAttachmentPleromaPart {
  @JsonKey(name: "mime_type")
  final String mimeType;

  PleromaMediaAttachmentPleromaPart({
    this.mimeType,
  });

  factory PleromaMediaAttachmentPleromaPart.fromJson(Map<String, dynamic> json) =>
      _$PleromaMediaAttachmentPleromaPartFromJson(json);

  factory PleromaMediaAttachmentPleromaPart.fromJsonString(String jsonString) =>
      _$PleromaMediaAttachmentPleromaPartFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaMediaAttachmentPleromaPartToJson(this);

  String toJsonString() => jsonEncode(_$PleromaMediaAttachmentPleromaPartToJson(this));
}
