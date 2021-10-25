import '../../../unifedi_api_model.dart';

abstract class IUnifediApiInstanceFieldLimits
    implements IUnifediApiResponsePart {
  int? get maxFields;

  int? get maxRemoteFields;

  int? get nameLength;

  int? get valueLength;
}
