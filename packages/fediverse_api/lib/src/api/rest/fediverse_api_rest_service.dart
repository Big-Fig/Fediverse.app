import 'package:easy_dispose/easy_dispose.dart';

import '../../../fediverse_api.dart';
import '../../rest/service/rest_service.dart';

abstract class IFediverseApiRestService implements IDisposable {
  IRestService get restService;

  bool get isNeedCheckRequirements;

  IFediverseApiAccessBloc get accessBloc;
}
