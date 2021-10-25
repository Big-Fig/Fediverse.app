import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../api/access/unifedi_api_access_bloc.dart';
import '../../api/rest/error/unifedi_api_rest_error_model.dart';
import '../../api/rest/unifedi_api_rest_service.dart';
import '../access/unifedi_api_access_bloc_pleroma_adapter.dart';
import 'error/unifedi_api_rest_error_model_pleroma_adapter.dart';

class UnifediApiRestServicePleromaAdapter extends DisposableOwner
    implements IUnifediApiRestService {
  final IPleromaApiRestService pleromaApiRestService;

  @override
  IRestService get restService => pleromaApiRestService.restService;

  UnifediApiRestServicePleromaAdapter({
    required this.pleromaApiRestService,
  });

  @override
  bool get isNeedCheckRequirements =>
      pleromaApiRestService.isNeedCheckRequirements;

  @override
  Stream<IUnifediApiRestError> get unifediApiErrorStream =>
      pleromaApiRestService.pleromaApiErrorStream.map(
        (error) => error.toUnifediApiRestErrorPleromaAdapter(),
      );

  @override
  IUnifediApiAccessBloc get accessBloc => UnifediApiAccessBlocPleromaAdapter(
        pleromaApiAccessBloc: pleromaApiRestService.accessBloc,
      );
}
