import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart';

abstract class IMastodonCard {
  String? get url;

  String? get title;

  String? get description;

  MastodonCardType? get type;

  String? get authorName;

  String? get authorUrl;

  String? get providerName;

  String? get providerUrl;

  String? get html;

  int? get width;

  int? get height;

  String? get image;

  String? get embedUrl;
}

extension IMastodonCardExtension on IMastodonCard {
  bool get isHaveImage => image?.isNotEmpty == true;

  bool get isHaveContent =>
      title?.isNotEmpty == true ||
      description?.isNotEmpty == true ||
      html?.isNotEmpty == true;
}

enum MastodonCardType {
  link,
  photo,
  video,
  rich,
  unknown,
}

const unknownMastodonCardType = MastodonCardType.unknown;

const _linkMastodonCardTypeJsonValue = "link";
const _photoMastodonCardTypeJsonValue = "photo";
const _videoMastodonCardTypeJsonValue = "video";
const _richMastodonCardTypeJsonValue = "rich";
const _unknownMastodonCardTypeJsonValue = "unknown";

extension MastodonCardTypeListExtension on List<MastodonCardType> {
  List<String> toMastodonCardTypeStrings() => map(
        (visibility) => visibility.toJsonValue(),
      ).toList();
}

extension MastodonCardTypeExtension on MastodonCardType {
  String toJsonValue() {
    String result;

    switch (this) {
      case MastodonCardType.link:
        result = _linkMastodonCardTypeJsonValue;
        break;
      case MastodonCardType.photo:
        result = _photoMastodonCardTypeJsonValue;
        break;
      case MastodonCardType.video:
        result = _videoMastodonCardTypeJsonValue;
        break;
      case MastodonCardType.rich:
        result = _richMastodonCardTypeJsonValue;
        break;
      case MastodonCardType.unknown:
        result = _unknownMastodonCardTypeJsonValue;
        break;
    }

    return result;
  }
}

extension MastodonCardTypeStringExtension on String {
  MastodonCardType toMastodonCardType() {
    MastodonCardType result;

    switch (this) {
      case _linkMastodonCardTypeJsonValue:
        result = MastodonCardType.link;
        break;
      case _videoMastodonCardTypeJsonValue:
        result = MastodonCardType.video;
        break;
      case _photoMastodonCardTypeJsonValue:
        result = MastodonCardType.photo;
        break;
      case _richMastodonCardTypeJsonValue:
        result = MastodonCardType.rich;
        break;
      case _unknownMastodonCardTypeJsonValue:
        result = MastodonCardType.unknown;
        break;
      default:
        result = unknownMastodonCardType;
        break;
    }

    return result;
  }
}

extension MastodonCardTypeStringListExtension on List<String> {
  List<MastodonCardType> toPleromaVisibilities() => map(
        (visibilityString) => visibilityString.toMastodonCardType(),
      ).toList();
}

class MastodonCardTypeTypeConverter
    implements
        JsonConverter<MastodonCardType, String?>,
        TypeConverter<MastodonCardType, String?> {
  const MastodonCardTypeTypeConverter();

  @override
  MastodonCardType fromJson(String? value) =>
      value?.toMastodonCardType() ?? unknownMastodonCardType;

  @override
  String? toJson(MastodonCardType? value) => value?.toJsonValue();

  @override
  MastodonCardType? mapToDart(String? fromDb) => fromJson(fromDb);

  @override
  String? mapToSql(MastodonCardType? value) => toJson(value);
}
