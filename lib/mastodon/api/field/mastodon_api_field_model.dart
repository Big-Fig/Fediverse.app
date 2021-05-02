abstract class IMastodonApiField {
  String? get name;

  String? get value;

  String? get valueAsRawUrl;

  String? get valueAsRawUrlWithoutSchema;

  DateTime? get verifiedAt;
}
