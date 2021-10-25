import 'package:fediverse_api/fediverse_api.dart';

import '../access/unifedi_api_access_bloc.dart';
import 'error/unifedi_api_rest_error_model.dart';

abstract class IUnifediApiRestService implements IFediverseApiRestService {
  @override
  IUnifediApiAccessBloc get accessBloc;

  Stream<IUnifediApiRestError> get unifediApiErrorStream;
}
