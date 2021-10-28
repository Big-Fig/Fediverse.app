import 'package:fediverse_api/fediverse_api.dart';

import 'feature/unifedi_api_feature_model.dart';
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
  //
  // Uri get baseUri => restService.accessBloc.access.uri;
}
