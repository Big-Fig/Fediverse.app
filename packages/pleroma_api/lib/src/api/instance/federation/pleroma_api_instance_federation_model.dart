import '../../pleroma_api_model.dart';
import 'mfr/object_age/pleroma_api_instance_federation_mfr_object_age_model.dart';

abstract class IPleromaApiInstanceFederation
    implements IPleromaApiResponsePart {
  bool? get enabled;

  bool? get exclusions;

  IPleromaApiInstanceFederationMfrObjectAge? get mrfObjectAge;

  List<String>? get mrfPolicies;

  List<String>? get quarantinedInstances;
}
