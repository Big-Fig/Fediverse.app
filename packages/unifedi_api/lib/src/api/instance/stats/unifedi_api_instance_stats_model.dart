import '../../unifedi_api_model.dart';

abstract class IUnifediApiInstanceStats implements IUnifediApiResponsePart {
  int? get userCount;

  int? get statusCount;

  int? get domainCount;
}
