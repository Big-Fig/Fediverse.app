import 'type/mastodon_api_card_type_sealed.dart';

abstract class IMastodonApiCard {
  String? get url;

  String? get title;

  String? get description;

  String get type;

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

extension IMastodonApiCardTypExtension on IMastodonApiCard {
  MastodonApiCardType get typeAsMastodonApi => type.toMastodonApiCardType();
}

extension IMastodonApiCardExtension on IMastodonApiCard {
  bool get isHaveImage => image?.isNotEmpty == true;

  bool get isHaveContent =>
      title?.isNotEmpty == true ||
      description?.isNotEmpty == true ||
      html?.isNotEmpty == true;
}
