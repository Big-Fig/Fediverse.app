import 'package:fediverse_api/fediverse_api.dart';

import '../unifedi_api_version_model.dart';

abstract class IUnifediApiVersionRange implements IFediverseApiVersionRange {
  @override
  IUnifediApiVersion? get min;
  @override
  IUnifediApiVersion? get max;
}
