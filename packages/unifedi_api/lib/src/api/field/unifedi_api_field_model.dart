import '../unifedi_api_model.dart';

abstract class IUnifediApiField implements IUnifediApiResponse {
  String? get name;

  String? get value;

  DateTime? get verifiedAt;
}
