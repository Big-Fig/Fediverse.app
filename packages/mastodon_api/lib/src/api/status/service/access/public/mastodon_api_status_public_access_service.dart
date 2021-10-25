import '../../../../account/mastodon_api_account_model.dart';
import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../service/mastodon_api_service.dart';
import '../../../context/mastodon_api_status_context_model.dart';
import '../../../mastodon_api_status_model.dart';

abstract class IMastodonApiStatusPublicAccessService
    implements IMastodonApiService {
  IMastodonApiFeature get getStatusFeature;

  IMastodonApiFeature get getStatusContextFeature;

  IMastodonApiFeature get favouritedByFeature;

  IMastodonApiFeature get rebloggedByFeature;

  Future<IMastodonApiStatus> getStatus({
    required String statusId,
  });

  Future<IMastodonApiStatusContext> getStatusContext({
    required String statusId,
  });

  Future<List<IMastodonApiAccount>> favouritedBy({
    required String statusId,
    required IMastodonApiPagination? pagination,
  });

  Future<List<IMastodonApiAccount>> rebloggedBy({
    required String statusId,
    required IMastodonApiPagination? pagination,
  });
}
