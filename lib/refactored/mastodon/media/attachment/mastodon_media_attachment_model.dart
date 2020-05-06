import 'package:fedi/refactored/enum/enum_values.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class IMastodonMediaAttachment {
  String get description;

  String get id;

  String get previewUrl;

  String get remoteUrl;

  String get textUrl;

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

final mastodonMediaAttachmentTypeValues = EnumValues({
  "unknown": MastodonMediaAttachmentType.unknown,
  "image": MastodonMediaAttachmentType.image,
  "gifv": MastodonMediaAttachmentType.gifv,
  "video": MastodonMediaAttachmentType.video,
  "audio": MastodonMediaAttachmentType.audio
});

class MastodonMediaAttachmentTypeTypeConverter
    implements JsonConverter<MastodonMediaAttachmentType, String> {
  const MastodonMediaAttachmentTypeTypeConverter();

  @override
  MastodonMediaAttachmentType fromJson(String value) =>
      mastodonMediaAttachmentTypeValues.map[value];

  @override
  String toJson(MastodonMediaAttachmentType value) =>
      mastodonMediaAttachmentTypeValues.reverse[value];
}
