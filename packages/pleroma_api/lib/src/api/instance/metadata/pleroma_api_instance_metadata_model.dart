import '../../pleroma_api_model.dart';
import '../federation/pleroma_api_instance_federation_model.dart';
import '../limits/field/pleroma_api_instance_field_limits_model.dart';

abstract class IPleromaApiInstanceMetadata implements IPleromaApiResponsePart {
  List<String>? get features;

  List<String>? get postFormats;

  bool? get accountActivationRequired;

  IPleromaApiInstanceFieldLimits? get fieldsLimits;

  IPleromaApiInstanceFederation? get federation;
}
