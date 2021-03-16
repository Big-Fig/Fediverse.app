import 'package:json_annotation/json_annotation.dart';

abstract class IMastodonMediaAttachment {
  String? get description;

  String get id;

  String? get previewUrl;

  String? get remoteUrl;

  String? get textUrl;

  MastodonMediaAttachmentType get typeMastodon;

  String get type;

  String get url;
}

enum MastodonMediaAttachmentType {
  unknown, // unsupported or unrecognized file type
  image, //Static image
  gifv, // Looping, soundless animation
  video, // Video clip
  audio, // Audio track
}

const unknownMastodonMediaAttachmentType = MastodonMediaAttachmentType.unknown;

const _imageMastodonMediaAttachmentTypeJsonValue = "image";
const _gifvMastodonMediaAttachmentTypeJsonValue = "gifv";
const _videoMastodonMediaAttachmentTypeJsonValue = "video";
const _audioMastodonMediaAttachmentTypeJsonValue = "audio";
const _unknownMastodonMediaAttachmentTypeJsonValue = "unknown";

extension MastodonMediaAttachmentTypeExtension on MastodonMediaAttachmentType {
  String toJsonValue() {
    String result;

    switch (this) {
      case MastodonMediaAttachmentType.image:
        result = _imageMastodonMediaAttachmentTypeJsonValue;
        break;
      case MastodonMediaAttachmentType.gifv:
        result = _gifvMastodonMediaAttachmentTypeJsonValue;
        break;
      case MastodonMediaAttachmentType.video:
        result = _videoMastodonMediaAttachmentTypeJsonValue;
        break;
      case MastodonMediaAttachmentType.audio:
        result = _audioMastodonMediaAttachmentTypeJsonValue;
        break;
      case MastodonMediaAttachmentType.unknown:
        result = _unknownMastodonMediaAttachmentTypeJsonValue;
        break;
    }

    return result;
  }
}

extension MastodonMediaAttachmentTypeStringExtension on String? {
  MastodonMediaAttachmentType toMastodonMediaAttachmentType() {
    MastodonMediaAttachmentType result;

    switch (this) {
      case _imageMastodonMediaAttachmentTypeJsonValue:
        result = MastodonMediaAttachmentType.image;
        break;
      case _audioMastodonMediaAttachmentTypeJsonValue:
        result = MastodonMediaAttachmentType.audio;
        break;
      case _videoMastodonMediaAttachmentTypeJsonValue:
        result = MastodonMediaAttachmentType.video;
        break;
      case _gifvMastodonMediaAttachmentTypeJsonValue:
        result = MastodonMediaAttachmentType.gifv;
        break;
      case _unknownMastodonMediaAttachmentTypeJsonValue:
        result = MastodonMediaAttachmentType.unknown;
        break;
      // can't parse, unknown value
      default:
        result = unknownMastodonMediaAttachmentType;
        break;
    }

    return result;
  }
}

class MastodonMediaAttachmentTypeTypeConverter
    implements JsonConverter<MastodonMediaAttachmentType, String?> {
  const MastodonMediaAttachmentTypeTypeConverter();

  @override
  MastodonMediaAttachmentType fromJson(String? value) =>
      value.toMastodonMediaAttachmentType();

  @override
  String toJson(MastodonMediaAttachmentType value) => value.toJsonValue();
}
