import 'package:fediverse_api/fediverse_api.dart';

import '../../../../version/range/unifedi_api_version_range_model.dart';
import '../../../../version/unifedi_api_version_model.dart';
import '../../../unifedi_api_requirement_model.dart';

abstract class IUnifediApiInstanceMetadataVersionRequirement
    implements
        IUnifediApiRequirement<IUnifediApiVersion?>,
        IFediverseApiInstanceMetadataVersionRequirement<IUnifediApiVersion?> {
  @override
  IUnifediApiVersionRange get versionRange;
}
