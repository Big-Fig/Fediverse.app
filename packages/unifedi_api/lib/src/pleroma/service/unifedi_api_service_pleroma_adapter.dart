import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../api/feature/type/unifedi_api_type_not_supported_feature_model_impl.dart';
import '../../api/feature/type/unifedi_api_type_supported_feature_model_impl.dart';
import '../../api/feature/unifedi_api_feature_model.dart';
import '../../api/unifedi_api_service.dart';
import '../feature/unifedi_api_feature_model_pleroma_adapter.dart';
import '../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';

abstract class UnifediApiServicePleromaAdapter extends DisposableOwner
    implements IUnifediApiService {
  UnifediApiServicePleromaAdapter();

  @override
  FediverseApiFeatureRequirementState checkFeatureState(
    IUnifediApiFeature feature,
  ) {
    if (feature is UnifediApiTypeNotSupportedFeature) {
      return const FediverseApiFeatureRequirementState.forbidden(
        [
          FediverseApiFeatureRequirementReason(
            name: 'unsupported',
            description: 'Unsupported',
          ),
        ],
      );
    } else if (feature is UnifediApiTypeSupportedFeature) {
      return FediverseApiFeatureRequirementState.accessibleValue;
    } else {
      var unifediApiRestServicePleromaAdapter =
          restService as UnifediApiRestServicePleromaAdapter;

      return unifediApiRestServicePleromaAdapter
          .pleromaApiRestService.accessBloc
          .checkPleromaApiFeatureState(
        // TODO(xal): remove cast, https://github.com/xal/dart_fediverse_api/issues/4
        (feature as UnifediApiFeaturePleromaAdapter).value,
      );
    }
  }
}
