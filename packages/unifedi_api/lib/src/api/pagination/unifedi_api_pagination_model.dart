import '../unifedi_api_model.dart';

abstract class IUnifediApiPagination implements IUnifediApiObject {
  String? get maxId;

  String? get minId;

  // String? get sinceId;

  int? get limit;
}
