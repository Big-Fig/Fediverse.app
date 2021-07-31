abstract class IMastodonApiCard {
  String? get url;

  String? get title;

  String? get description;

  String? get type;

  MastodonApiCardType? get typeAsMastodonApi;

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

extension IMastodonApiCardExtension on IMastodonApiCard {
  bool get isHaveImage => image?.isNotEmpty == true;

  bool get isHaveContent =>
      title?.isNotEmpty == true ||
      description?.isNotEmpty == true ||
      html?.isNotEmpty == true;
}

enum MastodonApiCardType {
  link,
  photo,
  video,
  rich,
  unknown,
}

const unknownMastodonApiCardType = MastodonApiCardType.unknown;

const _linkMastodonApiCardTypeJsonValue = 'link';
const _photoMastodonApiCardTypeJsonValue = 'photo';
const _videoMastodonApiCardTypeJsonValue = 'video';
const _richMastodonApiCardTypeJsonValue = 'rich';
const _unknownMastodonApiCardTypeJsonValue = 'unknown';

extension MastodonApiCardTypeExtension on MastodonApiCardType {
  String toJsonValue() {
    String result;

    switch (this) {
      case MastodonApiCardType.link:
        result = _linkMastodonApiCardTypeJsonValue;
        break;
      case MastodonApiCardType.photo:
        result = _photoMastodonApiCardTypeJsonValue;
        break;
      case MastodonApiCardType.video:
        result = _videoMastodonApiCardTypeJsonValue;
        break;
      case MastodonApiCardType.rich:
        result = _richMastodonApiCardTypeJsonValue;
        break;
      case MastodonApiCardType.unknown:
        result = _unknownMastodonApiCardTypeJsonValue;
        break;
    }

    return result;
  }
}

extension MastodonApiCardTypeStringExtension on String {
  MastodonApiCardType toMastodonApiCardType() {
    MastodonApiCardType result;

    switch (this) {
      case _linkMastodonApiCardTypeJsonValue:
        result = MastodonApiCardType.link;
        break;
      case _videoMastodonApiCardTypeJsonValue:
        result = MastodonApiCardType.video;
        break;
      case _photoMastodonApiCardTypeJsonValue:
        result = MastodonApiCardType.photo;
        break;
      case _richMastodonApiCardTypeJsonValue:
        result = MastodonApiCardType.rich;
        break;
      case _unknownMastodonApiCardTypeJsonValue:
        result = MastodonApiCardType.unknown;
        break;
      default:
        result = unknownMastodonApiCardType;
        break;
    }

    return result;
  }
}
