import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../api/access/unifedi_api_access_bloc.dart';
import '../../api/rest/error/unifedi_api_rest_error_model.dart';
import '../../api/rest/unifedi_api_rest_service.dart';
import '../access/unifedi_api_access_bloc_mastodon_adapter.dart';
import 'error/unifedi_api_rest_error_model_mastodon_adapter.dart';

class UnifediApiRestServiceMastodonAdapter extends DisposableOwner
    implements IUnifediApiRestService {
  final IMastodonApiRestService mastodonApiRestService;

  @override
  IRestService get restService => mastodonApiRestService.restService;

  UnifediApiRestServiceMastodonAdapter({
    required this.mastodonApiRestService,
  });

  @override
  bool get isNeedCheckRequirements =>
      mastodonApiRestService.isNeedCheckRequirements;

  @override
  Stream<IUnifediApiRestError> get unifediApiErrorStream =>
      mastodonApiRestService.mastodonApiErrorStream.map(
        (error) => error.toUnifediApiRestErrorMastodonAdapter(),
      );

  @override
  IUnifediApiAccessBloc get accessBloc => UnifediApiAccessBlocMastodonAdapter(
        mastodonApiAccessBloc: mastodonApiRestService.accessBloc,
      );
}
