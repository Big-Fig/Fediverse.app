import 'package:json_annotation/json_annotation.dart';

abstract class IMastodonApiMediaAttachment {
  String? get description;

  String get id;

  String? get previewUrl;

  String? get remoteUrl;

  String? get textUrl;

  MastodonApiMediaAttachmentType get typeAsMastodonApi;

  String get type;

  String get url;
}

enum MastodonApiMediaAttachmentType {
  unknown, // unsupported or unrecognized file type
  image, //Static image
  gifv, // Looping, soundless animation
  video, // Video clip
  audio, // Audio track
}

const unknownMastodonApiMediaAttachmentType = MastodonApiMediaAttachmentType.unknown;

const _imageMastodonApiMediaAttachmentTypeJsonValue = "image";
const _gifvMastodonApiMediaAttachmentTypeJsonValue = "gifv";
const _videoMastodonApiMediaAttachmentTypeJsonValue = "video";
const _audioMastodonApiMediaAttachmentTypeJsonValue = "audio";
const _unknownMastodonApiMediaAttachmentTypeJsonValue = "unknown";

extension MastodonApiMediaAttachmentTypeExtension on MastodonApiMediaAttachmentType {
  String toJsonValue() {
    String result;

    switch (this) {
      case MastodonApiMediaAttachmentType.image:
        result = _imageMastodonApiMediaAttachmentTypeJsonValue;
        break;
      case MastodonApiMediaAttachmentType.gifv:
        result = _gifvMastodonApiMediaAttachmentTypeJsonValue;
        break;
      case MastodonApiMediaAttachmentType.video:
        result = _videoMastodonApiMediaAttachmentTypeJsonValue;
        break;
      case MastodonApiMediaAttachmentType.audio:
        result = _audioMastodonApiMediaAttachmentTypeJsonValue;
        break;
      case MastodonApiMediaAttachmentType.unknown:
        result = _unknownMastodonApiMediaAttachmentTypeJsonValue;
        break;
    }

    return result;
  }
}

extension MastodonApiMediaAttachmentTypeStringExtension on String? {
  MastodonApiMediaAttachmentType toMastodonApiMediaAttachmentType() {
    MastodonApiMediaAttachmentType result;

    switch (this) {
      case _imageMastodonApiMediaAttachmentTypeJsonValue:
        result = MastodonApiMediaAttachmentType.image;
        break;
      case _audioMastodonApiMediaAttachmentTypeJsonValue:
        result = MastodonApiMediaAttachmentType.audio;
        break;
      case _videoMastodonApiMediaAttachmentTypeJsonValue:
        result = MastodonApiMediaAttachmentType.video;
        break;
      case _gifvMastodonApiMediaAttachmentTypeJsonValue:
        result = MastodonApiMediaAttachmentType.gifv;
        break;
      case _unknownMastodonApiMediaAttachmentTypeJsonValue:
        result = MastodonApiMediaAttachmentType.unknown;
        break;
      // can't parse, unknown value
      default:
        result = unknownMastodonApiMediaAttachmentType;
        break;
    }

    return result;
  }
}

class MastodonApiMediaAttachmentTypeTypeConverter
    implements JsonConverter<MastodonApiMediaAttachmentType, String?> {
  const MastodonApiMediaAttachmentTypeTypeConverter();

  @override
  MastodonApiMediaAttachmentType fromJson(String? value) =>
      value.toMastodonApiMediaAttachmentType();

  @override
  String toJson(MastodonApiMediaAttachmentType value) => value.toJsonValue();
}
