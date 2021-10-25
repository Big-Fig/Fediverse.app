import '../../unifedi_api_model.dart';
import 'mfr/object_age/unifedi_api_instance_federation_mfr_object_age_model.dart';

abstract class IUnifediApiInstanceFederation
    implements IUnifediApiResponsePart {
  bool? get enabled;

  bool? get exclusions;

  IUnifediApiInstanceFederationMfrObjectAge? get mrfObjectAge;

  List<String>? get mrfPolicies;

  List<String>? get quarantinedInstances;
}
