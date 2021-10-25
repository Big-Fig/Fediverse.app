import 'package:fediverse_api/fediverse_api.dart';

import 'feature/unifedi_api_feature_model.dart';
import 'instance/type/unifedi_api_instance_type_model.dart';
import 'instance/unifedi_api_instance_model.dart';
import 'rest/unifedi_api_rest_service.dart';

abstract class IUnifediApiService implements IFediverseApiService {
  @override
  IUnifediApiRestService get restService;

  FediverseApiFeatureRequirementState checkFeatureState(
    IUnifediApiFeature feature,
  );
}

extension IUnifediApiServiceExtension on IUnifediApiService {
  bool isFeatureSupported(IUnifediApiFeature feature) =>
      checkFeatureState(feature).isAccessible;

  Uri get baseUri => restService.accessBloc.access.uri;

  bool get isPleroma =>
      restService.accessBloc.access.instance?.typeAsUnifediApi.isPleroma ==
      true;

  bool get isMastodon =>
      restService.accessBloc.access.instance?.typeAsUnifediApi.isMastodon ==
      true;
}
