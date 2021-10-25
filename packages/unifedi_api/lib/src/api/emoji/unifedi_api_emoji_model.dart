import '../unifedi_api_model.dart';

abstract class IUnifediApiEmoji implements IUnifediApiResponse {
  String get name;

  String? get url;

  String? get staticUrl;

  bool? get visibleInPicker;

  List<String>? get tags;
}
