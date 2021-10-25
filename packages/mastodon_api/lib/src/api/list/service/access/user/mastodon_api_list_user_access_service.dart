import '../../../../account/mastodon_api_account_model.dart';
import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../pagination/mastodon_api_pagination_model.dart';
import '../../../../service/mastodon_api_service.dart';
import '../../../mastodon_api_list_model.dart';
import '../../../replies_policy_type/mastodon_api_card_replies_policy_type_sealed.dart';

abstract class IMastodonApiListUserAccessService
    implements IMastodonApiService {
  IMastodonApiFeature get getListsFeature;

  IMastodonApiFeature get getListAccountsFeature;

  IMastodonApiFeature get addAccountsToListFeature;

  IMastodonApiFeature get removeAccountsFromListFeature;

  IMastodonApiFeature get getListFeature;

  IMastodonApiFeature get deleteListFeature;

  IMastodonApiFeature get createListFeature;

  IMastodonApiFeature get createListRepliesPolicyFeature;

  IMastodonApiFeature get updateListFeature;

  IMastodonApiFeature get updateListRepliesPolicyFeature;

  Future<List<IMastodonApiList>> getLists();

  Future<List<IMastodonApiAccount>> getListAccounts({
    required String listId,
    required IMastodonApiPagination? pagination,
  });

  Future<void> addAccountsToList({
    required String listId,
    required List<String> accountIds,
  });

  Future<void> removeAccountsFromList({
    required String listId,
    required List<String> accountIds,
  });

  Future<IMastodonApiList> getList({
    required String listId,
  });

  Future<void> deleteList({
    required String listId,
  });

  Future<IMastodonApiList> createList({
    required String title,
    required MastodonApiListRepliesPolicyType? repliesPolicy,
  });

  Future<IMastodonApiList> updateList({
    required String listId,
    required String title,
    required MastodonApiListRepliesPolicyType? repliesPolicy,
  });
}
