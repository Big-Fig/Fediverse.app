import '../../../pleroma_api_model.dart';

abstract class IPleromaApiInstanceFieldLimits
    implements IPleromaApiResponsePart {
  int? get maxFields;

  int? get maxRemoteFields;

  int? get nameLength;

  int? get valueLength;
}
