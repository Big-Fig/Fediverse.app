import 'package:fediverse_api/fediverse_api.dart';

import '../pleroma_api_version_model.dart';

abstract class IPleromaApiVersionRange implements IFediverseApiVersionRange {
  @override
  IPleromaApiVersion? get min;

  @override
  IPleromaApiVersion? get max;
}
