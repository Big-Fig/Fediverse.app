import '../../../../pleroma_api_model.dart';

abstract class IPleromaApiInstanceFederationMfrObjectAge
    implements IPleromaApiResponsePart {
  int? get threshold;

  List<String>? get actions;
}
