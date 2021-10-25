import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../service/mastodon_api_service.dart';
import '../../../../status/mastodon_api_status_model.dart';
import '../../../mastodon_api_account_model.dart';

abstract class IMastodonApiAccountPublicAccessService
    extends IMastodonApiService {
  IMastodonApiFeature get getAccountStatusesFeature;

  IMastodonApiFeature get getAccountStatusesPaginationMinIdFeature;

  IMastodonApiFeature get getAccountStatusesExcludeReblogsFeature;

  IMastodonApiFeature get getAccountStatusesTaggedFeature;

  IMastodonApiFeature get getAccountFeature;

  // ignore: long-parameter-list
  Future<List<IMastodonApiStatus>> getAccountStatuses({
    required String accountId,
    required String? tagged,
    required bool? pinned,
    required bool? excludeReplies,
    required bool? excludeReblogs,
    required bool? onlyWithMedia,
    required IMastodonApiPagination? pagination,
  });

  Future<IMastodonApiAccount> getAccount({
    required String accountId,
  });
}
