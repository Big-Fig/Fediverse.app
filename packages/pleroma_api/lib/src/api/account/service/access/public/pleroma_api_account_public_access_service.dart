import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../service/pleroma_api_service.dart';
import '../../../../status/pleroma_api_status_model.dart';
import '../../../../visibility/pleroma_api_visibility_sealed.dart';
import '../../../pleroma_api_account_model.dart';

abstract class IPleromaApiAccountPublicAccessService
    extends IPleromaApiService {
  IPleromaApiFeature get getAccountStatusesFeature;

  IPleromaApiFeature get getAccountStatusesPaginationMinIdFeature;

  IPleromaApiFeature get getAccountStatusesExcludeReblogsFeature;

  IPleromaApiFeature get getAccountStatusesTaggedFeature;

  IPleromaApiFeature get getAccountFavouritedStatusesFeature;

  IPleromaApiFeature get getAccountFeature;

  // ignore: long-parameter-list
  Future<List<IPleromaApiStatus>> getAccountStatuses({
    required String accountId,
    required String? tagged,
    required bool? pinned,
    required bool? excludeReplies,
    required bool? excludeReblogs,
    required List<PleromaApiVisibility>? excludeVisibilities,
    required bool? withMuted,
    required bool? onlyWithMedia,
    required IPleromaApiPagination? pagination,
  });

  Future<List<IPleromaApiStatus>> getAccountFavouritedStatuses({
    required String accountId,
    required IPleromaApiPagination? pagination,
  });

  Future<IPleromaApiAccount> getAccount({
    required String accountId,
    required bool? withRelationship,
  });
}
