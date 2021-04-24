import 'package:fedi/mastodon/api/media/attachment/mastodon_api_media_attachment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_media_attachment_model.g.dart';

abstract class IPleromaApiMediaAttachment extends IMastodonApiMediaAttachment {
  PleromaApiMediaAttachmentPleromaPart? get pleroma;
}

extension IPleromaApiMediaAttachmentExtension on IPleromaApiMediaAttachment {
  PleromaApiMediaAttachment toPleromaApiMediaAttachment() {
    if (this is PleromaApiMediaAttachment) {
      return this as PleromaApiMediaAttachment;
    } else {
      return PleromaApiMediaAttachment(
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

extension IPleromaApiMediaAttachmentListExtension
    on List<IPleromaApiMediaAttachment> {
  List<PleromaApiMediaAttachment> toPleromaApiMediaAttachments() {
    if (this is List<PleromaApiMediaAttachment>) {
      return this as List<PleromaApiMediaAttachment>;
    } else {
      return map(
        (mediaAttachment) => mediaAttachment.toPleromaApiMediaAttachment(),
      ).toList();
    }
  }

  List<String> toPleromaApiMediaAttachmentIds() {
    return map(
      (mediaAttachment) => mediaAttachment.id,
    ).toList();
  }
}

@JsonSerializable()
class PleromaApiMediaAttachment implements IPleromaApiMediaAttachment {
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
  final PleromaApiMediaAttachmentPleromaPart? pleroma;

  PleromaApiMediaAttachment({
    required this.description,
    required this.id,
    required this.previewUrl,
    required this.remoteUrl,
    required this.textUrl,
    required this.type,
    required this.url,
    required this.pleroma,
  });

  PleromaApiMediaAttachment.only({
    this.description,
    required this.id,
    this.previewUrl,
    this.remoteUrl,
    this.textUrl,
    required this.type,
    required this.url,
    this.pleroma,
  });

  static PleromaApiMediaAttachment fromJson(Map<String, dynamic> json) =>
      _$PleromaApiMediaAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaApiMediaAttachmentToJson(this);

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMediaAttachment &&
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
    return 'PleromaApiMediaAttachment{'
        'description: $description, '
        'id: $id, '
        'previewUrl: $previewUrl, '
        'remoteUrl: $remoteUrl, '
        'textUrl: $textUrl, '
        'type: $type, '
        'url: $url, '
        'pleroma: $pleroma'
        '}';
  }

  static PleromaApiMediaAttachment fromIPleromaApiMediaAttachment(
    IPleromaApiMediaAttachment mediaAttachment,
  ) =>
      PleromaApiMediaAttachment(
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
class PleromaApiMediaAttachmentPleromaPart {
  @JsonKey(name: "mime_type")
  final String? mimeType;

  PleromaApiMediaAttachmentPleromaPart({
    this.mimeType,
  });

  static PleromaApiMediaAttachmentPleromaPart fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiMediaAttachmentPleromaPartFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PleromaApiMediaAttachmentPleromaPartToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMediaAttachmentPleromaPart &&
          runtimeType == other.runtimeType &&
          mimeType == other.mimeType;

  @override
  int get hashCode => mimeType.hashCode;

  @override
  String toString() {
    return 'PleromaApiMediaAttachmentPleromaPart{mimeType: $mimeType}';
  }
}
