import 'package:json_annotation/json_annotation.dart';

enum MastodonVisibility {
  public,
  private,
  direct,
  unlisted,
}

const defaultMastodonVisibility = MastodonVisibility.public;

const _publicMastodonVisibilityJsonValue = "public";
const _privateMastodonVisibilityJsonValue = "private";
const _directMastodonVisibilityJsonValue = "direct";
const _unlistedMastodonVisibilityJsonValue = "unlisted";

extension MastodonVisibilityExtension on MastodonVisibility {
  String toJsonValue() {
    String result;

    switch (this) {
      case MastodonVisibility.public:
        result = _publicMastodonVisibilityJsonValue;
        break;
      case MastodonVisibility.unlisted:
        result = _unlistedMastodonVisibilityJsonValue;
        break;
      case MastodonVisibility.direct:
        result = _directMastodonVisibilityJsonValue;
        break;
      case MastodonVisibility.private:
        result = _privateMastodonVisibilityJsonValue;
        break;
    }

    return result;
  }
}

extension MastodonVisibilityStringExtension on String {
  MastodonVisibility toMastodonVisibility() {
    MastodonVisibility result;

    switch (this) {
      case _publicMastodonVisibilityJsonValue:
        result = MastodonVisibility.public;
        break;
      case _privateMastodonVisibilityJsonValue:
        result = MastodonVisibility.private;
        break;
      case _directMastodonVisibilityJsonValue:
        result = MastodonVisibility.direct;
        break;
      case _unlistedMastodonVisibilityJsonValue:
        result = MastodonVisibility.unlisted;
        break;
      // can't parse, default value
      default:
        result = defaultMastodonVisibility;
        break;
    }

    return result;
  }
}

class MastodonVisibilityTypeConverter
    implements JsonConverter<MastodonVisibility, String> {
  const MastodonVisibilityTypeConverter();

  @override
  MastodonVisibility fromJson(String value) => value.toMastodonVisibility();

  @override
  String toJson(MastodonVisibility value) => value.toJsonValue();
}
