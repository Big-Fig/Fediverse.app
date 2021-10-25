import '../unifedi_api_model.dart';
import 'type/unifedi_api_card_type_sealed.dart';

abstract class IUnifediApiCard implements IUnifediApiResponse {
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

extension IUnifediApiCardExtension on IUnifediApiCard {
  bool get isHaveImage => image?.isNotEmpty == true;

  bool get isHaveContent =>
      title?.isNotEmpty == true ||
      description?.isNotEmpty == true ||
      html?.isNotEmpty == true;
  UnifediApiCardType get typeAsUnifediApi =>
      UnifediApiCardType.fromStringValue(type);
}
