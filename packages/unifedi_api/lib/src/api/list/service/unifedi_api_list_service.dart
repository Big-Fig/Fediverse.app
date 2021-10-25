import '../../account/unifedi_api_account_model.dart';
import '../../feature/unifedi_api_feature_model.dart';
import '../../pagination/unifedi_api_pagination_model.dart';
import '../../unifedi_api_service.dart';
import '../replies_policy_type/unifedi_api_card_replies_policy_type_sealed.dart';
import '../unifedi_api_list_model.dart';

abstract class IUnifediApiListService implements IUnifediApiService {
  IUnifediApiFeature get getListsFeature;

  IUnifediApiFeature get getListAccountsFeature;

  IUnifediApiFeature get addAccountsToListFeature;

  IUnifediApiFeature get removeAccountsFromListFeature;

  IUnifediApiFeature get getListFeature;

  IUnifediApiFeature get deleteListFeature;

  IUnifediApiFeature get createListFeature;

  IUnifediApiFeature get createListRepliesPolicyFeature;

  IUnifediApiFeature get updateListFeature;

  IUnifediApiFeature get updateListRepliesPolicyFeature;

  Future<List<IUnifediApiList>> getLists();

  Future<List<IUnifediApiAccount>> getListAccounts({
    required String listId,
    required IUnifediApiPagination? pagination,
  });

  Future<void> addAccountsToList({
    required String listId,
    required List<String> accountIds,
  });

  Future<void> removeAccountsFromList({
    required String listId,
    required List<String> accountIds,
  });

  Future<IUnifediApiList> getList({
    required String listId,
  });

  Future<void> deleteList({
    required String listId,
  });

  Future<IUnifediApiList> createList({
    required String title,
    required UnifediApiListRepliesPolicyType? repliesPolicy,
  });

  Future<IUnifediApiList> updateList({
    required String listId,
    required String title,
    required UnifediApiListRepliesPolicyType? repliesPolicy,
  });
}
