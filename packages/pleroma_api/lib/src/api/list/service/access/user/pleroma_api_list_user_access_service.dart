import '../../../../account/pleroma_api_account_model.dart';
import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../service/pleroma_api_service.dart';
import '../../../pleroma_api_list_model.dart';
import '../../../replies_policy_type/pleroma_api_card_replies_policy_type_sealed.dart';

abstract class IPleromaApiListUserAccessService implements IPleromaApiService {
  IPleromaApiFeature get getListsFeature;

  IPleromaApiFeature get getListAccountsFeature;

  IPleromaApiFeature get addAccountsToListFeature;

  IPleromaApiFeature get removeAccountsFromListFeature;

  IPleromaApiFeature get getListFeature;

  IPleromaApiFeature get deleteListFeature;

  IPleromaApiFeature get createListFeature;

  IPleromaApiFeature get createListRepliesPolicyFeature;

  IPleromaApiFeature get updateListFeature;

  IPleromaApiFeature get updateListRepliesPolicyFeature;

  Future<List<IPleromaApiList>> getLists();

  Future<List<IPleromaApiAccount>> getListAccounts({
    required String listId,
    required IPleromaApiPagination? pagination,
  });

  Future<void> addAccountsToList({
    required String listId,
    required List<String> accountIds,
  });

  Future<void> removeAccountsFromList({
    required String listId,
    required List<String> accountIds,
  });

  Future<IPleromaApiList> getList({
    required String listId,
  });

  Future<void> deleteList({
    required String listId,
  });

  Future<IPleromaApiList> createList({
    required String title,
    required PleromaApiListRepliesPolicyType? repliesPolicy,
  });

  Future<IPleromaApiList> updateList({
    required String listId,
    required String title,
    required PleromaApiListRepliesPolicyType? repliesPolicy,
  });
}
