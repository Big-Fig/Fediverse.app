import '../../../../unifedi_api_model.dart';

abstract class IUnifediApiInstanceFederationMfrObjectAge
    implements IUnifediApiResponsePart {
  int? get threshold;

  List<String>? get actions;
}
