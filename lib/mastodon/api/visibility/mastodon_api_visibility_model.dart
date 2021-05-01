enum MastodonApiVisibility {
  public,
  private,
  direct,
  unlisted,
}

const defaultMastodonApiVisibility = MastodonApiVisibility.public;

const _publicMastodonApiVisibilityJsonValue = "public";
const _privateMastodonApiVisibilityJsonValue = "private";
const _directMastodonApiVisibilityJsonValue = "direct";
const _unlistedMastodonApiVisibilityJsonValue = "unlisted";

extension MastodonApiVisibilityExtension on MastodonApiVisibility {
  String toJsonValue() {
    String result;

    switch (this) {
      case MastodonApiVisibility.public:
        result = _publicMastodonApiVisibilityJsonValue;
        break;
      case MastodonApiVisibility.unlisted:
        result = _unlistedMastodonApiVisibilityJsonValue;
        break;
      case MastodonApiVisibility.direct:
        result = _directMastodonApiVisibilityJsonValue;
        break;
      case MastodonApiVisibility.private:
        result = _privateMastodonApiVisibilityJsonValue;
        break;
    }

    return result;
  }
}

extension MastodonApiVisibilityStringExtension on String {
  MastodonApiVisibility toMastodonApiVisibility() {
    MastodonApiVisibility result;

    switch (this) {
      case _publicMastodonApiVisibilityJsonValue:
        result = MastodonApiVisibility.public;
        break;
      case _privateMastodonApiVisibilityJsonValue:
        result = MastodonApiVisibility.private;
        break;
      case _directMastodonApiVisibilityJsonValue:
        result = MastodonApiVisibility.direct;
        break;
      case _unlistedMastodonApiVisibilityJsonValue:
        result = MastodonApiVisibility.unlisted;
        break;
      // can't parse, default value
      default:
        result = defaultMastodonApiVisibility;
        break;
    }

    return result;
  }
}
